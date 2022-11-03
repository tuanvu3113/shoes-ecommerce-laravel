<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="<?php echo isset($_SESSION["description_SEO"]) ? $_SESSION["description_SEO"] : ''; ?>">
	<meta name="keywords" content="<?php echo isset($_SESSION["keywords_SEO"]) ? $_SESSION["keywords_SEO"] : ''; ?>')}}" />
	<meta name="author" content="<?php echo isset($_SESSION["author_SEO"]) ? $_SESSION["author_SEO"] : 'Tuan Vu DEV'; ?>">
	<title><?php echo isset($_SESSION["title_SEO"]) ? $_SESSION["title_SEO"] : 'Urdan'; ?></title>

	<!-- Add site Favicon -->
	<link rel="icon" href="{{asset('assets/images/favicon/cropped-favicon-32x32.png')}}" sizes="32x32" />
	<link rel="icon" href="{{asset('assets/images/favicon/cropped-favicon-192x192.png')}}" sizes="192x192" />
	<link rel="apple-touch-icon" href="{{asset('assets/images/favicon/cropped-favicon-180x180.png')}}" />
	<meta name="msapplication-TileImage" content="assets/images/favicon/cropped-favicon-270x270.png')}}" />

	<!-- All CSS is here
    ============================================ -->
	<link rel="stylesheet" href="{{asset('assets/css/vendor/bootstrap.min.css')}}" />
	<link rel="stylesheet" href="{{asset('assets/css/vendor/pe-icon-7-stroke.css')}}" />
	<link rel="stylesheet" href="{{asset('assets/css/vendor/themify-icons.css')}}" />
	<link rel="stylesheet" href="{{asset('assets/css/vendor/font-awesome.min.css')}}" />
	<link rel="stylesheet" href="{{asset('assets/css/plugins/animate.css')}}" />
	<link rel="stylesheet" href="{{asset('assets/css/plugins/aos.css')}}" />
	<link rel="stylesheet" href="{{asset('assets/css/plugins/magnific-popup.css')}}" />
	<link rel="stylesheet" href="{{asset('assets/css/plugins/swiper.min.css')}}" />
	<link rel="stylesheet" href="{{asset('assets/css/plugins/jquery-ui.css')}}" />
	<link rel="stylesheet" href="{{asset('assets/css/plugins/nice-select.css')}}" />
	<link rel="stylesheet" href="{{asset('assets/css/plugins/select2.min.css')}}" />
	<link rel="stylesheet" href="{{asset('assets/css/plugins/easyzoom.css')}}" />
	<link rel="stylesheet" href="{{asset('assets/css/plugins/slinky.css')}}" />
	<link rel="stylesheet" href="{{asset('assets/css/style.css')}}" />
	@yield('css')
	<script>
		var formSearch = 'page';
	</script>
</head>

<body>
	<div class="main-wrapper main-wrapper-2">
		<label class="error" style="display: none; opacity: 1;"></label>
		@include('Front.includes.header')
		@yield('content')
		@include('Front.includes.footer')
	</div>
</body>

</html>