$(document).ready(function () {
    // $('.js-basic-example').DataTable();
    // START Xử lý Notify
    // setInterval(function() {
    //     getNotify();
    // }, 20000);
    // getNotify();
    $(document).on('click', '.turnoff-notify', function (e) {
        var id = $(this).attr('id');
        var action = "";
        if ($(this).hasClass('notify-order')) {
            action = 'notify-order';
        }
        if ($(this).hasClass('notify-comment')) {
            action = 'notify-comment';
        }
        if ($(this).hasClass('notify-events')) {
            action = 'notify-events';
        }
        if ($(this).hasClass('notify-contact')) {
            action = 'notify-contact';
        }
        if ($(this).hasClass('notify-review')) {
            action = 'notify-review';
        }
        $.ajax({
            url: '/admin.php/home/turnOffNotify',
            async: false,
            type: 'POST',
            data: {
                action: action,
                id: id
            },
            success: function (r) {
                getNotify();
            },
            error: function () {

            }
        });
    });

    $(document).on('click', '.text-decoration-underline', function (e) {
        $.ajax({
            url: '/admin.php/home/turnOffNotify',
            async: false,
            type: 'POST',
            data: {
                action: "turnoff-all-notify",
            },
            success: function (r) {
                getNotify();
            },
            error: function () {

            }
        });
    });

    $(document).on('click', '.replyContact', function (e) {
        var id_contact = $(this).attr('id_contact');
        window.location = "/admin.php/contact?id_contact=" + id_contact;
    });
    $(document).on('click', '.viewOrder', function (e) {
        var id_order = $(this).attr('id_order');
        var code_order = $(this).attr('code_order');
        var obj = {};
        obj['id_order'] = id_order;
        obj['code_order'] = code_order;
        var searchs = JSON.stringify(obj);
        window.location = "/admin.php/orders?datas=" + searchs;
    });
    $(document).on('click', '.viewComment', function (e) {
        var id = $(this).attr('id');
        window.location = "/admin.php/comments?id=" + id;
    });
    $(document).on('click', '.viewReview', function (e) {
        var id = $(this).attr('id');
        window.location = "/admin.php/reviews?id=" + id;
    });
    $(document).on('click', '.viewEvents', function (e) {
        var id = $(this).attr('id');
        window.location = "/admin.php/calendar?id=" + id;
    });
    // END Xử lý Notify Order

    $(".minileftbar .notify-contact").on('click', function () {
        $(".right_menu .notif-contact").toggleClass("open stretchRight").siblings().removeClass('open stretchRight');
        if ($(".right_menu .notif-contact").hasClass('open')) {
            $('.overlay').fadeIn();
        } else {
            $('.overlay').fadeOut();
        }
    });
    $(".minileftbar .notify-events").on('click', function () {
        $(".right_menu .notif-events").toggleClass("open stretchRight").siblings().removeClass('open stretchRight');
        if ($(".right_menu .notif-events").hasClass('open')) {
            $('.overlay').fadeIn();
        } else {
            $('.overlay').fadeOut();
        }
    });

    // START set điều kiện Check All/Check
    $(document).on('click', '#checkall', function (e) {
        var status_checkall = $("#checkall").prop("checked");
        var checkBoxes = $("input[name=check]");
        checkBoxes.prop("checked", status_checkall);
    });

    $(document).on('click', '#listData input.chkrow', function (e) {
        var len = $('#listData input.chkrow').length;
        var len2 = $('#listData input.chkrow:checked').length;
        if (len == len2) {
            $("#checkall").prop("checked", true);
        } else {
            $("#checkall").prop("checked", false);
        }
    });
    // END set condition Check All

    // Cấu hình default color themes/menu
    if (localStorage.getItem("themes-stype") === null) {
        localStorage.setItem("themes-stype", 'light');
        $("#layout-mode-light").prop('checked', true);
        $("#layout-mode-dark").prop('checked', false);
    }
    else {
        var body = document.getElementsByTagName("body")[0];
        if (localStorage.getItem("themes-stype") == 'light') {
            document.body.setAttribute('data-layout-mode', 'light');
            document.body.setAttribute('data-topbar', 'light');
            document.body.setAttribute('data-sidebar', 'light');
            (body.hasAttribute("data-layout") && body.getAttribute("data-layout") == "horizontal") ? '' : document.body.setAttribute('data-sidebar', 'light');
            $("#layout-mode-light").prop('checked', true);
            $("#layout-mode-dark").prop('checked', false);
        }
        else {
            document.body.setAttribute('data-layout-mode', 'dark');
            document.body.setAttribute('data-topbar', 'dark');
            document.body.setAttribute('data-sidebar', 'dark');
            (body.hasAttribute("data-layout") && body.getAttribute("data-layout") == "horizontal") ? '' : document.body.setAttribute('data-sidebar', 'dark');
            $("#layout-mode-light").prop('checked', false);
            $("#layout-mode-dark").prop('checked', true);
        }
    }

    if (localStorage.getItem("data-layout-size") !== null) {
        document.body.setAttribute('data-layout-size', localStorage.getItem("data-layout-size"));
        if (localStorage.getItem("data-layout-size") == 'fluid') {
            $("#layout-width-fuild").prop('checked', true);
            $("#layout-width-boxed").prop('checked', false);
        }
        else {
            $("#layout-width-fuild").prop('checked', false);
            $("#layout-width-boxed").prop('checked', true);
        }
    }
    else {
        $("#layout-width-fuild").prop('checked', true);
        $("#layout-width-boxed").prop('checked', false);
    }
    if (localStorage.getItem("data-layout-scrollable") !== null) {
        document.body.setAttribute('data-layout-scrollable', localStorage.getItem("data-layout-scrollable"));
        if (localStorage.getItem("data-layout-scrollable") == 'false') {
            $("#layout-position-fixed").prop('checked', true);
            $("#layout-position-scrollable").prop('checked', false);
        }
        else {
            $("#layout-position-fixed").prop('checked', false);
            $("#layout-position-scrollable").prop('checked', true);
        }
    }
    else {
        $("#layout-position-fixed").prop('checked', true);
        $("#layout-position-scrollable").prop('checked', false);
    }
    if (localStorage.getItem("data-topbar") !== null) {
        document.body.setAttribute('data-topbar', localStorage.getItem("data-topbar"));
        if (localStorage.getItem("data-topbar") == 'light') {
            $("#topbar-color-light").prop('checked', true);
            $("#topbar-color-dark").prop('checked', false);
        }
        else {
            $("#topbar-color-light").prop('checked', false);
            $("#topbar-color-dark").prop('checked', true);
        }
    }
    else {
        $("#topbar-color-light").prop('checked', true);
        $("#topbar-color-dark").prop('checked', false);
    }
    if (localStorage.getItem("data-sidebar-size") !== null) {
        document.body.setAttribute('data-sidebar-size', localStorage.getItem("data-sidebar-size"));
        if (localStorage.getItem("data-sidebar-size") == 'lg') {
            $("#sidebar-size-default").prop('checked', true);
            $("#sidebar-size-compact").prop('checked', false);
            $("#sidebar-size-small").prop('checked', false);
        }
        else if (localStorage.getItem("data-sidebar-size") == 'md') {
            $("#sidebar-size-default").prop('checked', false);
            $("#sidebar-size-compact").prop('checked', true);
            $("#sidebar-size-small").prop('checked', false);
        }
        else {
            $("#sidebar-size-default").prop('checked', false);
            $("#sidebar-size-compact").prop('checked', false);
            $("#sidebar-size-small").prop('checked', true);
        }
    }
    else {
        $("#sidebar-size-default").prop('checked', true);
        $("#sidebar-size-compact").prop('checked', false);
        $("#sidebar-size-small").prop('checked', false);
    }
    if (localStorage.getItem("data-sidebar") !== null) {
        document.body.setAttribute('data-sidebar', localStorage.getItem("data-sidebar"));
        if (localStorage.getItem("data-sidebar") == 'light') {
            $("#sidebar-color-light").prop('checked', true);
            $("#sidebar-color-dark").prop('checked', false);
            $("#sidebar-color-brand").prop('checked', false);
        }
        else if (localStorage.getItem("data-sidebar") == 'dark') {
            $("#sidebar-color-light").prop('checked', false);
            $("#sidebar-color-dark").prop('checked', true);
            $("#sidebar-color-brand").prop('checked', false);
        }
        else {
            $("#sidebar-color-light").prop('checked', false);
            $("#sidebar-color-dark").prop('checked', false);
            $("#sidebar-color-brand").prop('checked', true);
        }
    }
    else {
        $("#sidebar-color-light").prop('checked', true);
        $("#sidebar-color-dark").prop('checked', false);
        $("#sidebar-color-brand").prop('checked', false);
    }
    // START click button drak/light
    $('#mode-setting-btn').on('click', function (e) {
        if (body.hasAttribute("data-layout-mode") && body.getAttribute("data-layout-mode") == "dark") {
            localStorage.setItem("themes-stype", 'dark');
        } else {
            localStorage.setItem("themes-stype", 'light');
        }
    });

    $(document).on('click', '.form-check-input', function (e) {
        var id = $(this).attr('id');
        if (id == 'layout-width-fuild') {
            localStorage.setItem("data-layout-size", 'fluid');
        }
        if (id == 'layout-width-boxed') {
            localStorage.setItem("data-layout-size", 'boxed');
        }
        if (id == 'layout-position-fixed') {
            localStorage.setItem("data-layout-scrollable", 'false');
        }
        if (id == 'layout-position-scrollable') {
            localStorage.setItem("data-layout-scrollable", 'true');
        }
        if (id == 'topbar-color-light') {
            localStorage.setItem("data-topbar", 'light');
        }
        if (id == 'topbar-color-dark') {
            localStorage.setItem("data-topbar", 'dark');
        }
        if (id == 'sidebar-size-default') {
            localStorage.setItem("data-sidebar-size", 'lg');
        }
        if (id == 'sidebar-size-compact') {
            localStorage.setItem("data-sidebar-size", 'md');
        }
        if (id == 'sidebar-size-small') {
            localStorage.setItem("data-sidebar-size", 'sm');
        }
        if (id == 'sidebar-color-light') {
            localStorage.setItem("data-sidebar", 'light');
        }
        if (id == 'sidebar-color-dark') {
            localStorage.setItem("data-sidebar", 'dark');
        }
        if (id == 'sidebar-color-brand') {
            localStorage.setItem("data-sidebar", 'brand');
        }
    });
    // END click color themes custom

    // Click tr hightlight on table
    $(document).on('click', '.table-hover tbody tr', function (e) {
        $(".table-hover tbody tr").removeClass("highlight-row");
        $(this).addClass('highlight-row');
    });

    // Scroll to top
    var pxShow = 800; // height on which the button will show
    var scrollSpeed = 500; // how slow / fast you want the button to scroll to top.
    $(window).scroll(function () {
        if ($(window).scrollTop() >= pxShow) {
            $("#toTop").addClass('visible');
        } else {
            $("#toTop").removeClass('visible');
        }
    });
    $('#toTop').on('click', function () {
        $('html, body').animate({ scrollTop: 0 }, scrollSpeed);
        return false;
    });
});

