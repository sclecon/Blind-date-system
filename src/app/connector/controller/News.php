<?php

namespace app\connector\controller;

use app\BaseController;
use app\connector\response\Json;

class News extends BaseController
{
    public function list(){
        return Json::success('get news list successfully', [
            'list'  =>  ''
        ]);
    }

    public function detail(){
        return Json::success('get news detail successfully', []);
    }
}