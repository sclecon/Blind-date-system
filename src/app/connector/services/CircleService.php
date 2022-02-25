<?php

namespace app\connector\services;

use app\admin\model\Circle;
use app\connector\exception\HandleException;
use app\connector\utils\traits\BaseModelService;

class CircleService
{
    protected $model = Circle::class;

    use BaseModelService;

    /**
     * @var CircleJoinService
     */
    protected $join;

    /**
     * @var UserService
     */
    protected $user;

    public function __construct(CircleJoinService $circleJoinService, UserService $userService){
        $this->join = $circleJoinService;
        $this->user = $userService;
    }

    public function list(string $user_id, string $page, string $number){
        $data = $this->getModel()
            ->field('circle_id')
            ->field('name')
            ->field('intro')
            ->field('image')
            ->page($page, $number)
            ->order('weight', 'desc')
            ->order('circle_id', 'desc')
            ->select();
        $userJoin = $this->join->myJoin($user_id);
        foreach ($data as $key => $datum){
            $data[$key]->isJoin = in_array($datum->circle_id, $userJoin) ? 1 : 0;
        }
        return $data;
    }

    public function detail(string $circle_id) : array {
        $circle = $this->getModel()
            ->where('circle_id', $circle_id)
            ->find();
        if (is_null($circle)){
            throw new HandleException('该圈子不存在');
        }
        $userList = $this->join->circleJoin($circle_id);
        $circle->userlist = $this->user->getListByUserID($userList);
        $circle = $circle->toArray();
        unset($circle['join'], $circle['weight'], $circle['status'], $circle['create_time'], $circle['update_time'], $circle['delete_time']);
        return $circle;
    }
}