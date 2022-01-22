<?php

namespace app\connector\controller;

use app\connector\response\Json;
use app\connector\services\EventService;
use app\connector\utils\Verify;

class Event
{
    public function list(){
        $default = Verify::default(['page'=>1,'number'=>10, 'flag'=>0], 'post');
        return Json::success('get list successfully', ['list'=>(new EventService())->page($default->flag, $default->page, $default->number)]);
    }
}