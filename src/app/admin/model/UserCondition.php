<?php

namespace app\admin\model;

use app\common\model\TimeModel;

class UserCondition extends TimeModel
{

    protected $pk = 'condition_id';

    protected $name = "user_condition";

    protected $deleteTime = "delete_time";

    public function getEduList()
    {
        return ['1'=>'初中','2'=>'中专','3'=>'高中','4'=>'大专','5'=>'本科','6'=>'硕士','7'=>'博士','8'=>'博士后',];
    }

    public function getMarriageList()
    {
        return ['1'=>'未婚','2'=>'离异','3'=>'丧偶','4'=>'已婚',];
    }

    public function getHouseList()
    {
        return ['1'=>'已购房无贷款','2'=>'已购房有贷款','3'=>'与父母同住','4'=>'暂未购房','5'=>'租房',];
    }


}