function loadingForm(s) {
    if (formSearch !== "") {
        var elFS = jQuery("#" + formSearch);
        if (elFS.height() <= ($(window).height())) {
            elFS.cenrerY = true;
        }
    }
    if (gridDatas !== "") {
        var el = jQuery("#" + gridDatas);
        if (el.height() <= ($(window).height())) {
            el.cenrerY = true;
        }
    }
    if (s === true) {
        if (formSearch !== "") {
            $(elFS).block({
                message: '<i class="fas fa-spinner fa-spin fa-2x"></i>',
                baseZ: elFS.zIndex ? elFS.zIndex : 1000,
                centerY: elFS.cenrerY != undefined ? elFS.cenrerY : false,
                css: {
                    top: '10%',
                    border: '0',
                    padding: '0',
                    backgroundColor: 'none'
                },
                overlayCSS: {
                    backgroundColor: elFS.overlayColor ? elFS.overlayColor : '#000',
                    opacity: elFS.boxed ? 0.05 : 0.1,
                    cursor: 'wait'
                }
            });
        }
        if (gridDatas !== "") {
            $(el).block({
                message: '<i class="fas fa-spinner fa-spin fa-2x"></i>',
                baseZ: el.zIndex ? el.zIndex : 1000,
                centerY: el.cenrerY != undefined ? el.cenrerY : false,
                css: {
                    top: '10%',
                    border: '0',
                    padding: '0',
                    backgroundColor: 'none'
                },
                overlayCSS: {
                    backgroundColor: el.overlayColor ? el.overlayColor : '#000',
                    opacity: el.boxed ? 0.05 : 0.1,
                    cursor: 'wait'
                }
            });
        }
    } else {
        if (formSearch !== "") {
            $(elFS).unblock();
        }
        if (gridDatas !== "") {
            $(el).unblock();
        }
    }
}

