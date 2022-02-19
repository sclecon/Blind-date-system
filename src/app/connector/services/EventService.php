<?php

namespace app\connector\services;

use app\admin\model\Event;
use app\admin\model\EventJoin;
use app\connector\exception\HandleException;
use app\connector\utils\traits\BaseModelService;

class EventService
{
    protected $model = Event::class;

    use BaseModelService;

    public function page(string $flag, string $page, string $number, string $city){
        $response = $this->getModel();
        if (in_array($flag, [1, 2, 3])){
            $response = $response->where('flag', $flag);
        }
        $city = htmlspecialchars_decode($city);
        $city = json_decode($city, true) ?: [];
        $city = isset($city['name']) ? $city['name'] : '';
        $city = explode(' ', $city);
        $city = $city[0] ?: false;
        return $response
            ->where(function ($query) use ($city) {
                if ($city !== false){
                    $query->where('city', 'like', "%{$city}%");
                }
            })
            ->page($page, $number)
            ->field('event_id, image, subject, remark, start_time, over_time, flag, total_fee, address')
            ->select();
    }

    public function detail(string $event_id){
        $response = $this->getModel()
            ->where('event_id', $event_id)
            ->field('event_id, image, subject, remark, message, start_time, over_time, flag, total_fee, address')
            ->find();
        if (is_null($response)){
            throw new HandleException('活动不存在');
        }
        $response->message = htmlspecialchars_decode($response->message);
        $joinList = $this->joinList($event_id);
        $response->list = $joinList ?: [];
        return $response;
    }

    public function joinList(string $event_id){
        $joinlist = $this->getJoinModel()
            ->field('join_id')
            ->field('user_id')
            ->field('join_id')
            ->field('event_id')
            ->withJoin([
                'user'=>['username'=>'username', 'avatar'=>'avatar']
            ],'LEFT')
            ->where('event_id', $event_id)
            ->select()->toArray();
        foreach ($joinlist as &$item){
            $item['avatar'] = explode('|', $item['avatar']);
        }
        return $joinlist;
    }

    public function joinEvent(string $event_id, string $user_id) : int {
        $event = $this->detail($event_id);
        if ($event->flag == 2){
            throw new HandleException('活动已经开始，无法继续报名');
        } elseif ($event->flag == 3){
            throw new HandleException('后动已经结束，无法参与报名');
        } elseif ($this->hasJoinStatus($event_id, $user_id) === true) {
            throw new HandleException('您已报名，请勿重复报名参与');
        }
        return $this->newJoinEvent($event_id, $user_id);
    }

    public function joinPage(string $user_id, string $page, string $number) : array {
         $response = $this->getJoinModel()
            ->field('join_id')
            ->field('user_id')
            ->field('event_id')
            ->field('create_time as join_time')
            ->withJoin([
                'event'=>['subject'=>'subject', 'image'=>'image'],
                'user'=>['username'=>'username', 'phone'=>'phone']
            ],'LEFT')
            ->where('event_join.user_id', $user_id)
            ->page($page, $number)
            ->order('event_join.join_id', 'desc')
            ->select()->toArray();
         foreach ($response as &$resource){
             unset($resource['user'], $resource['event']);
             $resource['join_time'] = date('Y-m-d H:i:s', $resource['join_time']);
         }
         return $response;
    }

    public function checkFlagAndUpdate(string $field, int $flag) : bool {
        return $this->getModel()
            ->where('flag', '<', $flag)
            ->where($field, '<', date('Y-m-d H:i:s', time()))
            ->save(['flag'=>$flag]);
    }

    protected function hasJoinStatus(string $event_id, string $user_id) : bool {
        return $this->getJoinModel()
            ->where('event_id', $event_id)
            ->where('user_id', $user_id)
            ->count() ? true : false;
    }

    protected function newJoinEvent(string $event_id, string $user_id) : int {
        return $this->getJoinModel()->insert([
            'event_id'  =>  $event_id,
            'user_id'   =>  $user_id,
            'create_time'   =>  time(),
            'status'    =>  1
        ], true);
    }

    protected function getJoinModel() : EventJoin{
        return new EventJoin();
    }

}