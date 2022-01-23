<?php

/**
 * Created By PhpStorm
 * User sclecon
 * Contact Email 27941662@qq.com
 * Time 2022/1/22 10:15
 */


namespace app\connector\controller;


use app\BaseController;
use app\connector\response\Json;
use app\connector\services\SendCode;
use app\connector\services\SmsSendCode;
use app\connector\utils\Verify;
use EasyAdmin\upload\Uploadfile;

class Utils extends BaseController
{

    public function send_code(){
        $input = Verify::get(['phone'], 'post');
        $code = (new SmsSendCode())->setDriver('aliyun')->setPhone($input->phone)->send();
        return Json::success('send code successfully', [
            'code_id'   =>  (new SendCode())->insert($input->phone, $code)
        ]);
    }

    public function upload_image(){
        $data = [
            'upload_type' => $this->request->post('upload_type'),
            'file'        => $this->request->file('file'),
        ];
        $uploadConfig = sysconfig('upload');
        empty($data['upload_type']) && $data['upload_type'] = $uploadConfig['upload_type'];
        $rule = [
            'upload_type|指定上传类型有误' => "in:{$uploadConfig['upload_allow_type']}",
            'file|文件'              => "require|file|fileExt:{$uploadConfig['upload_allow_ext']}|fileSize:{$uploadConfig['upload_allow_size']}",
        ];
        $this->validate($data, $rule);
        $upload = Uploadfile::instance()
            ->setUploadType($data['upload_type'])
            ->setUploadConfig($uploadConfig)
            ->setFile($data['file'])
            ->save();
        if ($upload['save'] == true) {
            return Json::success($upload['msg'], ['url' => $upload['url']]);
        } else {
            return Json::error($upload['msg']);
        }
    }

}