<?php

namespace app\admin\model;

use app\common\model\TimeModel;

class Banner extends TimeModel
{

    protected $pk = 'banner_id';

    protected $name = "banner";

    protected $deleteTime = "delete_time";

    
    
    public function getTypeList()
    {
        return ['1'=>'首页Banner','2'=>'活动页Banner',];
    }

    public function getStatusList()
    {
        return ['1'=>'显示正常','0'=>'显示错误',];
    }


}