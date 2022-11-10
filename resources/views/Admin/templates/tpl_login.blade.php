<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>:: Admin :: Sign In</title>
	<!--favicon-->
	<link rel="icon" href="{{asset('assets/admin/images/favicon-32x32.png')}}" type="image/png" />
	<!--plugins-->
	<link href="{{asset('assets/admin/plugins/simplebar/css/simplebar.css')}}" rel="stylesheet" />
	<link href="{{asset('assets/admin/plugins/perfect-scrollbar/css/perfect-scrollbar.css')}}" rel="stylesheet" />
	<!-- Bootstrap CSS -->
	<link href="{{asset('assets/admin/css/bootstrap.min.css')}}" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
	<link href="{{asset('assets/admin/css/app.css')}}" rel="stylesheet">
	<link href="{{asset('assets/admin/css/icons.css')}}" rel="stylesheet">

	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<link rel="stylesheet" href="{{asset('assets/admin/plugins/sweetalert/sweetalert.css')}}" />
	@yield('css')
</head>

<body class="bg-login">
	<!--wrapper-->
	<div class="auth-page">
		@yield('content')
	</div>
	<script src="{{asset('assets/admin/libs/jquery/jquery.min.js')}}"></script>
	<script src="{{asset('assets/admin/libs/bootstrap/js/bootstrap.bundle.min.js')}}"></script>
	<script src="{{asset('assets/admin/plugins/sweetalert/sweetalert.min.js')}}"></script> <!-- SweetAlert Plugin Js -->
	<script src="{{asset('assets/admin/libs/metismenu/metisMenu.min.js')}}"></script>
	<script src="{{asset('assets/admin/libs/simplebar/simplebar.min.js')}}"></script>
	<script src="{{asset('assets/admin/libs/node-waves/waves.min.js')}}"></script>
	<script src="{{asset('assets/admin/libs/feather-icons/feather.min.js')}}"></script>
	<!-- pace js -->
	<script src="{{asset('assets/admin/libs/pace-js/pace.min.js')}}"></script>
	<!-- password addon init -->
	<script src="{{asset('assets/admin/js/pages/pass-addon.init.js')}}"></script>

	<script src="{{asset('assets/admin/js/jquery.blockUI.js')}}"></script>
	<script src="{{asset('assets/admin/js/custom.js')}}"></script>

</html>