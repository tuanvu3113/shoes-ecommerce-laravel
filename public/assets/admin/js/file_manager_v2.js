var formSearch = 'formSearch';
var gridDatas = '';
var limit = 10;
var limit_search = 20;
var start_folder = 0;
var start_all_f = 0;
var start_file = 0;
var start_all = 0;
var format = /[!@#$%^&*()_+\-=\[\]{};':"\\|<>\/]+/;

// ID khi click chuột phải
var id_from_action = '';
$(document).ready(function () {
    getData();
    loadSortNameAZ(sort_list);
    $("#id_from_action").val('');
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
                $('#smallModal').modal('hide');
                var obj = JSON.parse(datas);
                if (obj.status == 1) {
                    resetNumLoad();
                    getData();
                }
                else {
                    showMessage('Warning', obj.msg, 'warning');
                    return false;
                }
            },
            error: function () {
            }
        });
    });

    // Rename folder
    $("#rename_folder").click(function () {
        var name_folder_new = $("#title_folder_rename").val();
        if (format.test(name_folder_new)) {
            $("#title_folder").css("border-color", "red");
        }
        var id = $("#id_from_action").val();
        $.ajax({
            url: controller + 'actionFolderFile',
            async: false,
            type: 'POST',
            data: {
                id: id,
                name_folder_new: name_folder_new,
                action: 'rename_folder'
            },
            success: function (datas) {
                $('#smallModalRename').modal('hide');
                var obj = JSON.parse(datas);
                if (obj.status == 1) {
                    resetNumLoad();
                    getData();
                } else {
                    showMessage('Warning', obj.msg, 'warning');
                    return false;
                }
            },
            error: function () {
                showMessage('Error', 'Saved unsuccessfully.', 'error');
                return false;
            }
        });
    });

    $('#folderToUpload').change(function (evt) {
        var files = evt.target.files;
        var first_run = false;
        var data = new FormData();
        var paths = "";
        for (var i = 0, f; f = files[i]; i++) {
            paths += files[i].webkitRelativePath + "###";
            data.append(i, files[i]);
        }
        data.append('paths', paths);
        data.append('url_folder', url_folder);
        $.ajax({
            url: controller + 'uploadFolder',
            type: 'POST',
            async: false,
            data: data,
            enctype: 'multipart/form-data',
            processData: false,
            contentType: false,
            success: function (r) {
                var obj = JSON.parse(r);
                if (obj.status == 1) {
                    resetFolder();
                    window.location.reload();
                }
                else {
                    showMessage('Warning', obj.msg, 'warning');
                    return false;
                }
            },
            error: function (datas) {
                resetFolder();
                showMessage('Error', 'Upload unsuccessfully.', 'error');
                return false;
            }
        });
    });

    $('#fileToUpload').change(function (evt) {
        var files = evt.target.files;
        for (var i = 0, f; f = files[i]; i++) {
            var size = f.size;
            if (size < 128000000) {
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
                        var obj = JSON.parse(r);
                        resetFile();
                        if (obj.status == 1) {
                            window.location.reload();
                        } else {
                            showMessage('Warning', obj.msg, 'warning');
                            return false;
                        }
                    },
                    error: function (datas) {
                        resetFile();
                        showMessage('Error', 'Upload unsuccessfully.', 'error');
                        return false;
                    }
                });
            } else {
                showMessage('Error', 'File vượt quá 128MB.', 'error');
                resetFile();
                return false;
            }
        }
    });

    // Click button thực hiện move file
    $("#move_to_here").click(function () {
        var id_folder_move = $("#id_folder_moveto").val();
        var id_from_action = $("#id_from_action").val();
        $.ajax({
            url: controller + 'moveItem',
            async: false,
            type: 'POST',
            data: {
                id_folder_move: id_folder_move,
                id_item: id_from_action,
            },
            success: function (r) {
                var obj = JSON.parse(r);
                $('#smallModalMoveTo').modal('hide');
                $("#id_folder_moveto").val("");
                if (obj.status == 1) {
                    getData();
                    return false;
                }
            },
            error: function () {
                showMessage('Error', 'Moved unsuccessfully.', 'error');
                return false;
            }
        });
    });

    // Click sort type
    $("#sort_by").click(function () {
        resetNumLoad();
        $(".check_sort").css("display", "none");
        if (sort_type == "" || sort_type == 'sort_name') {
            console.log('sort type: name');
            $("#check_sort_name").css("display", "inline");
        }
        else if (sort_type !== "" && sort_type == 'sort_date') {
            console.log('sort type: date');
            $("#check_sort_date").css("display", "inline");
        }
    });
});

