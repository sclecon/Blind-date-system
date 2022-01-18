<?php

namespace app\connector\controller;


use app\connector\exception\HandleException;
use app\connector\response\Json;

class Test
{
    public function index(){
        throw new HandleException('又抛出一个错误看看');
        //return Json::success('test susseed');
    }
}