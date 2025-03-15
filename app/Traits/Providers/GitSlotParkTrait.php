<?php

namespace App\Traits\Providers;

use App\Helpers\Core as Helper;
use App\Models\Game;
use App\Models\GamesKey;
use App\Models\GGRGames;
use App\Models\Order;
use App\Models\Provider;
use App\Models\Transaction;
use App\Models\User;
use App\Models\Wallet;
use App\Traits\Missions\MissionTrait;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Storage;

trait GitSlotParkTrait
{
    use MissionTrait;

    /**
     * 456
     * @Trait feita por Pablo - Nabrisa (41)98448-7588
     * @var string
     */
    protected static $agentCode;
    protected static $agentToken;
    protected static $agentSecretKey;
    protected static $apiEndpoint;

    public static function getCredentialsGitSlotPark(): bool
    {
        if (!empty(self::$agentCode) && !empty(self::$agentToken) && !empty(self::$agentSecretKey) && !empty(self::$apiEndpoint)) {
            return true;
        }
    
        $setting = GamesKey::first();

        self::$agentCode        = $setting->getAttributes()['gitslotpark_agent_code'];
        self::$agentToken       = $setting->getAttributes()['gitslotpark_agent_token'];
        self::$agentSecretKey   = $setting->getAttributes()['gitslotpark_agent_secret_key'];
        self::$apiEndpoint      = $setting->getAttributes()['gitslotpark_api_endpoint'];

        return true;
    }

    /**
     * @Trait feita por Pablo - Nabrisa (41)98448-7588
     * @param $rtp
     * @param $provider
     * @return void
     */
    public static function LoadingGamesGitSlotPark()
    {
        if(self::getCredentialsGitSlotPark()) {
            $postArray = [
                "agent_code" => "",
                "agent_token" => "",
                "user_code" => "test",
                "game_type" => "slot",
                "provider_code" => "PRAGMATIC",
                "game_code" => "vs20doghouse",
                "lang" => "en",
                "user_balance" => 1000
            ];

            $response = Http::post(self::$apiEndpoint.'game_launch', $postArray);

            if($response->successful()) {
                $games = $response->json();

                dd($games);
            }
        }
    }

    /**
     * @dev victormsalatiel - Corra de golpista, me chame no instagram
     * @param $rtp
     * @param $provider
     * @return void
     */
    public static function UpdateRTPGitSlotPark($rtp, $provider)
    {
        if (self::getCredentialsGitSlotPark()) {
            $postArray = [
                "method"        => "control_rtp",
                "agent_code"    => self::$agentCode,
                "agent_token"   => self::$agentToken,
                "provider_code" => $provider,
                "user_code"     => auth('api')->id(),
                "rtp"           => $rtp
            ];
    
            $response = Http::post(self::$apiEndpoint.'/control_rtp', $postArray);
    
            if ($response->successful()) {
                // Handle successful response if needed
            }
        }
    }
    
    

    /**
     * Create User
     * Metodo para criar novo usuário
     * @dev victormsalatiel - Corra de golpista, me chame no instagram
     *
     * @return bool
     */
    public static function createUserGitSlotPark($userId)
    {
        if (self::getCredentialsGitSlotPark()) {
            $postArray = [
                "method"        => "user_create",
                "agent_code"    => self::$agentCode,
                "agent_token"   => self::$agentToken,
                "user_code"     => $userId,
            ];
    
            $response = Http::post(self::$apiEndpoint.'/user_create', $postArray);
    
            if ($response->successful()) {
                return true;
            }
            return false;
        }
        return false;
    }
    

