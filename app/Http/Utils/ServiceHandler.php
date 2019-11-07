<?php

namespace App\Http\Utils;

use GuzzleHttp\Client;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;

class ServiceHandler
{
    private $client;
    private $baseUrl;

    /**
     * Call this method to get singleton
     * @return ServiceController
     */
    public static function Instance()
    {
        static $inst = null;
        if ($inst === null) 
        {
            $inst = new ServiceController();
        }
        return $inst;
    }

    /**
     * Create a new controller instance.
     */
    private function __construct()
    {
        $this->client    =  new \GuzzleHttp\Client();
        $this->baseUrl   =  env("BCV_WEB_SERVICE_BASE_URL", "localhost/");
    }

    /**
     * Download files from BCV
     * @param  String $fileNumber Operation number
     * @param  String $file File to download
     * @return Array $response Service responses
     */
    public function downloadFile($fileNumber ,$file)
    {
        $operation = '';
        $response = array();

        switch($fileNumber){
            case '1':
                $operation = 'solicitudes';
            break;
            case '3':
                $operation = 'transferencias';
            break;
            case '4':
                $operation = 'desbloqueos';
            break;
            default:
                return;
            break;
        }

        $fileData     = explode("_", $file['file']);
        $auctionCode  = $fileData[0];
        $currencyCode = $fileData[3];

        try
        {
            $response = $this->client->request('POST', $this->baseUrl . $operation, [
    
                'headers' => ['X-Auth-Token' => $this->generateJWT()],
    
                'json'    => ['cosubasta'    => $auctionCode, 'comoneda' => $currencyCode]
    
            ]);
    
            return $response->getBody()->getContents();

        }catch(\Exception $e){
            return ['status' => '500'];
        }
    }

    /**
     * Upload files to BCV
     * @param  String $fileNumber Operation number
     * @param  String $file File to upload
     * @return Array $response Service responses
     */
    public function uploadFile($fileNumber ,$file)
    {
        $operation = '';
        $response = array();

        switch($fileNumber){
            case '2':
                $operation = 'comprobacion';
            break;
            case '5':
                $operation = 'operaciones';
            break;
            default:
                return;
            break;
        }
        
        $fileData     = explode("_", $file['file']);
        $auctionCode  = $fileData[0];
        $currencyCode = $fileData[3];

        try
        {
            $response = $this->client->request('POST', $this->baseUrl . $operation, [
    
                'headers' => ['X-Auth-Token' => $this->generateJWT()],
    
                'json'    => ['cosubasta'    => $auctionCode, 'comoneda' => $currencyCode, 'archivo' => $file]
    
            ]);
        
            return $response->getBody()->getContents();

        }catch(\Exception $e)
        {
            return ['status' => '500'];
        }
    }

    /**
     * Handles BCV password change
     * @param String $password User password
     * @return Array
     */
    public function changePassword($password)
    {
        try
        {

            $response = $this->client->request('POST', $this->baseUrl.'cambiarClave' , [
    
                'headers' => ['X-Auth-Token' => $this->generateJWT()],
    
                'json'    => ['clave'        => $password]
    
            ]);
    
            if($response->status == '200')
            {
                $usuarioBcv = UsuarioBcv::first();
    
                $usuarioBcv->tx_password = $clave;
    
                $usuarioBcv->save();
            }
    
            return $response;
        }catch(\Exception $e)
        {
            return ['status' => '500'];
        }
    }

    /**
     * Handles JWT Generation
     * @return String $token Token
     */
    private function generateJWT()
    {
        try
        {
            $user=Auth::user();         
            $payload=JWTFactory::sub($user->id_usuario)->make();          
            $token=JWTAuth::encode($payload);
            return $token;

        }catch(\Exception $e)
        {
            return '';
        }
    }
}
