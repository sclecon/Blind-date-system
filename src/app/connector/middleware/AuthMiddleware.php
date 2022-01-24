<?php

namespace app\connector\middleware;

use app\connector\services\UserService;
use app\connector\utils\Verify;
use app\Request;

class AuthMiddleware
{
    public function handle(Request $request, \Closure $next){
        $header = Verify::get(['authentication'], 'header');
        (new UserService())->decode($header->authentication);
        return $next($request);
    }
}