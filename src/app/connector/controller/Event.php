<?php

namespace app\connector\controller;

use app\BaseController;
use app\connector\response\Json;
use app\connector\services\EventService;
use app\connector\utils\Verify;
use think\facade\Config;

class Event extends BaseController
{
    public function list(){
        $default = Verify::default(['page'=>1,'number'=>10, 'flag'=>0], 'post');
        return Json::success('get list successfully', [
            'list'  =>  (new EventService())->page($default->flag, $default->page, $default->number)
        ]);
    }

    public function detail(){
        $input = Verify::get(['event_id'], 'post');
        return Json::success('get event detail successfully',(new EventService())->detail($input->event_id)->toArray());
    }

    public function join(){
        $input = Verify::get(['event_id'], 'post');
        return Json::success('join event successfully', [
            'join_id'   =>  (new EventService())->joinEvent($input->event_id, Config::get('user.id'))
        ]);
    }

    public function logs(){
        $default = Verify::default(['page'=>1,'number'=>10], 'post');
        return Json::success('get list successfully', [
            'list'  =>  (new EventService())->joinPage(Config::get('user.id'), $default->page, $default->number)
        ]);
    }
}