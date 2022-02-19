<?php

namespace app\admin\controller\circle;

use app\common\controller\AdminController;
use EasyAdmin\annotation\ControllerAnnotation;
use EasyAdmin\annotation\NodeAnotation;
use think\App;

/**
 * @ControllerAnnotation(title="circle_join")
 */
class Join extends AdminController
{

    use \app\admin\traits\Curd;

    public function __construct(App $app)
    {
        parent::__construct($app);

        $this->model = new \app\admin\model\CircleJoin();
        
        $this->assign('getStatusList', $this->model->getStatusList());

    }

    
}