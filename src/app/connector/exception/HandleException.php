<?php

/**
 * Created By PhpStorm
 * User sclecon
 * Contact Email 27941662@qq.com
 * Time 2022/1/18 10:43
 */


namespace app\connector\exception;


use Throwable;

class HandleException extends \Exception
{
    public function __construct(string $message, int $errCode = 500)
    {
        parent::__construct($message, $errCode);
    }
}