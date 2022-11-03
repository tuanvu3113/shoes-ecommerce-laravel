// $(document).ready(function () {
//     $('#change-lang').change(function () {
//         var value = $(this).val();
//         // console.log(value)
//         $.ajax({
//             url: '/home/setLanguage',
//             async: false,
//             type: 'POST',
//             data: {
//                 lang: value,
//             },
//             success: function (datas) {
//                 location.reload();
//             },
//             error: function () {

//             }
//         });
//     });
// });

// $(document).on('click', '.header-icon_search_custom', function (e) {
//     var search_form = $("#search-form").val();
//     setCookie('search_form', search_form, 7);
//     window.location.href = "/product.html";
// });

// $(document).on('click', '.removeItem', function (e) {
//     var code = $(this).attr('removeCode');
//     $.ajax({
//         url: '/product/cart',
//         async: false,
//         type: 'POST',
//         data: {
//             code: code,
//             action: 'remove',
//         },
//         success: function (datas) {
//             var obj = JSON.parse(datas);
//             $("#menuCart").html(obj.cart);
//             $("#total_price").html(obj.total_price);
//             $("#total_cart").html(obj.total);
//             $("#list_data_checkout").html(obj.list_data_checkout);
//             if (obj.total <= 0) {
//                 $(".process").css("display", "none");
//             }
//         },
//         error: function () {

//         }
//     });
// });

// $(document).on('click', '.tooltip-add-favorites', function (e) {
//     var code = $(this).attr('code');
//     var type_page = $(this).attr('type_page');
//     $.ajax({
//         url: '/product/cart',
//         async: false,
//         type: 'POST',
//         data: {
//             code: code,
//             action: 'add-favorites',
//         },
//         success: function (datas) {
//             var obj = JSON.parse(datas);
//             $("#wishlist_toal").html(obj.total_favorites);
//             var data_f = obj.data_favorites;
//             var color = '#004dda';
//             var color2 = '#fff';
//             if (type_page === 'list') {
//                 color = '#FFC107';
//                 color2 = '#f0f0f0';
//             }
//             $('.tooltip-add-favorites').each(function (i) {
//                 $(this).css('background-color', color2);
//             });
//             for (var code in data_f) {
//                 $("#favorites_" + code).css('background-color', color);
//             }
//             var check_wishlist = getCookie('click_wishlist');
//             if (check_wishlist) {
//                 var obj_list = JSON.parse(obj.datas_load);
//                 if (obj_list.content !== '') {
//                     $('#listProduct').html(obj_list.content);
//                     if (obj_list.count > 12) {
//                         $("#showpagination").html(obj_list.paging);
//                     } else {
//                         $("#showpagination").html("");
//                     }
//                 } else {
//                     $('#listProduct').html("No item");
//                 }
//             }
//         },
//         error: function () { }
//     });
// });

// $(document).on('click', '.tooltip-add-cart', function (e) {
//     var code = $(this).attr('code');
//     var quantity = 1;
//     $.ajax({
//         url: '/product/cart',
//         async: false,
//         type: 'POST',
//         data: {
//             code: code,
//             action: 'add',
//             quantity: quantity,
//         },
//         success: function (datas) {
//             var obj = JSON.parse(datas);
//             $("#menuCart").html(obj.cart);
//             $("#total_price").html(obj.total_price);
//             $("#total_cart").html(obj.total);
//             $("#list_data_checkout").html(obj.list_data_checkout);
//             $(".process").css("display", "inline");
//         },
//         error: function () { }
//     });
// });

// $(document).on('click', '.tooltip-add-compare', function (e) {
//     var code = $(this).attr('code');
//     var type_page = $(this).attr('type_page');
//     $.ajax({
//         url: '/product/cart',
//         async: false,
//         type: 'POST',
//         data: {
//             code: code,
//             action: 'add-compare',
//         },
//         success: function (datas) {
//             var obj = JSON.parse(datas);
//             if (obj.warning_compare !== "") {
//                 showMessage(obj.warning_compare);
//             }
//             $("#compare_toal").html(obj.total_compare);
//             var data_c = obj.data_compare;

