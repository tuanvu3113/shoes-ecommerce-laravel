@extends('Admin.templates.tpl_login')

@section('content')
<div class="container-fluid p-0">
    <div class="row g-0">
        <div class="col-xxl-3 col-lg-4 col-md-5">
            <div class="auth-full-page-content d-flex p-sm-5 p-4">
                <div class="w-100">
                    <div class="d-flex flex-column h-100">
                        <div class="mb-4 mb-md-5 text-center">
                            <a href="/">
                                <img src="{{asset('assets/admin/images/favicon.ico')}}" alt="" height="60">
                            </a>
                        </div>
                        <div class="mb-4 mb-md-5 text-center">
                            <a href="/" class="d-block auth-logo">
                                <h5 class="mb-0">Cơ khí Khai Tâm Phát</h5>
                                <p class="text-muted mt-2">“UY TÍN - TẬN TÂM - TRUNG THỰC”</p>
                            </a>
                        </div>
                        <div class="auth-content my-auto">
                            <div class="text-center">
                                <h5 class="mb-0">Đăng nhập</h5>
                            </div>
                            <form class="custom-form mt-4 pt-2" action="index.html">
                                <div class="mb-3">
                                    <label class="form-label">Tài khoản</label>
                                    <input type="text" class="form-control" id="username" placeholder="Nhập tài khoản">
                                </div>
                                <div class="mb-3">
                                    <div class="d-flex align-items-start">
                                        <div class="flex-grow-1">
                                            <label class="form-label">Mật khẩu</label>
                                        </div>
                                        <div class="flex-shrink-0" style="display: none;">
                                            <div class="">
                                                <a href="recover-password.html" class="text-muted">Forgot password?</a>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="input-group auth-pass-inputgroup">
                                        <input type="password" id="password" class="form-control" placeholder="Nhập mật khẩu" aria-label="Password" aria-describedby="password-addon">
                                        <button class="btn btn-light ms-0" type="button" id="password-addon"><i class="mdi mdi-eye-outline"></i></button>
                                    </div>
                                </div>
                                <div style="margin-top: 20px; display: flex; width: 100%">
                                    <div style="width: 45%">
                                        <div class="input-group" style="margin-left: 10px;">
                                            <input class="form-control" id="verification" type="text" autocomplete="off" placeholder="Mã xác thực" onkeypress="keypressed(event);" style="margin-left: -11px;">
                                        </div>
                                    </div>
                                    <div style="width: 45%; margin-left: 10%;">
                                        <div class="input-group">
                                            <!-- <img title="Làm mới" src="/admin/login/captcha/543534.html" id="icaptcha" style="width: 125px; height: 37px;"> -->
                                        </div>
                                    </div>
                                    <div style="display: flex;align-items: center; width: 10%; margin-left: 5%;">
                                        <div class="input-group">
                                            <i id="reload" title="Tạo mã xác thực" style="cursor:pointer; font-size: 28px;" align="absmiddle" class="bx bx-revision"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-4" style="margin-top: 20px;">
                                    <div class="col">
                                        <input class="form-check-input" type="checkbox" id="remember">
                                        <label class="form-check-label" for="remember">
                                            Ghi nhớ tôi
                                        </label>
                                    </div>

                                </div>
                                <div class="mb-3">
                                    <a href="javascript:;" class="btn btn-primary w-100 waves-effect waves-light" id="login">Đăng nhập</a>
                                </div>
                            </form>

                            <div class="mt-4 pt-2 text-center" style="display: none;">
                                <div class="signin-other-title">
                                    <h5 class="font-size-14 mb-3 text-muted fw-medium">- Sign in with -</h5>
                                </div>

                                <ul class="list-inline mb-0">
                                    <li class="list-inline-item">
                                        <a href="javascript:void()" class="social-list-item bg-primary text-white border-primary">
                                            <i class="mdi mdi-facebook"></i>
                                        </a>
                                    </li>
                                    <li class="list-inline-item">
                                        <a href="javascript:void()" class="social-list-item bg-info text-white border-info">
                                            <i class="mdi mdi-twitter"></i>
                                        </a>
                                    </li>
                                    <li class="list-inline-item">
                                        <a href="javascript:void()" class="social-list-item bg-danger text-white border-danger">
                                            <i class="mdi mdi-google"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>

                            <div class="mt-5 text-center" style="display: none;">
                                <p class="text-muted mb-0">Don't have an account ? <a href="register.html" class="text-primary fw-semibold"> Signup now </a> </p>
                            </div>
                        </div>
                        <div class="mt-4 mt-md-5 text-center">
                            <p class="mb-0">© <script>
                                    document.write(new Date().getFullYear())
                                </script> Cơ khí Khai Tâm Phát. </p>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end auth full page content -->
        </div>
        <!-- end col -->
        <div class="col-xxl-9 col-lg-8 col-md-7">
            <div class="auth-bg pt-md-5 p-4 d-flex">
                <div class="bg-overlay bg-primary"></div>
                <ul class="bg-bubbles">

                </ul>
                <!-- end bubble effect -->
                <div class="row justify-content-center align-items-center">
                    <div class="col-xl-7">
                        <div class="p-0 p-sm-4 px-xl-0">
                            <div id="reviewcarouselIndicators" class="carousel slide" data-bs-ride="carousel">
                                <div class="carousel-indicators carousel-indicators-rounded justify-content-start ms-0 mb-0">
                                    <button type="button" data-bs-target="#reviewcarouselIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                                    <button type="button" data-bs-target="#reviewcarouselIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                                    <button type="button" data-bs-target="#reviewcarouselIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                                </div>
                                <!-- end carouselIndicators -->
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <div class="testi-contain text-white">
                                            <i class="bx bxs-quote-alt-left text-success display-6"></i>
                                            <h4 class="mt-4 fw-medium lh-base text-white">“Chúng tôi luôn đặt “UY TÍN - TẬN TÂM - TRUNG THỰC” lên hàng đầu lấy tín nhiệm của khách hàng làm mục đích kinh doanh”
                                            </h4>
                                            <div class="mt-4 pt-3 pb-5">
                                                <div class="d-flex align-items-start">
                                                    <div class="flex-shrink-0">
                                                        <img src="{{asset('assets/admin/images/users/avatar-1.jpg')}}" class="avatar-md img-fluid rounded-circle" alt="...">
                                                    </div>
                                                    <div class="flex-grow-1 ms-3 mb-4">
                                                        <h5 class="font-size-18 text-white">Mr. Binh
                                                        </h5>
                                                        <p class="mb-0 text-white-50">Giám đốc</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="carousel-item">
                                        <div class="testi-contain text-white">
                                            <i class="bx bxs-quote-alt-left text-success display-6"></i>
                                            <h4 class="mt-4 fw-medium lh-base text-white">“Công ty TNHH Thương Mại Dịch Vụ Cơ Khí Khai Tâm Phát là nhà cung cấp các dòng sản phẩm Cắt CNC lasze chi tiết máy, Cắt CNC hoa văn - cửa cổng, Cắt CNC vách ngăn - lan can, Cắt CNC lasze bãn mã - kèo cột, Gia công cơ khí theo yêu cầu.... Chúng tôi tự tin đảm nhận các đơn hàng từ nhỏ lẻ (số lượng ít) đến gia công số lượng lớn.”</h4>
                                            <div class="mt-4 pt-3 pb-5">
                                                <div class="d-flex align-items-start">
                                                    <div class="flex-shrink-0">
                                                        <img src="{{asset('assets/admin/images/users/avatar-2.jpg')}}" class="avatar-md img-fluid rounded-circle" alt="...">
                                                    </div>
                                                    <div class="flex-grow-1 ms-3 mb-4">
                                                        <h5 class="font-size-18 text-white">Mrs. Ha
                                                        </h5>
                                                        <p class="mb-0 text-white-50">Chăm sóc khách hàng</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="carousel-item">
                                        <div class="testi-contain text-white">
                                            <i class="bx bxs-quote-alt-left text-success display-6"></i>
                                            <h4 class="mt-4 fw-medium lh-base text-white">“Với nhiều năm hoạt động hoạt động trong lĩnh vực cơ khí và luôn lấy khách hàng làm trọng tâm. Công ty TNHH Thương Mại Dịch Vụ Cơ Khí Khai Tâm Phát cam kết và luôn phấn đấu nhằm mang lại cho khách hàng sự An Tâm và sản phẩm tốt nhất với giá cạnh tranh trên thị trường.”</h4>
                                            <div class="mt-4 pt-3 pb-5">
                                                <div class="d-flex align-items-start">
                                                    <img src="{{asset('assets/admin/images/users/avatar-3.jpg')}}" class="avatar-md img-fluid rounded-circle" alt="...">
                                                    <div class="flex-1 ms-3 mb-4">
                                                        <h5 class="font-size-18 text-white">Mrs. Nhung</h5>
                                                        <p class="mb-0 text-white-50">Chăm sóc khách hàng
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- end carousel-inner -->
                            </div>
                            <!-- end review carousel -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end col -->
    </div>
    <!-- end row -->
