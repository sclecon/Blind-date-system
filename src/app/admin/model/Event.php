<?php

namespace app\admin\model;

use app\common\model\TimeModel;

class Event extends TimeModel
{

    protected $pk = 'event_id';

    protected $name = "event";

    protected $deleteTime = "delete_time";

    
    
    public function getFlagList()
    {
        return ['1'=>'进行中','0'=>'已结束',];
    }


}