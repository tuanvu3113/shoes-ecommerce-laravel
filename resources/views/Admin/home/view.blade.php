@extends('Admin.templates.tpl_default')

@section('content')
<div class="row">
    <div class="col-xl-4 col-md-6">
        <!-- card -->
        <div class="card card-h-100">
            <!-- card body -->
            <div class="card-body">
                <div class="row align-items-center">
                    <div class="col-12">
                        <span class="text-muted mb-3 lh-1 d-block text-truncate"><h5>Số lượng sản phẩm</h5></span>
                        <h4 class="mb-3">
                            <div style="display: flex; justify-items: center; align-items: center;">
                                <i class='bx bx-cart' style="font-size: 24px; margin-right: 5px;"></i>
                                <span class="counter-value" data-target="<?=$infoChart['total_products']?>">0</span>
                            </div>
                        </h4>
                    </div>
                </div>
                <div class="text-nowrap">
                    <span class="badge bg-soft-success text-success">+<?=$infoChart['total_products']?></span>
                    <span class="ms-1 text-muted font-size-13">Trong tuần qua</span>
                    <span class="ms-1 text-muted font-size-13" style="float: right;">
                        <a href="/admin/products">Xem chi tiết <i class='bx bxs-chevron-right-circle'></i></i></a>
                    </span>
                </div>
            </div><!-- end card body -->
        </div><!-- end card -->
    </div><!-- end col -->

    <div class="col-xl-4 col-md-6">
        <!-- card -->
        <div class="card card-h-100">
            <!-- card body -->
            <div class="card-body">
                <div class="row align-items-center">
                    <div class="col-12">
                        <span class="text-muted mb-3 lh-1 d-block text-truncate"><h5>Số lượng tin tức</h5></span>
                        <h4 class="mb-3">
                            <div style="display: flex; justify-items: center; align-items: center;">
                                <i class='mdi mdi-newspaper-variant-multiple' style="font-size: 24px; margin-right: 5px;"></i>
                                <span class="counter-value" data-target="<?=$infoChart['total_news']?>">0</span>
                            </div>
                        </h4>
                    </div>
                </div>
                <div class="text-nowrap">
                    <span class="badge bg-soft-success text-success">+<?=$infoChart['total_news']?></span>
                    <span class="ms-1 text-muted font-size-13">Trong tuần qua</span>
                    <span class="ms-1 text-muted font-size-13" style="float: right;">
                        <a href="/admin/news">Xem chi tiết <i class='bx bxs-chevron-right-circle'></i></i></a>
                    </span>
                </div>
            </div><!-- end card body -->
        </div><!-- end card -->
    </div><!-- end col -->

    <div class="col-xl-4 col-md-6">
        <!-- card -->
        <div class="card card-h-100">
            <!-- card body -->
            <div class="card-body">
                <div class="row align-items-center">
                    <div class="col-12">
                        <span class="text-muted mb-3 lh-1 d-block text-truncate"><h5>Số lượng khách hàng liên hệ</h5></span>
                        <h4 class="mb-3">
                            <div style="display: flex; justify-items: center; align-items: center;">
                                <i class='bx bx-user-pin' style="font-size: 24px; margin-right: 5px;"></i>
                                <span class="counter-value" data-target="<?=$infoChart['total_contact']?>">0</span>
                            </div>
                        </h4>
                    </div>
                </div>
                <div class="text-nowrap">
                    <span class="badge bg-soft-success text-success">+<?=$infoChart['total_contact']?></span>
                    <span class="ms-1 text-muted font-size-13">Trong tuần qua</span>
                    <span class="ms-1 text-muted font-size-13" style="float: right;">
                        <a href="/admin/contact">Xem chi tiết <i class='bx bxs-chevron-right-circle'></i></i></a>
                    </span>
                </div>
            </div><!-- end card body -->
        </div><!-- end card -->
    </div><!-- end col -->
</div><!-- end row-->
@endsection