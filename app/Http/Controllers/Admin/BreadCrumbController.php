<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Session;

class BreadCrumbController extends Controller
{
    public function getBreadcrumb()
    {
        $controller = str_replace("admin.", "", Route::getCurrentRoute()->getName());
        $lang = Session::get('language');
        $pid = DB::table('ecommerce_menus')
            ->select('parent', 'name','route', 'keylang')
            ->where('route', $controller)
            ->where('isdelete', 0)
            ->get();
        // Load bread crumb cho menu không có level
        if (!empty($pid[0])) {
            if ($pid[0]->parent == 0) {
                $keylang = $pid[0]->keylang;
                return isset($lang['menu'][$keylang]) ? $lang['menu'][$keylang] : $keylang;
            }
        }

        if(empty($pid[0]->name)){
            return '<li></li>';
        }
        $arr = array();
        $breadcrumb = '';
        (new BreadCrumbController)->getParent($pid[0]->parent, $arr,$lang);
        // echo'<pre>';print_r($pid[0]->parent);die;
        $c = count($arr) - 1;
        for ($i = $c; $i >= 0; $i--) {
            $breadcrumb .= $arr[$i];
        }
        $pagename = $pid[0]->name;
        $route = $pid[0]->route;
        if(isset($lang['menu'][trim($pid[0]->keylang)])){
            $pagename = $lang['menu'][trim($pid[0]->keylang)];
        }
        $breadcrumb .= '<li class="breadcrumb-item active"></li><li class="breadcrumb-item active">'.$pagename.'</li>';
        return $breadcrumb;
    }

    function getParent($id, &$arr,$lang) {
        $parent = DB::table('ecommerce_menus')
            ->select('id','route', 'name','parent', 'keylang')
            ->where('id', $id)
            ->where('isdelete', 0)
            ->get();
        if (!$parent) return;
        $pid = $parent[0]->parent;
        $route = $parent[0]->route;
        $pagename = $parent[0]->name;
        if(isset($lang['menu'][trim($parent[0]->keylang)])){
            $pagename = $lang['menu'][trim($parent[0]->keylang)];
        }
        if($route != '' && $route != '#'){
            $link = '/'.$route;
        }else{
            $link = $route;
        }
        $breadcrumb = '<li><a href="'.$link.'">'.$pagename.'</a><!--<i class="fa fa-angle-right"></i>--></li>';
        array_push($arr, $breadcrumb);
    }
}