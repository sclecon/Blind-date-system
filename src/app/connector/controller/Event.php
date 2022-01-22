<?php

namespace app\connector\controller;

use app\connector\utils\Verify;

class Event
{
    public function list(){
        $input = Verify::default([
            'page'  =>  1,
            'number'    =>  10,
        ], 'post');

    }
}