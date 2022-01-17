<?php

namespace app\admin\model;

use app\common\model\TimeModel;

class Feedback extends TimeModel
{

    protected $pk = 'feedback_id';

    protected $name = "feedback";

    protected $deleteTime = "delete_time";

    
    

}