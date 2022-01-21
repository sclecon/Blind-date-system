<?php

/**
 * Created By PhpStorm
 * User sclecon
 * Contact Email 27941662@qq.com
 * Time 2022/1/21 9:43
 */
namespace app\connector\services\pay;

use app\connector\services\pay\driver\Weixin;

class PayDriver
{
    protected $driver = [];

    public function __construct()
    {
        $driver = new Weixin();
        $this->driver[$driver->getField()] = $driver;
    }

    public function checkDrivers(string $driver, string $support = '') : bool {
        $drivers = [];
        if (strlen($support)){
            $drivers = array_merge($drivers, array_keys($this->getList($support)));
        }else{
            $drivers = array_merge($drivers, array_keys($this->driver));
        }
        if (in_array($driver, $drivers)){
            return true;
        }

        throw new \Exception(str_replace(['{support}', '{driver}'], [$support, $driver], '{support} not support {driver} pay driver'));
    }

    public function getList(string $support) : array {
        $pays = [];
        foreach ($this->driver as $field => $driver){
            if (in_array($support, $driver->support())){
                $pays[$field] = [
                    'field'  =>  $driver->getField(),
                    'name'  =>  $driver->getName(),
                    'logo'  =>  $driver->getLogo(),
                ];
            }
        }
        return $pays;
    }

    /**
     * @return Weixin
     */
    public function getDriver(string $driver) {
        return $this->driver[$driver];
    }
}