// Scroll xuống tự động load data cũ hơn của file
$('#load_data_file').on('scroll', function () {
    if ($(this).scrollTop() + $(this).innerHeight() >= $(this)[0].scrollHeight) {
        console.log('Load old data when scroll file.');
        getData('scroll', 'file', type_check);
    }
});

// Scroll xuống tự động load data cũ hơn của folder
$('#load_data_folder').on('scroll', function () {
    if ($(this).scrollTop() + $(this).innerHeight() >= $(this)[0].scrollHeight) {
        console.log('Load old data when scroll folder.');
        getData('scroll', 'folder', type_check);
    }
});

// Scroll xuống tự động load data cũ hơn của datas search
$('#load_data_search').on('scroll', function () {
    if ($(this).scrollTop() + $(this).innerHeight() >= $(this)[0].scrollHeight) {
        console.log('Load old data when scroll search.');
        getData('scroll', 'search', type_check);
    }
});

$('#load_data_search2').on('scroll', function () {
    if ($(this).scrollTop() + $(this).innerHeight() >= $(this)[0].scrollHeight) {
        console.log('Load old data when scroll search.');
        getData('scroll', 'search', type_check);
    }
});

$('#load_data_all').on('scroll', function () {
    if ($(this).scrollTop() + $(this).innerHeight() >= $(this)[0].scrollHeight) {
        console.log('Load old data when scroll all.');
        getData('scroll', 'all', type_check);
    }
});

$(document).on('click', '.val_sort', function (e) {
    $(".val_sort").css("display", "none");
    var id = $(this).attr('id');
    if (id == 'sort_desc') {
        sort_val = 'sort_desc';
        $("#sort_asc").css("display", "inline");
    }
    else {
        sort_val = 'sort_asc';
        $("#sort_desc").css("display", "inline");
    }
    resetNumLoad();
    getData();
});

$(document).on('click', '.sort_list_name', function (e) {
    var id = $(this).attr('id');
    if (id == "sort_name_az") {
        sort_list = "sort_name_az";
    } else if (id == "sort_name_za") {
        sort_list = "sort_name_za";
    } else if (id == "sort_date_az") {
        sort_list = "sort_date_az";
    } else if (id == "sort_date_za") {
        sort_list = "sort_date_za";
    }
    resetNumLoad();
    loadSortNameAZ(sort_list);
    getData();
});
$(document).on('click', '.sort_list_name_search', function (e) {
    var id = $(this).attr('id');
    if (id == "search_sort_name_az") {
        sort_list = "sort_name_az";
    }
    else {
        sort_list = "sort_name_za";
    }
    resetNumLoad();
    loadSortNameAZ(sort_list);
    getData();
});
$(document).on('click', '.delete-file', function (e) {
    var id = $(this).attr('id');
    delFile(id);
});

function delFile(id) {
    $.ajax({
        url: controller + 'actionFolderFile',
        type: 'POST',
        async: false,
        data: {
            id: id,
            action: 'delete_foder'
        },
        success: function (datas) {
            var obj = JSON.parse(datas);
            if (obj.status == 1) {
                resetNumLoad();
                getData();
            }
        },
        error: function () {
            showMessage('Error', 'Deleted unsuccessfully.', 'error');
            return false;
        }
    });
}

// View detail
function viewDetail(id) {
    $('#smallModalViewDetail').modal('show');
    $.ajax({
        url: controller + 'viewDetail',
        async: false,
        type: 'POST',
        data: {
            id: id
        },
        success: function (r) {
            var obj = JSON.parse(r);
            $("#body-detail").html(obj.content);
        },
        error: function () {
        }
    });
}

