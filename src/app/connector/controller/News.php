<?php

namespace app\connector\controller;

use app\BaseController;
use app\connector\response\Json;
use app\connector\services\NewsService;
use app\connector\utils\Verify;

class News extends BaseController
{
    public function list(){
        $default = Verify::default(['page'=>1, 'number'=>10], 'post');
        return Json::success('get news list successfully', [
            'list'  =>  (new NewsService())->getList($default->page, $default->number, 'desc')
        ]);
    }

    public function detail(){
        $input = Verify::get(['news_id'], 'post');
        return Json::success('get news detail successfully', (new NewsService())->getDetail($input->news_id)->toArray());
    }
}