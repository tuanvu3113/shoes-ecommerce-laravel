@extends('Admin.templates.tpl_default')

@section('content')
<div class="row clearfix">
    <div class="col-lg-12">
        <div class="card" id="formSearch">
            <div class="card-header">
                <h6><strong><i class='bx bx-menu'></i></i>&nbsp;&nbsp;<?= getLanguage('all', 'search') ?></strong></h6>
            </div>
            <div class="card-body">
                <div class="form-group">
                    <div class="row clearfix">
                        <div class="col-md-12">
                            <b><?= getLanguage('all', 'title') ?></b>
                            <input onkeypress="keypressed(event);" type="text" id="title" class="form-control searchs" placeholder="-- <?= getLanguage('public', 'input') ?> <?= getLanguage('all', 'title') ?> --">
                        </div>
                        <div class="col-md-12" style="margin-top: 15px;">
                            <b><?= getLanguage('public', 'categories') ?></b>
                            <select optsl="multiple" id="categories" name="categories" class="search">
                                <?php
                                foreach ($getCategories as $key => $value) { ?>
                                    <option value='<?= $key ?>'><?= $value; ?></option>
                                <?php }
                                ?>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="col-md-12" style="margin-top: 15px; display: flex; justify-content: right;">
                    <a id="search" href="javascript:;" class="btn btn-primary btn-round" style="margin-left: 5px;">
                        <i class='bx bx-search'></i> <?= getLanguage('all', 'search') ?>
                    </a>
                    <a id="refresh" href="javascript:;" class="btn btn-primary btn-round" style="margin-left: 5px;">
                        <i class='bx bx-refresh'></i> <?= getLanguage('all', 'refresh') ?>
                    </a>
                    <?php if (isset($permission['add'])) { ?>
                        <a id="save" href="javascript:;" class="btn btn-primary btn-round" style="margin-left: 5px;">
                            <i class='bx bx-plus'></i> <?= getLanguage('all', 'add_new') ?>
                        </a>
                    <?php }
                    if (isset($permission['edit'])) { ?>
                        <a id="edit" href="javascript:;" class="btn btn-primary btn-round" style="margin-left: 5px;">
                            <i class='bx bx-edit'></i> <?= getLanguage('all', 'edit') ?>
                        </a>
                    <?php }
                    if (isset($permission['delete'])) { ?>
                        <a id="delete" href="javascript:;" class="btn btn-primary btn-round" style="margin-left: 5px;">
                            <i class='bx bx-trash'></i> <?= getLanguage('all', 'delete') ?>
                        </a>
                    <?php } ?>
                    <a id="export" href="javascript:;" class="btn btn-primary btn-round" style="margin-left: 5px;">
                        <i class='bx bxs-file-export'></i> <span><?= getLanguage('public', 'export-excel') ?></span>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-12" id="formDatas" id="formDatas">
        <div class="card">
            <div class="page_content">

            </div>
        </div>
        <div class="row" id="paging" style="margin-top: 20px;"></div>
    </div>
