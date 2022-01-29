<?php

namespace app\connector\services;

use app\admin\model\UserPay;
use app\connector\exception\HandleException;
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

    public function getOrderStatus(string $user_id, string $order_id) : int {
        $order = $this->getModel()
            ->where('order_id', $order_id)
            ->where('user_id', $user_id)
            ->field('flag')
            ->find();
        if (is_null($order)){
            throw new HandleException('订单不存在', 404);
        }
        return intval($order->flag);
    }

    public function findUserBuyer(string $user_id, string $buy_user_id){
        $order = $this->getModel()
            ->where('buy_user_id', $buy_user_id)
            ->where('user_id', $user_id)
            ->field('flag')
            ->find();
        return is_null($order) ? 0 : $order->flag;
    }

    public function findOrderByOrderID(string $order_id){
        return $order = $this->getModel()
            ->where('order_id', $order_id)
            ->find();
    }

    public function success(string $order_id) : bool {
        return $this->getModel()
            ->where('order_id', $order_id)
            ->save(['flag'=>1]);
    }

    public function notify(\Closure $handle){
        (new PaymentService())->notify('weixin', $handle);
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