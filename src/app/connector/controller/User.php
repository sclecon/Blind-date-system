<?php

/**
 * Created By PhpStorm
 * User sclecon
 * Contact Email 27941662@qq.com
 * Time 2022/1/22 9:26
 */


namespace app\connector\controller;


use app\BaseController;
use app\connector\exception\HandleException;
use app\connector\response\Json;
use app\connector\services\SendCode;
use app\connector\services\UserService;
use app\connector\utils\Verify;

class User extends BaseController
{
    public function register(){
        $input = Verify::get(['phone', 'sex', 'msg_id', 'code', 'longitude', 'dimension'], 'post');
        (new SendCode())->hasMsgId($input->msg_id, $input->phone)->checkCode($input->code);
        $userService = new UserService();
        if ($userService->hasPhone($input->phone) === true){
            throw new HandleException("手机号已存在，请勿重复注册");
        }
        $userToken = $userService->register($input->phone, $input->sex, $input->longitude, $input->dimension);
        return Json::success('用户注册成功', $userToken);
    }

    public function login(){

    }
}