<?php

namespace app\admin\model;

use app\common\model\TimeModel;

class Event extends TimeModel
{

    protected $name = "event";

    protected $deleteTime = "delete_time";

    protected $pk = 'event_id';

    
    
    public function getFlagList()
    {
        return ['1'=>'等待开始', '2'=>'进行中', '3'=>'已结束'];
    }

    public function getStatusList()
    {
        return ['1'=>'正常','0'=>'已删除',];
    }


}