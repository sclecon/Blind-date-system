<?php

namespace app\connector\controller;

use app\BaseController;
use app\connector\response\Json;
use app\connector\services\OrderService;
use app\connector\utils\Verify;
use think\facade\Config;
use think\Response;

class Order extends BaseController
{
    public function create() : Response {
        $input = Verify::get(['user_id', 'code'], 'post');
        $order = (new OrderService())->createOrder(Config::get('user.id'), $input->user_id, $input->code);
        return Json::success('create order successfully', $order);
    }

    public function status() : Response {
        $input = Verify::get(['order_id'], 'post');
        return Json::success('get order status successfully', [
            'order_id'      =>  $input->order_id,
            'status'        =>  (new OrderService())->getOrderStatus(Config::get('user.id'), $input->order_id)
        ]);
    }

    public function query() : Response {
        $input = Verify::get(['user_id'], 'post');
        return Json::success('query user buy status successfully', [
           'user_id'    =>  $input->user_id,
           'status'     =>  (new OrderService())->findUserBuyer(Config::get('user.id'), $input->user_id)
        ]);
    }

    public function notify() : string {
        $orderService = new OrderService();
        $orderService->notify(function ($order_id) use ($orderService) {
            $order = $orderService->findOrderByOrderID($order_id);
            if (is_null($order)){
                return false;
            }
            return $orderService->success($order_id);
        });
        return "SUCCESS";
    }
}