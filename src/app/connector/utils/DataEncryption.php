<?php

namespace app\connector\utils;

class DataEncryption
{
    public static function encode(array $data) {
        return base64_encode(json_encode($data));
    }

    public static function decode(string $sign) {
        return json_decode(base64_decode($sign), true);
    }
}