//             var color = '#004dda';
//             var color2 = '#fff';
//             if (type_page === 'list') {
//                 color = '#FFC107';
//                 color2 = '#f0f0f0';
//             }
//             $('.tooltip-add-compare').each(function (i) {
//                 $(this).css('background-color', color2);
//             });
//             for (var code in data_c) {
//                 $("#compare_" + code).css('background-color', color);
//             }
//         },
//         error: function () { }
//     });
// });

// function getData(page = "", type = "") {
//     if (page !== '') {
//         cpage = page;
//     }
//     var datasS = {};
//     $.ajax({
//         url: '/product/getList',
//         async: false,
//         type: 'POST',
//         data: {
//             page: cpage,
//             type: type,
//             datasS: datasS,
//         },
//         success: function (datas) {
//             var obj = JSON.parse(datas);
//             if (obj.content !== '') {
//                 $('#listProduct').html(obj.content);
//                 if (obj.count > 12) {
//                     $("#showpagination").html(obj.paging);
//                 } else {
//                     $("#showpagination").html("");
//                 }
//             } else {
//                 $('#listProduct').html("No item");
//             }
//             setCookie('search_form', "");
//         },
//         error: function () { }
//     });
// }

// function setCookie(name, value, days) {
//     var expires = "";
//     if (days) {
//         var date = new Date();
//         date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
//         expires = "; expires=" + date.toUTCString();
//     }
//     document.cookie = name + "=" + (value || "") + expires + "; path=/";
// }

// function getCookie(name) {
//     var nameEQ = name + "=";
//     var ca = document.cookie.split(';');
//     for (var i = 0; i < ca.length; i++) {
//         var c = ca[i];
//         while (c.charAt(0) == ' ') c = c.substring(1, c.length);
//         if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
//     }
//     return null;
// }

// function showMessage(message) {
//     $(".error").show().text(message).animate({
//         opacity: 1
//     }, 800);
//     setTimeout(function () {
//         $(".error").animate({
//             opacity: 0
//         });
//     }, 3000);
// }

// function loadingForm(s) {
//     var gridDatas = 'headerSearch';
//     if (formSearch !== "") {
//         var elFS = jQuery("#" + formSearch);
//         if (elFS.height() <= ($(window).height())) {
//             elFS.cenrerY = true;
//         }
//     }
//     if (gridDatas !== "") {
//         var el = jQuery("#" + gridDatas);
//         if (el.height() <= ($(window).height())) {
//             el.cenrerY = true;
//         }
//     }
//     if (s === true) {
//         if (formSearch !== "") {
//             $(elFS).block({
//                 message: '<i class="ti-hc-reload ti-hc ti-reload"></i>',
//                 baseZ: elFS.zIndex ? elFS.zIndex : 1000,
//                 centerY: elFS.cenrerY != undefined ? elFS.cenrerY : false,
//                 css: {
//                     top: '10%',
//                     border: '0',
//                     padding: '0',
//                     backgroundColor: 'none'
//                 },
//                 overlayCSS: {
//                     backgroundColor: elFS.overlayColor ? elFS.overlayColor : '#000',
//                     opacity: elFS.boxed ? 0.05 : 0.1,
//                     cursor: 'wait'
//                 }
//             });
//         }
//         if (gridDatas !== "") {
//             $(el).block({
//                 message: '<i class="ti-hc-reload ti-hc ti-reload"></i>',
//                 baseZ: el.zIndex ? el.zIndex : 1000,
//                 centerY: el.cenrerY != undefined ? el.cenrerY : false,
//                 css: {
//                     top: '10%',
//                     border: '0',
//                     padding: '0',
//                     backgroundColor: 'none'
//                 },
//                 overlayCSS: {
//                     backgroundColor: el.overlayColor ? el.overlayColor : '#000',
//                     opacity: el.boxed ? 0.05 : 0.1,
//                     cursor: 'wait'
//                 }
//             });
//         }
//     } else {
//         if (formSearch !== "") {
//             $(elFS).unblock();
//         }
//         if (gridDatas !== "") {
//             $(el).unblock();
//         }
//     }
// }