    /**
     * Iniciar Jogo
     * @dev victormsalatiel - Corra de golpista, me chame no instagram
     * Metodo responsavel para iniciar o jogo
     *
     */
    public static function GameLaunchGitSlotPark($provider_code, $game_code, $lang, $userId)
    {
        if (self::getCredentialsGitSlotPark()) {
            $wallet = Wallet::where('user_id', $userId)->first();
    
            $postArray = [
                "agent_code"    => self::$agentCode,
                "agent_token"   => self::$agentToken,
                "user_code"     => $userId,
                "provider_code" => $provider_code,
                "game_code"     => $game_code,
                'user_balance'  => $wallet->total_balance,
                'game_type'     => 'slot',
                "lang"          => $lang
            ];
    
            $response = Http::post(self::$apiEndpoint.'/game_launch', $postArray);
    
            if ($response->successful()) {
                $data = $response->json();
    
                if ($data['status'] == 0 && $data['msg'] == 'Invalid User') {
                    if (self::createUserGitSlotPark($userId)) {
                        return self::GameLaunchGitSlotPark($provider_code, $game_code, $lang, $userId);
                    }
                } else {
                    return $data;
                }
            } else {
                return false;
            }
        }
    }
    

    /**
     * @dev victormsalatiel - Corra de golpista, me chame no instagram
     * @return false|void
     */
    public static function getGitSlotParkUserDetail()
    {
        if(self::getCredentialsGitSlotPark()) {
            $dataArray = [
                "method"        => "call_players",
                "agent_code"    => self::$agentCode,
                "agent_token"   => self::$agentToken,
            ];

            $response = Http::post(self::$apiEndpoint, $dataArray);

            if($response->successful()) {
                $data = $response->json();

                dd($data);
            }else{
                return false;
            }
        }

    }

    /**
     * @dev victormsalatiel - Corra de golpista, me chame no instagram
     * @param $provider_code
     * @param $game_code
     * @param $lang
     * @param $userId
     * @return false|void
     */
    public static function getGitSlotParkBalance()
    {
        try {
            if(self::getCredentialsGitSlotPark()) {
                $dataArray = [
                    "agent_code"    => self::$agentCode,
                    "agent_token"   => self::$agentToken,
                ];

                $response = Http::post(self::$apiEndpoint.'/info', $dataArray);

                if($response->successful()) {
                    $data = $response->json();

                    return $data['agent_balance'] ?? 0;
                }else{
                    return 0;
                }
            }
        } catch (\Exception $e) {
            return 0;
        }

    }

    /**
     * Prepare Transaction
     * Metodo responsavel por preparar a transação
     * @dev victormsalatiel - Corra de golpista, me chame no instagram
     *
     * @param $wallet
     * @param $userCode
     * @param $txnId
     * @param $betMoney
     * @param $winMoney
     * @param $gameCode
     * @return \Illuminate\Http\JsonResponse|void
     */
    private static function PrepareTransactionsGitSlotPark($walletId, $userId, $txnId, $betAmount, $winAmount, $gameCode, $providerCode)
    {
        $transaction = Order::create([
            'wallet_id' => $walletId,
            'user_id' => $userId,
            'transaction_id' => $txnId,
            'amount' => $betAmount,
            'type' => 'bet',
            'status' => 'pending',
            'game_code' => $gameCode,
            'provider_code' => $providerCode
        ]);
    
        if ($transaction) {
            GGRGames::create([
                'user_id' => $userId,
                'game' => $gameCode,
                'transaction_id' => $transaction->id,
                'amount' => $betAmount,
                'type' => 'bet',
                'balance_bet' => $betAmount,
                'balance_win' => $winAmount,
                'provider' => $providerCode
            ]);
            return $transaction;
        }
        return null;
    }
    
    

    /**
     * @param $request
     * @dev victormsalatiel - Corra de golpista, me chame no instagram
     * @return \Illuminate\Http\JsonResponse|null
     */
    public static function WebhooksGitSlotPark($request)
    {
        switch ($request->method) {
            case "user_balance":
                return self::GetUserBalanceGitSlotPark($request);
            case "game_callback":
                return self::GameCallbackGitSlotPark($request);
            case "money_callback":
                return self::MoneyCallbackGitSlotPark($request);
            default:
                return response()->json(['status' => 0]);
        }
    }

