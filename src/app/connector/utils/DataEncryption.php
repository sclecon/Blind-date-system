<?php

namespace app\connector\utils;

class DataEncryption
{
    protected static $secret = '12f862d21d3ceafba1b88e5f22960d55';

    public static function encode(array $data) {
        return base64_encode(openssl_encrypt(json_encode($data), 'AES-128-CBC', self::$secret, OPENSSL_RAW_DATA , self::getIv()));
    }

    public static function decode(string $sign) {
        return json_decode(openssl_decrypt(base64_decode($sign), 'AES-128-CBC', self::$secret, OPENSSL_RAW_DATA, self::getIv()), true);
    }

    protected static function getIv(){
        return md5(self::$secret, true);
    }
}