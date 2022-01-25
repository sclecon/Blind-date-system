<?php

namespace app\connector\services;

use EasyWeChat\Factory;

class WxAppService
{

    protected $app;

    public function __construct()
    {
        $this->app = Factory::miniProgram($this->getWxAppConfig());
    }

    public function getOpenID(string $code){
        $auth = $this->app->auth->session($code);
        return $auth['openid'];
    }

    private function getWxAppConfig() : array {
        return [
            'app_id' => sysconfig('pay', 'pay_weixin_appid'),
            'secret' => sysconfig('pay', 'pay_weixin_secret'),
            'response_type' => 'array',
        ];
    }
}