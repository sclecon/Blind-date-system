<?php

namespace app\connector\services;

use app\admin\model\News;
use app\connector\exception\HandleException;
use app\connector\utils\traits\BaseModelService;

class NewsService
{
    protected $model = News::class;

    use BaseModelService;

    public function getList(string $page, string $number, $order = 'desc'){
        return $this->getModel()
            ->page($page, $number)
            ->field('news_id, subject, create_time')
            ->order('news_id', $order)
            ->select();
    }

    public function getDetail(string $news_id){
        $news = $this->getModel()
            ->where('news_id', $news_id)
            ->field('news_id, subject, message, create_time')
            ->find();
        if (is_null($news)){
            throw new HandleException('获取详情失败，新闻广告不存在', 404);
        }
        return $news;
    }
}