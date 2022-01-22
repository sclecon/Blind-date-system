<?php

namespace app\connector\services;

use app\admin\model\Feedback;
use app\connector\utils\traits\BaseModelService;

class FeedbackService
{
    protected $model = Feedback::class;

    use BaseModelService;

    public function add(string $user_id, string $phone, string $message){
        return $this->getModel()->insert([
            'user_id'   =>  $user_id,
            'phone'     =>  $phone,
            'message'   =>  $message,
            'create_time'   =>  time()
        ], true);
    }
}