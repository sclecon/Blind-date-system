<?php

namespace app\admin\model;

use app\common\model\TimeModel;

class Circle extends TimeModel
{

    protected $pk = 'circle_id';

    protected $name = "circle";

    protected $deleteTime = "delete_time";

    
    
    public function getStatusList()
    {
        return ['1'=>'数据正常','0'=>'数据已删除',];
    }


}