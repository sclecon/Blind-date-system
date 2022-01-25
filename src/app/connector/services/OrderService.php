<?php

namespace app\connector\services;

use app\admin\model\UserPay;
use app\connector\utils\traits\BaseModelService;

class OrderService
{
    protected $model = UserPay::class;

    use BaseModelService;

    public function createOrder(string $user_id, string $buy_user_id, string $code){
        $openid = (new WxAppService())->getOpenID($code);
        // $openid = 'ovuZIwgm0P38tOUj8jdmfJwlvCug';
        $orderData = $this->createOrderData($user_id, $buy_user_id);
        $payConfig = (new PaymentService())
            ->setOrder('wxapp', 'weixin', $orderData['order_id'], $orderData['total'], $orderData['subject'], $openid)
            ->pay();
        $pay_id = $this->getModel()->insert($orderData, true);
        return [
            'pay_id'    =>  $pay_id,
            'order_id'  =>  $orderData['order_id'],
            'config'    =>  $payConfig['data']
        ];
    }

    protected function createOrderId(){
        return time().rand(100000, 999999);
    }

    protected function createOrderData(string $user_id, string $buy_user_id) : array {
        return [
            'order_id'      =>  $this->createOrderId(),
            'user_id'       =>  $user_id,
            'buy_user_id'   =>  $buy_user_id,
            'subject'       =>  '查看联系方式',
            'total'         =>  sysconfig('pay', 'pay_total'),
            'create_time'   =>  time(),
        ];
    }

}