function getNotify() {
    $.ajax({
        url: '/admin.php/home/getNotify',
        async: false,
        type: 'POST',
        success: function (r) {
            if (isJsonString(r)) {
                var obj = JSON.parse(r);
                $("#show_notify").removeClass("bg-danger rounded-pill");
                $("#list_notify").html("");
                $("#total_notify").html('');
                $("#total_unread").html(0);
                var total = 0
                if (obj.total_notify_order > 0) {
                    total += obj.total_notify_order;
                }
                if (obj.notify_contact > 0) {
                    total += obj.notify_contact;
                }
                if (obj.notify_comment > 0) {
                    total += obj.notify_comment;
                }
                if (obj.notify_events > 0) {
                    total += obj.notify_events;
                }
                if (obj.notify_reviews > 0) {
                    total += obj.notify_reviews;
                }
                if (total > 0) {
                    $("#show_notify").addClass("bg-danger rounded-pill");
                    if (total > 99) {
                        total = '99+';
                    }
                    $("#list_notify").html(obj.list_notify);
                    $("#total_notify").html(total);
                    $("#total_unread").html(total);
                }
            }
        },
        error: function () {

        }
    });
}

// Hàm check JSON
function isJsonString(str) {
    try {
        JSON.parse(str);
    } catch (e) {
        return false;
    }
    return true;
}

