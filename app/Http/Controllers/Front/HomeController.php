<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function view()
    {
        $title = "Data from Controller";
        $description = "Đây là dòng mô tả";
        $copyright = "Học Web Chuẩn";
        $data = array();
        $data['user'] = $this->getUser();
        $data['slides'] = $this->getSlides();
        return view('Front.home.view')->with(['datas' => $data]);
    }

    public function getSlides()
    {
        $query = DB::table('ecommerce_home')->select('json_pictures')
            ->where('is_delete',  0)
            ->where('is_publish', 1)
            ->get();
        $json_pictures = !empty($query[0]) ? $query[0]->json_pictures : '';
        return $json_pictures;
    }
    public function getUser()
    {
        $user = DB::table('ecommerce_public_users')->get();
        return $user;
    }
}
