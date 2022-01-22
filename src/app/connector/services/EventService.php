<?php

namespace app\connector\services;

use app\admin\model\Event;
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
            ->field('event_id, image, subject, remark, start_time, over_time')
            ->select();
    }

}