<?php

namespace app\admin\model;

use app\common\model\TimeModel;

class UserPay extends TimeModel
{

    protected $pk = 'pay_id';

    protected $name = "user_pay";

    protected $deleteTime = "delete_time";

    
    public function user()
    {
        return $this->belongsTo('\app\admin\model\User', 'user_id', 'user_id');
    }


    public function buyUser()
    {
        return $this->belongsTo('\app\admin\model\BuyUser', 'buy_user_id', 'user_id');
    }

    
    public function getFlagList()
    {
        return ['1'=>'支付完成','0'=>'未支付',];
    }


}