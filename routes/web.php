<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });

Route::group([
    'name' => 'front.',
    'prefix' => '/',
    'namespace' => 'Front',
], function () {

    // No middleware here
    // URL: /front/about-us
    // Route name: front.about
    Route::get('/', 'HomeController@view')->name('home');
    Route::get('about.html', 'AboutController@view')->name('about');
    // Route::get('login', 'SecurityController@view')->name('user.login');
});


Route::group([
    'name' => 'admin.',
    'prefix' => 'admin',
    'namespace' => 'Admin',
], function () {

    // No middleware here
    // URL: /front/about-us
    // Route name: front.about

    // Login
    Route::get('/', 'SecurityController@view')->name('admin');
    Route::get('login', 'SecurityController@view');
    Route::post('login', 'SecurityController@loginAdmin')->name('admin.login');
    Route::get('logout', 'SecurityController@logoutAdmin')->name('admin.logout');

    // Home
    Route::get('home', 'DashboardController@view');
    Route::post('home-setlanguage', 'DashboardController@setLanguage')->name('admin.setLanguage');
    Route::post('get-notify', 'DashboardController@getNotify')->name('admin.getNotify');
    Route::post('turn-off-notify', 'DashboardController@turnOffNotify')->name('admin.turnOffNotify');

    // News
    Route::get('news', 'NewsController@view')->name('admin.news');
    Route::get('news/edit/{id}', 'NewsController@getEdit')->name('admin.getEdit');
    Route::get('news/exportexcel', 'NewsController@exportexcel')->name('admin.exportexcel');
    Route::post('news', 'NewsController@getList')->name('admin.getList');
    Route::post('news-delete', 'NewsController@delete')->name('admin.delete');
    Route::post('news-isshow', 'NewsController@isshow')->name('admin.isshow');
    Route::post('news-ispopular', 'NewsController@ispopular')->name('admin.ispopular');
    Route::post('news-setposition', 'NewsController@setposition')->name('admin.setposition');
    Route::post('news-upload-file', 'NewsController@uploadFile')->name('admin.uploadFile');
    Route::post('news-mysave', 'NewsController@mysave')->name('admin.mysave');
});
