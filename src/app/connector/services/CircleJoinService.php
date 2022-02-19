<?php

namespace app\connector\services;

use app\admin\model\CircleJoin;
use app\connector\exception\HandleException;
use app\connector\utils\traits\BaseModelService;

class CircleJoinService
{
    protected $model = CircleJoin::class;

    use BaseModelService;

    public function myJoin(string $user_id){
        return $this->getModel()
            ->where('user_id', $user_id)
            ->where('status', '<>', 0)
            ->column('circle_id');
    }

    public function circleJoin(string $circle_id){
        return $this->getModel()
            ->where('circle_id', $circle_id)
            ->where('status', '<>', 0)
            ->column('user_id');
    }

    public function join(string $circle_id, string $user_id, string $intro){
        $circles = $this->myJoin($user_id);
        if (in_array($circle_id, $circles)){
            throw new HandleException('您已加入该圈子或加入请求正在审核，请勿重复申请');
        }
        return $this->getModel()->insert([
            'circle_id' =>  $circle_id,
            'user_id'   =>  $user_id,
            'intro'     =>  $intro,
            'status'    =>  1,
        ], true);
    }
}