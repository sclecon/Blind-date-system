<?php

/**
 * Created By PhpStorm
 * User sclecon
 * Contact Email 27941662@qq.com
 * Time 2022/1/18 13:34
 */


namespace app\connector\utils;


class Location
{

    protected static $radius = '6378.138';

    public static function distanceByMysqlM(string $longitude, string $dimension, string $longitude_field = 'longitude', string $dimension_field = 'dimension', $filed = 'distance')
    {
        $radius = self::$radius;
        return <<<FIELD
ROUND(
                $radius * 2 * ASIN(
                    SQRT(
                        POW(
                            SIN(
                                (
                                    $dimension * PI() / 180 - $dimension_field * PI() / 180
                                ) / 2
                            ),
                            2
                        ) + COS($dimension * PI() / 180) * COS($dimension_field * PI() / 180) * POW(
                            SIN(
                                (
                                     $longitude * PI() / 180 -   $longitude_field * PI() / 180
                                ) / 2
                            ),
                            2
                        )
                    )
                ) * 1000 ) AS $filed
FIELD;
    }

    public static function mToKm($number){
        $number /= 1000;
        return $number;
    }

}