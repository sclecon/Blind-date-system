<?php

namespace app\connector\utils\traits;

use app\connector\exception\HandleException;
use think\Model;

trait BaseModelService
{
    /**
     * @return Model
     * @throws HandleException
     */
    protected function getModel() : Model {
        if (empty($this->model)){
            throw new HandleException(self::class.' protected params \'model\' must define');
        }
        if (is_string($this->model)){
            $this->model = new $this->model();
        }
        return $this->model;
    }
}