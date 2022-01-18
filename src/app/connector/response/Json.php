<?php

/**
 * Created By PhpStorm
 * User sclecon
 * Contact Email 27941662@qq.com
 * Time 2022/1/18 10:56
 */


namespace app\connector\response;


use think\Response;

class Json
{

    public static function success(string $msg, array $data = []) : Response {
        return self::output(self::structure(200, $msg, $data));
    }

    public static function error(string $msg, int $code =  500) : Response {
        return self::output(self::structure($code, $msg, []));
    }

    public static function output(array $data) : Response{
        // ob_clean();
        return Response::create($data, 'json');
    }

    protected static function structure(int $code, string $msg, array $data) : array {
        $structure = [
            'code'  =>  $code,
            'msg'   =>  $msg,
        ];
        if ($data){
            $structure['data'] = $data;
        }
        return $structure;
    }

}