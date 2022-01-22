<?php

namespace app\admin\controller\send;

use app\common\controller\AdminController;
use EasyAdmin\annotation\ControllerAnnotation;
use EasyAdmin\annotation\NodeAnotation;
use think\App;

/**
 * @ControllerAnnotation(title="send_code")
 */
class Code extends AdminController
{

    use \app\admin\traits\Curd;

    public function __construct(App $app)
    {
        parent::__construct($app);

        $this->model = new \app\admin\model\SendCode();
        
        $this->assign('getStatusList', $this->model->getStatusList());

    }

    
}