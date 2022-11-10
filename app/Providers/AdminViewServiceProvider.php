<?php

namespace App\Providers;

use Illuminate\Support\Facades\View;
use Illuminate\Support\ServiceProvider;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class AdminViewServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        // Render data menu, profile ra các trang trong Admin
        View::composer('Admin.*', function ($view) {
            $login = Session::get('login');
            if (!empty($login->username)) {
                $menu = \App\Http\Controllers\Admin\MenuController::getMenu();
                $profile = \App\Http\Controllers\Admin\ProfileController::getProfile();
                $breadcrumb = \App\Http\Controllers\Admin\BreadCrumbController::getBreadcrumb();
                $view->with(compact('menu', 'profile', 'breadcrumb'));
            }
        });
    }
}
