<?php

/**
 * Created By PhpStorm
 * User sclecon
 * Contact Email 27941662@qq.com
 * Time 2022/1/21 9:48
 */


namespace app\connector\services\pay\driver;


use app\connector\exception\HandleException;
use EasyWeChat\Factory;
use EasyWeChat\Payment\Application;
use app\connector\services\pay\driver\exception\WeixinException;
use app\connector\services\pay\driver\port\PayPort;
use app\connector\services\pay\driver\traits\BaseDriver;
use think\facade\Request;

class Weixin implements PayPort
{
    use BaseDriver;

    protected $name = '微信';
    protected $sandbox = false;
    protected $openid;
    protected $notifyUrl;

    public function setOpenID(string $openid) : Weixin {
        $this->openid = $openid;
        return $this;
    }

    public function setNotifyUrl(string $notifyUrl) : Weixin {
        $this->notifyUrl = $notifyUrl;
        return $this;
    }

    public function pay(string $support, string $order_id, string $total_fee, string $subject): array
    {
        $data = ['body'=>$subject, 'out_trade_no'=>$order_id, 'total_fee'=>$total_fee * 100];
        switch ($support){
            case 'pc': $data = array_merge($data, $this->OrderUnifyByQrcode());break;
            case 'h5': $data = array_merge($data, $this->OrderUnifyByH5());break;
            case 'wx': $data = array_merge($data, $this->OrderUnifyByWx());break;
            case 'wxapp': $data = array_merge($data, $this->OrderUnifyByMiniApp());break;
            default: throw new WeixinException('your have client is not support');
        }
        $client = $this->getAppClient();
        $response = $client->order->unify($data);
        if (isset($response['return_code']) && $response['return_code'] === 'FAIL') {
            throw new WeixinException($response['retmsg']?:$response['return_msg']);
        } else if (isset($response['result_code']) && $response['result_code'] === 'FAIL') {
            throw new WeixinException($response['err_code_des']);
        }
        switch ($support){
            case 'pc': return ['type'=>'qrcode', 'string'=>$response['code_url'], 'order_id'=>$order_id, 'drives_order_id'=>$response['prepay_id']];
            case 'h5': return ['type'=>'json', 'data'=>$client->jssdk->sdkConfig($response['prepay_id']), 'order_id'=>$order_id, 'drive_order_id'=>$response['prepay_id']];
            case 'wx': return ['type'=>'json', 'data'=>$client->jssdk->bridgeConfig($response['prepay_id'], false), 'order_id'=>$order_id, 'drive_order_id'=>$response['prepay_id']];
            case 'wxapp': return ['type'=>'json', 'data'=>$client->jssdk->bridgeConfig($response['prepay_id'], false), 'order_id'=>$order_id, 'drive_order_id'=>$response['prepay_id']];
        }
        throw new WeixinException('your have client is not support in response');
    }

    public function query(string $order_id, string $id_type = 'out_trade_no'): array
    {
        if ($id_type === 'out_trade_no') {
            $response = $this->getAppClient()->order->queryByOutTradeNumber($order_id);
        } else if ($id_type === 'transaction_id') {
            $response = $this->getAppClient()->order->queryByTransactionId($order_id);
        } else {
            throw new WeixinException('query order arg id type must transaction_id or out_trade_no');
        }
        if (isset($response['return_code']) && $response['return_code'] === 'FAIL'){
            throw new WeixinException($response['return_msg']);
        }
        if (isset($response['result_code']) && $response['result_code'] === 'FAIL'){
            throw new WeixinException($response['err_code_des']."[order_id:$order_id]");
        }
        $data = [
            'transaction_id'    =>    $response['transaction_id'],
            'out_trade_no'      =>    $response['out_trade_no'],
            'message'           =>    $response['trade_state_desc'],
            'total_fee'         =>    $response['total_fee'] / 100,
            'fee_type'          =>    $response['fee_type'],
            'pay_status'            =>    $response['trade_state'] === 'SUCCESS'
        ];
        return $data;
    }

    public function notify(\Closure $handle) : bool {
        $response = $this->getAppClient()->handlePaidNotify(function ($params, $fail) use ($handle) {
            if (isset($params['return_code']) && $params['return_code'] === 'SUCCESS' && isset($params['result_code']) && $params['result_code'] === 'SUCCESS') {
                $handle($params['out_trade_no']);
                return true;
            }
            return $fail('please notify me later');
        });
        $response->send();
        return true;
    }

    protected function OrderUnifyByQrcode() : array {
        return ['trade_type'=>'NATIVE'];
    }

    protected function OrderUnifyByH5() : array {
        if (is_null($this->getOpenId())){
            throw new HandleException('weixin payment openid is null', 500);
        }
        return ['trade_type'=>'JSAPI', 'openid'=>$this->getOpenId()];
    }

    protected function OrderUnifyByWx() : array {
        if (is_null($this->getOpenId())){
            throw new HandleException('weixin payment openid is null', 500);
        }
        return ['trade_type'=>'JSAPI', 'openid'=>$this->getOpenId()];
    }

    protected function OrderUnifyByMiniApp() : array {
        if (is_null($this->getOpenId())){
            throw new HandleException('weixin payment openid is null', 500);
        }
        return ['trade_type'=>'JSAPI', 'openid'=>$this->getOpenId()];
    }

    public function getConfig(): array
    {
        $config = [
            'app_id'    =>  sysconfig('pay', 'pay_weixin_appid'),
            'secret'    =>  sysconfig('pay', 'pay_weixin_secret'),
            'mch_id'    =>  sysconfig('pay', 'pay_weixin_mch_id'),
            'key'       =>  sysconfig('pay', 'pay_weixin_mch_key'),
        ];
        $config['sandbox'] = $this->sandbox;
        $config['notify_url'] = $this->getNotifyUrl();
        return $config;
    }

    protected function getNotifyUrl(){
        if (is_null($this->notifyUrl)){
            return Request::domain().'/order/notify';
        }
        return $this->notifyUrl;
    }

    protected function getAppClient() : Application {
        $config = $this->getConfig();
        return Factory::payment($config);
    }

    public function support() : array {
        return ['wx', 'h5', 'pc', 'wxapp'];
    }

    protected function getOpenId(){
        return $this->openid;
    }
}