function reName(id) {
    var arr_string_id = id.split("###");
    $('#smallModalRename').modal('show');
    $("#title_folder_rename").val(arr_string_id[1]);
    $("#title_folder_rename").css("border-color", "");
    const input_name = document.getElementById('title_folder_rename');
    // Select chọn vùng name file để đổi tên
    setTimeout(function () {
        var arr_string_name = arr_string_id[1].split(".");
        var count_sn = arr_string_name[0].length;
        input_name.focus();
        input_name.setSelectionRange(0, count_sn);
    }, 1000);
}

function addStar(id) {
    $.ajax({
        url: controller + 'actionFolderFile',
        async: false,
        type: 'POST',
        data: {
            id: id,
            action: 'add_starred'
        },
        success: function (datas) {
            resetNumLoad();
            getData();
        },
        error: function () {
            showMessage('Error', 'Added unsuccessfully.', 'error');
            return false;
        }
    });
}

function viewFile(id) {
    $.ajax({
        type: 'POST',
        url: controller + 'viewFile',
        data: {
            id: id
        }
    }).done(function (r) {
        if (r.indexOf('<img') !== -1) {
            var tmp = r.split("+_*");
            $("#viewItem").modal('show');
            $("#file-name-view").html(tmp[1])
            $("#modalContentView").html(tmp[0]);
        }
        else {
            window.open(r);
        }
    }).fail(function (x) {

    });
}

function getLink(id) {
    var id_from_action = $("#id_from_action").val();
    var arr_string_id = id_from_action.split("###");
    /* Get the text field */
    var copyText = arr_string_id[2];
    /* Copy the text inside the text field */
    navigator.clipboard.writeText(url_domain + copyText);
}

function openAddFolder(params) {
    $('#smallModal').modal('show');
    $("#title_folder").val('Untitled folder');
    $("#title_folder").css("border-color", "");
}

