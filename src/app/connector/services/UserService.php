<?php
namespace app\connector\services;
use app\connector\utils\DataEncryption;

class UserService
{
    protected $user;

    public function getUserByPhone($phone){
        if ($this->user === null){
            $this->user = [
                'user_id'   =>  1,
                // ...
            ];
        }
        return $this->user;
    }

    public function login(string $phone){
        $user = [
            'phone'     =>  $phone,
            'user_id'   =>  1,
            'expire'    =>  strtotime('+1day')
        ];
        $callBack = [
            'authentication'      =>  DataEncryption::encode($user),
            'profile'             =>  $this->profileCheck($phone)
        ];
        return $callBack;
    }

    public function getUserBySign(string $sign){
        $data = DataEncryption::decode($sign);
        if (is_array($data) === false){
            return 'sign error';
        }
        if ($data['expire'] < time()){
            return 'sign is expire';
        }
        return $this->getUserByPhone($data['phone']);
    }

    public function register($phone, $sex){
        $user = [
            'phone'     =>  $phone,
            'sex'       =>  $sex,
        ];
        // insert data in user table
        return $this->login($phone);
    }

    public function profileCheck($phone){
        $user = $this->getUserByPhone($phone);
        $profile = false;
        // code if
        return $profile;
    }
}