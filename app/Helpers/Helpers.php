<?php
    // base_path(); // Path of application root D:\xampp7\htdocs\shoes-ecommerce-laravel
    // storage_path(); // Path of storage D:\xampp7\htdocs\shoes-ecommerce-laravel\storage
    // app_path(); // Path of app D:\xampp7\htdocs\shoes-ecommerce-laravel\app
    // public_path(); D:\xampp7\htdocs\shoes-ecommerce-laravel\public

	function getLanguage($keylang, $content)
	{
		$language = Session::get('language');
		if(isset($language[$keylang][$content])){
			return $language[$keylang][$content];
		}
		else{
			return $content;
		}
	}

    function admin_url()
    {
        return '/admin/';
    }

    function base_url()
    {
        return '/';
    }

    function url_tmpl()
    {
        return '/';
    }