<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\Facades\Session;
use Illuminate\Http\Request;
use App\Models\SecurityModel;

class SecurityController extends Controller
{
    protected $model;
    public function __construct()
    {
        $this->model = new SecurityModel();
    }

    public function view()
    {

        $data = array();
        if (isset($_COOKIE['gdt_user'])) {
            $data['username'] = $_COOKIE['gdt_user'];
        } else {
            $data['username'] = '';
        }
        if (isset($_COOKIE['gdt_pass'])) {
            $data['password'] = $_COOKIE['gdt_pass'];
        } else {
            $data['password'] = '';
        }
        return view('Admin.security.view')->with(['datas' => $data]);
    }

    public function loginAdmin(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'username' => 'bail|required|alpha',
            'password' => 'bail|required|',
        ]);

        if ($validator->fails()) {
            return response()->json([
                "status" => 0,
                "token" => csrf_token()
            ], 200);
        }
        $u = $request->username;
        $p = $request->password;
        $GMTTime = date("Y-m-d H:i:s");
        $remember = $request->remember;
        $captcha = md5($request->captcha);
        $pass = md5(md5($p) . "eCommerce@WEB");
        $captcha_check =  Session::get('captcha_eCommerce');
        Session::forget("login");
        if ($captcha != $captcha_check) {
            return response()->json([
                "status" => 0,
                "token" => csrf_token()
            ], 200);
        }
        if (!empty($u) && !empty($p)) {
            $login = $this->model->login($u);
            // var_dump($login);die;
            if (!empty($login[0])) {
                if ($pass == $login[0]->password) { // compare password success
                    // set session
                    $login[0]->logtime = $GMTTime;
                    $login[0]->params = $this->model->getRouter($login[0]->params);
                    $lang = $this->model->getLanguage();
                    $listmenu = $this->model->getListMenu();
                    unset($login[0]->password);
                    $login = $login[0];
                    Session::put('login', $login);
                    Session::put('menus', $listmenu);
                    Session::put('language', $lang);

                    if ($remember == 1) {
                        Cookie::queue('gdt_user', $u, time() + (86400 * 7), "/");
                        Cookie::queue('gdt_pass', $p, time() + (86400 * 7), "/");
                    } else {
                        Cookie::queue('gdt_user', '', time() + (86400 * 7), "/");
                        Cookie::queue('gdt_pass', '', time() + (86400 * 7), "/");
                    }
                    return response()->json([
                        "status" => 1,
                        "token" => csrf_token()
                    ], 200);
                } else {
                    return response()->json([
                        "status" => 0,
                        "token" => csrf_token()
                    ], 200);
                }
            } else {
                return response()->json([
                    "status" => 0,
                    "token" => csrf_token()
                ], 200);
            }
        }
    }

    public function logoutAdmin()
    {
        Session::forget("login");
        Session::forget("menus");
        return redirect('/admin');
    }

    function captcha(Request $request)
    {
        $captcha = $this->model->createCapcha('captcha_eCommerce');
    }
}
