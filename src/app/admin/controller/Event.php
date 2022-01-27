<?php

namespace app\admin\controller;

use app\common\controller\AdminController;
use EasyAdmin\annotation\ControllerAnnotation;
use EasyAdmin\annotation\NodeAnotation;
use think\App;

/**
 * @ControllerAnnotation(title="event")
 */
class Event extends AdminController
{
    protected $pk = 'event_id';

    use \app\admin\traits\Curd;

    public function __construct(App $app)
    {
        parent::__construct($app);

        $this->model = new \app\admin\model\Event();
        
        $this->assign('getFlagList', $this->model->getFlagList());

        $this->assign('getStatusList', $this->model->getStatusList());

    }

    
}