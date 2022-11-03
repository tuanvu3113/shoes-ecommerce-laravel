<button type="button" class="btn header-item bg-soft-light border-start border-end" id="page-header-user-dropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    <?php
        $login =Session::get('login');
        $img = !empty($login->image) ? $login->image : 'profile_av.jpg';
        $link_avata =  'assets/files/user/'.$img;
    ?>
    <img class="rounded-circle header-profile-user" src="{{asset($link_avata)}}" alt="Header Avatar">

    <?=$profile?>
</button>
<div class="dropdown-menu dropdown-menu-end">
    <!-- item-->
    <a class="dropdown-item" href="/admin/profile"><i class="mdi mdi-face-profile font-size-16 align-middle me-1"></i> Hồ sơ</a>
    <a class="dropdown-item" href="{{ route('admin.logout') }}">
        <i class="mdi mdi-logout font-size-16 align-middle me-1"></i> Đăng xuất
    </a>
</div>