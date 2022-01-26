<?php

namespace app\connector\services;

use app\connector\exception\HandleException;
use think\db\Query;

class SearchService
{
    /**
     * @var Query
     */
    protected $query;

    protected $fields = ['age', 'height', 'address', 'income', 'edu', 'marriage', 'house', 'search'];

    public function init(array $condition) : \Closure {
        return function($query) use ($condition) {
            $this->query = $query;
            foreach ($condition as $action => $value){
                if ($value !== false and in_array($action, $this->fields)){
                    $this->$action($value);
                }
            }
        };
    }

    protected function age(string $age){
        list($min, $max) = $this->scope($age, 0, 100, '年龄');
        $over = date('Y-01-01', strtotime("-{$min}year"));
        $start = date('Y-01-01', strtotime("-{$max}year"));
        $this->query = $this->query->where('birthday', '>=', $start);
        $this->query = $this->query->where('birthday', '<=', $over);
    }

    protected function height(string $height){
        list($min, $max) = $this->scope($height, 140, 210, '身高');
        $this->query = $this->query->where('height', '>=', $min);
        $this->query = $this->query->where('height', '<=', $max);
    }

    protected function address(string $address){
        $this->query = $this->query->where('address', $address);
    }

    protected function income(string $income){
        if (in_array($income, [1, 2, 3, 4, 5]) === false){
            throw new HandleException('月收入选项错误');
        }
        $this->query = $this->query->where('income', $income);
    }

    protected function edu(string $edu){
        if (in_array($edu, [1, 2, 3, 4, 5, 6, 7, 8]) === false){
            throw new HandleException('学历选项错误');
        }
        $this->query = $this->query->where('edu', $edu);
    }

    protected function marriage(string $marriage){
        if (in_array($marriage, [1, 2, 3, 4]) === false){
            throw new HandleException('婚姻状态选项错误');
        }
        $this->query = $this->query->where('marriage', $marriage);
    }

    protected function search(string $search){
        $this->query = $this->query->where("(phone = '{$search}' or username = '{$search}')");
    }

    protected function house(string $house){
        if (in_array($house, [1, 2, 3, 4, 5]) === false){
            throw new HandleException('购房状态选项错误');
        }
        $this->query = $this->query->where('house', $house);
    }

    private function scope(string $scope, string $minScope, string $maxScope, string $instruction) : array {
        @list($min, $max) = explode('-', $scope);
        if (is_null($max)){
            throw new HandleException("{$instruction}参数必须是一个范围值，用-分割");
        }
        if ($min < $minScope or $max < $min){
            throw new HandleException($instruction.'范围不能小于'.$minScope);
        } else if ($min > $maxScope or $max > $maxScope){
            throw new HandleException($instruction.'范围不能大于'.$maxScope);
        } else if ($min > $max){
            throw new HandleException($instruction.'最小值不能大于最大值');
        }
        return [$min, $max];
    }
}