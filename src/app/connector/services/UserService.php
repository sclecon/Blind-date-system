<?php
namespace app\connector\services;
use app\admin\model\User;
use app\connector\exception\HandleException;
use app\connector\response\Json;
use app\connector\utils\DataEncryption;
use app\connector\utils\Location;
use think\facade\Config;

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
        return $this->userModel->where('phone', $phone)->save([
            'longitude' =>  $longitude,
            'dimension' =>  $dimension,
            'update_time'   =>  time(),
        ]);
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
            'create_time'=> time(),
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
        $user['avatar'] = explode('|', $user['avatar']);
        return $user;
    }

    public function getDetailByUserId(string $user_id){
        $user = $this->userModel
            ->where('user_id', $user_id)
            ->find();
        if (is_null($user)){
            throw new HandleException('get user detail fail, user non-existent', 404);
        }
        unset($user['status'], $user['update_time'], $user['delete_time'], $user['longitude'], $user['dimension']);
        $user['avatar'] = explode('|', $user['avatar']);
        $user['edu_str'] = is_null($user['edu']) === false ? $this->userModel->getEduList()[$user['edu']] : '暂未选择';
        $user['sex_str'] = is_null($user['sex']) === false ? $this->userModel->getSexList()[$user['sex']] : '暂未选择';
        $user['income_str'] = is_null($user['income']) === false ? $this->userModel->getIncomeList()[$user['income']] : '暂未选择';
        $user['marriage_str'] = is_null($user['marriage']) === false ? $this->userModel->getMarriageList()[$user['marriage']] : '暂未选择';
        $user['children_str'] = is_null($user['children']) === false ? $this->userModel->getChildrenList()[$user['children']] : '暂未选择';
        $user['blood_str'] = is_null($user['blood']) === false ? $this->userModel->getBloodList()[$user['blood']] : '暂未选择';
        $user['house_str'] = is_null($user['house']) === false ? $this->userModel->getHouseList()[$user['house']] : '暂未选择';
        $user['car_buy_str'] = is_null($user['car_buy']) === false ? $this->userModel->getCarBuyList()[$user['car_buy']] : '暂未选择';
        $user['age'] = $this->getAgeByBirthday($user['birthday']);
        $user['city'] = json_decode(htmlspecialchars_decode($user['city']), true) ?: false;
        $user['address'] = json_decode(htmlspecialchars_decode($user['address']), true) ?: false;
        $user['native'] = json_decode(htmlspecialchars_decode($user['native']), true) ?: false;
        return $user;
    }

    public function getList(string $page, string $number, string $sex, string $city, string $longitude, string $dimension, array $search = [], string $order = 'user_id'){
        unset($search['page'], $search['number']);
        $order = in_array($order, ['user_id', 'score', 'location']) ? $order : 'user_id';
        $fields = ['user_id', 'username', 'avatar', 'remark', 'sex', 'height', 'birthday', 'vip', 'numbers', 'expire', 'score'];

        $city = htmlspecialchars_decode($city);
        $city = json_decode($city, true) ?: [];
        $city = isset($city['name']) ? $city['name'] : '';
        $city = explode(' ', $city);
        $city = $city[0] ?: false;
        $users = $this->userModel
            ->where('sex', $sex)
            ->where(function ($query) use ($city) {
                if ($city !== false){
                    $query->where('city', 'like', "%{$city}%");
                }
            })
            ->where((new SearchService())->init($search))
            ->field($fields)
            ->field(Location::distanceByMysqlM($longitude, $dimension, 'longitude', 'dimension', 'location'))
            ->order($order, 'desc')
            ->page($page, $number)
            ->select();
        foreach ($users as &$user){
            $user->avatar = explode('|', $user->avatar);
            $user->location = $user->location > 1000 ? Location::mToKm(intval($user->location)).'千米' : $user->location.'米';
            $user->sex = is_null($user->sex) === false ? $this->userModel->getSexList()[$user->sex] : '暂未选择';
            $user->age = $this->getAgeByBirthday($user->birthday);
        }
        return $users;
    }

    public function hasPhone(string $phone) : bool {
        $phone = $this->userModel
            ->where('phone', $phone)
            ->value('phone');
        return strlen($phone) ? true : false;
    }

    public function update(string $user_id, string $phone, array $data) : bool {
        $addressField = ['city', 'address', 'native'];
        foreach ($addressField as $item){
            if (isset($data[$item])){
                $json = htmlspecialchars_decode(is_string($data[$item]) ? $data[$item] : '');
                $json = json_decode($json, true) ?: false;
                if ($json === false){
                    throw new HandleException("'{$item}'格式错误");
                } else if (empty($json['name'])){
                    throw new HandleException("'{$item}'缺少name");
                }
            }
        }
        return $this->userModel
            ->where('user_id', $user_id)
            ->where('phone', $phone)
            ->save($data);
    }

    public function upgradeAvatar(string $user_id, string $phone, $avatar) : bool {
        $avatar = is_array($avatar) ? implode('|', $avatar) : $avatar;
        $flag = $this->update($user_id, $phone, ['avatar'=>$avatar]);
        if ($flag === false){
            throw new HandleException('更新头像失败');
        }
        return $flag;
    }

    public function decode(string $authentication){
        $user = DataEncryption::decode($authentication);
        if (is_null($user)){
            throw new HandleException('用户凭证错误', 502);
        }
        if ($user['expire'] < time()){
            throw new HandleException('用户登录信息已过期，请重新登录', 504);
        }
        return Config::set(['id'=>$user['user_id'], 'phone'=>$user['phone']], 'user');
    }

    public function openVip(string $user_id, string $days, string $numbers){
        $user = $this->getUserVipData($user_id);
        $user->vip = 1;
        $user->numbers += intval($numbers);
        $expire = strtotime($user->expire) ?: time();
        $user->expire = date('Y-m-d H:i:s', $expire + ($days * 86400));
        return $user->save();
    }

    public function vipGetUserPhone(string $vip_user_id, string $view_user_id){
        $user = $this->getUserVipData($vip_user_id);
        $timestamp = time();
        $expire = strtotime($user->expire) ?: $timestamp;
        if ($user->vip == 0 or $user->numbers <= 0 or $expire < $timestamp){
            throw new HandleException('您当前不是VIP，无法享用VIP权益', 403);
        }
        $user->numbers -= 1;
        $user->save();
        $view_user = $this->userModel->where('user_id', $view_user_id)->field('phone')->find();
        if (is_null($view_user)){
            throw new HandleException('查看的用户信息不存在');
        }
        $this->vipCheckStatus();
        return $view_user->phone;
    }

    public function vipCheckStatus(){
        return $this->userModel
            # ->fetchSql()
            ->where('vip', 1)
            ->where(function ($query){
                $query->where('numbers', '<=', 0);
                $query->whereOr('expire', '<', date('Y-m-d H:i:s'));
            })
            ->save([
                'vip'   =>  0,
                'numbers'   =>  0,
                'expire'    =>  null,
            ]);
    }

    protected function getUserVipData(string $user_id){
        $user = $this->userModel
            ->where('user_id', $user_id)
            ->field('vip')
            ->field('expire')
            ->field('numbers')
            ->find();
        if (is_null($user)){
            throw new HandleException('get user fail, user non-existent', 404);
        }
        return $user;
    }


    private function getAgeByBirthday($birthday){
        if (is_string($birthday)){
            return date('Y', time()) - date('Y', strtotime($birthday));
        }
        return '暂未设置';
    }
}