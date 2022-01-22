<?php
namespace app\connector\services;
use app\admin\model\User;
use app\connector\exception\HandleException;
use app\connector\utils\DataEncryption;

class UserService
{
    protected $userModel;
    protected $user;

    public function __construct()
    {
        $this->userModel = new User();
    }

    public function getUserByPhone($phone){
        if ($this->user === null){
            $this->user = $this->userModel->where('phone', $phone)->findOrFail();
            if ($this->user === null){
                throw new HandleException("手机号为{$phone}的用户不存在");
            }
        }
        return $this->user;
    }

    public function login(string $phone, string $longitude, string $dimension){
        $user = [
            'phone'     =>  $phone,
            'user_id'   =>  $this->getUserByPhone($phone)->user_id,
            'expire'    =>  strtotime('+1day')
        ];
        $this->setLocation($phone, $longitude, $dimension);
        $callBack = [
            'authentication'      =>  DataEncryption::encode($user),
            'profile'             =>  $this->profileCheck($phone)
        ];
        return $callBack;
    }

    public function setLocation(string $phone, string $longitude, string $dimension){
        return $this->userModel->data([
            'longitude' =>  $longitude,
            'dimension' =>  $dimension
        ])->where('phone', $phone)->save();
    }

    public function getUserBySign(string $sign){
        $data = DataEncryption::decode($sign);
        if (is_array($data) === false){
            throw new HandleException('用户签名无效');
        }
        if ($data['expire'] < time()){
            throw new HandleException('用户签名已过期');
        }
        return $this->getUserByPhone($data['phone']);
    }

    public function register(string $phone, string $sex, string $longitude, string $dimension){
        $user = [
            'phone'     =>  $phone,
            'sex'       =>  $sex,
            'username'  =>  $phone,
        ];
        $this->userModel->insert($user);
        return $this->login($phone, $longitude, $dimension);
    }

    public function profileCheck($phone) : int {
        $user = $this->getUserByPhone($phone);
        $proFileNumber = 0;
        if ($user->avatar){
            $proFileNumber += 1;
        }
        if ($user->remark){
            $proFileNumber += 1;
        }
        if ($user->edu){
            $proFileNumber += 1;
        }
        if ($user->sex){
            $proFileNumber += 1;
        }
        if ($user->birthday){
            $proFileNumber += 1;
        }
        if ($user->height){
            $proFileNumber += 1;
        }
        if ($user->city){
            $proFileNumber += 1;
        }
        if ($user->address){
            $proFileNumber += 1;
        }
        if ($user->marriage){
            $proFileNumber += 1;
        }
        if ($user->children){
            $proFileNumber += 1;
        }
        if ($user->native){
            $proFileNumber += 1;
        }
        if ($user->nation){
            $proFileNumber += 1;
        }
        if ($user->blood){
            $proFileNumber += 1;
        }
        if ($user->weight){
            $proFileNumber += 1;
        }
        if ($user->occupation){
            $proFileNumber += 1;
        }
        if ($user->school){
            $proFileNumber += 1;
        }
        if ($user->major){
            $proFileNumber += 1;
        }
        if ($user->house){
            $proFileNumber += 1;
        }
        if ($user->car_buy){
            $proFileNumber += 1;
        }
        if ($user->username){
            $proFileNumber += 1;
        }
        return $proFileNumber > 15 ? 1 : 0;
    }

    public function getDetail($phone){
        $user = $this->getUserByPhone($phone)->toArray();
        unset($user['status'], $user['update_time'], $user['delete_time']);
        $user['create_time'] = date('Y-m-d H:i:s', $user['create_time']);
        return $user;
    }

    public function getList(string $sex, string $city, string $longitude, string $dimension){
        $fields = ['user_id', 'phone', 'username', 'avatar', 'remark', 'sex'];
        $users = $this->userModel
            ->field($fields)
            ->select();
        halt($users);
    }

    public function hasPhone(string $phone){
        return $this->userModel
            ->where('phone', $phone)
            ->count() ? true : false;
    }
}