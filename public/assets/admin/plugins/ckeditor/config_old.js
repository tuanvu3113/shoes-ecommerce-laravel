/*
 Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
 For licensing, see LICENSE.html or http://ckeditor.com/license
 */
var DIR_FOLDER = ''; // Nếu trên host thì để rỗng
CKEDITOR.editorConfig = function(config) {

    config.filebrowserBrowseUrl = DIR_FOLDER + 'editor/kcfinder/browse.php?type=files';
    config.filebrowserImageBrowseUrl = DIR_FOLDER + 'editor/kcfinder/browse.php?type=images';
    config.filebrowserFlashBrowseUrl = DIR_FOLDER + 'editor/kcfinder/browse.php?type=flash';
    config.filebrowserUploadUrl = DIR_FOLDER + 'editor/kcfinder/upload.php?type=files';
    config.filebrowserImageUploadUrl = DIR_FOLDER + 'editor/kcfinder/upload.php?type=images';
    config.filebrowserFlashUploadUrl = DIR_FOLDER + 'editor/kcfinder/upload.php?type=flash';

    config.toolbar = 'MyToolbar';
    config.toolbar_MyToolbar =
            [
                {name: 'document', items: ['Source', '-', 'Save', 'NewPage', 'DocProps', 'Preview', 'Print', '-', 'Templates']},
                {name: 'clipboard', items: ['Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo']},
                {name: 'editing', items: ['Find', 'Replace', '-', 'SelectAll']},
                
                '/',
                {name: 'basicstyles', items: ['Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat']},
                {name: 'paragraph', items: ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', 'CreateDiv',
                        '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', '-', 'BidiLtr', 'BidiRtl']},
                {name: 'links', items: ['Link', 'Unlink', 'Anchor']},
                {name: 'insert', items: ['Image', 'Flash', 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar', 'PageBreak', 'Iframe']},
                '/',
                {name: 'styles', items: ['Styles', 'Format', 'Font', 'FontSize']},
                {name: 'colors', items: ['TextColor', 'BGColor']},
                {name: 'tools', items: ['Maximize', 'ShowBlocks', '-']}
            ];

};


var width = 800;
var height = 400;
var iLeft = (screen.width - width) / 2;
var iTop = (screen.height - height) / 2;
function openKCFinder(field, type, path_upload, add) {

    window.KCFinder = {
        callBack: function(url) {
            if (path_upload && path_upload != "") {
                var urlArray = url.split(path_upload);   // cắt bỏ đường dẫn thư mục gốc chứa hình ảnh
                url = urlArray[1];
            }
            $("#" + field).val(url);
            window.KCFinder = null;
            if (add)
                addtion();

        }
    };
    window.open(DIR_FOLDER + 'editor/kcfinder/browse.php?type=' + type + '&dir=' + type + '/public', 'kcfinder_textbox',
            'status=0, toolbar=0, location=0, menubar=0, directories=0,resizable=1, scrollbars=0, width=' + width + ', height=' + height + ',top=' + iTop + ",left=" + iLeft);
}

/* -----------------------------------
 * Upload hiển thị qua hình ảnh      |
 * -----------------------------------
 * function openKCFinder(div) {
 window.KCFinder = {
 callBack: function(url) {
 window.KCFinder = null;
 div.innerHTML = '<div style="margin:5px">Loading...</div>';
 var img = new Image();
 img.src = url;
 img.onload = function() {
 div.innerHTML = '<img id="img" src="' + url + '" />';
 var img = document.getElementById('img');
 var o_w = img.offsetWidth;
 var o_h = img.offsetHeight;
 var f_w = div.offsetWidth;
 var f_h = div.offsetHeight;
 if ((o_w > f_w) || (o_h > f_h)) {
 if ((f_w / f_h) > (o_w / o_h))
 f_w = parseInt((o_w * f_h) / o_h);
 else if ((f_w / f_h) < (o_w / o_h))
 f_h = parseInt((o_h * f_w) / o_w);
 img.style.width = f_w + "px";
 img.style.height = f_h + "px";
 } else {
 f_w = o_w;
 f_h = o_h;
 }
 img.style.marginLeft = parseInt((div.offsetWidth - f_w) / 2) + 'px';
 img.style.marginTop = parseInt((div.offsetHeight - f_h) / 2) + 'px';
 img.style.visibility = "visible";
 }
 }
 };
 window.open('/demo/kcfinder/browse.php?type=images&dir=images/public',
 'kcfinder_image', 'status=0, toolbar=0, location=0, menubar=0, ' +
 'directories=0, resizable=1, scrollbars=0, width=800, height=600'
 );
 }
 uses: <div id="image" onclick="openKCFinder(this)"><div style="margin:5px">Click here to choose an image</div></div>
 */

/*
 * Multiple files - Upload nhiều hình
 *
 function openKCFinder(textarea) {
 window.KCFinder = {
 callBackMultiple: function(files) {
 window.KCFinder = null;
 textarea.value = "";
 for (var i = 0; i < files.length; i++)
 textarea.value += files[i] + "\n";
 }
 };
 window.open('/demo/kcfinder/browse.php?type=files&dir=files/public',
 'kcfinder_multiple', 'status=0, toolbar=0, location=0, menubar=0, ' +
 'directories=0, resizable=1, scrollbars=0, width=800, height=600'
 );
 }
 * USES: 
 <textarea id="files" readonly="readonly" onclick="openKCFinder(this)">Click here and choose multiple files with the Ctrl/Command key. Then right click on one of them and choose "Select"</textarea>
 **/

/*----------------------------
 * Load iframe chọn hình      |
 * ---------------------------
 function openKCFinder(field) {
 var div = document.getElementById('kcfinder_div');
 if (div.style.display == "block") {
 div.style.display = 'none';
 div.innerHTML = '';
 return;
 }
 window.KCFinder = {
 callBack: function(url) {
 window.KCFinder = null;
 field.value = url;
 div.style.display = 'none';
 div.innerHTML = '';
 }
 };
 div.innerHTML = '<iframe name="kcfinder_iframe" src="/demo/kcfinder/browse.php?type=files&dir=files/public" ' +
 'frameborder="0" width="100%" height="100%" marginwidth="0" marginheight="0" scrolling="no" />';
 div.style.display = 'block';
 }
 USES: 
 Selected file:
 <input type="text" readonly="readonly" value="Click here to browse the server" onclick="openKCFinder(this)" style="width:600px;cursor:pointer" /><br />
 <div id="kcfinder_div"></div>
 **/