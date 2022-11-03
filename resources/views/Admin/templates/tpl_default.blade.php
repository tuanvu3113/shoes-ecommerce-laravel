<!doctype html>
<html class="no-js " lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}" />
    <title>:: eCommerce :: <?php echo isset($_SESSION["title"]) ? $_SESSION["title"] : 'Home'; ?></title>
    <!--favicon-->
    <link rel="icon" href="{{asset('assets/admin/images/favicon-32x32.png')}}" type="image/png" />
    <!--plugins-->
    <!-- App favicon -->
    <link rel="shortcut icon" href="{{asset('assets/admin/images/favicon.ico')}}">
    <!-- preloader css -->
    <link rel="stylesheet" href="{{asset('assets/admin/css/preloader.min.css')}}" type="text/css" />
    <!-- Bootstrap Css -->
    <link href="{{asset('assets/admin/css/bootstrap.min.css')}}" id="bootstrap-style" rel="stylesheet" type="text/css" />
    <!-- Icons Css -->
    <link href="{{asset('assets/admin/css/icons.min.css')}}" rel="stylesheet" type="text/css" />
    <!-- App Css-->
    <link href="{{asset('assets/admin/css/app.min.css')}}" id=" app-style" rel="stylesheet" type="text/css" />
    <!-- Custom Css -->
    <link href="{{asset('assets/admin/css/custom.css')}}" rel="stylesheet" type="text/css" />
    <link href="{{asset('assets/admin/css/custom_admin_themes.css')}}" rel="stylesheet" type="text/css" />
    <link href="{{asset('assets/admin/css/main.css')}}" rel="stylesheet" type="text/css" />
    <script src="{{asset('assets/admin/libs/jquery/jquery.min.js')}}"></script>
    <script src="https://code.jquery.com/jquery-migrate-3.0.0.min.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <link rel="stylesheet" href="{{asset('assets/admin/plugins/sweetalert/sweetalert.css')}}" />
    <link rel="stylesheet" href="{{asset('assets/admin/plugins/multipleselect/multiple-select.css')}}" />
    <link href="{{asset('assets/admin/plugins/bootstrap-material-datetimepicker/css/bootstrap-material-datetimepicker.css')}}" rel="stylesheet" />
    <link rel="stylesheet" href="{{asset('assets/admin/plugins/jquery-datatable/dataTables.bootstrap4.min.css')}}">
    <link href="{{asset('assets/admin/plugins/jQuery.msgBox-master/styles/msgBoxLight.css')}}" rel="stylesheet">
    rel="stylesheet" type="text/css" />
    <style type="text/css">
        body {
            font-size: 15px !important;
        }
        .ms-parent .placeholder {
            cursor: pointer !important;
        }
    </style>
</head>

