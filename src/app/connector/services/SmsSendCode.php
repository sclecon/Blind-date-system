<?php

namespace app\connector\services;

use app\connector\services\sms\Aliyun;
use app\connector\exception\HandleException;

class SmsSendCode
{
    protected $phone;
    protected $driver;
    protected $template;
    protected $code;
    protected $drivers = ['aliyun'];

    public function send(int $code = 0) : int {
        $this->createCode($code);
        $this->checkParams();
        $driver = $this->getDriver();
        switch ($driver){
            case 'aliyun':
                return $this->aliYunSend();
        }
        throw new HandleException("You have Driver '$driver' not matched");
    }

    public function setPhone(string $phone) : SmsSendCode {
        $this->phone = $phone;
        return $this;
    }

    public function getPhone(){
        return $this->phone;
    }

    public function setDriver(string $driver) : SmsSendCode {
        if (in_array($driver, $this->drivers) === false){
            throw new HandleException('your setting code Driver is invalid', 500);
        }
        $this->driver = $driver;
        return $this;
    }

    public function getDriver(){
        return $this->driver;
    }

    public function getCode(){
        return $this->code;
    }

    protected function createCode(int $code = 0){
        $this->code = in_array(strlen($code), [4, 5, 6]) ?: rand(100000, 999999);
        return $this;
    }

    protected function checkParams(){
        if ($this->getDriver() === null){
            throw new HandleException('You have not set SMS Base Driver', 500);
        }
        if ($this->getPhone() === null){
            throw new HandleException('You have not set SMS phone Number', 500);
        }
        if ($this->getCode() === null){
            throw new HandleException('You have not create or transfer SMS Template Extend Code', 500);
        }
        return true;
    }

    protected function aliYunSend() : int {
        $signName = '阿里云短信测试';
        $appId = 'LTAIwdFnCMoWTqio';
        $appSecret = 'yPF6QxyPZoiXYHiizt88u0W1vaM2a8';
        $template = 'SMS_154950909';

        $response = Aliyun::send(
            $appId,
            $appSecret,
            $signName,
            $template,
            ['code'=>$this->getCode()],
            $this->getPhone()
        );
        if ($response->body->code !== 'OK'){
            throw new HandleException($response->body->message);
        }
        return $this->getCode();
    }
}