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
use app\connector\services\SmsSendCode;

class Utils extends BaseController
{

    /**
     * @var SmsSendCode
     */
    protected $smsService;

    public function send_code(){
        $phone = $this->request->post('phone');
        $code = $this->smsService->setDriver('aliyun')->setPhone($phone)->send();

    }
}