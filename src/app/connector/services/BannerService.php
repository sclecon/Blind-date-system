<?php

namespace app\connector\services;

use app\admin\model\Banner;
use app\connector\utils\traits\BaseModelService;

class BannerService
{
    protected $model = Banner::class;
    use BaseModelService;

    public function home(){
        return $this->getData(1);
    }

    public function event(){
        return $this->getData(2);
    }

    protected function getData(int $type){
        return $this->getModel()
            ->where('type', $type)
            ->field('url as image')
            ->field('str as text')
            ->order('weight', 'desc')
            ->order('banner_id', 'desc')
            ->select()
            ->toArray();
    }
}