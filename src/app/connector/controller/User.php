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
        $input = (array) Verify::default([
            'username'  =>  $user['username'],
            'remark'    =>  $user['remark'],
            'edu'       =>  $user['edu'],
            'sex'       =>  $user['sex'],
            'birthday'  =>  $user['birthday'],
            'height'    =>  $user['height'],
            'city'      =>  $user['city'],
            'address'   =>  $user['address'],
            'marriage'  =>  $user['marriage'],
            'children'  =>  $user['children'],
            'native'    =>  $user['native'],
            'nation'    =>  $user['nation'],
            'blood'     =>  $user['blood'],
            'weight'    =>  $user['weight'],
            'occupation'  =>  $user['occupation'],
            'school'    =>  $user['school'],
            'major'     =>  $user['major'],
            'house'     =>  $user['house'],
            'car_buy'   =>  $user['car_buy'],
            'income'    =>  $user['income'],
        ], 'post');
        foreach ($input as $field => $item) {
            if ($user[$field] === $item){
                unset($input[$field]);
                continue;
            }
            if (is_null($item)){
                $input[$field] = '';
            }
        }
        if (count($input) > 0) {
            $userService->update(Config::get('user.id'), Config::get('user.phone'), $input);
        }
        return Json::success('upgrade user profile successfully', $input);
    }

    public function detail(){
        $header = Verify::default(['authentication'=>''], 'header');
        if (strlen($header->authentication) === 0){
            $input = Verify::get(['user_id'], 'post');
        }else{
            (new UserService())->decode($header->authentication);
            $input = Verify::default(['user_id'=>Config::get('user.id')], 'post');
        }
        return Json::success('get user detail successfully', (new UserService())->getDetailByUserId($input->user_id)->toArray());
    }

    public function list(){
        $input = Verify::get(['sex', 'city', 'longitude', 'dimension'], 'post');
        $default = Verify::default([
            'age'               =>  false,
            'height'            =>  false,
            'address'           =>  false,
            'income'            =>  false,
            'edu'               =>  false,
            'marriage'          =>  false,
            'house'             =>  false,
            'search'            =>  false,
            'page'              =>  1,
            'number'            =>  10,
        ], 'post');
        $list = (new UserService())->getList($default->page, $default->number, $input->sex, $input->city, $input->longitude, $input->dimension, (array) $default);
        return Json::success('get user list', [
            'list'  =>  $list,
        ]);
    }
}