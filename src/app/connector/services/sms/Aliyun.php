<?php

namespace app\connector\services\sms;

use AlibabaCloud\SDK\Dysmsapi\V20170525\Dysmsapi;
use AlibabaCloud\SDK\Dysmsapi\V20170525\Models\SendSmsRequest;
use AlibabaCloud\SDK\Dysmsapi\V20170525\Models\SendSmsResponse;
use Darabonba\OpenApi\Models\Config;

/**
 * Class 阿里大鱼短信发送应用类
 * @package app\connector\services\sms
 */
class Aliyun
{
    protected static $endpoint = 'dysmsapi.aliyuncs.com';

    /**
     * 发送短信
     * @param string $accessKeyId 阿里大鱼的密钥ID
     * @param string $accessKeySecret 阿里大鱼的密钥KEY
     * @param string $signName 短信签名名称
     * @param string $template 短信模板ID
     * @param array $params 短信模板参数
     * @param string $phone 目标手机号
     * @return SendSmsResponse
     */
    public static function send(string $accessKeyId, string $accessKeySecret, string $signName, string $template, array $params, string $phone) : SendSmsResponse {
        $sendRequest = new SendSmsRequest([
            'signName'      =>  $signName,
            'templateCode'  =>  $template,
            'templateParam' =>  json_encode($params),
            'phoneNumbers'  =>  $phone,
        ]);
        return self::createClient($accessKeyId, $accessKeySecret)->sendSms($sendRequest);
    }

    protected static function createClient(string $accessId, string $secret) : Dysmsapi {
        $config = new Config([
            'accessKeyId'    =>  $accessId,
            'accessKeySecret'=>  $secret
        ]);
        $config->endpoint = self::$endpoint;
        return new Dysmsapi($config);
    }
}