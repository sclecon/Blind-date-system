<?php

namespace app\admin\model;

use app\common\model\TimeModel;

class UserPay extends TimeModel
{

    protected $name = "user_pay";

    protected $deleteTime = "delete_time";

    
    public function event()
    {
        return $this->belongsTo('\app\admin\model\Event', 'user_id', 'user_id');
    }

    
    public function getFlagList()
    {
        return ['1'=>'支付完成','0'=>'未支付',];
    }


}