</div>
<style>
    #reload:hover {
        color: gray !important;
    }
</style>
<script>
    var formSearch = 'formSearch';
    var gridDatas = '';
    var controller = '/';
    $(document).ready(function() {
        $("#username").focus();
        var remember = localStorage.getItem('remember');
        if (remember) {
            var username = localStorage.getItem('username');
            var password = localStorage.getItem('password');
            $("#username").val(username);
            $("#password").val(password);
            $('#remember').prop('checked', true);
            $("#verification").focus();
        } else {
            $("#username").focus();
        }
        $("#reload").click(function() {
            var id = randomNumberFromRange(100, 1000);
            $("#icaptcha").attr("src", controller + "/captcha/" + id + ".html");
        });
        $("#login").click(function() {
            login();
        });

        $("#show_hide_password a").on('click', function(event) {
            event.preventDefault();
            if ($('#show_hide_password input').attr("type") == "text") {
                $('#show_hide_password input').attr('type', 'password');
                $('#show_hide_password i').addClass("bx-hide");
                $('#show_hide_password i').removeClass("bx-show");
            } else if ($('#show_hide_password input').attr("type") == "password") {
                $('#show_hide_password input').attr('type', 'text');
                $('#show_hide_password i').removeClass("bx-hide");
                $('#show_hide_password i').addClass("bx-show");
            }
        });
    });

    $(document).on('keydown', '#username', function(e) {
        // console.log(e)
        if (e.which == 9) {
            $("#password").focus();
            e.preventDefault();
        }
    });
    $(document).on('keydown', '#password', function(e) {
        // console.log(e)
        if (e.which == 9) {
            $("#verification").focus();
            e.preventDefault();
        }
    });

    function randomNumberFromRange(min, max) {
        return Math.floor(Math.random() * (max - min + 1) + min);
    }

    function keypressed(event) {
        if (event.keyCode == '13') {
            login();
        }
    }

    function login() {
        var password = $("#password").val();
        var username = $("#username").val();
        var verification = $("#verification").val();
        var remember = $('#remember').is(':checked');
        if (remember) {
            remember = 1;
        } else {
            remember = 0;
        }
        if (username == '') {
            showMessage('Warning', "Tài khoản không được để trống.", 'warning');
            return false;
        }
        if (password == '') {
            showMessage('Warning', "Mật khẩu không được để trống.", 'warning');
            return false;
        }
        if (verification == '') {
            showMessage('Warning', "Mã xác thực không được để trống.", 'warning');
            return false;
        }
        var token = $("#token").val();
        loadingForm(true);
        $.ajax({
            url: "{{ route('admin.login') }}",
            type: 'POST',
            async: false,
            data: {
                _token: "{{ csrf_token() }}",
                password: password,
                username: username,
                remember: remember,
                captcha: verification
            },
            success: function(obj) {
                loadingForm(false);
                $("#token").val(obj.token);
                if (obj.status == 1) {
                    window.location = "admin/home";
                    if (remember) {
                        localStorage.setItem('username', username);
                        localStorage.setItem('password', password);
                        localStorage.setItem('remember', remember);
                    } else {
                        localStorage.setItem('username', '');
                        localStorage.setItem('password', '');
                        localStorage.setItem('remember', '');
                    }
                } else {
                    var id = randomNumberFromRange(100, 1000);
                    // $("#icaptcha").attr("src", "/admin/login/captcha/" + id + ".html");
                    showMessage('Warning', "Tài khoản hoặc Mật khẩu không đúng.", 'warning');
                }
            },
            error: function() {
                loadingForm(false);
                var id = randomNumberFromRange(100, 1000);
                $("#icaptcha").attr("src", "/admin/login/captcha/" + id + ".html");
            }
        });
    }

    function showMessage(title, mess, type) {
        swal(title, mess, type);
    }
</script>
@endsection