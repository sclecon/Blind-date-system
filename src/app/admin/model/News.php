<?php

namespace app\admin\model;

use app\common\model\TimeModel;

class News extends TimeModel
{

    protected $pk = 'news_id';

    protected $name = "news";

    protected $deleteTime = "delete_time";

    
    

}