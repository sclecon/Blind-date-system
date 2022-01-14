<?php

namespace app\admin\controller;

use app\common\controller\AdminController;
use EasyAdmin\annotation\ControllerAnnotation;
use EasyAdmin\annotation\NodeAnotation;
use think\App;

/**
 * @ControllerAnnotation(title="user")
 */
class User extends AdminController
{

    use \app\admin\traits\Curd;

    public function __construct(App $app)
    {
        parent::__construct($app);

        $this->model = new \app\admin\model\User();
        
        $this->assign('getEduList', $this->model->getEduList());

        $this->assign('getSexList', $this->model->getSexList());

        $this->assign('getMarriageList', $this->model->getMarriageList());

        $this->assign('getChildrenList', $this->model->getChildrenList());

        $this->assign('getBloodList', $this->model->getBloodList());

        $this->assign('getHouseList', $this->model->getHouseList());

        $this->assign('getCarBuyList', $this->model->getCarBuyList());

    }

    
}