<?php

namespace app\admin\model;

use app\common\model\TimeModel;

class Event extends TimeModel
{

    protected $name = "event";

    protected $deleteTime = "delete_time";

    
    
    public function getFlagList()
    {
        return ['1'=>'进行中','0'=>'已结束',];
    }

    public function getStatusList()
    {
        return ['1'=>'正常','0'=>'已删除',];
    }


}