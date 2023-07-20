<?php

namespace App\Http\Middleware;

use Illuminate\Auth\Middleware\Authenticate as Middleware;

class Authenticate extends Middleware
{
    /**
     * Get the path the user should be redirected to when they are not authenticated.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return string|null
     */
    protected function redirectTo($request)
    {
      // echo json_encode($request);
      // exit();
        if (! $request->expectsJson()) {
            // return route('dashboard');
            // return '/';
        }
    //      if(\Auth::user()->hasRole('copy')){
    //     $this->redirectTo = '/copy/dashboardCopy';
    //     return $this->redirectTo;
    // } 
    }
  //    public function handle($request, Closure $next, ...$levels)
  //   {
  //       if (Auth::check() && Auth::user()->role == ‘admin’) {
  //    return $next($request);
  //  }
  // return '/';
  //   }
}
