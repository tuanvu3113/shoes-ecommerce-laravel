<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use DB;
use Illuminate\Http\Request;

class AboutController extends Controller
{
    public function view()
    {
        $data = array();
        return view('Front.about.view')->with(['datas' => $data]);
    }
}