</div>
<script>
    var controller = '<?= $controller; ?>/';
    var csrfHash = '<?= $csrfHash; ?>';
    var cpage = 1;
    var search;
    var formSearch = 'formSearch';
    var gridDatas = 'formDatas';
    $(document).ready(function() {
        initFirst();
        refresh();
        $("#refresh").click(function() {
            refresh();
        });
        $("#search").click(function() {
            getData();
        });
        $("#edit").click(function() {
            var list_id = '';
            $('input.chkrow[type=checkbox]').each(function() {
                if ($(this).prop("checked")) {
                    if (list_id === "")
                        list_id += $(this).attr("id");
                    else
                        list_id += "," + $(this).attr("id");
                }
            });
            if (list_id.indexOf(",") !== -1 || list_id.length === 0) {
                showMessage('Warning', "<?= getLanguage('all', 'error_select_empty') ?>", 'warning');
                return false;
            }
            window.location = "<?= $controller; ?>/edit/" + list_id;
        });
        $("#export").click(function() {
            var search = getSearch();
            window.location = '<?= $controller; ?>/exportexcel?search=' + search;
        });
        $("#save").click(function() {
            window.location = "<?= $controller; ?>/edit/0";
        });
        $("#delete").click(function() {
            var list_id = '';
            $('input.chkrow[type=checkbox]').each(function() {
                if ($(this).prop("checked")) {
                    if (list_id === "")
                        list_id += $(this).attr("id");
                    else
                        list_id += "," + $(this).attr("id");
                }
            });
            if (list_id !== "") {
                swal({
                    title: "<?= getLanguage('all', 'delete_confirm') ?>",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "OK",
                    closeOnConfirm: false
                }, function() {
                    var token = $('#token').val();
                    loadingForm(true);
                    $.ajax({
                        url: "{{ route('admin.delete') }}",
                        async: false,
                        type: 'POST',
                        data: {
                            list: list_id
                        },
                        success: function(datas) {
                            loadingForm(false);
                            var obj = JSON.parse(datas);
                            if (obj.status != 1) {
                                showMessage('Warning', "<?= getLanguage('all', 'error_unknow') ?>", 'warning');
                                return false;
                            } else {
                                getData();
                                showMessage('Success', "<?= getLanguage('all', 'luu-thanh-cong') ?>", 'success');
                                return false;
                            }
                        },
                        error: function() {
                            loadingForm(false);
                            showMessage('Warning', "<?= getLanguage('all', 'error_unknow') ?>", 'warning');
                            return false;
                        }
                    });
                });
            } else {
                showMessage('Warning', "<?= getLanguage('all', 'error_select_empty') ?>", 'warning');
                return false;
            }
        });
        $(document.body).on("click", ".isshow", function() {
            var id = $(this).attr("name");
            var status = $(this).prop("checked") ? 1 : 0;
            loadingForm(true);
            $.ajax({
                async: false,
                type: 'POST',
                url: "{{ route('admin.isshow') }}",
                data: {
                    id: id,
                    status: status
                }
            }).done(function(r) {
                loadingForm(false);
                if (r === "endsession") {
                    window.location = "<?php echo admin_url(); ?>" + "authorize.html";
                }
                var obj = JSON.parse(r);
                if (obj.status === "success") {
                    showMessage('Success', "<?= getLanguage('all', 'luu-thanh-cong') ?>", 'success');
                    return false;
                } else if (obj.status === "deny") {
                    showMessage('Warning', "<?= getLanguage('all', 'permision_denied') ?>", 'warning');
                    return false;
                } else if (obj.status === "fail") {
                    showMessage('Error', "<?= getLanguage('all', 'save_error') ?>", 'error');
                    return false;
                }
            }).fail(function(x) {
                loadingForm(false);
                showMessage('Error', "<?= getLanguage('all', 'save_error') ?>", 'error');
                return false;
            });
        });
        $(document.body).on("click", ".ispopular", function() {
            var id = $(this).attr("name");
            var status = $(this).prop("checked") ? 1 : 0;
            loadingForm(true);
            $.ajax({
                async: false,
                type: 'POST',
                url: "{{ route('admin.ispopular') }}",
                data: {
                    id: id,
                    status: status
                }
            }).done(function(r) {
                loadingForm(false);
                if (r === "endsession") {
                    window.location = "<?php echo admin_url(); ?>" + "authorize.html";
                }
                var obj = JSON.parse(r);
                if (obj.status === "success") {
                    showMessage('Success', "<?= getLanguage('all', 'luu-thanh-cong') ?>", 'success');
                    return false;
                } else if (obj.status === "deny") {
                    showMessage('Warning', "<?= getLanguage('all', 'permision_denied') ?>", 'warning');
                    return false;
                } else if (obj.status === "fail") {
                    showMessage('Error', "<?= getLanguage('all', 'save_error') ?>", 'error');
                    return false;
                }
            }).fail(function(x) {
                loadingForm(false);
                showMessage('Error', "<?= getLanguage('all', 'save_error') ?>", 'error');
                return false;
            });
        });
        $(document.body).on("click", "#btnorder", function() {
            var arr = [];
            $(".order-record").each(function() {
                arr.push({
                    "id": $(this).attr("name"),
                    "position": $(this).val()
                });
            });
            loadingForm(true);
            $.ajax({
                async: false,
                type: 'POST',
                url: "{{ route('admin.setposition') }}",
                data: {
                    position: JSON.stringify(arr)
                }
            }).done(function(r) {
                loadingForm(false);
                showMessage('Success', "<?= getLanguage('all', 'luu-thanh-cong') ?>", 'success');
                return false;
            }).fail(function(x) {
                loadingForm(false);
                showMessage('Error', "<?= getLanguage('all', 'save_error') ?>", 'error');
                return false;
            });
        });
    });

    function refresh() {
        $('.searchs').val('');
        $('#show').html('');
        resetCombo('categories');
        cpage = 1;
        getData();
    }

    function keypressed(event) {
        if (event.keyCode == '13') {
            getData();
        }
    }

    function getSearch() {
        var obj = {};
        $('.searchs').each(function(i) {
            var id = $(this).attr('id');
            var val = $(this).val();
            obj[id] = val;
        });
        var categories = getCombo('categories');
        obj['categories'] = categories;
        var searchs = JSON.stringify(obj);
        return searchs;
    }

    function getData() {
        search = getSearch();
        loadingForm(true);
        $.ajax({
            url: "{{ route('admin.getList') }}",
            async: false,
            type: 'POST',
            data: {
                page: cpage,
                search: search
            },
            success: function(datas) {
                loadingForm(false);
                // $('#listData').DataTable().clear().destroy();
                var obj = JSON.parse(datas);
                cpage = obj.cPage;
                $('.page_content').html(obj.content);
                $("#paging").html(obj.paging);
                $(".viewtotal").text(obj.viewtotal);
                // $('#listData').DataTable({
                //     "paging": false,
                //     "info": false,
                //     "fixedColumns": true,
                //     "columnDefs": [{
                //         "targets": [0, 1, 7, 8, 9, 10],
                //         "orderable": false
                //     }]
                // });
                // $('.sorting_asc').removeClass('sorting_asc');
            },
            error: function() {
                loadingForm(false);
                showMessage('Error', "<?= getLanguage('all', 'error_unknow') ?>", 'error');
                return false;
            }
        });
    }
</script>
@endsection