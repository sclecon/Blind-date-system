<?php

namespace app\connector\services;

use app\admin\model\Vip;
use app\connector\exception\HandleException;
use app\connector\utils\traits\BaseModelService;

class VipService
{
    protected $model = Vip::class;

    use BaseModelService;

    public function list(){
        return $this->getModel()
            ->where('status', 1)
            ->field('vip_id')
            ->field('name')
            ->field('days')
            ->field('numbers')
            ->field('total_fee')
            ->order('weight', 'desc')
            ->order('vip_id', 'desc')
            ->select()->toArray();
    }

    public function get(string $vip_id){
        $vip = $this->getModel()->where('status', 1)->find($vip_id);
        if (is_null($vip)){
            throw new HandleException('会员套餐不存在');
        }
        return $vip;
    }
}