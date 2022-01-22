<?php

/**
 * Created By PhpStorm
 * User sclecon
 * Contact Email 27941662@qq.com
 * Time 2022/1/22 10:15
 */


namespace app\connector\controller;


use app\admin\model\SendCode;
use app\BaseController;
use app\connector\exception\HandleException;
use app\connector\response\Json;
use app\connector\services\SmsSendCode;

class Utils extends BaseController
{

    public function send_code(){
        $phone = $this->request->post('phone', false);
        if ($phone === false){
            throw new HandleException('args must phone param');
        }
        $code = (new SmsSendCode())->setDriver('aliyun')->setPhone($phone)->send();
        $send_id = (new SendCode())->insert([
            'phone' =>  $phone,
            'code'  =>  $code,
            'status'=>  0
        ], true);
        return Json::success('send code successfully', [
            'code_id'   =>  $send_id
        ]);
    }
}