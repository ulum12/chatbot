<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Http;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

use App\Models\M_User;

class C_Auth extends Controller
{
    public function loginPage()
    {
        if(auth()->user()){
            return redirect('/dashboard');
        }
        return view('auth.loginPage');
    }
    
    public function loginProses(Request $request)
    {
        // {'username':username, 'password':password}
        $credentials = $request->validate([
            'username' => ['required'],
            'password' => ['required'],
        ]);

        $tUser = M_User::where('username', $request -> username) -> count();
        if($tUser < 1){
            $status = "NO_USER";
        }else{
            $dUser = M_User::where('username', $request -> username) -> first();
            $cekUser = password_verify($request -> password, $dUser -> password);

            if($cekUser == true){
                $status = "SUCCESS";
                if (Auth::attempt($credentials)) {
                    $request->session()->regenerate();
                }
            }else{
                $status = "WRONG_PASSWORD";
            }
            
        }

        $dr = ['status' => $status];
        return \Response::json($dr);
    }

    public function logout(Request $request)
    {
        Auth::logout();
 
        request()->session()->invalidate();
 
        request()->session()->regenerateToken();
 
        return redirect('/');
    }
}
