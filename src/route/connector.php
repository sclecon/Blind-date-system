<?php

/**
 * Created By PhpStorm
 * User sclecon
 * Contact Email 27941662@qq.com
 * Time 2022/1/22 9:27
 */
use think\facade\Route;
use \app\connector\middleware\AuthMiddleware;
 
Route::group('user', function(){
   Route::post('register', '\app\connector\controller\User::register');
   Route::post('login', '\app\connector\controller\User::login');
   Route::post('upgrade/avatar', '\app\connector\controller\User::avatar')->middleware(AuthMiddleware::class);
   Route::post('upgrade/profile', '\app\connector\controller\User::profile')->middleware(AuthMiddleware::class);
   Route::post('detail', '\app\connector\controller\User::detail');
   Route::post('list', '\app\connector\controller\User::list')->middleware(AuthMiddleware::class);
   Route::group('condition', function (){
       Route::post('set', '\app\connector\controller\userCondition::set')->middleware(AuthMiddleware::class);
       Route::post('get', '\app\connector\controller\userCondition::get');
   });
});

Route::group('utils', function (){
   Route::post('send_code', '\app\connector\controller\Utils::send_code');
   Route::post('upload/image', '\app\connector\controller\Utils::upload_image');
});

Route::group('event', function (){
   Route::post('list', '\app\connector\controller\Event::list');
   Route::post('detail', '\app\connector\controller\Event::detail');
   Route::post('join', '\app\connector\controller\Event::join')->middleware(AuthMiddleware::class);
   Route::post('logs', '\app\connector\controller\Event::logs')->middleware(AuthMiddleware::class);
});

Route::group('feedback', function (){
    Route::post('send', '\app\connector\controller\Feedback::send');
})->middleware(AuthMiddleware::class);

Route::group('news', function (){
   Route::post('list', '\app\connector\controller\News::list');
   Route::post('detail', '\app\connector\controller\News::detail');
});

Route::group('order', function (){
    Route::post('create', '\app\connector\controller\Order::create');
    Route::post('status', '\app\connector\controller\Order::status');
    Route::post('query', '\app\connector\controller\Order::query');
    Route::post('get/phone', '\app\connector\controller\Order::getUserPhone');
})->middleware(AuthMiddleware::class);

Route::rule('order/notify', '\app\connector\controller\Order::notify');

Route::group('banner', function (){
    Route::post('home', '\app\connector\controller\Banner::home');
    Route::post('event', '\app\connector\controller\Banner::event');
});

Route::rule('vip/pay/notify', '\app\connector\controller\Vip::notify');
Route::group('vip', function (){
    Route::post('list', '\app\connector\controller\Vip::list');
    Route::post('pay/query', '\app\connector\controller\Vip::query');
    Route::post('user/phone', '\app\connector\controller\Vip::getUserPhone');
    Route::post('pay', '\app\connector\controller\Vip::pay');
})->middleware(AuthMiddleware::class);