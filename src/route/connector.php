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
});