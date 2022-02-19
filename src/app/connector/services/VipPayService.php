<?php

namespace app\connector\services;

use app\admin\model\VipPay;
use app\connector\exception\HandleException;
use app\connector\utils\traits\BaseModelService;
use think\facade\Request;

class VipPayService
{
    protected $model = VipPay::class;

    use BaseModelService;

    public function pay(string $vip_id, string $user_id, string $name, string $days, string $numbers, string $total_fee, string $code){
        # $openid = (new WxAppService())->getOpenID($code);
        $openid = 'ovuZIwgm0P38tOUj8jdmfJwlvCug';
        $orderData = $this->createOrderData($vip_id, $user_id, $name, $days, $numbers, $total_fee);
        $notifyUrl = Request::domain().'/vip/pay/notify';
        $payConfig = (new PaymentService())
            ->setOrder('wxapp', 'weixin', $orderData['order_id'], $orderData['total_fee'], $orderData['name'], $openid, $notifyUrl)
            ->pay();
        $pay_id = $this->getModel()->insert($orderData, true);
        return [
            'pay_id'    =>  $pay_id,
            'order_id'  =>  $orderData['order_id'],
            'config'    =>  $payConfig['data']
        ];
    }

    public function getOrderStatus(string $order_id){
        $order = $this->get($order_id);
        return $order->flag;
    }

    public function get(string $order_id, bool $exctption = true){
        $order = $this->getModel()
            ->where('order_id', $order_id)
            ->find();
        if (is_null($order) && $exctption === true){
            throw new HandleException('获取订单数据失败');
        }
        return $order;
    }

    public function notify(\Closure $handle){
        (new PaymentService())->notify('weixin', $handle);
    }

    public function success(string $order_id) : bool {
        return $this->getModel()
            ->where('order_id', $order_id)
            ->save(['flag'=>1]);
    }

    protected function createOrderId(){
        return time().rand(100000, 999999);
    }

    protected function createOrderData(string $vip_id, string $user_id, string $name, string $days, string $numbers, string $total_fee) : array {
        return [
            'vip_id'    =>  $vip_id,
            'user_id'   =>  $user_id,
            'order_id'  =>  $this->createOrderId(),
            'name'      =>  $name,
            'days'      =>  $days,
            'numbers'   =>  $numbers,
            'total_fee' =>  $total_fee
        ];
    }
}