// Load data page
function getDataPage(page) {
    cpage = page;
    getData();
    // $('.js-basic-example').DataTable();
}

// Show message
function showMessage(title, mess, type) {
    // swal(title, mess, type);
    swal("", mess, type);
}

// START function get/set/reset multiselect
function getCombo(id) {
    var val = $('#' + id).multipleSelect('getSelects');
    if (typeof val === 'object') {
        val = "";
    }
    return val;
}

function resetCombo(id) {
    $('#' + id).multipleSelect('refresh').multipleSelect('uncheckAll');
}

function setCombo(id, value) {
    if (value !== '') {
        arr = value.split(",");
        $('#' + id).multipleSelect('setSelects', arr);
    }
}
// END function get/set/reset multiselect

// START Change language
function changeLangAdmin(lang) {
    $.ajax({
        url: "/admin/home-setlanguage",
        async: false,
        type: 'POST',
        data: {
            lang: lang,
        },
        success: function (datas) {
            location.reload();
        },
        error: function () {

        }
    });
}
// END Change language

// Khởi tạo multipleSelect
function initFirst() {
    $(".search").each(function () {
        var id = $(this).attr('id');
        var optsl = $(this).attr('optsl');
        var optslClick = $(this).attr('optslClick');
        if (optsl != undefined) {
            var configSelect = {};
            configSelect[optsl] = true;
            configSelect['filter'] = true;
            var placeholder = (typeof $(this).attr('placeholder') !== 'undefined') ? $(this).attr('placeholder') : '-- Select item --';
            if (optslClick != undefined) {
                configSelect['onClick'] = eval(optslClick);
            }
            configSelect['placeholder'] = placeholder;
            $('#' + id).multipleSelect(configSelect);
            $('#' + id).multipleSelect('uncheckAll');
            if (configSelect.onClick != undefined) {
                $("input[name*='selectAll" + id + "']").click(function () {
                    var func = eval(optslClick); if (typeof func == 'function') { func(); }
                });
            }
        }
        $('#' + id).parent().find('.option').css({ 'padding-left': '10px' });
    });
}