<?php

namespace app\admin\controller;

use app\common\controller\AdminController;
use EasyAdmin\annotation\ControllerAnnotation;
use EasyAdmin\annotation\NodeAnotation;
use think\App;

/**
 * @ControllerAnnotation(title="banner")
 */
class Banner extends AdminController
{
    protected $pk = 'banner_id';

    use \app\admin\traits\Curd;

    public function __construct(App $app)
    {
        parent::__construct($app);

        $this->model = new \app\admin\model\Banner();
        
        $this->assign('getTypeList', $this->model->getTypeList());

        $this->assign('getStatusList', $this->model->getStatusList());

    }

    
}