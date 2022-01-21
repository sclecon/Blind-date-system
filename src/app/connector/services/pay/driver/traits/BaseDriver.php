<?php

/**
 * Created By PhpStorm
 * User sclecon
 * Contact Email 27941662@qq.com
 * Time 2022/1/21 10:00
 */


namespace app\connector\services\pay\driver\traits;


trait BaseDriver
{
    public function support() : array {
        return ['wx', 'h5', 'pc'];
    }

    public function getName() : string {
        return (empty($this->name) || is_null($this->name)) ? strtolower(self::class) : $this->name ;
    }

    public function getField() : string {
        $class = explode('\\', self::class);
        return (empty($this->field) || is_null($this->field)) ? strtolower(end($class)) : $this->field ;
    }

    public function getLogo() : string {
        return (empty($this->logo) || is_null($this->logo)) ? str_replace('{field}', $this->getField(), '/static/pay/{field}.png') : $this->logo;
    }

    public function getConfig() : array {
        // return Config::get('pay.'.$this->>getName(), []);
        return [];
    }

    public function pay(string $support, string $order_id, string $total_fee, string $subject): array {
        throw new \Exception('pay module must drive customize');
    }

    public function query(string $order_id, string $id_type = 'out_trade_no') : array {
        throw new \Exception('query order module must drive customize');
    }

    public function notify(\Closure $handle) : bool
    {
        throw new \Exception('order notify module must drive customize');
    }
}