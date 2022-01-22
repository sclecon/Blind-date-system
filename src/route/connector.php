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
});