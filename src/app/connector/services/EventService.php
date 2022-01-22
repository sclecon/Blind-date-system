<?php

namespace app\connector\services;

use app\admin\model\Event;
use app\connector\exception\HandleException;
use app\connector\utils\traits\BaseModelService;

class EventService
{
    protected $model = Event::class;

    use BaseModelService;

    public function page(string $flag, string $page, string $number){
        $response = $this->getModel();
        if (in_array($flag, [1, 2, 3])){
            $response = $response->where('flag', $flag);
        }
        return $response
            ->page($page, $number)
            ->field('event_id, image, subject, remark, start_time, over_time, flag')
            ->select();
    }

    public function detail(string $event_id){
        $response = $this->getModel()
            ->where('event_id', $event_id)
            ->field('event_id, image, subject, remark, message, start_time, over_time, flag')
            ->find();
        if (is_null($response)){
            throw new HandleException('event does not exist');
        }
        return $response;
    }

}