function getData(action = "", from = "", type = "") {
    if (action === "" && from === "" && type === "") {
        start_all_f = 0;
        start_file = 0;
        start_folder = 0;
    }
    $.ajax({
        url: controller + 'getList',
        async: false,
        type: 'POST',
        data: {
            start_all_f: start_all_f,
            start_folder: start_folder,
            start_file: start_file,
            start_all: start_all,
            name_folder: name_folder,
            id_folder: id_folder,
            id_parent_folder: id_parent_folder,
            scroll_from: from,
            action_search: action_search,
            type: type,
            sort_type: sort_type,
            sort_val: sort_val,
            sort_list: sort_list,
        },
        success: function (datas) {
            if (from === "") {
                $('#tb_all').DataTable().clear().destroy();
                $('#table_search').DataTable().clear().destroy();
            }
            // console.log(datas); return false;
            var obj = JSON.parse(datas);
            if (obj.hasOwnProperty('total') && obj.total > 0) {
                start_all_f = obj.total;
            }
            if (obj.hasOwnProperty('total_file') && obj.total_file > 0) {
                start_file = obj.total_file;
            }
            if (obj.hasOwnProperty('total_folder') && obj.total_folder > 0) {
                start_folder = obj.total_folder;
            }
            if (action_search === "") {
                if (type_check == 'grid') {
                    if (from === "") {
                        checkTypeShowDataSearch();
                        $('.list_folder').html(obj.content_folder);
                        $('.list_file').html(obj.content_file);
                    } else if (from === 'folder') { // Scroll chuột append data
                        $('.list_folder').append(obj.content_folder);
                        if (obj.content_folder !== '') {
                            start_folder = start_folder + limit;
                        }
                    } else if (from === 'file') { // Scroll chuột append data
                        $('.list_file').append(obj.content_file);
                        if (obj.content_file !== '') {
                            start_file = start_file + limit;
                        }
                    }
                    if (from !== 'folder' && from !== 'file') { // Scroll chuột append data thì ko ẩn
                        // Nếu ko có data thì ẩn body folder
                        if (obj.content_folder === "") {
                            $("#show_folder").css("display", "none");
                        } else {
                            $("#show_folder").css("display", "inline");
                        }
                        // Nếu ko có data thì ẩn body file
                        if (obj.content_file === "") {
                            $("#show_file").css("display", "none");
                        } else {
                            $("#show_file").css("display", "inline");
                        }
                        if (obj.content_file === "" && obj.content_folder === "") {
                            $("#show_folder").css("display", "inline");
                        }
                    }
                }
                else {
                    if (obj.content !== '') {
                        if (from === "") {
                            checkTypeShowDataSearch();
                            $('.list_all').html(obj.content);
                            $('#tb_all').DataTable({
                                "paging": false,
                                "info": false,
                                "searching": false,
                                "fixedColumns": true,
                                "order": [[0, 'desc']],
                                // "columnDefs": [{
                                //     "targets": [0,1,2,3],
                                //     "orderable": false
                                // }]
                            });
                        } else if (from === 'all') { // Scroll chuột append data
                            start_all_f += limit_search;
                            $('.list_all').append(obj.content);
                        }
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
            }
            else {
                if (obj.content !== '') {
                    start_all = start_all + limit_search;
                    if (from == 'search') {
                        $('.list_datas').append(obj.content);
                        $('#table_search').DataTable({
                            "paging": false,
                            "info": false,
                            "searching": false,
                            "fixedColumns": true,
                            "order": [[0, 'desc']],
                            // "columnDefs": [{
                            //     "targets": [1, 2, 3],
                            //     "orderable": false
                            // }]
                        });
                    }
                    else {
                        checkTypeShowDataSearch();
                        $('.list_datas').html(obj.content);
                    }
                }
            }
        },
        error: function () {
        }
    });
}
// Copy file/folder
function makeCopy(id) {
    $.ajax({
        url: controller + 'makeCopyFile',
        async: false,
        type: 'POST',
        data: {
            id: id
        },
        success: function (r) {
            var obj = JSON.parse(r);
            if (obj.status == 1) {
                getData();
            }
        },
        error: function () {
            showMessage('Error', 'Copied unsuccessfully.', 'error');
            return false;
        }
    });
}
// Hàm hiển thị folder để lựa chọn move file
function loadFolderMoveTo(id = "") {
    $('#smallModalMoveTo').modal('show');
    $("#id_folder_moveto").val("");
    var id_from_action = $("#id_from_action").val();
    $.ajax({
        url: controller + 'clickMoveTo',
        async: false,
        type: 'POST',
        data: {
            id: id,
            id_item_move: id_from_action,
        },
        success: function (r) {
            var obj = JSON.parse(r);
            $("#body-move-to").html(obj.content);
            $("#id_folder_moveto").val(obj.id);
        },
        error: function () {
        }
    });
}
function delFile(id) {
    $.ajax({
        url: controller + 'actionFolderFile',
        type: 'POST',
        async: false,
        data: {
            id: id,
            action: 'delete_foder'
        },
        success: function (datas) {
            var obj = JSON.parse(datas);
            if (obj.status == 1) {
                resetNumLoad();
                getData();
            }
        },
        error: function () {
            showMessage('Error', 'Deleted unsuccessfully.', 'error');
            return false;
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

function resetNumLoad() {
    start_folder = 0;
    start_all_f = 0;
    start_file = 0;
    start_all = 0;
}

function loadSortNameAZ(status) {
    $(".sort_list_name").css("display", "none");
    $(".sort_list_name_search").css("display", "none");
    if (status == "" || status == 'sort_name_az' || status.includes("sort_name_az")) {
        $("#sort_name_za").css("display", "inline");
        $("#search_sort_name_za").css("display", "inline");
    }
    else {
        $("#sort_name_az").css("display", "inline");
        $("#search_sort_name_az").css("display", "inline");
    }
    if (status == 'sort_date_az') {
        $("#sort_date_za").css("display", "inline");
        $("#sort_date_az").css("display", "none");
    }
    if (status == 'sort_date_za') {
        $("#sort_date_az").css("display", "inline");
        $("#sort_date_za").css("display", "none");
    }
}