Optimize = {
	initFormControl: function(){
		$(".search").each(function(){
			var name = $(this).attr('id');
			var val = $(this).val();
			var optsl = $(this).attr('optsl');
			if(optsl != undefined){
				var optslClick = $(this).attr('optslClick');
				var configSelect = {};
				configSelect[optsl] = true;
				configSelect['filter'] = true;
				configSelect['placeholder'] = $(this).attr('placeholder');
				if(optslClick != undefined){ configSelect['onClick'] = eval(optslClick); }
				$('#'+name).multipleSelect(configSelect);
				$('#'+name).multipleSelect('uncheckAll');
				if(configSelect.onClick != undefined){
					$( "input[name*='selectAll"+name+"']" ).click(function(){ 
						var func = eval(optslClick); if(typeof func == 'function'){ func(); }
					});
				}
				$('#'+name).parent().find('.option').css({'padding-left': '20px'});
			}
		});
		$('.multiple').css({'width': 'auto', 'min-width' : '100%'});
		//$('.option').css({'padding-left': '20px'});
		
		$("#"+gridView+" tr td").live('click',function(){
			if(
				$(this).parent().parent().find('.edit').length < 1 || 
				$(this).find('.check').length > 0 || 
				$(this).find('.delete').length > 0
			){
				console.log('--prevent click--');
				if($(this).find('.check').length > 0){
					if($('.check').parent().find($( "input[type=checkbox]:checked" )).length == $('.check').length){
						$('#checkAll').attr("checked","checked");
					} else {
						$('#checkAll').removeAttr("checked");
					}
				}
			} else {
				var objTr = $(this).parent().find('.edit');
				var id = objTr.attr('id');
				var datas = objTr.attr('datas');
				var p = Optimize.parseJson(datas);
				for (var key in p) {
					if (p.hasOwnProperty(key)) {
						var valTmp = p[key];
						var objTmp = $('#'+key);
						var optsl = objTmp.attr('optsl');
						var opttimepicker = objTmp.attr('timepicker');
						var optType = objTmp.attr('type');
						if(optsl != undefined){
							valTmp = valTmp.toString();
							if(valTmp != ''){
								$('#'+key).multipleSelect('setSelects', valTmp.split(','));
							}
							var optslClick = objTmp.attr('optslClick');
							if(optslClick != undefined){
								var func = eval(optslClick);
								if(typeof func == 'function'){
									func();
								}
							}
						} else if(opttimepicker != undefined){
							$('#'+key).timepicker('setTime', valTmp);
						} else if(optType == 'checkbox'){
							valTmp = valTmp == 1 ? true : false;
							$('#'+key).attr('checked', valTmp);
						} else {
							$('#'+key).val(valTmp);
						}
					}
				}
				$('body, html').animate({scrollTop:0},800);
			}
		});
		
		return false;
	},
	getFormControlValue: function(){
		var search = {};
		$(".search").each(function(){
			var name = $(this).attr('id');
			var val = $(this).val();
			var optsl = $(this).attr('optsl');
			var optslCheckAllForSearch = $(this).attr('optslCheckAllForSearch');
			if(optsl != undefined){
				val = $('#'+name).multipleSelect('getSelects');
				if(val == "''" || val == '' || typeof val == 'object'){
					if(optslCheckAllForSearch != undefined){
						$('#'+name).multipleSelect('checkAll');
						val = $('#'+name).multipleSelect('getSelects');
						$('#'+name).multipleSelect('uncheckAll');
					}
				}				
				if(val == "''" || val == '' || typeof val == 'object'){
					val = '';
				}
			}
			if(name != undefined){
				var checkType = $(this).attr('type');
				if(checkType != 'checkbox'){
					search[name] = val;
				} else {
					search[name] = $('#'+name).is(':checked') == true ? 1 : 0;
				}
			}
		});
		var searchs = JSON.stringify(search);
		return searchs;
	},
	getDataWithAjax: function(page){
		var searchs = '';
		//console.log(searchCookie);
		searchs = searchCookie = Optimize.getFormControlValue();
		if(searchCookie == '' || searchCookie == undefined){
			// searchs = searchCookie = Optimize.getFormControlValue();
		} else {
			// searchs = searchCookie;
		}
		//console.log(searchCookie);
		localStorage.cached_search = searchs; // this saved in localStorage
		var el = jQuery("#"+gridView);
		var elFS = jQuery("#"+formView);
		App.blockUI({target: el, iconOnly: true});
        //App.blockUI({target: elFS, iconOnly: false});
		if(ajaxGetList != null){ ajaxGetList.abort(); }
		ajaxGetList = $.ajax({
			type: "POST",
			url: 'getList',
			data: {
				page:page, searchs:searchs
			},
			success: function(data) {
				$("#"+gridView).html(data);
				$('#export_search').val(''); // reset value for export
				App.initAjax();
                App.unblockUI(el);
                App.unblockUI(elFS);
				var checkEdit = $('#edit').attr('id');
				$('#export').unbind('click');
				$('#export').bind('click', function(){
					$('#export_search').val(searchs);
					$('#'+formView).submit();
				});
				if(checkEdit == undefined){ console.log('prevent'); return false; }
				$("#"+gridView+" tr").css({'cursor':'pointer'});
				$('.delete').each(function(){
					$(this).click(function(){
						var idDel = $(this).attr('idDel');
						$.msgBox({
							title: 'Message',
							content: 'Are you sure you want to delete this?',
							type: "alert",
							buttons: [{ value: "Yes"},{ value: "No"}],
							success: function (result) {
								if(result == 'Yes'){
									Optimize.deleteDataWithAjax(idDel);
								}
							}
						}); 
					});
				});
				$("#"+gridView+" tr td").css({'text-align': 'center'});
				$("#"+gridView+" tr th").css({'text-align': 'center'});
				$('#checkAll').live('click', function(){
					if($(this).attr("checked") == 'checked' || $(this).attr("checked") == true){
						$("#"+gridView).find('input.check').attr("checked","checked");
					} else{
						$("#"+gridView).find('input.check').removeAttr("checked");
					}
				});
			},
			error: function(){
				App.initAjax();
                App.unblockUI(el);
                App.unblockUI(elFS);
			}
		});
		return false;
	},
	deleteDataWithAjax: function(idList, callback){
		var el = jQuery("#"+gridView);
		var elFS = jQuery("#"+formView);
		App.blockUI({target: el, iconOnly: true});
        App.blockUI({target: elFS, iconOnly: false});
		$.ajax({
			type:"POST",
			url:"delete",
			data:{idList:idList},
			success:function(data){
				App.unblockUI($('.ccontent'));
				App.initAjax();
                App.unblockUI(el);
                App.unblockUI(elFS);
				$.msgBox({
					title: 'Message',
					content: data,
					type: "alert",
					buttons: [{ value: "OK"}],
					success: function (result) {
						if(data.indexOf('success') >= 0){
							// Optimize.resetFormControl();
							// Optimize.getDataWithAjax(1);
							callback();
						}
					}
				}); 
			}  
		});
	},
	saveDataWithAjax: function(id, dataPost){
		var el = jQuery("#"+gridView);
		var elFS = jQuery("#"+formView);
		App.blockUI({target: el, iconOnly: true});
        App.blockUI({target: elFS, iconOnly: false});
		$.ajax({
			type: "POST",
			url: 'save',
			data: {
				id:id, dataPost:dataPost
			},
			success: function(data) {
				App.initAjax();
                App.unblockUI(el);
                App.unblockUI(elFS);
				$.msgBox({
					title: 'Message',
					content: data,
					type: "alert",
					buttons: [{ value: "OK"}],
					success: function (result) {
						if(data.indexOf('success') >= 0){
							Optimize.resetFormControl();
							//Optimize.getDataWithAjax(1);
						}
					}
				}); 
			},
			error: function(){
				App.initAjax();
                App.unblockUI(el);
                App.unblockUI(elFS);
			}
		});
	},
	getIdListForDelete: function(){
		var idList = '';
		$('#'+gridView+' .check:checked').each(function(){
			id = $(this).val();
			idList += (idList == '' ? '' : ',') + id;
		});
		return idList;
	},
	resetFormControl: function(){
		$(".search").each(function(){
			var preventreset = $(this).attr('preventreset');
			if(preventreset == undefined){
				var name = $(this).attr('id');
				var val = $(this).val();
				var optsl = $(this).attr('optsl');
				var opttimepicker = $(this).attr('timepicker');
				if(optsl != undefined){
					$('#'+name).multipleSelect('uncheckAll');
					var optslClick = $(this).attr('optslClick');
					if(optslClick != undefined){
						var func = eval(optslClick);
						if(typeof func == 'function'){
							func();
						}
					}
				} else if(opttimepicker != undefined){
					$('#'+name).timepicker('setTime', '0:00:00');
					$('#'+name).val('0:00:00');
				} else {
					$('#'+name).val('');
				}
			}
		});
		$('#id_edit').val('');
		searchCookie = '';
		if(searchCookie == '' || searchCookie == undefined){
			//Optimize.getDataWithAjax(1);
		}
	},
	checkEmptyFormControl: function(){
		var msg = '';
		var search = {};
		$(".search").each(function(){
			var name = $(this).attr('id');
			var val = $(this).val();
			var optsl = $(this).attr('optsl');
			var msgEmpty = $(this).attr('msgempty');
			var msgChooseOne = $(this).attr('msgchooseone');
			var optslCheckAllForSearch = $(this).attr('optslCheckAllForSearch');
			if(msgEmpty != undefined){
				if(optsl != undefined){
					val = $('#'+name).multipleSelect('getSelects');
					if(val == "''" || val == '' || typeof val == 'object'){
						msg = msgEmpty; return false;
					}
					if(msgChooseOne != undefined){
						var checkOne = val.split(',');
						if(checkOne.length > 1){
							msg = msgChooseOne; return false;
						}
					}
				} else if(val == ''){
					msg = msgEmpty; return false;
				}
			}
			//for return search
			if(optsl != undefined){
				val = $('#'+name).multipleSelect('getSelects');
				if(val == "''" || val == '' || typeof val == 'object'){
					if(optslCheckAllForSearch != undefined){
						$('#'+name).multipleSelect('checkAll');
						val = $('#'+name).multipleSelect('getSelects');
						$('#'+name).multipleSelect('uncheckAll');
					}
				}				
				if(val == "''" || val == '' || typeof val == 'object'){
					val = '';
				}
			}
			/* if(name != undefined){
				search[name] = val;
			} */
			if(name != undefined){
				var checkType = $(this).attr('type');
				if(checkType != 'checkbox'){
					search[name] = val;
				} else {
					search[name] = $('#'+name).is(':checked') == true ? 1 : 0;
				}
			}
		});
		if(msg != ''){
			return msg;
		}
		return search;
	},
	reloadValueFormControl: function(){
		try{
			var datas = localStorage.cached_search;
			if(datas == undefined || datas == null || datas == ''){ return false; }
			var p = Optimize.parseJson(datas);
			for (var key in p) {
				if (p.hasOwnProperty(key)) {
					var valTmp = p[key];
					var objTmp = $('#'+key);
					var optsl = objTmp.attr('optsl');
					var opttimepicker = objTmp.attr('timepicker');
					var optType = objTmp.attr('type');
					if(optsl != undefined){
						valTmp = valTmp.toString();
						if(valTmp != ''){
							$('#'+key).multipleSelect('setSelects', valTmp.split(','));
						}
						var optslClick = objTmp.attr('optslClick');
						if(optslClick != undefined){
							var func = eval(optslClick);
							if(typeof func == 'function'){
								func();
							}
						}
					} else if(opttimepicker != undefined){
						$('#'+key).timepicker('setTime', valTmp);
					} else if(optType == 'checkbox'){
						valTmp = valTmp == 1 ? true : false;
						$('#'+key).attr('checked', valTmp);
					} else {
						$('#'+key).val(valTmp);
					}
				}
			}
		} catch(exx){}
	},
	parseJson: function (strParse){
		var objectParser = {};
		try{
			objectParser = JSON.parse(strParse);
		} catch(exx){
			console.log(exx);
			objectParser = {};
		}
		return objectParser;
	}
}