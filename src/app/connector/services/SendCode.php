<?php

/**
 * Created By PhpStorm
 * User sclecon
 * Contact Email 27941662@qq.com
 * Time 2022/1/22 11:48
 */


namespace app\connector\services;


use app\connector\exception\HandleException;

class SendCode
{
    protected $model;
    protected $data;

    public function hasMsgId(string $msg_id, string $phone){
        $this->data = $this->getModel()
            ->where('send_id', $msg_id)
            ->where('phone', $phone)
            ->field('code, create_time, status')
            ->find();
        if (is_null($this->data)){
            throw new HandleException('验证码不存在');
        }
        if ($this->data->status == 1){
            // throw new HandleException('验证码无效');
        }
        if ($this->data->getData('create_time')+60 < time()){
            // throw new HandleException('验证码超时');
        }
        return $this;
    }

    public function checkCode(string $code){
        if ($this->data->code != $code){
            throw new HandleException('验证码错误');
        }
        $this->data->status = 1;
        return $this->data->save();
    }

    public function insert(string $phone, string $code){
        return $this->getModel()
            ->insert([
                'phone'     =>  $phone,
                'code'      =>  $code,
                'status'        =>  0,
                'create_time'   =>  time(),
            ], true);
    }

    protected function getModel(){
        if (is_null($this->model)){
            $this->model = new \app\admin\model\SendCode();
        }
        return $this->model;
    }
}