<body>
    <!--wrapper-->
    <div id="layout-wrapper">
        <header id="page-topbar">
            <div class="navbar-header">
                <div class="d-flex">
                    <!-- LOGO -->
                    <div class="navbar-brand-box">
                        <a href="/admin.php/home" class="logo logo-dark">
                            <span class="logo-sm">
                                <img src="{{asset('assets/admin/images/favicon.ico')}}" alt="" height="22">
                            </span>
                            <span class="logo-lg">
                                <img src="{{asset('assets/admin/images/favicon.ico')}}" alt="" height="24"> <span class="logo-txt">Khai Tâm Phát</span>
                            </span>
                        </a>

                        <a href="/admin.php/home" class="logo logo-light">
                            <span class="logo-sm">
                                <img src="{{asset('assets/admin/images/favicon.ico')}}" alt="" height="22">
                            </span>
                            <span class="logo-lg">
                                <img src="{{asset('assets/admin/images/favicon.ico')}}" alt="" height="24"> <span class="logo-txt">Khai Tâm Phát</span>
                            </span>
                        </a>
                    </div>

                    <button type="button" class="btn btn-sm px-3 font-size-16 header-item" id="vertical-menu-btn">
                        <i class="fa fa-fw fa-bars"></i>
                    </button>

                    <!-- App Search-->
                    <form class="app-search d-none d-lg-block">
                        <div class="position-relative">
                            <input type="text" class="form-control" placeholder="Search...">
                            <button class="btn btn-primary" type="button"><i class="bx bx-search-alt align-middle"></i></button>
                        </div>
                    </form>
                </div>

                <div class="d-flex">
                    <div class="dropdown d-inline-block d-lg-none ms-2">
                        <button type="button" class="btn header-item" id="page-header-search-dropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i data-feather="search" class="icon-lg"></i>
                        </button>
                        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end p-0" aria-labelledby="page-header-search-dropdown">
                            <form class="p-3">
                                <div class="form-group m-0">
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="Search ..." aria-label="Search Result">
                                        <button class="btn btn-primary" type="submit"><i class="mdi mdi-magnify"></i></button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                    <div class="dropdown d-none d-sm-inline-block">
                        <button type="button" class="btn header-item" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <?php if (Session::get('lang') == 'us') { ?>
                                <img src="{{asset('assets/admin/images/flags/us.jpg')}}" alt="Header Language" height="16">
                            <?php } else { ?>
                                <img src="{{asset('assets/admin/images/flags/vn.jpg')}}" alt="Header Language" height="16">
                            <?php } ?>
                        </button>
                        <div class="dropdown-menu dropdown-menu-end">
                            <!-- item-->
                            <a href="javascript:void(0);" class="dropdown-item notify-item language" data-lang="vn" onclick="changeLangAdmin('vn')">
                                <img src="{{asset('assets/admin/images/flags/vn.jpg')}}" alt="user-image" class="me-1" height="12"> <span class="align-middle">Vietnamese</span>
                            </a>
                            <a href="javascript:void(0);" class="dropdown-item notify-item language" data-lang="en" onclick="changeLangAdmin('us')">
                                <img src="{{asset('assets/admin/images/flags/us.jpg')}}" alt="user-image" class="me-1" height="12"> <span class="align-middle">English</span>
                            </a>
                        </div>
                    </div>

                    <div class="dropdown d-none d-sm-inline-block">
                        <button type="button" class="btn header-item" id="mode-setting-btn">
                            <i data-feather="moon" class="icon-lg layout-mode-dark"></i>
                            <i data-feather="sun" class="icon-lg layout-mode-light"></i>
                        </button>
                    </div>

                    <div class="dropdown d-none d-lg-inline-block ms-1">
                        <button type="button" class="btn header-item" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i data-feather="grid" class="icon-lg"></i>
                        </button>
                        <div class="dropdown-menu dropdown-menu-lg
                                dropdown-menu-end">
                            <div class="p-2">
                                <div class="row g-0 icon-demo-content">
                                    <div class="col">
                                        <a class="dropdown-icon-item" href="/admin.php/news/edit/0">
                                            <i class="mdi mdi-newspaper-plus" style="font-size: 18px;"></i>
                                            <span><b>Thêm mới tin tức</b></span>
                                        </a>
                                    </div>
                                    <div class="col">
                                        <a class="dropdown-icon-item" href="/admin.php/products/edit/0">
                                            <i class="mdi mdi-sticker-plus-outline" style="font-size: 18px;"></i>
                                            <span><b>Thêm mới sản phẩm</b></span>
                                        </a>
                                    </div>
                                    <div class="col">
                                        <a class="dropdown-icon-item" href="/admin.php/contact">
                                            <i class="mdi mdi-message-reply-text-outline" style="font-size: 18px;"></i>
                                            <span><b>Danh sách liên hệ</b></span>
                                        </a>
                                    </div>
                                    <?php
                                        $login = Session::get('login');
                                        $username = isset($login->username) ? $login->username : '';
                                        if ($username == 'root') { ?>
                                            <div class="col">
                                                <a class="dropdown-icon-item" href="/admin.php/filemanager">
                                                    <i class="mdi mdi-folder-open-outline" style="font-size: 18px;"></i>
                                                    <span><b>Quản lý file</b></span>
                                                </a>
                                            </div>
                                        <?php }
                                    ?>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="dropdown d-inline-block">
                        <button type="button" class="btn header-item
                                noti-icon position-relative" id="page-header-notifications-dropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i data-feather="bell" class="icon-lg"></i>
                            <span id="show_notify" class="badge">
                                <span id="total_notify"></span>
                            </span>
                        </button>
                        <div class="dropdown-menu dropdown-menu-lg
                                dropdown-menu-end p-0" aria-labelledby="page-header-notifications-dropdown">
                            <div class="p-3">
                                <div class="row align-items-center">
                                    <div class="col">
                                        <h6 class="m-0"> Notifications </h6>
                                    </div>
                                    <div class="col-auto">
                                        <a href="#!" class="small text-reset text-decoration-underline"> Unread (<span id="total_unread"></span>)</a>
                                    </div>
                                </div>
                            </div>
                            <div data-simplebar style="max-height: 230px;">
                                <div id="list_notify">

                                </div>
                            </div>
                            <div class="p-2 border-top d-grid">
                                <a class="btn btn-sm btn-link font-size-14 text-center" href="javascript:void(0)">
                                    <i class="mdi mdi-arrow-right-circle me-1"></i> <span>View More..</span>
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="dropdown d-inline-block">
                        <button type="button" class="btn header-item
                                right-bar-toggle me-2">
                            <i data-feather="settings" class="icon-lg"></i>
                        </button>
                    </div>

                    <div class="dropdown d-inline-block">
                        @include('Admin.includes.profile')
                    </div>

                </div>
            </div>
        </header>
        <!-- ========== Left Sidebar Start ========== -->
        @include('Admin.includes.menu')
        <!-- Left Sidebar End -->

        <!-- ============================================================== -->
        <!-- Start right Content here -->
        <!-- ============================================================== -->
        <div class="main-content" id="miniaresult">
            <div class="page-content">
                <div class="container-fluid">
                    <!-- start page title -->
                    @include('Admin.includes.breadcrumb')
                    <!-- end page title -->
                    @yield('content')
                </div>
            </div>
            <footer class="footer">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-6">
                            <script>
                                document.write(new Date().getFullYear())
                            </script>
                            ©
                            VAT.
                        </div>
                        <div class="col-sm-6">
                            <div class="text-sm-end d-none d-sm-block">
                                Design & Develop by <a href="#!" class="text-decoration-underline">VAT</a>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
        </div>

        <!-- Right Sidebar -->
        <div class="right-bar">
            <div data-simplebar class="h-100">
                <div class="rightbar-title d-flex align-items-center bg-dark p-3">
                    <h5 class="m-0 me-2 text-white">Theme Customizer</h5>
                    <a href="javascript:void(0);" class="right-bar-toggle
                        ms-auto">
                        <i class="mdi mdi-close noti-icon"></i>
                    </a>
                </div>
                <!-- Settings -->
                <hr class="m-0" />
                <div class="p-4" style="margin-top: -30px;">
                    <h6 class="mt-4 mb-3 pt-2">Layout Mode</h6>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="layout-mode" id="layout-mode-light" value="light">
                        <label class="form-check-label" for="layout-mode-light">Light</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="layout-mode" id="layout-mode-dark" value="dark">
                        <label class="form-check-label" for="layout-mode-dark">Dark</label>
                    </div>

                    <h6 class="mt-4 mb-3 pt-2">Layout Width</h6>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="layout-width" id="layout-width-fuild" value="fuild" onchange="document.body.setAttribute('data-layout-size',
                            'fluid')">
                        <label class="form-check-label" for="layout-width-fuild">Fluid</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="layout-width" id="layout-width-boxed" value="boxed" onchange="document.body.setAttribute('data-layout-size',
                            'boxed')">
                        <label class="form-check-label" for="layout-width-boxed">Boxed</label>
                    </div>

                    <h6 class="mt-4 mb-3 pt-2">Layout Position</h6>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="layout-position" id="layout-position-fixed" value="fixed" onchange="document.body.setAttribute('data-layout-scrollable',
                            'false')">
                        <label class="form-check-label" for="layout-position-fixed">Fixed</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="layout-position" id="layout-position-scrollable" value="scrollable" onchange="document.body.setAttribute('data-layout-scrollable',
                            'true')">
                        <label class="form-check-label" for="layout-position-scrollable">Scrollable</label>
                    </div>

                    <h6 class="mt-4 mb-3 pt-2">Topbar Color</h6>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="topbar-color" id="topbar-color-light" value="light" onchange="document.body.setAttribute('data-topbar',
                            'light')">
                        <label class="form-check-label" for="topbar-color-light">Light</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="topbar-color" id="topbar-color-dark" value="dark" onchange="document.body.setAttribute('data-topbar',
                            'dark')">
                        <label class="form-check-label" for="topbar-color-dark">Dark</label>
                    </div>

                    <h6 class="mt-4 mb-3 pt-2 sidebar-setting">Sidebar Size</h6>
                    <div class="form-check sidebar-setting">
                        <input class="form-check-input" type="radio" name="sidebar-size" id="sidebar-size-default" value="default" onchange="document.body.setAttribute('data-sidebar-size',
                            'lg')">
                        <label class="form-check-label" for="sidebar-size-default">Default</label>
                    </div>
                    <div class="form-check sidebar-setting">
                        <input class="form-check-input" type="radio" name="sidebar-size" id="sidebar-size-compact" value="compact" onchange="document.body.setAttribute('data-sidebar-size',
                            'md')">
                        <label class="form-check-label" for="sidebar-size-compact">Compact</label>
                    </div>
                    <div class="form-check sidebar-setting">
                        <input class="form-check-input" type="radio" name="sidebar-size" id="sidebar-size-small" value="small" onchange="document.body.setAttribute('data-sidebar-size',
                            'sm')">
                        <label class="form-check-label" for="sidebar-size-small">Small (Icon View)</label>
                    </div>

                    <h6 class="mt-4 mb-3 pt-2 sidebar-setting">Sidebar Color</h6>
                    <div class="form-check sidebar-setting">
                        <input class="form-check-input" type="radio" name="sidebar-color" id="sidebar-color-light" value="light" onchange="document.body.setAttribute('data-sidebar',
                            'light')">
                        <label class="form-check-label" for="sidebar-color-light">Light</label>
                    </div>
                    <div class="form-check sidebar-setting">
                        <input class="form-check-input" type="radio" name="sidebar-color" id="sidebar-color-dark" value="dark" onchange="document.body.setAttribute('data-sidebar',
                            'dark')">
                        <label class="form-check-label" for="sidebar-color-dark">Dark</label>
                    </div>
                    <div class="form-check sidebar-setting">
                        <input class="form-check-input" type="radio" name="sidebar-color" id="sidebar-color-brand" value="brand" onchange="document.body.setAttribute('data-sidebar',
                            'brand')">
                        <label class="form-check-label" for="sidebar-color-brand">Brand</label>
                    </div>
                </div>
            </div> <!-- end slimscroll-menu-->
        </div>
        <!-- /Right-bar -->

        <!-- Right bar overlay-->
        <div class="rightbar-overlay"></div>
        <!--end switcher-->
        <script type="text/javascript">
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
        </script>
        <script src="{{asset('assets/admin/libs/bootstrap/js/bootstrap.bundle.min.js')}}"></script>
        <script src="{{asset('assets/admin/libs/metismenu/metisMenu.min.js')}}"></script>
        <script src="{{asset('assets/admin/libs/simplebar/simplebar.min.js')}}"></script>
        <script src="{{asset('assets/admin/libs/node-waves/waves.min.js')}}"></script>
        <script src="{{asset('assets/admin/libs/feather-icons/feather.min.js')}}"></script>
        <!-- pace js -->
        <script src="{{asset('assets/admin/libs/pace-js/pace.min.js')}}"></script>
        <script src="https://maps.google.com/maps/api/js?key=AIzaSyCtSAR45TFgZjOs4nBFFZnII-6mMHLfSYI"></script>
        <script src="{{asset('assets/admin/js/app.js')}}"></script>
        <script src="{{asset('assets/admin/plugins/multipleselect/optimize.select.js')}}"></script>
        <script src="{{asset('assets/admin/plugins/sweetalert/sweetalert.min.js')}}"></script> <!-- SweetAlert Plugin Js -->
        <script src="{{asset('assets/admin/plugins/momentjs/moment.js')}}"></script> <!-- Moment Plugin Js -->
        <script src="{{asset('assets/admin/plugins/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js')}}"></script>
        <script src="{{asset('assets/admin/js/jquery.blockUI.js')}}"></script>
        <script src="{{asset('assets/admin/plugins/jquery-datatable/jquery.dataTables.min.js')}}"></script>
        <script src="{{asset('assets/admin/plugins/jQuery.msgBox-master/scripts/jquery.msgBox.js')}}"></script>
        <script src="{{asset('assets/admin/js/custom.js')}}"></script>
</body>

</html>