<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class SecurityModel extends Model
{
    public function login($u)
    {
        $query = DB::table('ecommerce_admin_users')
            ->leftJoin('ecommerce_groups', 'ecommerce_groups.id', '=', 'ecommerce_admin_users.groupid')
            ->select('ecommerce_admin_users.*', 'ecommerce_groups.params')
            ->where('ecommerce_admin_users.isdelete', 0)
            ->where('ecommerce_groups.isdelete', 0)
            ->where('ecommerce_admin_users.username', $u)
            ->get();
        return $query;
    }

    function getRouter($str)
    {
        $json = json_decode($str);
        $menu = DB::table('ecommerce_menus')
            ->select('id', 'route')
            ->where('isdelete', 0)
            ->where('route', '<>', '')
            ->get();
        $arr_menu = array();
        foreach ($menu as $item) {
            $arr_menu[$item->id] = $item->route;
        }
        $arr_right = array();
        foreach ($json as $id => $right) {
            if (isset($arr_menu[$id])) {
                $arr_right[$arr_menu[$id]] = $right;
            }
        }
        return $arr_right;
    }

    function getLanguage($lang = '')
    {
        if ($lang != "") {
            $langs = $lang;
        } else {
            $langs = "vn";
        }
        $query = DB::table('ecommerce_language')
            ->select('keyword', 'translation', 'langpage')
            ->where('isdelete', 0)
            ->where('language', $langs)
            ->get();
        $arr = array();
        foreach ($query as $item) {
            $arr[$item->langpage][$item->keyword]       = $item->translation;
        }
        return $arr;
    }

    function getListMenu()
    {
        $menu = DB::table('ecommerce_menus')
            ->select('name', 'route')
            ->where('isdelete', 0)
            ->where('route', '<>', '')
            ->where('route', '<>', '#')
            ->get();
        $arr = array();
        foreach ($menu as $item) {
            $arr[$item->route] = $item->name;
        }
        return $arr;
    }

    function createCapcha($name, $width = 160, $height = 33, $characters = 3)
    {
        $font = public_path() . '/assets/fonts/courbd.ttf';
        $possible = '23456789abcdefghjkmnopqrstvwxyz';
        $text = '';
        $i = 0;
        while ($i < $characters) {
            $text .= substr($possible, mt_rand(0, strlen($possible) - 1), 1);
            $i++;
        }

        Session::forget($name);
        Session::put($name, md5($text));

        $im = imagecreatetruecolor($width, $height);
        $white = imagecolorallocate($im, 255, 255, 255);
        $grey = imagecolorallocate($im, 128, 128, 128);
        $black = imagecolorallocate($im, 0, 0, 0);
        imagefilledrectangle($im, 0, 0, 399, $height, $white);
        $noise_color = imagecolorallocate($im, 100, 120, 180);
        $noise_color3 = imagecolorallocate($im, 0, 120, 180);
        $noise_color2 = imagecolorallocate($im, 100, 120, 180);
        for ($i = 0; $i < ($width * $height) / 3; $i++) {
            imagefilledellipse($im, mt_rand(0, $width), mt_rand(0, $height), 1, 1, $noise_color);
        }

        /* generate random lines in background */
        for ($i = 0; $i < ($width * $height) / 150; $i++) {
            imageline($im, mt_rand(0, $width), mt_rand(0, $height), mt_rand(0, $width), mt_rand(0, $height), $noise_color2);
            imageline($im, mt_rand(0, $width), mt_rand(0, $width), mt_rand(0, $height), mt_rand(0, $height), $noise_color3);
        }

        $item_space = ($width - 3) / $characters;
        $max_font_size = 20;
        $min_font_size = 14;
        for ($i = 0; $i < $characters; $i++) {
            $x = ($i * $item_space) + 5;
            $font_size = rand(
                $min_font_size,
                $max_font_size
            );
            $y = rand(($height / 2), $height - 3);
            imagettftext($im, $font_size, 0, $x, $y, $grey, $font, $text[$i]);
            imagettftext($im, $font_size, 0, $x - 1, $y - 1, $black, $font, $text[$i]);
        }
        header('Content-type: image/png');

        imagejpeg($im);
        imagedestroy($im);
    }
}
