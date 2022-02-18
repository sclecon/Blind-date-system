<?php

namespace app\connector\controller;

use app\BaseController;
use app\connector\response\Json;
use app\connector\services\ConditionService;
use app\connector\utils\Verify;
use think\App;
use think\facade\Config;

class userCondition extends BaseController
{
    function __construct(App $app)
    {
        parent::__construct($app);
        $this->service = new ConditionService();
    }

    public function set(){
        $condition = $this->service->get(Config::get('user.id'));
        $default = Verify::default([
            'age'       =>  false,
            'height'    =>  false,
            'edu'       =>  false,
            'marriage'  =>  false,
            'address'   =>  false,
            'house'     =>  false
        ], 'post');
        if($default->address !== false){
            $default->address = htmlspecialchars_decode($default->address);
        }
        $checkbox = ['edu', 'marriage', 'house'];
        foreach ($checkbox as $item){
            if($default->$item !== false && strlen($default->$item)){
                $default->$item = explode(',', $default->$item);
                foreach ($default->$item as $_key => $_value){
                    if (!$_value){
                        unset($default->$item[$_key]);
                    }
                }
                $default->$item = json_encode($default->$item);
            }
        }
        $data = [];
        foreach ($default as $field => $item){
            if ($item !== false and ((isset($condition[$field]) and $item !== $condition[$field]) or isset($condition[$field]) === false)){
                $data[$field] = $item;
            }
        }
        if ($data){
            $this->service->save(Config::get('user.id'), $data);
        }
        if (isset($data['address'])){
            $data['address'] = json_decode(htmlspecialchars_decode($data['address']), true);
        }
        foreach ($checkbox as $item){
            if (isset($data[$item])){
                $data[$item] = json_decode($data[$item], true);
            }
        }
        return Json::success('save user condition successfully', $data);
    }

    public function get(){
        $input = Verify::get(['user_id'], 'post');
        $condition = $this->service->get($input->user_id);
        unset($condition['status'], $condition['create_time'], $condition['update_time'], $condition['delete_time'], $condition['condition_id']);
        $condition['address'] = $condition['address'] ? json_decode(htmlspecialchars_decode($condition['address']), true) : false;
        $checkbox = [
            'edu'   =>  $this->service->getEduList(),
            'marriage'  =>  $this->service->getMarriageList(),
            'house' =>  $this->service->getHouseList()
        ];
        foreach ($checkbox as $item => $list){
            $condition[$item] = json_decode($condition[$item], true) ?: [];
            $data = [];
            foreach ($condition[$item] as $value){
                $data[] = $list[$value];
            }
            $condition[$item.'_data'] = $data;
        }
        return Json::success('get user condition successfully', $condition);
    }

}