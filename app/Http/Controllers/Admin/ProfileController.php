<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Session;

class ProfileController extends Controller
{
    public function getProfile()
    {
        $login = Session::get('login');
        $name = isset($login->username) ? $login->username : '';
        $html = '
            <span class="d-none d-xl-inline-block ms-1 fw-medium">'.$name.'</span>
            <i class="mdi mdi-chevron-down d-none d-xl-inline-block"></i>
        ';
        return $html;
    }
}