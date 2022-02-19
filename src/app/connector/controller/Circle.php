<?php

namespace app\connector\controller;

use app\BaseController;
use app\connector\response\Json;
use app\connector\services\CircleJoinService;
use app\connector\services\CircleService;
use app\connector\utils\Verify;
use think\App;
use think\facade\Config;

class Circle extends BaseController
{

    /**
     * @var CircleService
     */
    protected $circle;

    /**
     * @var CircleJoinService
     */
    protected $circleJoin;

    public function __construct(App $app, CircleService $circleService, CircleJoinService $circleJoinService)
    {
        parent::__construct($app);
        $this->circle = $circleService;
        $this->circleJoin = $circleJoinService;
    }

    public function list(){
        $default = Verify::default(['page'=>1, 'number'=>10], 'post');
        return Json::success('get circle list successfully', [
            'list'  =>  $this->circle->list(Config::get('user.id'), $default->page, $default->number)
        ]);
    }

    public function detail(){
        $input = Verify::get(['circle_id'], 'post');
        return Json::success('get circle detail successfully', $this->circle->detail($input->circle_id));
    }

    public function join(){
        $input = Verify::get(['circle_id', 'intro'], 'post');
        return Json::success('join circle successfully', [
            'join_id'   =>  $this->circleJoin->join($input->circle_id, Config::get('user.id'), $input->intro)
        ]);
    }
}