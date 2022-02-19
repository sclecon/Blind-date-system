<?php
declare (strict_types = 1);

namespace app\command;

use app\connector\services\EventService;
use app\connector\services\UserService;
use think\console\Command;
use think\console\Input;
use think\console\input\Argument;
use think\console\input\Option;
use think\console\Output;

class Timing extends Command
{

    protected $types = [
        'event', // 活动状态更新
        'vip',  // VIP状态更新
    ];

    protected function configure()
    {
        // 指令配置
        $this->setName('timing')
            ->addOption('type', null, Option::VALUE_REQUIRED, '更新类型')
            ->setDescription('定时更新某些数据');
    }

    protected function execute(Input $input, Output $output)
    {
        if ($input->hasOption('type') === false){
            $output->error('必须传递type参数 目前支持'.implode(',', $this->types));
            return false;
        }
        $type = $input->getOption('type');
        if (in_array($type, $this->types) === false){
            $output->error("{$type}为未定义类型 暂不支持");
            return false;
        }

        return $this->$type($input, $output);
    }

    protected function event(Input $input, Output $output) : bool {
        $eventService = new EventService();
        $eventService->checkFlagAndUpdate('start_time', 2);
        $output->info('已检查所有未开始活动并且将已达到开始时间的活动状态改为进行中');
        $eventService->checkFlagAndUpdate('over_time', 3);
        $output->info('已检查所有进行中活动并且将已达到结束时间的活动状态改为已结束');
        return true;
    }

    protected function vip(Input $input, Output $output) : bool {
        $user = new UserService();
        $user->vipCheckStatus();
        $output->info('VIP状态检查更新已结束');
        return true;
    }
}
