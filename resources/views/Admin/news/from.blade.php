@extends('Admin.templates.tpl_default')

@section('content')
<link href="{{asset('assets/admin/plugins/fancybox/source/jquery.fancybox.css')}}" rel="stylesheet" type="text/css" />
<script src="{{asset('assets/admin/plugins/tags/src/jquery.tagsinput-revisited.js')}}"></script>
<link href="{{asset('assets/admin/plugins/tags/src/jquery.tagsinput-revisited.css')}}" rel="stylesheet" type="text/css"/>
<div class="row">
    <div class="col-lg-12">
        <div class="card" id="formSearch">
            <div class="card-body">
                <div class="form-group">
                    <div class="col-md-12">
                        <b><?= getLanguage('all', 'title') ?> us</b>
                        <input type="text" id="news_title" class="form-control searchs" value="<?php echo $detail->news_title; ?>" placeholder="-- <?= getLanguage('public', 'input') ?> <?= getLanguage('all', 'title') ?> --">
                    </div>
                    <div class="col-md-12" style="margin-top: 15px;">
                        <b><?= getLanguage('all', 'title') ?> vn</b>
                        <input onkeyup="addLink('news_title_vn')" type="text" id="news_title_vn" class="form-control searchs" value="<?php echo $detail->news_title_vn; ?>" placeholder="-- <?= getLanguage('public', 'input') ?> <?= getLanguage('all', 'title') ?> --">
                    </div>
                    <div class="col-md-12" style="margin-top: 15px;">
                        <b>Link</b>
                        <input onkeyup="addLink('link')" type="text" id="link" class="form-control searchs" value="<?php echo $detail->link; ?>" placeholder="-- <?= getLanguage('public', 'input') ?> Link --">
                    </div>
                    <div class="col-md-12" style="margin-top: 15px;">
                        <b><?= getLanguage('all', 'author') ?></b>
                        <input type="text" id="author" class="form-control searchs" value="<?php echo $detail->author; ?>" placeholder="-- <?= getLanguage('public', 'input') ?> <?= getLanguage('all', 'author') ?> --">
                    </div>
                    <div class="col-md-12" style="margin-top: 15px;">
                        <b><?= getLanguage('all', 'summary') ?> us</b>
                        <textarea id="news_summary" class="form-control no-resize" placeholder="-- <?= getLanguage('public', 'input') ?> <?= getLanguage('all', 'summary') ?> --"><?php echo $detail->news_summary; ?></textarea>
                    </div>
                    <div class="col-md-12" style="margin-top: 15px;">
                        <b><?= getLanguage('all', 'summary') ?> vn</b>
                        <textarea id="news_summary_vn" class="form-control no-resize" placeholder="-- <?= getLanguage('public', 'input') ?> <?= getLanguage('all', 'summary') ?> --"><?php echo $detail->news_summary_vn; ?></textarea>
                    </div>
                    <div class="col-md-12" style="margin-top: 15px;">
                        <b>Tags</b>
                        <input type="text" id="tag" class="form-control searchs" value="<?php echo $detail->tag; ?>" placeholder="-- <?= getLanguage('public', 'input') ?> tag --">
                    </div>
                    <div class="col-md-12" style="margin-top: 15px;">
                        <b>Categories</b>
                        <select optsl="multiple" id="categories" name="categories" class="search">
                            <?php
                            foreach ($getNewsCategories as $key => $value) { ?>
                                <option value='<?= $key ?>'><?= $value ?></option>
                            <?php }
                            ?>
                        </select>
                    </div>
                    <div class="col-md-12" style="margin-top: 15px;">
                        <b><?= getLanguage('all', 'content') ?> us</b>
                        <textarea id="ckeditor"><?= $detail->news_content; ?></textarea>
                    </div>
                    <div class="col-md-12" style="margin-top: 15px;">
                        <b><?= getLanguage('all', 'content') ?> vn</b>
                        <textarea id="news_content_vn"><?= $detail->news_content_vn; ?></textarea>
                    </div>
                    <div class="col-md-12" style="margin-top: 15px;">
                        <b><?= getLanguage('all', 'view-number') ?></b>
                        <input type="text" id="views_number" class="form-control searchs" value="<?= (isset($detail->views_number) ? $detail->views_number : 0) ?>">
                    </div>
                    <div class="col-md-4" style="margin-top: 15px;">
                        <b><?= getLanguage('all', 'date') ?></b>
                        <div class="input-group">
                            <input type="date" id="date_created" value="<?= (isset($detail->date_created) ? date("Y-m-d", strtotime($detail->date_created)) : ''); ?>" class="searchs form-control" placeholder="Please choose date & time...">
                        </div>
                    </div>
                    <div class="col-md-12" style="margin-top: 15px;">
                        <b><?= getLanguage('all', 'show') ?></b>
                        <select id="isshow" name="isshow" class="search" optsl="single">
                            <option value='1'><?= getLanguage('all', 'enable') ?></option>
                            <option value='2'><?= getLanguage('all', 'disable') ?></option>
                        </select>
                    </div>
                    <div class="col-md-12" style="margin-top: 15px;">
                        <b><?= getLanguage('all', 'popular') ?></b>
                        <select id="popular" name="popular" class="search" optsl="single">
                            <option value='1'><?= getLanguage('all', 'enable') ?></option>
                            <option value='2'><?= getLanguage('all', 'disable') ?></option>
                        </select>
                    </div>
                </div>
                <div class="col-md-12" style="margin-top: 15px;">
                    <b><?= getLanguage('all', 'background-img') ?></b>
                    <input type="file" id="i-picture" style="width: 100%;" /><input type="hidden" id="news_image" value="<?php echo $detail->news_image; ?>" />
                    <div style="margin-top: 2px; height: 250px; border: 1px solid #e5e5e5">
                        <?php
                        $link_img_1 = "";
                        if (!empty($detail->news_image)) {
                            $link_img_1 = 'assets\images\blog'.$detail->news_image;
                        }
                        ?>
                        <a id="picture-preview" href="{{asset($link_img_1)}}" class="fancybox-button" data-rel="fancybox-button">

                            <img style="max-width: 100%; max-height: 100%;" class="img-responsive" src="{{asset($link_img_1)}}">
                        </a>
                    </div>
                </div>
                <div class="col-md-12" style="margin-top: 15px;">
                    <b><?= getLanguage('all', 'image-popular') ?></b>
                    <input type="file" id="i-picture-mobile" style="width: 100%;" /><input type="hidden" id="news_image_right" value="<?= (isset($detail->news_image_right) ? $detail->news_image_right : ''); ?>" />
                    <div style="margin-top: 2px; height: 250px; border: 1px solid #e5e5e5">
                        <?php
                        $link_img_2 = "";
                        if (!empty($detail->news_image_right)) {
                            $link_img_2 = 'assets\images\blog'.$detail->news_image_right;
                        }
                        ?>
                        <a id="picture-mobile-preview" href="{{asset($link_img_2)}}" class="fancybox-button" data-rel="fancybox-button">
                            <img style="max-width: 100%; max-height: 100%;" class="img-responsive" src="{{asset($link_img_2)}}" alt="<?= (isset($detail->news_image_right) ? $detail->news_image_right : ''); ?>">
                        </a>
                    </div>
                </div>
                <div class="col-md-12" style="margin-top: 15px; margin-bottom: 10px; display: flex; justify-content: right;">
                    <a onclick="window.location = '/admin/<?= $controller; ?>'" href="javascript:;" class="btn btn-primary btn-round" style="margin-left: 5px;">
                        <i class="bx bx-left-arrow-alt"></i> <?= getLanguage('all', 'back') ?>
                    </a>
                    <a href="javascript:;" id="save" class="btn btn-primary btn-round" style="margin-left: 5px;">
                        <i class="bx bxs-save"></i> <?= getLanguage('all', (empty($detail->id) ? 'add_new' : 'edit')) ?>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<input type="hidden" id="idr" value="<?php echo $detail->id; ?>">
