<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Response;
use Illuminate\Http\Request;
use App\Models\SecurityModel;
use Session;

class DashboardController extends Controller
{
    private $route;
    private $login;

    function __construct() {
        if (in_array('__construct', get_class_methods(get_parent_class($this)))) {
            parent::__construct();
        }
        $this->route = 'news';
        $menu = Session::get('menus');
        $this->title = isset($menu[$this->route]) ? $menu[$this->route] : $this->route;
        $this->security_model = new SecurityModel();
    }

    public function checkPermission($action = 'view') {
        $class = get_class($this);
        $login = Session::get('login');
 
        if (empty($login->username)) { //Chưa đăng nhập
            return redirect('/admin');
        }
        else if (!isset($login->params[$this->route]->$action)) {
            return redirect('/admin');
        }
    }

    public function view()
    {
        $permissions = $this->checkPermission();
        if ($permissions instanceof RedirectResponse) {
            return $permissions;
        }
        $data = array();
        return view('Admin.home.view')->with(['datas' => $data]);
    }

    public function setLanguage(Request $request)
    {
        if (isset($request->lang)) {
            $lang = $request->lang;
        } else {
            $lang = 'vn';
        }
        $langs = $this->security_model->getLanguage($lang);
        Session::put('keylang', $lang);
        Session::put('language', $langs);
        Session::put('lang', $lang);
        return 1;
    }
}