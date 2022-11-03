<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class BreadCrumbController extends Controller
{
    public function getLanguage()
    {
        $pid = DB::table('ecommerce_menus')
            ->select('parent', 'name','route', 'keylang')
            ->where('route', $controller)
            ->where('isdelete', 0)
            ->get();
        
        return $breadcrumb;
    }
}