    /**
     * @dev victormsalatiel - Corra de golpista, me chame no instagram
     * @param $request
     * @return \Illuminate\Http\JsonResponse
     */
    private static function GetUserBalanceGitSlotPark($request)
    {
        $wallet = Wallet::where('user_id', $request->user_code)->where('active', 1)->first();
        if (!empty($wallet) && $wallet->total_balance > 0) {
            return response()->json([
                'status' => 1,
                'user_balance' => $wallet->total_balance
            ]);
        }
    
        return response()->json([
            'status' => 0,
            'msg' => "INVALID_USER"
        ]);
    }
    

    /**
     * @dev victormsalatiel - Corra de golpista, me chame no instagram
     * @param $request
     * @return \Illuminate\Http\JsonResponse|void|null
     */
    private static function GameCallbackGitSlotPark($request)
    {
        $data = $request->all();
        try {
            if($data['game_type'] == 'slot' && isset($data['slot'])) {
                return self::ProcessPlayGitSlotPark($data, $request->user_code,'slot');
            }

            if($data['game_type'] == 'casino' && isset($data['casino'])) {
                return self::ProcessPlayGitSlotPark($data, $request->user_code, 'casino');
            }

            return response()->json([
                'status' => 0,
                'msg' => 'INVALID_USER	'
            ]);
        } catch (\Exception $e) {
            dd($e->getMessage());
        }
    }

    /**
     * @param $data
     * @param $userId
     * @param $type
     * @return \Illuminate\Http\JsonResponse|void
     */
    private static function ProcessPlayGitSlotPark($data, $userId, $type)
    {
        $wallet = Wallet::where('user_id', $userId)->where('active', 1)->first();
        if (!empty($wallet)) {
            $game = Game::where('game_code', $data[$type]['game_code'])->first();
            self::CheckMissionExist($userId, $game);
    
            $existingTransaction = Order::where('transaction_id', $data[$type]['txn_id'])->where('type', 'bet')->first();
            if (!empty($existingTransaction)) {
                return response()->json([
                    'status' => 0,
                    'user_balance' => $wallet->total_balance,
                    'msg' => 'DUPLICATED_REQUEST'
                ]);
            }
    
            $transaction = Order::where('transaction_id', $data[$type]['txn_id'])->first();
            if (!empty($transaction)) {
                $resultType = floatval($data[$type]['win']) > floatval($data[$type]['bet']) ? 'win' : 'loss';
                $transaction->update([
                    'type' => $resultType,
                    'amount' => abs($data[$type]['win'] - $data[$type]['bet'])
                ]);
    
                $lastTransaction = GGRGames::where('user_id', $wallet->user_id)
                    ->where('provider', $data[$type]['provider_code'])
                    ->where('game', $data[$type]['game_code'])
                    ->latest()
                    ->first();
    
                if (!empty($lastTransaction)) {
                    $lastTransaction->update([
                        'transaction_id' => $transaction->id,
                        'balance_bet' => $data[$type]['bet'],
                        'balance_win' => $data[$type]['win'],
                        'type' => $resultType
                    ]);
    
                    Helper::generateGameHistory(
                        $wallet->user_id,
                        $resultType,
                        $data[$type]['win'],
                        $transaction->amount,
                        $transaction->getAttributes()['type_money'],
                        $transaction->transaction_id
                    );
    
                    $wallet = Wallet::where('user_id', $userId)->where('active', 1)->first();
                    return response()->json([
                        'status' => 1,
                        'user_balance' => $wallet->total_balance,
                    ]);
                } else {
                    return response()->json([
                        'status' => 0,
                        'msg' => 'No transaction found for the user'
                    ]);
                }
            }
    
            if (floatval($wallet->total_balance) >= $data[$type]['bet']) {
                self::CheckMissionExist($userId, $game);
    
                $transaction = self::PrepareTransactionsGitSlotPark(
                    $wallet->id, $userId,
                    $data[$type]['txn_id'],
                    $data[$type]['bet'],
                    $data[$type]['win'],
                    $data[$type]['game_code'],
                    $data[$type]['provider_code']
                );
    
                if ($transaction) {
                    $resultType = floatval($data[$type]['win']) > floatval($data[$type]['bet']) ? 'win' : 'loss';
    
                    Order::where('transaction_id', $data[$type]['txn_id'])
                        ->where('type', 'bet')
                        ->update([
                            'type' => $resultType,
                            'amount' => abs($data[$type]['win'] - $data[$type]['bet'])
                        ]);
    
                    $lastTransaction = GGRGames::where('user_id', $wallet->user_id)
                        ->where('provider', $data[$type]['provider_code'])
                        ->where('game', $data[$type]['game_code'])
                        ->latest()
                        ->first();
    
                    if (!empty($lastTransaction)) {
                        $lastTransaction->update([
                            'transaction_id' => $transaction->id,
                            'balance_bet' => $data[$type]['bet'],
                            'balance_win' => $data[$type]['win'],
                            'type' => $resultType
                        ]);
    
                        Helper::generateGameHistory(
                            $wallet->user_id,
                            $resultType,
                            $data[$type]['win'],
                            $transaction->amount,
                            $transaction->getAttributes()['type_money'],
                            $transaction->transaction_id
                        );
    
                        $wallet = Wallet::where('user_id', $userId)->where('active', 1)->first();
                        return response()->json([
                            'status' => 1,
                            'user_balance' => $wallet->total_balance,
                        ]);
                    } else {
                        return response()->json([
                            'status' => 0,
                            'msg' => 'No transaction found for the user'
                        ]);
                    }
                }
            } else {
                return response()->json([
                    'status' => 0,
                    'msg' => 'INSUFFICIENT_BALANCE'
                ]);
            }
        }
        return response()->json([
            'status' => 0,
            'msg' => 'INVALID_USER'
        ]);
    }
    
    
    
    
    
    

