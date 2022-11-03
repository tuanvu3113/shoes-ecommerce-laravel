<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use DB;

class SecurityModel extends Model
{
    public function login($u) {
        $query = DB::table('ecommerce_admin_users')
            ->leftJoin('ecommerce_groups', 'ecommerce_groups.id', '=', 'ecommerce_admin_users.groupid')
            ->select('ecommerce_admin_users.*', 'ecommerce_groups.params')
            ->where('ecommerce_admin_users.isdelete',0)
            ->where('ecommerce_groups.isdelete',0)
            ->where('ecommerce_admin_users.username',$u)
            ->get();
        return $query;
    }

    function getRouter($str){
        $json = json_decode($str);
        $menu = DB::table('ecommerce_menus')
        ->select('id', 'route')
        ->where('isdelete',0)
        ->where('route','<>','')
        ->get();
        $arr_menu = array();
        foreach($menu as $item){
            $arr_menu[$item->id] = $item->route;
        }
        $arr_right = array();
        foreach($json as $id=>$right){
            if(isset($arr_menu[$id])){
                $arr_right[$arr_menu[$id]] = $right;
            }
        }
        return $arr_right;
    }

    function getLanguage($lang=''){
        if($lang != ""){
            $langs = $lang;
        }
        else{
            $langs = "vn";
        }
        $query = DB::table('ecommerce_language')
        ->select('keyword', 'translation', 'langpage')
        ->where('isdelete',0)
        ->where('language',$langs)
        ->get();
        $arr = array();
        foreach($query as $item){
            $arr[$item->langpage][$item->keyword]       = $item->translation;
        }
        return $arr;
    }

    function getListMenu(){
        $menu = DB::table('ecommerce_menus')
        ->select('name', 'route')
        ->where('isdelete',0)
        ->where('route', '<>','')
        ->where('route','<>','#')
        ->get();
        $arr = array();
        foreach($menu as $item){
            $arr[$item->route] = $item->name;
        }
        return $arr;
    }
}