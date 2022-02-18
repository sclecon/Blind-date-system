<?php

namespace app\admin\controller\vip;

use app\common\controller\AdminController;
use EasyAdmin\annotation\ControllerAnnotation;
use EasyAdmin\annotation\NodeAnotation;
use think\App;

/**
 * @ControllerAnnotation(title="vip_pay")
 */
class Pay extends AdminController
{

    protected $pk = 'pay_id';

    use \app\admin\traits\Curd;

    public function __construct(App $app)
    {
        parent::__construct($app);

        $this->model = new \app\admin\model\VipPay();
        
        $this->assign('getFlagList', $this->model->getFlagList());

        $this->assign('getStatusList', $this->model->getStatusList());

    }

    
}