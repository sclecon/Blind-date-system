<?php

namespace app\admin\model;

use app\common\model\TimeModel;

class User extends TimeModel
{

    protected $pk = 'user_id';

    protected $name = "user";

    protected $deleteTime = "delete_time";






    public function getVIPList(){
        return ['1'=>'已开通', '0'=>'未开通或已过期'];
    }

    public function getIncomeList(){
        return ['1'=>'3000元以内', '2'=>'3000-5000元', '3'=>'5000-10000元', '4'=>'10000-30000元', '5'=>'30000元以上'];
    }
    
    public function getEduList()
    {
        return ['1'=>'初中','2'=>'中专','3'=>'高中','4'=>'大专','5'=>'本科','6'=>'硕士','7'=>'博士','8'=>'博士后',];
    }

    public function getSexList()
    {
        return ['0'=>'未知','1'=>'男','2'=>'女',];
    }

    public function getMarriageList()
    {
        return ['1'=>'未婚','2'=>'离异','3'=>'丧偶','4'=>'已婚',];
    }

    public function getChildrenList()
    {
        return ['0'=>'没有','1'=>'有',];
    }

    public function getBloodList()
    {
        return ['1'=>'A','2'=>'B','3'=>'AB','4'=>'0','5'=>'其他',];
    }

    public function getHouseList()
    {
        return ['1'=>'已购房无贷款','2'=>'已购房有贷款','3'=>'与父母同住','4'=>'暂未购房','5'=>'租房',];
    }

    public function getCarBuyList()
    {
        return ['1'=>'已买车','2'=>'未买车',];
    }


}