<?php

namespace App\Http\Controllers\Api\Profile;

use App\Http\Controllers\Controller;
use App\Models\AffiliateHistory;
use App\Models\AffiliateWithdraw;
use App\Models\Bau;
use App\Models\Deposit;
use App\Models\User;
use App\Models\Wallet;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class AffiliateController extends Controller
{
    public function index()
    {
        $userId = auth('api')->id();
        $indications    = User::where('inviter', auth('api')->id())->count();
        $totalDeposits = AffiliateHistory::where('inviter', $userId)
            ->where('deposited_amount', '>', 0)
            ->where('commission_type', 'cpa')
            ->count();
        $user = auth('api')->user();
        $indications = User::where('inviter', $user->id)->count();
        $walletDefault = Wallet::where('user_id', $user->id)->first();
        $affiliateBauValue = $user->affiliate_bau_value;
        $performanceDeposits = $indications > 0 ? ($totalDeposits / $indications) * 100 : 0;

        // Obtendo os caminhos das imagens dos baús
        $chestImages = [];
        for ($i = 1; $i <= 40; $i++) {
            $bau = Bau::where('user_id', $user->id)->where('bau_id', $i)->first();
            if ($bau) {
                $chestImages[$i] = $bau->caminho;
            } else {
                $chestImages[$i] = '/assets/images/big3.png'; // Caminho padrão
            }
        }

        // Verificando baús ao carregar a página
        $this->verificarTodosBaus($user);

        return response()->json([
            'status' => true,
            'code' => $user->inviter_code,
            'url' => config('app.url') . '/?code=' . $user->inviter_code,
            'indications' => $indications,
            'wallet' => $walletDefault,
            'totalDeposits' => $totalDeposits,
            'performanceDeposits' => intval($performanceDeposits),
            'bau_value' => $affiliateBauValue,
            'chest_images' => $chestImages
        ]);
    }

    public function generateCode()
    {
        $code = $this->gencode();
        $setting = \Helper::getSetting();

        if (!empty($code)) {
            $user = auth('api')->user();
            \DB::table('model_has_roles')->updateOrInsert(
                [
                    'role_id' => 2,
                    'model_type' => 'App\Models\User',
                    'model_id' => $user->id,
                ],
            );

            if ($user->update(['inviter_code' => $code, 'affiliate_revenue_share' => $setting->revshare_percentage])) {
                return response()->json(['status' => true, 'message' => trans('Successfully generated code')]);
            }

            return response()->json(['error' => ''], 400);
        }

        return response()->json(['error' => ''], 400);
    }

    private function gencode()
    {
        $code = \Helper::generateCode(8);

        $checkCode = User::where('inviter_code', $code)->first();
        if (empty($checkCode)) {
            return $code;
        }

        return $this->gencode();
    }

    public function makeRequest(Request $request)
    {
        $settings = Setting::where('id', 1)->first();

        if ($settings) {
            $withdrawalLimit = $settings->withdrawal_limit;
            $withdrawalPeriod = $settings->withdrawal_period;
        } else {
            $withdrawalLimit = null;
            $withdrawalPeriod = null;
        }

        if ($withdrawalLimit !== null && $withdrawalPeriod !== null) {
            $startDate = now()->startOfDay();
            $endDate = now()->endOfDay();

            switch ($withdrawalPeriod) {
                case 'daily':
                    break;
                case 'weekly':
                    $startDate = now()->startOfWeek();
                    $endDate = now()->endOfWeek();
                    break;
                case 'monthly':
                    $startDate = now()->startOfMonth();
                    $endDate = now()->endOfMonth();
                    break;
                case 'yearly':
                    $startDate = now()->startOfYear();
                    $endDate = now()->endOfYear();
                    break;
            }

            $withdrawalCount = AffiliateWithdraw::where('user_id', auth('api')->user()->id)
                ->whereBetween('created_at', [$startDate, $endDate])
                ->count();

            if ($withdrawalCount >= $withdrawalLimit) {
                return response()->json(['message' => 'Você atingiu o limite de saques para este período'], 400);
            }
        }

        $rules = [
            'amount' => ['required', 'numeric', 'min:' . $settings->min_withdrawal, 'max:' . $settings->max_withdrawal],
            'pix_type' => 'required',
        ];

        switch ($request->pix_type) {
            case 'document':
                $rules['pix_key'] = 'required|cpf_ou_cnpj';
                break;
            case 'email':
                $rules['pix_key'] = 'required|email';
                break;
            default:
                $rules['pix_key'] = 'required';
                break;
        }

        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        $comission = auth('api')->user()->wallet->refer_rewards;

        if (floatval($comission) >= floatval($request->amount) && floatval($request->amount) > 0) {
            AffiliateWithdraw::create([
                'user_id' => auth('api')->id(),
                'amount' => $request->amount,
                'pix_key' => $request->pix_key,
                'pix_type' => $request->pix_type,
                'currency' => 'BRL',
                'symbol' => 'R$',
            ]);

            auth('api')->user()->wallet->decrement('refer_rewards', $request->amount);

            return response()->json(['message' => trans('Commission withdrawal successfully carried out')], 200);
        }

        return response()->json(['message' => trans('Commission withdrawal error')], 400);
    }

    private function verificarTodosBaus($user)
    {
        $affiliateBaseline = $user->affiliate_bau_baseline;

        $indications = User::where('inviter', $user->id)
            ->whereHas('deposits', function ($query) use ($affiliateBaseline) {
                $query->where('amount', '>=', $affiliateBaseline)
                      ->where('status', 1); // Verifica se o depósito foi pago
            })
            ->count();

        for ($i = 1; $i <= 40; $i++) {
            $bau = Bau::where('user_id', $user->id)->where('bau_id', $i)->first();

            if ($bau) {
                if ($bau->status == 1 && $indications >= $i) {
                    $bau->status = 2;
                    $bau->caminho = '/assets/images/big2.png';
                    $bau->save();
                }
            } else {
                if ($indications >= $i) {
                    Bau::create([
                        'status' => 2,
                        'user_id' => $user->id,
                        'bau_id' => $i,
                        'caminho' => '/assets/images/big2.png',
                    ]);
                }
            }
        }
    }

    public function verificarBau(Request $request, $bauId)
    {
        $user = auth('api')->user();
        $affiliateBaseline = $user->affiliate_bau_baseline;

        $indications = User::where('inviter', $user->id)
            ->whereHas('deposits', function ($query) use ($affiliateBaseline) {
                $query->where('amount', '>=', $affiliateBaseline)
                      ->where('status', 1); // Verifica se o depósito foi pago
            })
            ->count();

        $bau = Bau::where('user_id', $user->id)->where('bau_id', $bauId)->first();

        if ($bau) {
            if ($bau->status == 3) {
                return response()->json(['status' => false, 'error' => 'Baú já foi aberto.']);
            } elseif ($bau->status == 2) {
                return response()->json(['status' => true]);
            } else {
                if ($indications >= $bauId) {
                    $bau->status = 2;
                    $bau->save();
                    return response()->json(['status' => true]);
                } else {
                    return response()->json(['status' => false, 'error' => 'Baú ainda não liberado.']);
                }
            }
        } else {
            if ($indications >= $bauId) {
                Bau::create([
                    'status' => 2,
                    'user_id' => $user->id,
                    'bau_id' => $bauId,
                    'caminho' => '/assets/images/big2.png',
                ]);
                return response()->json(['status' => true]);
            } else {
                return response()->json(['status' => false, 'error' => 'Baú ainda não liberado.']);
            }
        }
    }

    public function abrirBau(Request $request, $bauId)
    {
        $user = auth('api')->user();
        $bau = Bau::where('user_id', $user->id)->where('bau_id', $bauId)->first();

        if ($bau && $bau->status == 2) {
            $bau->status = 3;
            $bau->caminho = '/assets/images/big1.png';
            $bau->aberto_em = now();
            $bau->save();

            // Adiciona o valor do baú à carteira do usuário
            $user->wallet->increment('refer_rewards', $user->affiliate_bau_value);

            return response()->json(['message' => 'Baú aberto com sucesso.']);
        }

        return response()->json(['error' => 'Baú não pode ser aberto.'], 400);
    }
}
