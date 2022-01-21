<?php

/**
 * Created By PhpStorm
 * User sclecon
 * Contact Email 27941662@qq.com
 * Time 2022/1/21 14:25
 */


namespace app\connector\services\pay\driver\exception;


class WeixinException extends \Exception
{
    public function __construct(string $msg)
    {
        $msg = str_replace('{msg}', $msg, '[wxpay] {msg}');
        parent::__construct($msg);
    }
}