<?php

use Illuminate\Support\Facades\Session;
use Illuminate\Http\Request;

// base_path(); // Path of application root D:\xampp7\htdocs\shoes-ecommerce-laravel
// storage_path(); // Path of storage D:\xampp7\htdocs\shoes-ecommerce-laravel\storage
// app_path(); // Path of app D:\xampp7\htdocs\shoes-ecommerce-laravel\app
// public_path(); D:\xampp7\htdocs\shoes-ecommerce-laravel\public

function getLanguage($keylang, $content)
{
    $language = Session::get('language');
    if (isset($language[$keylang][$content])) {
        return $language[$keylang][$content];
    } else {
        return $content;
    }
}

function admin_url()
{
    $host = request()->getHttpHost();
    return $host . '/admin/';
}

function base_url()
{
    $host = request()->getHttpHost();
    return $host;
}

function url_tmpl()
{
    $host = request()->getHttpHost();
    return $host;
}
