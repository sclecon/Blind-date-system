<?php

namespace app\connector\controller;

use app\BaseController;
use app\connector\response\Json;
use app\connector\services\FeedbackService;
use app\connector\utils\Verify;
use think\facade\Config;

class Feedback extends BaseController
{
    public function send(){
        $input = Verify::get(['message'], 'post');
        return Json::success('send feedback successfully', [
            'feedback_id'   =>  (new FeedbackService())->add(Config::get('user.id'), Config::get('user.phone'), $input->message)
        ]);
    }
}