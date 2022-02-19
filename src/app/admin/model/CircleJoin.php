<?php

namespace app\admin\model;

use app\common\model\TimeModel;

class CircleJoin extends TimeModel
{

    protected $name = "circle_join";

    protected $deleteTime = "delete_time";

    
    
    public function getStatusList()
    {
        return ['1'=>'等待审核','0'=>'审核失败','2'=>'审核通过',];
    }


}