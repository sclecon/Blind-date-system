<?php

namespace app\connector\controller;

use app\BaseController;
use app\connector\response\Json;
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

    public function __construct(App $app, VipService $vip, VipPayService $vipOrder)
    {
        parent::__construct($app);
        $this->vip = $vip;
        $this->vipOrder = $vipOrder;
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

    public function check(){
        $input = Verify::get(['order_id'], 'post');
        return Json::success('get vip payment status successfully', [
            'order_id'  =>  $input->order_id,
            'status'    =>  $this->vipOrder->getOrderStatus($input->order)
        ]);
    }

    public function notify() : string {
        $vipOrder = $this->vipOrder;
        $vipOrder->notify(function ($order_id) use ($vipOrder) {
            $order = $vipOrder->get($order_id, false);
            if (is_null($order)){
                return false;
            }
            return $vipOrder->success($order_id);
        });
        return "SUCCESS";
    }
}