<?php

namespace app\admin\controller\circle;

use app\common\controller\AdminController;
use EasyAdmin\annotation\ControllerAnnotation;
use EasyAdmin\annotation\NodeAnotation;
use think\App;
use think\facade\Cookie;

/**
 * @ControllerAnnotation(title="circle_join")
 */
class Join extends AdminController
{

    protected $pk = 'join_id';

    use \app\admin\traits\Curd;

    public function __construct(App $app)
    {
        parent::__construct($app);

        $this->model = new \app\admin\model\CircleJoin();
        
        $this->assign('getStatusList', $this->model->getStatusList());

    }

    /**
     * @NodeAnotation(title="列表")
     */
    public function index()
    {
        if ($this->request->get('id', false) !== false){
            Cookie::set('circle_id', $this->request->get('id'), ['expire'=>10]);
        }
        if ($this->request->isAjax()) {
            if (input('selectFields')) {
                return $this->selectList();
            }
            list($page, $limit, $where) = $this->buildTableParames();
            $model = $this->model;
            if (Cookie::has('circle_id')){
                $model = $model->where('circle_id', Cookie::get('circle_id', false));
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
                if (is_null($item->user)){
                    $option['username'] = 'null';
                    $option['phone'] = 'null';
                }else{
                    $option['username'] = $item->user->username;
                    $option['phone'] = $item->user->phone;
                }
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

    /**
     * @NodeAnotation(title="编辑")
     */
    public function edit($id)
    {
        $row = $this->model->find($id);
        empty($row) && $this->error('数据不存在');
        if ($this->request->isPost()) {
            $post = $this->request->post();
            $rule = [];
            $this->validate($post, $rule);
            try {
                if ($post['status'] == 0){
                    $save = $row->delete();
                }else{
                    $save = $row->save($post);
                }
            } catch (\Exception $e) {
                $this->error('保存失败');
            }
            $save ? $this->success('保存成功') : $this->error('保存失败');
        }
        $this->assign('row', $row);
        return $this->fetch();
    }

    
}