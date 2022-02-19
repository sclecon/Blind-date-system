<?php

namespace app\admin\model;

use app\common\model\TimeModel;

class CircleJoin extends TimeModel
{

    protected $pk = 'join_id';

    protected $name = "circle_join";

    protected $deleteTime = "delete_time";

    
    
    public function getStatusList()
    {
        return ['1'=>'等待审核','0'=>'审核失败','2'=>'审核通过',];
    }

    public function circle()
    {
        return $this->belongsTo('\app\admin\model\Circle', 'circle_id', 'circle_id');
    }

    public function user()
    {
        return $this->belongsTo('\app\admin\model\User', 'user_id', 'user_id');
    }


}