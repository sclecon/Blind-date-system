<?php

namespace app\admin\model;

use app\common\model\TimeModel;

class VipPay extends TimeModel
{

    protected $pk = 'pay_id';

    protected $name = "vip_pay";

    protected $deleteTime = "delete_time";

    
    
    public function getFlagList()
    {
        return ['1'=>'支付完成','0'=>'未支付',];
    }

    public function getStatusList()
    {
        return ['1'=>'数据正常','0'=>'已失效',];
    }


}