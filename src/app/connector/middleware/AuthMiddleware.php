<?php

namespace app\connector\middleware;

use app\connector\response\Json;
use app\connector\utils\DataEncryption;
use app\connector\utils\Verify;
use app\Request;
use think\facade\Config;

class AuthMiddleware
{
    public function handle(Request $request, \Closure $next){
        $header = Verify::get(['authentication'], 'header');
        $user = DataEncryption::decode($header->authentication);
        if ($user['expire'] < time()){
            return Json::error('用户登录信息已过期，请重新登录', 504);
        }
        Config::set(['id'=>$user['user_id'], 'phone'=>$user['phone']], 'user');
        return $next($request);
    }
}