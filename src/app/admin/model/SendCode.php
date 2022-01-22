<?php

namespace app\admin\model;

use app\common\model\TimeModel;

class SendCode extends TimeModel
{

    protected $name = "send_code";

    protected $deleteTime = "delete_time";

    protected $pk = 'send_id';

    
    
    public function getStatusList()
    {
        return ['1'=>'验证完成','0'=>'等待验证',];
    }


}