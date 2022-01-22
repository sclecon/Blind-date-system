<?php

/**
 * Created By PhpStorm
 * User sclecon
 * Contact Email 27941662@qq.com
 * Time 2022/1/22 10:15
 */


namespace app\connector\controller;


use app\BaseController;
use app\connector\response\Json;
use app\connector\services\SendCode;
use app\connector\services\SmsSendCode;
use app\connector\utils\Verify;

class Utils extends BaseController
{

    public function send_code(){
        $input = Verify::get(['phone'], 'post');
        $code = (new SmsSendCode())->setDriver('aliyun')->setPhone($input->phone)->send();
        return Json::success('send code successfully', [
            'code_id'   =>  (new SendCode())->insert($input->phone, $code)
        ]);
    }
}