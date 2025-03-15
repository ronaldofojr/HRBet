<?php

namespace App\Traits\Gateways;

use App\Models\AffiliateHistory;
use App\Models\Deposit;
use App\Models\DigitoPayPayment;
use App\Models\Gateway;
use App\Models\Setting;
use App\Models\Transaction;
use App\Models\User;
use App\Models\Wallet;
use App\Notifications\NewDepositNotification;
use Carbon\Carbon;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;
use App\Helpers\Core as Helper;
use Telegram;

trait DigitoPayTrait
{
    protected static string $bearerToken;
    protected static string $uri;

    private static function digitoPayGenerateCredentials()
    {
        $setting = Gateway::first();
        if (!empty($setting)) {
            self::$uri = $setting->getAttributes()['digitopay_uri'];
            $clientId = $setting->getAttributes()['digitopay_cliente_id'];
            $clienteSecret = $setting->getAttributes()['digitopay_cliente_secret'];

            self::$bearerToken = Http::post(self::$uri.'api/token/api', [
                "clientId" => $clientId,
                "secret" => $clienteSecret
            ])->object()->accessToken;
        }
    }

    public static function digitoPayRequestQrcode($request)
    {
        $setting = Helper::getSetting();
        $rules = [
            'amount' => ['required', 'min:'.$setting->min_deposit, 'max:'.$setting->max_deposit],
            'cpf'    => ['required', 'max:255'],
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        self::digitoPayGenerateCredentials();

        $response = Http::withToken(self::$bearerToken)->post(self::$uri.'api/deposit', [
            "dueDate" => Carbon::now()->addDay(),
            "paymentOptions" => ["PIX"],
            "person" => [
                "cpf" => Helper::soNumero($request->cpf),
                "name" => auth('api')->user()->name,
            ],
            "value" => $request->amount
        ]);

        if ($response->successful()) {
            $responseData = $response->json();
            self::digitoPayGenerateTransaction($responseData['id'], Helper::amountPrepare($request->amount), false); // Gerando histórico
            self::digitoPayGenerateDeposit($responseData['id'], Helper::amountPrepare($request->amount)); // Gerando depósito

            // Enviar notificação para o Telegram
            $user = auth('api')->user();
            $dateTime = Carbon::now()->format('d/m/Y H:i:s');
            Telegram::sendPixNotification($user->name, $user->email, $request->amount, $dateTime);

            return [
                'status' => true,
                'qrcode' => $responseData['pixCopiaECola']
            ];
        }

        return [
            'status' => false,
        ];
    }

    public static function digitoPayConsultStatusTransaction($request)
    {
        self::digitoPayGenerateCredentials();

        $response = Http::withToken(self::$bearerToken)->get(self::$uri.'api/status/'.$request->idTransaction);
        if ($response->successful()) {
            $responseData = $response->object();
            Log::info("Status da transação consultado: " . json_encode($responseData));

            if ($responseData == "REALIZADO") {
                $transaction = Transaction::where('payment_id', $request->idTransaction)->first();
                if ($transaction) {
                    $user = User::find($transaction->user_id);
                    $dateTime = Carbon::now();
                    $date = $dateTime->format('d/m/Y');
                    $time = $dateTime->format('H:i:s');
                    Log::info("Enviando notificação de pagamento PIX confirmado para o usuário {$user->name}");
                    Telegram::sendPixPaymentConfirmed($user->name, $user->email, $transaction->price, $date, $time);

                    if (self::digitoPayFinalizePayment($request->idTransaction)) {
                        return response()->json(['status' => 'PAID']);
                    }
                }

                return response()->json(['status' => 'Transaction not found or not finalized'], 400);
            }

            return response()->json(['status' => $responseData], 400);
        }

        return response()->json(['status' => 'ERROR'], 400);
    }

    public static function ValidateHash($hash, $params)
    {
        $generateHash = self::GenerateHash($params, config('DP_PRIVATE_KEY'));
        return $hash == $generateHash;
    }

    public static function GenerateHash($paramsValue, $key)
    {
        return hash('sha256', $paramsValue . $key);
    }

    public static function digitoPayFinalizePayment($idTransaction): bool
    {
        $transaction = Transaction::where('payment_id', $idTransaction)
            ->where('status', 0)
            ->first();

        $setting = \Helper::getSetting();
        if (!empty($transaction)) {
            $checkHash = self::GenerateHash('hash:'.$transaction->user_id.'#'.$idTransaction, config('DP_PRIVATE_KEY'));
            $checkTransaction = Transaction::where('payment_id', $idTransaction)
                ->where('hash', $checkHash)
                ->where('status', 0)
                ->first();

            if (empty($checkTransaction)) {
                Log::error("Falha na validação do hash para a transação {$idTransaction}");
                throw new \ErrorException('Essa não cola mais otário');
                return false;
            }

            $user = User::find($transaction->user_id);
            $wallet = Wallet::where('user_id', $transaction->user_id)->first();
            if (!empty($wallet)) {
                $checkTransactions = Transaction::where('user_id', $transaction->user_id)
                    ->where('status', 1)
                    ->count();

                if ($checkTransactions == 0 || empty($checkTransactions)) {
                    if ($transaction->accept_bonus) {
                        $bonus = Helper::porcentagem_xn($setting->initial_bonus, $transaction->price);
                        $wallet->increment('balance_bonus', $bonus);

                        if (!$setting->disable_rollover) {
                            $wallet->update(['balance_bonus_rollover' => $bonus * $setting->rollover]);
                        }
                    }
                }

                if ($setting->disable_rollover == false) {
                    $wallet->increment('balance_deposit_rollover', ($transaction->price * intval($setting->rollover_deposit)));
                }

                Helper::payBonusVip($wallet, $transaction->price);

                if ($setting->disable_rollover) {
                    $wallet->increment('balance_withdrawal', $transaction->price);
                } else {
                    $wallet->increment('balance', $transaction->price);
                }

                if ($transaction->update(['status' => 1])) {
                    $deposit = Deposit::where('payment_id', $idTransaction)->where('status', 0)->first();
                    if (!empty($deposit)) {
                        $affHistoryCPA = AffiliateHistory::where('user_id', $user->id)
                            ->where('commission_type', 'cpa')
                            ->first();

                        if (!empty($affHistoryCPA)) {
                            $affHistoryCPA->increment('deposited_amount', $transaction->price);
                            $sponsorCpa = User::find($user->inviter);

                            if (!empty($sponsorCpa) && $affHistoryCPA->status == 'pendente') {
                                $walletCpa = Wallet::where('user_id', $affHistoryCPA->inviter)->first();

                                if (!empty($walletCpa)) {
                                    if ($affHistoryCPA->deposited_amount >= $sponsorCpa->affiliate_percentage_baseline || $deposit->amount >= $sponsorCpa->affiliate_percentage_baseline) {
                                        $commissionPercentage = ($transaction->price * $sponsorCpa->affiliate_percentage_cpa) / 100;
                                        $walletCpa->increment('refer_rewards', $commissionPercentage);
                                        $affHistoryCPA->update(['status' => 1, 'commission_paid' => $commissionPercentage]);
                                    } else if ($affHistoryCPA->deposited_amount >= $sponsorCpa->affiliate_baseline || $deposit->amount >= $sponsorCpa->affiliate_baseline) {
                                        $walletCpa->increment('refer_rewards', $sponsorCpa->affiliate_cpa);
                                        $affHistoryCPA->update(['status' => 1, 'commission_paid' => $sponsorCpa->affiliate_cpa]);
                                    }
                                }
                            }
                        }

                        if ($deposit->update(['status' => 1])) {
                            $admins = User::where('role_id', 0)->get();
                            foreach ($admins as $admin) {
                                $admin->notify(new NewDepositNotification($user->name, $transaction->price));
                            }

                            return true;
                        }
                        return false;
                    }
                    return false;
                }

                return false;
            }
            return false;
        }
        return false;
    }

    private static function digitoPayGenerateDeposit($idTransaction, $amount)
    {
        $userId = auth('api')->user()->id;
        $wallet = Wallet::where('user_id', $userId)->first();

        Deposit::create([
            'payment_id'=> $idTransaction,
            'user_id'   => $userId,
            'amount'    => $amount,
            'type'      => 'pix',
            'currency'  => $wallet->currency,
            'symbol'    => $wallet->symbol,
            'status'    => 0
        ]);
    }

    private static function digitoPayGenerateTransaction($idTransaction, $amount, $accept_bonus)
    {
        $setting = \Helper::getSetting();
        $hashGenerate = self::GenerateHash('hash:'.auth('api')->user()->id.'#'.$idTransaction, config('DP_PRIVATE_KEY'));

        Transaction::create([
            'payment_id' => $idTransaction,
            'user_id' => auth('api')->user()->id,
            'payment_method' => 'pix',
            'price' => $amount,
            'currency' => $setting->currency_code,
            'accept_bonus' => $accept_bonus,
            'status' => 0,
            'hash' => $hashGenerate
        ]);
    }

    public static function digitoPayPixCashOut(array $array): bool
    {
        self::digitoPayGenerateCredentials();

        $response = Http::withToken(self::$bearerToken)->post(self::$uri.'api/withdraw', [
            "paymentOptions" => ["PIX"],
            "person" => [
                "pixKeyTypes" => self::FormatPixType($array['pix_type']),
                "pixKey" => $array['pix_key']
            ],
            "value" => $array['amount']
        ]);

        if ($response->successful()) {
            $responseData = $response->json();
            $digitoPayPayment = DigitoPayPayment::lockForUpdate()->find($array['digitoPayPayment_id']);
            if (!empty($digitoPayPayment)) {
                if ($digitoPayPayment->update(['status' => 1, 'payment_id' => $responseData['id']])) {
                    return true;
                }
                return false;
            }
            return $responseData['success'];
        }
        return false;
    }

    private static function FormatPixType($type)
    {
        switch ($type) {
            case 'email':
                return 'EMAIL';
            case 'document' && strlen($type) == 11:
                return 'CPF';
            case 'document' && strlen($type) == 14:
                return 'CNPJ';
            case 'randomKey':
                return 'EVP';
            case 'phoneNumber':
                return 'PHONE';
        }
    }
}
