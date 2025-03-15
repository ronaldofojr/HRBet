<?php

namespace App\Traits\Providers;

use App\Helpers\Core as Helper;
use App\Models\Game;
use App\Models\Provider;
use App\Models\GamesKey;
use App\Models\GGRGames;
use App\Models\Order;
use App\Models\User;
use App\Models\Wallet;
use App\Traits\Missions\MissionTrait;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Storage;

trait FiversTrait
{
    use MissionTrait;

    public static function GameLaunchFivers($provider_code, $game_code, $lang, $userId)
    {
        $endpointwo = "https://api.roxgames.online/api/v1/game_launch";
        $wallet = Wallet::where('user_id', $userId)->where('active', 1)->first();

        error_log($game_code);

        switch ($game_code) {
            case '40':
                $gamename = "jungle-delight";
                break;
            case '98':
                $gamename = "fortune-ox";
                break;
            case '63':
                $gamename = "dragon-tiger-luck";
                break;
            case '42':
                $gamename = "ganesha-gold";
                break;
            case '48':
                $gamename = "double-fortune";
                break;
            case '68':
                $gamename = "fortune-mouse";
                break;
            case '69':
                $gamename = "bikini-paradise";
                break;
            case '126':
                $gamename = "fortune-tiger";
                break;
            case '1543462':
                $gamename = "fortune-rabbit";
                break;
            case '1695365':
                $gamename = "fortune-dragon";
                break;
            default:
                $gamename = null;
        }

        $postArray = [
            "secretKey"    => '471e22b1-1c22-483e-99b4-dcc908080529',
            "agentToken"   => '7383d6af-0f85-4707-a55d-d93a9ed016b6',
            "user_code"    => $userId.'',
            "provider_code"=> $provider_code,
            "game_code"    => $gamename,
            "user_balance" => $wallet->total_balance,
            "lang"         => $lang
        ];

        $response = Http::withOptions(['verify' => false])->post($endpointwo, $postArray);
        $data = $response->json();
        $data['launchUrl'] = $data['launch_url'];

        return $data;
    }

    private static function PrepareTransactionsFivers($wallet, $userCode, $txnId, $betMoney, $winMoney, $gameCode, $providerCode, $changeBonus, $txnType)
    {
        $user = User::find($wallet->user_id);

        if ($winMoney > $betMoney) {
            $transaction = self::CreateTransactionsFivers($userCode, time(), $txnId, 'check', $changeBonus, $winMoney, $gameCode, $gameCode);

            if (!empty($transaction)) {
                GGRGames::create([
                    'user_id' => $userCode,
                    'provider' => $providerCode,
                    'game' => $gameCode,
                    'balance_bet' => $betMoney,
                    'balance_win' => $winMoney,
                    'currency' => $wallet->currency,
                    'aggregator' => "fivers",
                    "type" => "win"
                ]);

                Helper::generateGameHistory($user->id, 'win', $winMoney, $betMoney, $changeBonus, $transaction->transaction_id);

                $wallet = Wallet::where('user_id', $wallet->user_id)->where('active', 1)->first();
                return response()->json([
                    "status"  => 0,
                    "balance" => floatval(number_format($wallet->total_balance, 2, '.', '')),
                    "msg"     => "SUCCESS",
                ]);
            }
        } else {
            $checkTransaction = Order::where('transaction_id', $txnId)->first();
            if (empty($checkTransaction)) {
                $checkTransaction = self::CreateTransactionsFivers($userCode, time(), $txnId, 'check', $changeBonus, $betMoney, $gameCode, $gameCode);
            }

            GGRGames::create([
                'user_id' => $userCode,
                'provider' => $providerCode,
                'game' => $gameCode,
                'balance_bet' => $betMoney,
                'balance_win' => $winMoney,
                'currency' => $wallet->currency,
                'aggregator' => "fivers",
                "type" => "loss"
            ]);

            Helper::generateGameHistory($user->id, 'bet', $winMoney, $betMoney, $changeBonus, $txnId);
            $wallet = Wallet::where('user_id', $wallet->user_id)->where('active', 1)->first();

            return response()->json([
                "status"  => 0,
                "balance" => floatval(number_format($wallet->total_balance, 2, '.', '')),
                "msg"     => "SUCCESS",
            ]);
        }
    }

    public static function WebhooksFivers($request)
    {
        switch ($request->method) {
            case "user_balance":
                return self::GetBalanceInfo($request);
            case "transaction":
                return self::SetTransaction($request);
            default:
                return response()->json(['status' => 0]);
        }
    }

    private static function CreateTransactionsFivers($playerId, $betReferenceNum, $transactionID, $type, $changeBonus, $amount, $providers, $game, $pn)
    {
        $order = Order::create([
            'user_id'       => $playerId,
            'session_id'    => $betReferenceNum,
            'transaction_id'=> $transactionID,
            'type'          => $type,
            'type_money'    => $changeBonus,
            'amount'        => $amount,
            'providers'     => $providers,
            'game'          => $game,
            'game_uuid'     => $pn,
            'round_id'      => 1,
        ]);

        if ($order) {
            return $order;
        }

        return false;
    }
}

?>
