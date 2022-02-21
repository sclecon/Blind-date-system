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

    protected $pk = 'user_id';

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

        $this->assign('getIncomeList', $this->model->getIncomeList());

        $this->assign('getVipList', $this->model->getVipList());

    }


    /**
     * @NodeAnotation(title="列表")
     */
    public function index()
    {
        if ($this->request->isAjax()) {
            if (input('selectFields')) {
                return $this->selectList();
            }
            list($page, $limit, $where) = $this->buildTableParames();
            $count = $this->model
                ->where($where)
                ->count();
            $list = $this->model
                ->where($where)
                ->page($page, $limit)
                ->order($this->sort)
                ->select();
            $data = [
                'code'  => 0,
                'msg'   => '',
                'count' => $count,
                'data'  => $list,
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
                foreach ($post as $k => $v){
                    if (is_string($v)){
                        $post[$k] = htmlspecialchars_decode($v);
                    }
                }
                if (is_string($post['expire']) && strlen($post['expire']) == 0){
                    $post['expire'] = null;
                }
                $save = $row->save($post);
            } catch (\Exception $e) {
                $this->error('保存失败');
            }
            $save ? $this->success('保存成功') : $this->error('保存失败');
        }
        $row = $row->toArray();
        foreach ($row as $k => $v){
            $row[$k] = htmlspecialchars_decode($v);
        }
        $this->assign('row', $row);
        return $this->fetch();
    }

    
}