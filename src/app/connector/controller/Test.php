<?php

namespace app\connector\controller;


use app\connector\exception\HandleException;
use app\connector\services\UserService;
use app\connector\utils\Location;
use think\facade\Db;

class Test
{
    public function index(){
        throw new HandleException('又抛出一个错误看看');
    }

    public function rice(){
        $distance_field = 'distance';
        $longitude_field = 'longitude';
        $dimension_field = 'dimension';
        halt(
            Db::table('tests')
                ->field('name as address')
                ->field(Location::distanceByMysqlM('104.05622442955018', '30.63291510922048', $longitude_field, $dimension_field, $distance_field))
                ->order($distance_field, 'asc')
                ->select()
        );
    }

    public function list(){
        $user = new UserService();
        $users = $user->getList(1, '成都', '104.05622442955018', '30.63291510922048');
        halt($users);
    }
}