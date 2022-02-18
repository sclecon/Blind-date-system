<?php

namespace app\admin\model;

use app\common\model\TimeModel;

class Vip extends TimeModel
{

    protected $pk = 'vip_id';

    protected $name = "vip";

    protected $deleteTime = "delete_time";

    
    
    public function getStatusList()
    {
        return ['1'=>'数据正常','0'=>'数据已删除',];
    }


}