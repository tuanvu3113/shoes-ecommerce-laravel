var formSearch = 'formSearch';
var gridDatas = '';
var limit = 10;
var start_folder = 0;
var start_file = 0;
var format = /[!@#$%^&*()_+\-=\[\]{};':"\\|<>\/]+/;
// ID khi click chuột phải
var id_from_action = '';
$(document).ready(function () {
    getData();
    // setInterval(function() {
    //     load_data_chart();
    // }, 240000);
    // load_data_chart();

    // Sự kiến click chuột phải
    window.addEventListener("mousedown", onMouseDown);
    document.addEventListener("contextmenu", function (e) {
        e.preventDefault();
    });

    // Sự kiện click ra ngoài thì hide menu action upload
    document.getElementById('content').onclick = function (e) {
        hide_menu("upload-action");
        hide_menu("folder-file-action");
    }

    // Add new folder
    $("#add-new-folder").click(function () {
        $('#smallModal').modal('show');
        $("#title_folder").val('Untitled folder');
        $("#title_folder").css("border-color", "");
        hide_menu("upload-action");
    });

    // Rename folder/ file
    $("#rename").click(function () {
        var arr_string_id = id_from_action.split("###");
        $('#smallModalRename').modal('show');
        $("#title_folder_rename").val(arr_string_id[1]);
        $("#title_folder_rename").css("border-color", "");
        hide_menu("upload-action");
    });

    // Get list folder/file
    $("#getlink").click(function () {
        var arr_string_id = id_from_action.split("###");
        /* Get the text field */
        var copyText = arr_string_id[1];
        /* Copy the text inside the text field */
        navigator.clipboard.writeText(url_upload + copyText);
    });

    // Add bookmark folder/file
    $("#addstarred").click(function () {
        $.ajax({
            url: controller + 'actionFolderFile',
            async: false,
            type: 'POST',
            data: {
                id: id_from_action,
                action: 'add_starred'
            },
            success: function (datas) {
                loadingForm(false);
                start_folder = 0;
                start_file = 0;
                getData();
            },
            error: function () {
                loadingForm(false);
                showMessage('Warning', "<?= getLanguage('all', 'error_unknow') ?>", 'warning');
                return false;
            }
        });
    });

    // Create new folder
    $("#add_folder").click(function () {
        var new_folder = $("#title_folder").val();
        if (format.test(new_folder)) {
            $("#title_folder").css("border-color", "red");
        }
        $.ajax({
            url: controller + 'actionFolderFile',
            async: false,
            type: 'POST',
            data: {
                id_folder: id_folder,
                name_folder: name_folder,
                id_parent_folder: id_parent_folder,
                new_folder: new_folder,
                action: 'create_new_folder'
            },
            success: function (datas) {
                loadingForm(false);
                $('#smallModal').modal('hide');
                var obj = JSON.parse(datas);
                if (obj.status == 1) {
                    start_folder = 0;
                    start_file = 0;
                    getData();
                    showMessage('Success', "Created successfuly.", 'success');
                    return false;
                } else {
                    showMessage('Warning', obj.msg, 'warning');
                    return false;
                }
            },
            error: function () {
                loadingForm(false);
                showMessage('Warning', "<?= getLanguage('all', 'error_unknow') ?>", 'warning');
                return false;
            }
        });
    });

    // Rename folder
    $("#rename_folder").click(function () {
        var name_folder_new = $("#title_folder_rename").val();
        if (format.test(name_folder_new)) {
            $("#title_folder").css("border-color", "red");
        }
        $.ajax({
            url: controller + 'actionFolderFile',
            async: false,
            type: 'POST',
            data: {
                id: id_from_action,
                name_folder_new: name_folder_new,
                action: 'rename_folder'
            },
            success: function (datas) {
                loadingForm(false);
                $('#smallModalRename').modal('hide');
                var obj = JSON.parse(datas);
                if (obj.status == 1) {
                    start_folder = 0;
                    start_file = 0;
                    getData();
                    showMessage('Success', obj.msg, 'success');
                    return false;
                } else {
                    showMessage('Warning', obj.msg, 'warning');
                    return false;
                }
            },
            error: function () {
                loadingForm(false);
                showMessage('Warning', "<?= getLanguage('all', 'error_unknow') ?>", 'warning');
                return false;
            }
        });
    });

    // View detail
    $("#view-detail").click(function () {
        $('#smallModalViewDetail').modal('show');
        $.ajax({
            url: controller + 'viewDetail',
            async: false,
            type: 'POST',
            data: {
                id: id_from_action
            },
            success: function (r) {
                loadingForm(false);
                var obj = JSON.parse(r);
                $("#body-detail").html(obj.content);
            },
            error: function () {
                loadingForm(false);
                showMessage('Warning', "<?= getLanguage('all', 'error_unknow') ?>", 'warning');
                return false;
            }
        });
    });

    // Download file
    $("#download").click(function () {
        window.location = controller + 'download?id=' + id_from_action;
    });
    // Remove file
    $("#remove").click(function () {
        delFile(id_from_action);
    });

    // Upload folder
    $("#upload-folder").click(function () {
        document.getElementById('folderToUpload').click();
    });

    $('#folderToUpload').change(function (evt) {
        loadingForm(true);
        var files = evt.target.files;
        var first_run = false;
        var data = new FormData();
        var paths = "";
        for (var i = 0, f; f = files[i]; i++) {
            paths += files[i].webkitRelativePath + "###";
            data.append(i, files[i]);
        }
        data.append('paths', paths);
        $.ajax({
            url: controller + 'uploadFolder',
            type: 'POST',
            async: false,
            data: data,
            enctype: 'multipart/form-data',
            processData: false,
            contentType: false,
            success: function (r) {
                loadingForm(false);
                resetFolder();
                window.location.reload();
            },
            error: function (datas) {
                loadingForm(false);
                resetFolder();
            }
        });
    });

    // Upload file
    $("#upload-file").click(function () {
        document.getElementById('fileToUpload').click();
    });

    $('#fileToUpload').change(function (evt) {
        loadingForm(true);
        var files = evt.target.files;
        for (var i = 0, f; f = files[i]; i++) {
            var size = f.size;
            if (size < 2048000) {
                var data = new FormData();
                var objectfile = document.getElementById('fileToUpload').files;
                data.append('userfile', objectfile[0]);
                data.append('url_folder', url_folder);
                data.append('id_folder', id_folder);
                $.ajax({
                    url: controller + 'uploadFile',
                    type: 'POST',
                    async: false,
                    data: data,
                    enctype: 'multipart/form-data',
                    processData: false,
                    contentType: false,
                    success: function (r) {
                        loadingForm(false);
                        var obj = JSON.parse(r);
                        resetFile();
                        if (obj.status == 1) {
                            window.location.reload();
                        } else if (obj.status == -3) {
                            showMessage('Warning', "<?= getLanguage('all', 'error_unknow') ?>", 'warning');
                            return false;
                        } else {
                            showMessage('Warning', obj.msg, 'warning');
                            return false;
                        }
                    },
                    error: function (datas) {
                        loadingForm(false);
                        resetFile();
                        showMessage('Warning', 'Upload file không thành công!', 'warning');
                        return false;
                    }
                });
            } else {
                loadingForm(false);
                resetFile();
                showMessage('Warning', "File size can't over 2Mb.", 'warning');
                return false;
            }
        }
    });
    // Scroll xuống tự động load data cũ hơn của file
    $('#load_data_file').on('scroll', function () {
        if ($(this).scrollTop() + $(this).innerHeight() >= $(this)[0].scrollHeight) {
            console.log('Load old data when scroll file.');
            start_file = start_file + limit;
            getData('scroll', 'file');
        }
    });

    // Scroll xuống tự động load data cũ hơn của folder
    $('#load_data_folder').on('scroll', function () {
        if ($(this).scrollTop() + $(this).innerHeight() >= $(this)[0].scrollHeight) {
            console.log('Load old data when scroll folder.');
            start_folder = start_folder + limit;
            getData('scroll', 'folder');
        }
    });
});

$(document).on('click', '.delete-file', function (e) {
    var id = $(this).attr('id');
    delFile(id);
});

function delFile(id) {
    loadingForm(true);
    $.ajax({
        url: controller + 'actionFolderFile',
        type: 'POST',
        async: false,
        data: {
            id: id,
            action: 'delete_foder'
        },
        success: function (datas) {
            loadingForm(false);
            var obj = JSON.parse(datas);
            if (obj.status == 1) {
                start_folder = 0;
                start_file = 0;
                getData();
            } else {
                showMessage('Warning', "<?= getLanguage('all', 'xoa-khong-thanh-cong') ?>", 'warning');
                return false;
            }
        },
        error: function () {
            loadingForm(false);
            showMessage('Warning', "<?= getLanguage('all', 'xoa-khong-thanh-cong') ?>", 'warning');
            return false;
        }
    });
}

// Hàm check click chuột phải vào vùng folder/file thì show popup
function onMouseDown(evt) {
    // Click right mouse thì show popup chọn upload file
    if (evt.which === 3 || evt.button === 2) {
        // lấy id khi click để biết đang thao tác vào vùng nào
        id_from_action = evt.target.id;
        console.log(id_from_action)
        // DOM utility functions:
        const el = (sel, par) => (par || document).querySelector(sel);
        // Popup:
        let elPopup; // To remember the currently active popup

        // Get clicked target
        const elTarget = evt.target;

        // Clicked a popup, do nothing (Comment this line if not needed)
        if (elTarget.closest(".popup")) return;

        // Close currently open popup (if any):
        if (elPopup) elPopup.classList.remove("is-active");

        // Get initiator button
        const elBtn = elTarget.closest("[data-popup]");

        // Not a valid button
        if (!elBtn) return;

        // Get the popup
        elPopup = el(elBtn.dataset.popup);

        // No matching popup in this page, do nothing
        if (!elPopup) return;

        // Get its parent (BODY) so that we can calculate the min max
        // available space
        const elParent = elPopup.parentElement;

        // Position:
        const absX = evt.clientX + window.scrollX;
        const absY = evt.clientY + window.scrollY;

        const bcrParent = elParent.getBoundingClientRect();
        const bcrPopup = elPopup.getBoundingClientRect();

        const maxX = bcrParent.width - bcrPopup.width;
        const maxY = bcrParent.height - bcrPopup.height;

        // Lấy vị trí left, top khi click chuột trái để show popup
        const x = Math.max(0, Math.min(absX, maxX));
        const y = Math.max(0, Math.min(absY, maxY));
        var left = (x - 65) + 'px';
        var top = y + 'px';
        // Kiểm tra xem đang click vào phân vùng nào để show popup
        if (id_from_action == 'from-folder' || id_from_action == 'from-file' || id_from_action == 'load_data_folder' || id_from_action == 'load_data_file') { // khi click ngoài folder/ file thì show popup upload
            var popup_show = "upload-action";
            hide_menu("folder-file-action"); // Ẩn popup rename/delete...
        } else if (id_from_action.indexOf("folder") !== -1 || id_from_action.indexOf("file") !== -1) { // click vào folder/file thì show popup rename/delete...
            popup_show = "folder-file-action";
            hide_menu("upload-action"); // Ẩn popup upload
            var arr_string_id = id_from_action.split("###");
            var arr_tmp = arr_string_id[0].split("_");
            var id_use = arr_tmp[1];
            // Action check file starred
            if (listFileStarred.hasOwnProperty(id_use)) {
                $("#show-type-starred").html('<i class="zmdi zmdi-star" style="margin-right: 20px;"></i>Remove from Starred');
            } else {
                $("#show-type-starred").html('<i class="zmdi zmdi-star-outline" style="margin-right: 20px;"></i>Add to Starred');
            }
        } else {
            var popup_show = "upload-action";
            hide_menu("folder-file-action"); // Ẩn popup rename/delete...
        }
        // Show popup
        var menu = document.getElementById(popup_show)
        $(".dropdown").addClass('show');
        $(".dropdown-menu").addClass('show');
        menu.style.left = left;
        menu.style.top = top;
        menu.style.display = 'block';
    }
}

// Ẩn popup upload
function hide_menu(popup) {
    var menu = document.getElementById(popup)
    menu.style.display = 'none';
    $(".dropdown").removeClass('show');
    $(".dropdown-menu").removeClass('show');
}

function getData(action = "", from = "") {
    loadingForm(true);
    $.ajax({
        url: controller + 'getList',
        async: false,
        type: 'POST',
        data: {
            start_folder: start_folder,
            start_file: start_file,
            name_folder: name_folder,
            id_folder: id_folder,
            id_parent_folder: id_parent_folder,
            scroll_from: from,
        },
        success: function (datas) {
            // console.log(datas); return false;
            loadingForm(false);
            var obj = JSON.parse(datas);
            if (from === "") {
                $('.list_folder').html(obj.content_folder);
                $('.list_file').html(obj.content_file);
            } else if (from === 'folder') { // Scroll chuột append data
                $('.list_folder').append(obj.content_folder);
            } else if (from === 'file') { // Scroll chuột append data
                $('.list_file').append(obj.content_file);
            }
            if (from !== 'folder' && from !== 'file') { // Scroll chuột append data thì ko ẩn
                // Nếu ko có data thì ẩn body folder
                if (obj.content_folder === "") {
                    $("#show_folder").css("display", "none");
                }
                else {
                    $("#show_folder").css("display", "inline");
                }
                // Nếu ko có data thì ẩn body file
                if (obj.content_file === "") {
                    $("#show_file").css("display", "none");
                }
                else {
                    $("#show_file").css("display", "inline");
                }
                if (obj.content_file === "" && obj.content_folder === "") {
                    $("#show_folder").css("display", "inline");
                }
            }
            listFileStarred = JSON.parse(obj.listFileStarred);
            if (name_folder === '') {
                $('#total-doc').html(obj.total_doc);
                $('#total-media').html(obj.total_media);
                $('#total-img').html(obj.total_img);
                $('#total-all').html(obj.storage_all_file);
                document.getElementById("progress-bar-all").style.width = obj.progress_all + '%';
                document.getElementById("progress-bar-doc").style.width = obj.progress_doc + '%';
                document.getElementById("progress-bar-media").style.width = obj.progress_media + '%';
                document.getElementById("progress-bar-images").style.width = obj.progress_img + '%';
            }
        },
        error: function () {
            loadingForm(false);
            showMessage('Warning', "<?= getLanguage('all', 'error_unknow') ?>", 'warning');
            return false;
        }
    });
}

function load_data_chart() {
    $(".show-chart-file").html('<i class="zmdi zmdi-hc-2x zmdi-spinner zmdi-hc-spin"></i>');
    $.ajax({
        url: controller + "getChartFile",
        method: "POST",
        cache: false,
        success: function (r) {
            if (r !== '') {
                $(".show-chart-file").html(r);
            }
        }
    });
}

function resetFolder() {
    $('input[type="file"]').val(null);
    $("#folderToUpload").val("");
}

function resetFile() {
    $('input[type="file"]').val(null);
    $("#fileToUpload").val("");
}