<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class SecurityController extends Controller
{
    public function view()
    {
        $data = array();
        return view('Front.security.view')->with(['datas' => $data]);
    }
}
