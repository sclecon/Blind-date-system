<?php

namespace app\admin\controller\event;

use app\common\controller\AdminController;
use EasyAdmin\annotation\ControllerAnnotation;
use EasyAdmin\annotation\NodeAnotation;
use think\App;
use think\facade\Cookie;
use think\facade\Session;

/**
 * @ControllerAnnotation(title="event_join")
 */
class Join extends AdminController
{

    protected $pk = 'join_id';

    use \app\admin\traits\Curd;

    public function __construct(App $app)
    {
        parent::__construct($app);

        $this->model = new \app\admin\model\EventJoin();
        
    }

    
    /**
     * @NodeAnotation(title="列表")
     */
    public function index()
    {
        if ($this->request->get('id', false) !== false){
            Cookie::set('event_id', $this->request->get('id'), ['expire'=>10]);
        }
        if ($this->request->isAjax()) {
            if (input('selectFields')) {
                return $this->selectList();
            }
            list($page, $limit, $where) = $this->buildTableParames();
            $model = $this->model;
            if (Cookie::has('event_id')){
                $model = $model->where('event_id', Cookie::get('event_id', false));
            }
            $count = $model
                ->where($where)
                ->count();
            $list = $model
                ->where($where)
                ->page($page, $limit)
                ->order($this->sort)
                ->select();
            $datalist = [];
            foreach ($list as $item){
                $option = $item->toArray();
                $option['username'] = $item->user->username;
                $option['phone'] = $item->user->phone;
                $datalist[] = $option;
            }
            $data = [
                'code'  => 0,
                'msg'   => '',
                'count' => $count,
                'data'  => $datalist,
            ];
            return json($data);
        }
        return $this->fetch();
    }
}