    /**
     * @param $request
     * @return \Illuminate\Http\JsonResponse
     */
    private static function MoneyCallbackGitSlotPark($request)
    {
        $data = $request->all();

        $transaction = Order::where('transaction_id', $data['txn_id'])->first();
        $wallet = Wallet::where('user_id', $transaction->user_id)->first();

        if(!empty($transaction) && !empty($wallet)) {

        }

        return response()->json([
            'status' => 1,
            'user_balance' => $wallet->total_balance
        ]);
    }


    /**
     * Create Transactions
     * Metodo para criar uma transação
     * @dev victormsalatiel - Corra de golpista, me chame no instagram
     *
     * @return false
     */
    private static function CreateTransactionsGitSlotPark($playerId, $betReferenceNum, $transactionID, $type, $changeBonus, $amount, $game, $pn)
    {

        $order = Order::create([
            'user_id'       => $playerId,
            'session_id'    => $betReferenceNum,
            'transaction_id'=> $transactionID,
            'type'          => $type,
            'type_money'    => $changeBonus,
            'amount'        => $amount,
            'providers'     => 'gitslotpark',
            'game'          => $game,
            'game_uuid'     => $pn,
            'round_id'      => 1,
        ]);

        if($order) {
            return $order;
        }

        return false;
    }

    /**
     * Create User
     * Metodo para criar novo usuário
     *
     * @return bool
     */
    public static function getProviderGitSlotPark($param)
    {
        if(self::getCredentialsGitSlotPark()) {
            $response = Http::post(self::$apiEndpoint.'provider_list', [
                'agent_code' => self::$agentCode,
                'agent_token' => self::$agentToken,
                'game_type' => $param, ///  [slot, casino, pachinko]
            ]);

            if($response->successful()) {
                $data = $response->json();
                if($data['status'] == 1) {
                    foreach ($data['providers'] as $provider) {
                        $checkProvider = Provider::where('code', $provider['code'])->where('distribution', 'gitslotpark')->first();
                        if(empty($checkProvider)) {

                            $dataProvider = [
                                'code' => $provider['code'],
                                'name' => $provider['name'],
                                'rtp' => 90,
                                'status' => 1,
                                'distribution' => 'gitslotpark',
                            ];

                            Provider::create($dataProvider);
                        }
                    }
                }
            }
        }
    }