<script type="text/javascript">
    var controller = '<?= $controller; ?>/';
    var url_theme = '<?php echo url_tmpl(); ?>';
    var path_image = '<?php echo base_url() . "Images/news/tmp/"; ?>';
    var formSearch = 'formSearch';
    var gridDatas = '';
    $(document).ready(function() {
        $('#tag').tagsInput();
        CKEDITOR.replace('news_content_vn');
        CKEDITOR.replace('ckeditor');
        CKEDITOR.config.height = 300;
        initFirst();
        setCombo('categories', '<?php echo !empty($detail->categories) ? $detail->categories : ''; ?>');
        setCombo('isshow', '<?php echo !empty($detail->isshow) ? $detail->isshow : ''; ?>');
        setCombo('popular', '<?php echo !empty($detail->popular) ? $detail->popular : ''; ?>');
        var uploader = new plupload.Uploader({
            runtimes: 'html5,flash,silverlight,html4',
            browse_button: document.getElementById('tab_images_uploader_pickfiles'), // you can pass in id...
            container: document.getElementById('tab_images_uploader_container'), // ... or DOM Element itself
            url: controller + "upload",
            filters: {
                max_file_size: '10mb',
                mime_types: [{
                        title: "Image files",
                        extensions: "jpg,gif,png"
                    },
                    {
                        title: "Zip files",
                        extensions: "zip"
                    }
                ]
            },
            // Flash settings
            flash_swf_url: url_theme + 'assets/plugins/plupload/js/Moxie.swf',
            // Silverlight settings
            silverlight_xap_url: url_theme + 'assets/plugins/plupload/js/Moxie.xap',
            init: {
                PostInit: function() {
                    $('#tab_images_uploader_filelist').html("");
                    $('#tab_images_uploader_uploadfiles').click(function() {
                        uploader.start();
                        return false;
                    });
                    $('#tab_images_uploader_filelist').on('click', '.added-files .remove', function() {
                        uploader.removeFile($(this).parent('.added-files').attr("id"));
                        $(this).parent('.added-files').remove();
                    });
                },
                FilesAdded: function(up, files) {
                    plupload.each(files, function(file) {
                        $('#tab_images_uploader_filelist').append('<div class="alert alert-warning added-files" id="uploaded_file_' + file.id + '">' + file.name + '(' + plupload.formatSize(file.size) + ') <span class="status badge badge-info"></span>&nbsp;<a href="javascript:;" class="remove"><i class="zmdi zmdi-close-circle-o"></i>remove</a></div>');
                    });
                },
                UploadProgress: function(up, file) {
                    $('#uploaded_file_' + file.id + ' > .status').html(file.percent + '%');
                },
                FileUploaded: function(up, file, response) {
                    var response = $.parseJSON(response.response);
                    if (response.hasOwnProperty('result')) {
                        var img = path_image + file.name;
                        var row = $("#tbl_img tbody tr").length;
                        $('#uploaded_file_' + file.id + ' > .status').removeClass("badge-info").addClass("badge-success").html('<i class="fa fa-check"></i> Done'); // set successfull upload
                        var html = '<tr><td><a href="' + img + '" class="fancybox-button" data-rel="fancybox-button"><img class="img-responsive" src="' + img + '" alt=""></a></td>';
                        html += '<td><textarea rows="4" class="form-control no-resize"></textarea><input type="hidden" class="img_name" value="' + file.name + '"></td>';
                        html += '<td class="text-center"><textarea rows="4" class="form-control no-resize ta-link"></textarea></td>';
                        html += '<td class="text-center"><input class="form-control ic-display" type="checkbox" checked /></td>';
                        html += '<td class="text-center"><a href="javascript:;" class="btn-img-remove"><i class="zmdi zmdi-close-circle-o"></i> Remove</a></td></tr> ';
                        $("#tbl_img tbody").append(html);
                        // $(".fancybox-button").fancybox();
                    } else {
                        $('#uploaded_file_' + file.id + ' > .status').removeClass("badge-info").addClass("badge-danger").html('<i class="zmdi zmdi-alert-circle-o"></i> Failed '); // set failed upload
                        showMessage('Warning', "Có một hình ảnh upload lỗi. Vui lòng thực hiện lại.", 'warning');
                        return false;
                    }
                },
                Error: function(up, err) {
                    showMessage('Warning', err.message, 'warning');
                    return false;
                }
            }
        });
        uploader.init();

        $("#i-picture").change(function() {
            $("#picture-preview").html("");
            var data = new FormData();
            var filesData = document.getElementById('i-picture').files;
            data.append('file', filesData[0]);
            loadingForm(true);
            $.ajax({
                url: "{{ route('admin.uploadFile') }}",
                type: 'POST',
                async: false,
                data: data,
                enctype: 'multipart/form-data',
                processData: false,
                contentType: false,
                success: function(datas) {
                    loadingForm(false);
                    var obj = JSON.parse(datas);
                    $("#picture-preview").html("<img src='/assets/images/blog/tmp/"+obj.filename+"' style='max-width: 100%; max-height: 100%;' />");
                    if (obj.status === "pass") {
                        $("#news_image").val(obj.filename);
                    } else if (obj.status === "size") {
                        $("#news_image").val("");
                    }
                },
                error: function() {
                    loadingForm(false);
                    showMessage('Error', "Uploaded fail.", 'error');
                    return false;
                }
            });
        });

        $("#i-picture-mobile").change(function() {
            $("#picture-mobile-preview").html("");
            var data = new FormData();
            var filesData = document.getElementById('i-picture-mobile').files;
            data.append('file', filesData[0]);
            loadingForm(true);
            $.ajax({
                url: "{{ route('admin.uploadFile') }}",
                type: 'POST',
                async: false,
                data: data,
                enctype: 'multipart/form-data',
                processData: false,
                contentType: false,
                success: function(datas) {
                    loadingForm(false);
                    var obj = JSON.parse(datas);
                    $("#picture-mobile-preview").html("<img src='/assets/images/blog/tmp/"+obj.filename+"' style='max-width: 100%; max-height: 100%;' />");
                    if (obj.status === "pass") {
                        $("#news_image_right").val(obj.filename);
                    } else if (obj.status === "size") {
                        $("#news_image_right").val("");
                    }
                },
                error: function() {
                    loadingForm(false);
                    showMessage('Error', "Uploaded fail.", 'error');
                    return false;
                }
            });
        });

        $('#tbl_img').on('click', ".btn-img-remove", function() {
            $(this).closest('tr').remove();
        });

        $("#save").click(function() {
            var valid = 0;
            var id = $("#idr").val();
            var title = $("#news_title").val();
            var link = $("#link").val();
            var news_title_vn = $("#news_title_vn").val();
            var views_number = $("#views_number").val();
            var date_created = $("#date_created").val();
            var author = $("#author").val();
            var news_summary = $("#news_summary").val();
            var news_summary_vn = $("#news_summary_vn").val();
            var picture = $("#news_image").val();
            var picture_right = $("#news_image_right").val();
            var tag = $("#tag").val();
            var content = CKEDITOR.instances['ckeditor'].getData().trim();
            var news_content_vn = CKEDITOR.instances['news_content_vn'].getData().trim();
            var publish = getCombo("isshow");
            var popular = getCombo("popular");
            var categories = getCombo('categories');
            var pictures = [];
            $(".img_name").each(function(i) {
                var obj_pic = {};
                obj_pic["name"] = $(this).val();
                obj_pic["link"] = $(".ta-link").eq(i).val();
                obj_pic["display"] = ($(".ic-display").eq(i).prop("checked") === true) ? 1 : 0;
                pictures.push(obj_pic);
            });
            var json_pic = JSON.stringify(pictures);
            if (title.length === 0) {
                showMessage('Warning', "<?= getLanguage('all', 'title-is-not-empty') ?>", 'warning');
                return false;
            } else if (link.length === 0) {
                showMessage('Warning', "Link không được bỏ trống.", 'warning');
                return false;
            } else if (news_title_vn.length === 0) {
                showMessage('Warning', "<?= getLanguage('all', 'title-is-not-empty') ?>", 'warning');
                return false;
            } else if (picture === "") {
                showMessage('Warning', "<?= getLanguage('all', 'picture-not-empty-or-size-not-incorrect') ?>", 'warning');
                return false;
            } else if (content === "") {
                showMessage('Warning', "<?= getLanguage('all', 'content-not-empty') ?>", 'warning');
                return false;
            } else if (news_content_vn === "") {
                showMessage('Warning', "<?= getLanguage('all', 'content-not-empty') ?>", 'warning');
                return false;
            } else if (news_summary === "") {
                showMessage('Warning', "<?= getLanguage('all', 'summary-not-empty') ?>", 'warning');
                return false;
            } else if (news_summary_vn === "") {
                showMessage('Warning', "<?= getLanguage('all', 'summary-not-empty') ?>", 'warning');
                return false;
            } else {
                valid = 1;
            }
            if (valid === 1) {
                var fdata = {};
                fdata['news_title'] = title;
                fdata['news_title_vn'] = news_title_vn;
                fdata['link'] = link;
                fdata['views_number'] = views_number;
                fdata['date_created'] = date_created;
                fdata['author'] = author;
                fdata['tag'] = tag;
                fdata['news_summary'] = news_summary;
                fdata['news_summary_vn'] = news_summary_vn;
                fdata['news_image'] = picture;
                fdata['news_image_right'] = picture_right;
                fdata['news_content'] = content;
                fdata['news_content_vn'] = news_content_vn;
                fdata['isshow'] = publish;
                fdata['popular'] = popular;
                fdata['categories'] = categories;
                loadingForm(true);
                $.ajax({
                    async: false,
                    type: 'POST',
                    url: "{{ route('admin.mysave') }}",
                    data: {
                        id: id,
                        fdata: fdata
                    }
                }).done(function(r) {
                    loadingForm(false);
                    if (r === "endsession") {
                        window.location = "<?php echo admin_url(); ?>" + "authorize.html";
                    }
                    var obj = JSON.parse(r);
                    if (obj.status === "deny") {
                        showMessage('Warning', "<?= getLanguage('all', 'permision_denied') ?>", 'warning');
                        return false;
                    } else if (obj.status === "exist") {
                        showMessage('Warning', "<?= getLanguage('all', 'item_exist') ?>", 'warning');
                        return false;
                    } else if (obj.status === "fail") {
                        showMessage('Error', "<?= getLanguage('all', 'save_error') ?>", 'error');
                        return false;
                    } else {
                        window.location = '/admin/<?= $controller; ?>';
                    }
                }).fail(function(x) {
                    loadingForm(false);
                    showMessage('Error', "<?= getLanguage('all', 'save_error') ?>", 'error');
                    return false;
                });
            }
        });
    });

    function addLink(id) {
        var str = $("#" + id).val();
        var link = locdau(str);
        $("#link").val(link);
    }

    function locdau(str) {
        str = str.toLowerCase();
        str = str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g, "a");
        str = str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g, "e");
        str = str.replace(/ì|í|ị|ỉ|ĩ/g, "i");
        str = str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g, "o");
        str = str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g, "u");
        str = str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g, "y");
        str = str.replace(/đ/g, "d");
        str = str.replace(/!|@|\$|%|\^|\*|\(|\)|\+|\=|\<|\>|\?|\/|,|\.|\:|\'| |\"|\&|\#|\[|\]|\;|\||\{|\}|~/g, "-");
        str = str.replace(/^\-+|\-+$/g, "-");
        str = str.replace(/\–/g, "-");
        str = str.replace(/\\/g, "-");
        str = str.replace(/-+-/g, "-");
        return str;
    }
</script>
<script src="{{asset('assets/admin/plugins/ckeditor/ckeditor.js')}}" type="text/javascript"></script>
<script src="{{asset('assets/admin/plugins/plupload/js/plupload.full.min.js')}}" type="text/javascript"></script>
<script src="{{asset('assets/admin/plugins/fancybox/source/jquery.fancybox.js')}}" type="text/javascript"></script>
@endsection