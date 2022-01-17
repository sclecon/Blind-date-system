<?php

namespace app\connector\controller;

use think\response\Json;
use app\connector\utils\DataEncryption;

class Test
{
    public function index(){
        halt(DataEncryption::encode(['code'=>1]), false);
        halt('debug');
    }
}