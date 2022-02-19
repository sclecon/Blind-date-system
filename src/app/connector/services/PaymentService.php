<?php

/**
 * Created By PhpStorm
 * User sclecon
 * Contact Email 27941662@qq.com
 * Time 2022/1/21 9:33
 */


namespace app\connector\services;


use app\connector\services\pay\PayDriver;

class PaymentService
{
    protected $driver;
    protected $order;

    public function __construct()
    {
        $this->driver = new PayDriver();
    }

    public function getPayTypes(string $support) : array {
        return $this->driver->getList($support);
    }

    public function setOrder(string $support, string $driver, string $order_id, string $total_fee, string $subject, ...$params) : PaymentService {
        $this->driver->checkDrivers($driver, $support);
        if (is_numeric($total_fee) === false){
            throw new \Exception('total_fee must be an integer or float');
        }
        $this->order = [
            'support'   =>  $support,
            'driver'    =>  $driver,
            'order_id'  =>  $order_id,
            'total_fee' =>  $total_fee,
            'subject'   =>  $subject,
            'params'    =>  $params
        ];
        return $this;
    }

    public function pay(){
        if (is_null($this->order)){
            throw new \Exception('Run pay Action before must run setOrder');
        }
        $derve = $this->driver->getDriver($this->order['driver']);
        if ($this->order['driver'] === 'weixin' && is_string($this->order['params'][0])){
            $derve = $derve->setOpenID($this->order['params'][0]);
        }
        if ($this->order['driver'] === 'weixin' && isset($this->order['params'][1]) && is_string($this->order['params'][1])){
            $derve = $derve->setNotifyUrl($this->order['params'][1]);
        }
        return $derve->pay($this->order['support'], $this->order['order_id'], $this->order['total_fee'], $this->order['subject']);
    }

    public function query(string $driver, string $order_id, string $id_type = 'out_trade_no'){
        $this->driver->checkDrivers($driver);
        return $this->driver->getDriver($driver)->query($order_id, $id_type);
    }

    public function notify(string $driver, \Closure $handle){
        $this->driver->checkDrivers($driver);
        return $this->driver->getDriver($driver)->notify($handle);
    }
}