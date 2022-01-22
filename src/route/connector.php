<?php

/**
 * Created By PhpStorm
 * User sclecon
 * Contact Email 27941662@qq.com
 * Time 2022/1/22 9:27
 */
use think\facade\Route;
 
Route::group('user', function(){
   Route::post('register', '\app\connector\controller\User::register');
   Route::post('login', '\app\connector\controller\User::login');
});

Route::group('utils', function (){
   Route::post('send_code', '\app\connector\controller\Utils::send_code');
});

Route::group('event', function (){
   Route::post('list', '\app\connector\controller\Event::list');
   Route::post('detail', '\app\connector\controller\Event::detail');
});

// 用户列表
// 用户详情
// 下单支付
// 获取支付结果
// 修改头像
// 编辑资料
// 提交反馈
// 我参与的活动
// 广告新闻列表
// 广告新闻详情