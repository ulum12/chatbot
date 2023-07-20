<?php

namespace App\Http\Middleware;

use Closure;

class CheckStatus
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if (auth()->user()) {
            if (auth()->user()->active == 1) {
                return $next($request);
            }
            return response()->json('Akun anda tidak aktif');
        }else{
            return redirect('/');
        }
    }
}
?>