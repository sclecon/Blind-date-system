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
    public function __construct($message = "")
    {
        parent::__construct($message, 500);
    }
}