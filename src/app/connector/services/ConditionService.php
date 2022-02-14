<?php

namespace app\connector\services;

use app\admin\model\UserCondition;
use app\connector\exception\HandleException;
use app\connector\utils\traits\BaseModelService;

class ConditionService
{
    protected $model = UserCondition::class;
    use BaseModelService;

    public function get(string $user_id) : array {
        $condition = $this->getModel()
            ->where('user_id', $user_id)
            ->find();
        if (is_null($condition)){
            $this->insert($user_id);
            return $this->get($user_id);
        }
        return $condition->toArray();
    }

    public function save(string $user_id, array $data) : bool {
        return $this->getModel()
            ->where('user_id', $user_id)
            ->save($data);
    }

    public function insert(string $user_id){
        return $this->getModel()->insert([
            'user_id'   =>  $user_id,
            'create_time'   =>  time(),
            'status'    =>  1
        ]);
    }
}