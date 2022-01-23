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
use think\facade\Config;

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
        $input = Verify::get(['phone', 'msg_id', 'code', 'longitude', 'dimension'], 'post');
        (new SendCode())->hasMsgId($input->msg_id, $input->phone)->checkCode($input->code);
        return Json::success('用户登录成功', (new UserService())->login($input->phone, $input->longitude, $input->dimension));
    }

    public function avatar(){
        $input = Verify::get(['avatar'], 'post');
        (new UserService())->upgradeAvatar(Config::get('user.id'), Config::get('user.phone'), $input->avatar);
        return Json::success('更新头像成功', ['avatar'=>$input->avatar]);
    }

    public function profile(){
        $userService = new UserService();
        $user = $userService->getDetail(Config::get('user.phone'));
        return Json::success('tests', $user);
    }
}