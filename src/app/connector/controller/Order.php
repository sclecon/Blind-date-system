<?php

namespace app\connector\controller;

use app\BaseController;
use app\connector\response\Json;
use app\connector\services\OrderService;
use app\connector\utils\Verify;
use think\facade\Config;

class Order extends BaseController
{
    public function create(){
        $input  = Verify::get(['user_id', 'code'], 'post');
        $order = (new OrderService())->createOrder(Config::get('user.id'), $input->user_id, $input->code);
        return Json::success('create order successfully', $order);
    }

    public function status(){
        $input = Verify::get(['order_id'], 'post');
        return Json::success('get order status successfully', [
            'order_id'      =>  $input->order_id,
            'status'        =>  (new OrderService())->getOrderStatus(Config::get('user.id'), $input->order_id)
        ]);
    }

    public function query(){

    }
}