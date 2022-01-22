<?php

/**
 * Created By PhpStorm
 * User sclecon
 * Contact Email 27941662@qq.com
 * Time 2022/1/22 11:13
 */


namespace app\connector\utils;


use app\connector\exception\HandleException;
use think\facade\Request;

class Verify
{
    public static function get(array $params, string $method = 'post'){
        if (in_array($method, ['get', 'post', 'header']) === false){
            throw new HandleException($method.' method not must verify args');
        }
        $data = new \stdClass();
        foreach ($params as $param) {
            $data->$param = Request::$method($param, false);
            if ($data->$param === false){
                throw new HandleException($method.' args list must '.$param.' param');
            }
        }
        return $data;
    }

}