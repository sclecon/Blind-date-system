<?php

/**
 * Created By PhpStorm
 * User sclecon
 * Contact Email 27941662@qq.com
 * Time 2022/1/21 9:52
 */


namespace app\connector\services\pay\driver\port;


interface PayPort
{

    public function getName() : string;

    public function getField() : string;

    public function getLogo() : string;

    public function getConfig() : array;

    public function support() : array;

    public function pay(string $support, string $order_id, string $total_fee, string $subject) : array;

    public function query(string $order_id, string $id_type = 'out_trade_no') : array;

    public function notify(\Closure $handle):bool;
}