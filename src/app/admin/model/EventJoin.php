<?php

namespace app\admin\model;

use app\common\model\TimeModel;

class EventJoin extends TimeModel
{

    protected $pk = 'join_id';

    protected $name = "event_join";

    protected $deleteTime = "delete_time";

    
    public function event()
    {
        return $this->belongsTo('\app\admin\model\Event', 'event_id', 'event_id');
    }

    public function user()
    {
        return $this->belongsTo('\app\admin\model\User', 'user_id', 'user_id');
    }

    

}