    /**
     * Create User
     * Metodo para criar novo usuário
     *
     * @return bool
     */
    public static function getGamesGitSlotPark()
    {
        if(self::getCredentialsGitSlotPark()) {
            $providers = Provider::where('distribution', 'gitslotpark')->get();
            foreach($providers as $provider) {
                $response = Http::post(self::$apiEndpoint.'/game_list', [
                    'agent_code' => self::$agentCode,
                    'agent_token' => self::$agentToken,
                    'provider_code' => $provider->code
                ]);

                if($response->successful()) {
                    $data = $response->json();

                    if(isset($data['games'])) {
                        foreach ($data['games'] as $game) {
                            $checkGame = Game::where('provider_id', $provider->id)->where('game_code', $game['game_code'])->first();
                            if(empty($checkGame)) {
                                if(!empty($game['banner'])) {
                                    $image = self::uploadFromUrlGitSlotPark($game['banner'], $game['game_code']);
                                }else{
                                    $image = null;
                                }

                                if(!empty($game['game_code']) && !empty($game['game_name'])) {
                                    $data = [
                                        'provider_id'   => $provider->id,
                                        'game_id'       => $game['game_code'],
                                        'game_code'     => $game['game_code'],
                                        'game_name'     => $game['game_name'],
                                        'technology'    => 'html5',
                                        'distribution'  => 'gitslotpark',
                                        'rtp'           => 90,
                                        'cover'         => $image,
                                        'status'        => 1,
                                    ];

                                    Game::create($data);
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    public static function getInfoFromProviders(array $providerCodes)
    {
        $requestData = [];
        foreach ($providerCodes as $providerCode) {
            $requestData[] = [
                'provider_code' => $providerCode,
                // Adicione outros parâmetros necessários aqui
            ];
        }
    
        $response = Http::post(self::$apiEndpoint.'/get_info_from_providers', $requestData);
    
        if ($response->successful()) {
            $data = $response->json();
            // Verificar se a resposta contém os dados esperados
            if (isset($data['status']) && $data['status'] === 1 && isset($data['providers'])) {
                return $data['providers'];
            } else {
                return false;
            }
        } else {
            // Tratar falhas na comunicação com a API
            // Exemplo: retornar uma mensagem de erro personalizada
            return ['error' => 'Desculpe, os jogos voltam em alguns minutos'];
        }
    }
    
    /**
     * @param $url
     * @return string|null
     * @throws \GuzzleHttp\Exception\GuzzleException
     */
    private static function uploadFromUrlGitSlotPark($url, $name = null)
    {
        try {
            $client = new \GuzzleHttp\Client();
            $response = $client->get($url);

            if ($response->getStatusCode() === 200) {
                $fileContent = $response->getBody();

                // Extrai o nome do arquivo e a extensão da URL
                $parsedUrl = parse_url($url);
                $pathInfo = pathinfo($parsedUrl['path']);
                //$fileName = $pathInfo['filename'] ?? 'file_' . time(); // Nome do arquivo
                $fileName  = $name ?? $pathInfo['filename'] ;
                $extension = $pathInfo['extension'] ?? 'png'; // Extensão do arquivo

                // Monta o nome do arquivo com o prefixo e a extensão
                $fileName = 'fivers/'.$fileName . '.' . $extension;

                // Salva o arquivo usando o nome extraído da URL
                Storage::disk('public')->put($fileName, $fileContent);

                return $fileName;
            }

            return null;
        } catch (\Exception $e) {
            return null;
        }
    }
}


?>
