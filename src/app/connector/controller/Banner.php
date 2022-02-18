<?php

namespace app\connector\controller;

use app\BaseController;
use app\connector\response\Json;
use app\connector\services\BannerService;
use think\App;

class Banner extends BaseController
{
    /**
     * @var BannerService
     */
    protected $banner;

    function __construct(App $app, BannerService $banner)
    {
        parent::__construct($app);
        $this->banner = $banner;
    }

    public function home(){
        return Json::success('get home banner successfully', [
            'list'  =>  $this->banner->home()
        ]);
    }

    public function event(){
        return Json::success('get event banner successfully', [
            'list'  =>  $this->banner->event()
        ]);
    }
}