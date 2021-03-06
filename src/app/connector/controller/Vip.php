<?php

namespace app\connector\controller;

use app\BaseController;
use app\connector\response\Json;
use app\connector\services\UserService;
use app\connector\services\VipPayService;
use app\connector\services\VipService;
use app\connector\utils\Verify;
use think\App;
use think\facade\Config;

class Vip extends BaseController
{
    /**
     * @var VipService
     */
    protected $vip;

    /**
     * @var VipPayService
     */
    protected $vipOrder;

    /**
     * @var UserService
     */
    protected $userService;

    public function __construct(App $app, VipService $vip, VipPayService $vipOrder, UserService $userService)
    {
        parent::__construct($app);
        $this->vip = $vip;
        $this->vipOrder = $vipOrder;
        $this->userService = $userService;
    }

    public function list(){
        return Json::success('get vip list successfully', [
            'list'  =>  $this->vip->list()
        ]);
    }

    public function pay(){
        $input = Verify::get(['vip_id', 'code'], 'post');
        $vip = $this->vip->get($input->vip_id);
        return Json::success('get vip payment config successfully',
            $this->vipOrder->pay($input->vip_id, Config::get('user.id'), '开通'.$vip->name, $vip->days, $vip->numbers, $vip->total_fee, $input->code)
        );
    }

    public function query(){
        $input = Verify::get(['order_id'], 'post');
        return Json::success('get vip payment status successfully', [
            'order_id'  =>  $input->order_id,
            'status'    =>  $this->vipOrder->getOrderStatus($input->order_id)
        ]);
    }

    public function notify() : string {
        $vipOrder = $this->vipOrder;
        $userService = $this->userService;
        $vipOrder->notify(function ($order_id) use ($vipOrder, $userService) {
            $order = $vipOrder->get($order_id, false);
            if (is_null($order)){
                return false;
            }
            $userService->openVip($order->user_id, $order->days, $order->numbers);
            $vipOrder->success($order_id);
        });
        return "SUCCESS";
    }

    public function getUserPhone(){
        $input = Verify::get(['user_id'], 'post');
        return Json::success('get user phone successfully', [
            'user_id'   =>  $input->user_id,
            'phone'     =>  $this->userService->vipGetUserPhone(Config::get('user.id'), $input->user_id)
        ]);
    }
}