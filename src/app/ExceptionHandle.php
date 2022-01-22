<?php
namespace app;

use app\connector\response\Json;
use think\db\exception\DataNotFoundException;
use think\db\exception\ModelNotFoundException;
use think\exception\FuncNotFoundException;
use think\exception\Handle;
use think\exception\HttpException;
use think\exception\HttpResponseException;
use think\exception\ValidateException;
use think\Response;
use app\connector\exception\HandleException;
use Throwable;

/**
 * 应用异常处理类
 */
class ExceptionHandle extends Handle
{
    /**
     * 不需要记录信息（日志）的异常类列表
     * @var array
     */
    protected $ignoreReport = [
        HttpException::class,
        HttpResponseException::class,
        ModelNotFoundException::class,
        DataNotFoundException::class,
        ValidateException::class,
        HandleException::class,
        FuncNotFoundException::class
    ];

    protected $output = [
        HandleException::class,
        HttpException::class,
        ModelNotFoundException::class,
        FuncNotFoundException::class
    ];

    /**
     * 记录异常信息（包括日志或者其它方式记录）
     *
     * @access public
     * @param  Throwable $exception
     * @return void
     */
    public function report(Throwable $exception): void
    {
        // 使用内置的方式记录异常日志
        parent::report($exception);
    }

    /**
     * Render an exception into an HTTP response.
     *
     * @access public
     * @param \think\Request   $request
     * @param Throwable $e
     * @return Response
     */
    public function render($request, Throwable $e): Response
    {
        foreach ($this->output as $output){
            if ($e instanceof $output){
                $msg = str_replace("\\", ">", $e->getMessage());
                $msg = str_replace('>app>', '', $msg);
                return Json::error($msg, $e->getCode()?:500);
            }
        }
        return parent::render($request, $e);
    }
}
