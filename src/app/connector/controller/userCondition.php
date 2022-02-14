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
        return Json::success('save user condition successfully', $data);
    }

    public function get(){
        $input = Verify::get(['user_id'], 'post');
        $condition = $this->service->get($input->user_id);
        $condition['address'] = $condition['address'] ? json_decode(htmlspecialchars_decode($condition['address']), true) : false;
        return Json::success('get user condition successfully', $condition);
    }

}