
function showMsg(_content) {
	window.parent.showMsg(_content);
}

function showModal(_type, _title, _area, _content, _tableObj, isFull) {
    window.parent.showLayer(_type, _title, _area, _content, _tableObj, isFull);
}

function showConfirm(_content, _callback) {
    return window.parent.showConfirm(_content, _callback);
}

function showFullModal(_type, _area, _content, isFull) {
    return window.parent.showFullModal(_type, " ", _area, _content, isFull);
}

function comfirmDeleteData(_table, _checkedBox, _url) {
    var checkedLength = _checkedBox.length;
    if(checkedLength == 0) {
        showMsg("请选择需要删除的数据！");
        return;
    }
	window.parent.showComfirmDelData(_table, _checkedBox, _url);
}


/** 
 * 日期格式化 
 */  
Date.prototype.format = function(format) {  
    /* 
     * eg:format="yyyy-MM-dd hh:mm:ss"; 
     */  
    var o = {  
        "M+" : this.getMonth() + 1, // month  
        "d+" : this.getDate(), // day  
        "h+" : this.getHours(), // hour  
        "m+" : this.getMinutes(), // minute  
        "s+" : this.getSeconds(), // second  
        "q+" : Math.floor((this.getMonth() + 3) / 3), // quarter  
        "S" : this.getMilliseconds()  
        // millisecond  
    }  

    if (/(y+)/.test(format)) {  
        format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4  
                        - RegExp.$1.length));  
    }  

    for (var k in o) {  
        if (new RegExp("(" + k + ")").test(format)) {  
            format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));  
        }  
    }  
    return format;  
}

function initCheckBox() {
    $("input:checkbox").each(function(){
        if($(this).hasClass("initCompleted") === false) {
            $(this).addClass('initCompleted');
            $(this).uniform();
        }
    });
	setTimeout(initCheckBox, 200);
}

function initTab() {
    var toolHtml = $('#btn-data-tools').html();
    $('.div_right').append(toolHtml);
    initCheckBox();
}

function getInitConfig() {
    return config = {
        "processing" : true,
        "pageLength" : 5,
        "destroy": true,
        "serverSide" : false,
        "lengthMenu" : [ [ 5, 10, 20, -1 ], [ 5, 10, 20, "全部" ] ],
        "dom" : '<"top"l<"div_right">>rt<"bottom"ip><"clear">',
        'columnDefs': [{
            'orderable' : false,
            "searchable" : false,
            "targets": [0]
        }],
        "order" : [ [ 1, "asc" ] ],
        'initComplete' : initTab,
        "language" : {
            "lengthMenu" : "_MENU_ 条记录每页",
            "zeroRecords" : " ",
            "info" : "第 _PAGE_ 页 ( 总共 _PAGES_ 页 )",
            "infoEmpty" : "无记录",
            "infoFiltered" : "(从 _MAX_ 条记录过滤)",
            "paginate" : {
                "previous" : "上一页",
                "next" : "下一页"
            }
        }
    };
}

function renderCalendar(cid, url) {
	
    var date = new Date();
    var d = date.getDate();
    var m = date.getMonth();
    var y = date.getFullYear();
    
    $('#' + cid).addClass("mobile");
    $('#' + cid).fullCalendar({
        header:  {
            left: 'title',
            center: '',
            right: 'prev,next,today,month'
//            right: 'prev,next,today,month,agendaWeek,agendaDay'
        },
        titleFormat: {
            month: 'YYYY年MM月'
        },
        defaultView: 'month',
        contentHeight: 200,
        aspectRatio: 1,
        slotMinutes: 15,
        lang: 'zh-cn',
        editable: true,
        events: 'stat/online/calendar',
//        selectable: true,
//        selectHelper: true,
//        select: function(startDate, endDate, allDay, jsEvent, view){
//			alert("select==============" + startDate.format('YYYY-MM-DD HH:mm:ss'));
//			alert("select====22==========" + endDate.format('YYYY-MM-DD HH:mm:ss'));
//			alert('Event: ' + jsEvent.title);
//    	},
    	dayClick: function(date, jsEvent, view) {
//            alert('Clicked on: ' + date.format('YYYY-MM-DD HH:mm:ss'));
//            alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
//            alert('Current view: ' + view.name);
//            $(this).css('background-color', 'red');
        },
		eventClick: function(calEvent, jsEvent, view) {
//			alert('Event: ' + calEvent.id);
//	        alert('Event: ' + calEvent.title);
//	        alert('Event: ' + calEvent.start);
//	        alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
//	        alert('View: ' + view.name);
	        $(this).css('background-color', '#00CD00');
	        var _date = calEvent.id;
	        showFullModal(2, [ '1000px', '550px' ], "stat/online/list/" + _date);
    	}
//    	eventResizeStop: function( event, jsEvent, ui, view ) {
//    		alert(22222222222211);
//    	},
//    	eventDragStop: function( event, jsEvent, ui, view ) {
//    		alert(22222222222211);
//    	},
//    	eventRender: function(event, element) {
////    		alert(22222222222211);
//        },
//        eventAfterRender: function( event, element, view ) {
//        	alert(9999999999999);
//        	
//        	alert(view.title);
//        	alert(view.start);
//        },
//        resourceRender: function(resourceObj, labelTds, bodyTds) {
//        	alert(11111111111111);
//        },
//        loading:function( isLoading, view ) {
//        	alert(8977);
//        }
    });
	
	
}

//Touchspin边框去除操作
function addClassSpin() {
    $('.form-group').find(".bootstrap-touchspin-down, .bootstrap-touchspin-up").addClass('btn-touchspin-bordered');
    $('.form-group').find(".input-group-btn").addClass('btn-touchspin-hover');
}


/**
 * 表格添加序号列
 * 需要在现在表格里面先配置该列
 * @param _tableObj
 */
function addTableNoCol(_tableObj) {
    _tableObj.on('order.dt search.dt',
        function() {
        _tableObj.column(0, {
                search: 'applied',
                order: 'applied'
            }).nodes().each(function(cell, i) {
                cell.innerHTML = i + 1;
            });
    }).draw();
}

//表单校验提交 begin
function initFormValidate1(formId) {
    $('#' + formId).validate({
        errorElement: 'span',
        errorClass: 'help-block help-block-error',
        focusInvalid: false,
        ignore: "",
        errorPlacement: function(error, element) {
            if (element.is(':checkbox')) {
                error.insertAfter(element.closest(".md-checkbox-list, .md-checkbox-inline, .checkbox-list, .checkbox-inline"));
            } else if (element.is(':radio')) {
                error.insertAfter(element.closest(".md-radio-list, .md-radio-inline, .radio-list,.radio-inline"));
            } else {
                error.insertAfter(element);
            }
        },
        highlight: function(element) {
            $(element).closest('.form-group').addClass('has-error');
        },
        unhighlight: function(element) {
            $(element).closest('.form-group').removeClass('has-error');
        },
        success: function(label) {
            label.closest('.form-group').removeClass('has-error');
        },
        invalidHandler: function(event, validator) {
            return false;
        }
    });
}

function initFormValidate(formId, rules, submitUrl, opType) {
    $('#' + formId).validate({
        errorElement: 'span',
        errorClass: 'help-block help-block-error',
        focusInvalid: false,
        ignore: "",
        rules: rules,
        errorPlacement: function(error, element) {
            if (element.is(':checkbox')) {
                error.insertAfter(element.closest(".md-checkbox-list, .md-checkbox-inline, .checkbox-list, .checkbox-inline"));
            } else if (element.is(':radio')) {
                error.insertAfter(element.closest(".md-radio-list, .md-radio-inline, .radio-list,.radio-inline"));
            } else {
                error.insertAfter(element);
            }
        },
        highlight: function(element) {
            $(element).closest('.form-group').addClass('has-error');
        },
        unhighlight: function(element) {
            $(element).closest('.form-group').removeClass('has-error');
        },
        success: function(label) {
            label.closest('.form-group').removeClass('has-error');
        },
        invalidHandler: function(event, validator) {
            return false;
        },
        //以下提交动作在使用页面自定义
        submitHandler: function(form) {
            if(opType === 'add') {
                ajaxSubmitForm(submitUrl, form);
            }else if(opType === 'update'){
                ajaxSubmitUpdate(submitUrl, form);
            }else {
                showMsg("操作类型设置有误！");
                return false;
            }
        }
    });
}

//新增提交
function ajaxSubmitForm(surl, form) {
    $.ajax({
        type: 'post',
        url: surl,
        data: $(form).serialize(),
        dataType: "json",
        async: false,
        success: function (data) {
            showConfirm("添加成功，是否继续添加？");
        },
        error: function() {
            alert("添加失败，请稍后重试！");
        }
    });
}

//更新提交
function ajaxSubmitUpdate(surl, form) {
    $.ajax({
        url:surl,
        type: 'POST',
        dataType: "json",
        data: $(form).serialize(),
        async:false,
        success:function (data) {
            showMsg("修改成功！");
            window.parent.reloadData();
            //当你在iframe页面关闭自身时
            var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
            parent.layer.close(index); //再执行关闭 
        },
        error:function() {
            showMsg("修改操作发生错误！");
        }
    });
}
//表单校验提交 end


/**
 * 表格数据删除操作
 */
function deleteData(_table, _checkedBox, _url) {
    //var checkedBox = $("#tabMntTaskInfo tbody tr td .checked");
    //var checkedLength = _checkedBox.length;
    var taskIdAry = [];
    _checkedBox.find('input:checkbox').each(function(){
        taskIdAry.push($(this).val());
    });
    $.ajax({
        url: _url + taskIdAry,
        dataType: 'json',
        async:false,
        success:function (data) {
            showMsg("删除成功！");
            _table.ajax.reload(null,false);
        },
        error:function() {
            showMsg("删除操作发生错误！");
        }
    });
}

//===========表单校验提交 begin ========================================
//获取该产品下的产品版本
function loadVerCodeSelectDynamic(_tarSelectId, _srcSelectId, _url) {
    if(_url == undefined || _url == null || _url == '') {
    	if(_url == undefined || _url == null || _url == '') {
    		return false;
    	}
    	var _srcSelectVal = $("#" + _srcSelectId).val();
    	_url = "load/select/ver/" + _srcSelectVal;
    }
    loadSelectBox(_url, _tarSelectId);
}

//关联加载页面下拉框
function loadSelectUI(_url, _tarSelectId, type) {
    loadSelectBox(_url, _tarSelectId);
    if(type == 2){
        $('#' + _tarSelectId).prepend("<option value='-1' selected>全部</option>");
        $('#' + _tarSelectId).select2({
            minimumResultsForSearch: Infinity
        });
    }else {
        $('#' + _tarSelectId).selectpicker('refresh');
    }
}


//获取该产品下的产品版本
function loadVerCodeSelect(type) {
    var _prodId = $("#prodId").val();
    loadSelectBox("load/select/ver/" + _prodId, "verCode");
    if(type == 2){
    	$('#verCode').prepend("<option value='-1' selected>全部</option>");
    	$('#verCode').select2({
    		minimumResultsForSearch: Infinity
    	});
    }else {
    	$('#verCode').selectpicker('refresh');
    }
}

//获取该产品版本下的发布版本
function loadRelSelect(type) {
	var _prodId = $("#prodId").val();
    var _verCode = $("#verCode").val();
    loadSelectBox("load/select/rel/" + _prodId + "/" + _verCode, "relId");
    if(type == 2){
    	$('#relId').prepend("<option value='-1' selected>全部</option>");
    	$('#relId').select2({
    		minimumResultsForSearch: Infinity
    	});
    }else {
    	$('#relId').selectpicker('refresh');
    }
}

//获取该发布版本下的明细
function loadRelDtlSelect(type) {
	var _relId = $("#relId").val();
    loadSelectBox("load/select/dtl/" + _relId, "relDtlId");
    if(type == 2){
    	$('#relDtlId').prepend("<option value='-1' selected>全部</option>");
    	$('#relDtlId').select2({
    		minimumResultsForSearch: Infinity
    	});
    }else {
    	$('#relDtlId').selectpicker('refresh');
    }
}

//获取模块下的Lib
function loadLibSelect(type) {
	var _moduleId = $("#moduleId").val();
    loadSelectBox("load/select/lib/" + _moduleId, "libId");
    if(type == 2){
    	$('#libId').prepend("<option value='-1' selected>全部</option>");
    	$('#libId').select2({
    		minimumResultsForSearch: Infinity
    	});
    }else {
    	$('#libId').selectpicker('refresh');
    }
}

//获取该产品版本下的模块
function loadModuleSelect(type) {
	var _prodId = $("#prodId").val();
    var _verCode = $("#verCode").val();
    loadSelectBox("load/select/module/" + _prodId + "/" + _verCode, "moduleId");
    if(type == 2){
    	$('#moduleId').prepend("<option value='-1' selected>全部</option>");
    	$('#moduleId').select2({
    		minimumResultsForSearch: Infinity
    	});
    }else {
//    	$('#moduleId').prepend("<option value='-1' selected>无</option>");
    	$('#moduleId').selectpicker('refresh');
    }
}

//获取该产品版本下的模块
function loadParentModuleSelect(type) {
    var _prodId = $("#prodId").val();
    var _verCode = $("#verCode").val();
    loadSelectBox("load/select/module/" + _prodId + "/" + _verCode, "parentModuleId");
    if(type == 2){
        $('#parentModuleId').prepend("<option value='-1' selected>全部</option>");
        $('#parentModuleId').select2({
            minimumResultsForSearch: Infinity
        });
    }else {
        $('#parentModuleId').prepend("<option value='-1' selected>无</option>");
        $('#parentModuleId').selectpicker('refresh');
    }
}

/**
 * 加载下拉框数据
 */
function loadSelectBox(_url, _selectId) {
	var _oSelect = $("#" + _selectId);
    $.ajax({
        url: _url,
        dataType: "json",
        async:false,
        success:function (data) {
        	_oSelect.empty();
            for(var index in data) {
                for(var d in data[index]) {
                	_oSelect.append("<option value=" + d + ">" + data[index][d] + "</option>");
                }
            }
//            _oSelect.selectpicker('refresh');
        },
        error:function() {
            showMsg("加载下拉框出现错误！");
        }
    });
}


/**
 * KEY和VAL均为TEXT
 * @param _url
 * @param _selectId
 */
//获取该产品版本下的发布版本
function loadRelSelect2(type) {
	var _prodId = $("#prodId").val();
    var _verCode = $("#verCode").val();
    loadSelectBox2("load/select/rel/" + _prodId + "/" + _verCode, "relCode");
    if(type == 2){
    	$('#relCode').prepend("<option value='-1' selected>全部</option>");
    	$('#relCode').select2({
    		minimumResultsForSearch: Infinity
    	});
    }else {
    	$('#relCode').selectpicker('refresh');
    }
}

function loadSelectBox2(_url, _selectId) {
	var _oSelect = $("#" + _selectId);
    $.ajax({
        url: _url,
        dataType: "json",
        async:false,
        success:function (data) {
        	_oSelect.empty();
            for(var index in data) {
                for(var d in data[index]) {
                	_oSelect.append("<option value=" + data[index][d] + ">" + data[index][d] + "</option>");
                }
            }
//            _oSelect.selectpicker('refresh');
        },
        error:function() {
            showMsg("加载下拉框出现错误！");
        }
    });
}

function refreshSelect2() {
    //下拉框.select2
	$(".select2").select2({
		minimumResultsForSearch: Infinity
	});
	
    //下拉框.select2
	$(".select2Search").select2();
}

//===========表单校验提交 end ========================================

function clearHtmlTag(str){
	return str.replace(/<[^>]+>/g,"").replace(/&nbsp;/ig, "");//去掉所有的html标签
}


jQuery(document).ready(function() {
	
//    $('input').iCheck({
//        checkboxClass: 'icheckbox_minimal',
//        radioClass: 'iradio_minimal',
//        increaseArea: '10%' // optional
//     });
//    
//    $('#tab-th-chk').on('ifChecked', function(event){
//        $('input').iCheck('check');
//    });
//    
//    $('#tab-th-chk').on('ifUnchecked', function(event){
//        $('input').iCheck('uncheck');
//    });
    
//    $('input').icheck('destroy').icheck();
    
//    $('#tabRelease tbody').on('dblclick', 'tr', function() {
//        if($(this).find('input').is(':checked')) {
//          $(this).find('input').iCheck('uncheck');
//        }else {
//          $(this).find('input').iCheck('check');
//        }
//    });
//    $('#tabRelease tbody tr').on('dblclick', function() {
//        if($(this).find('input').attr('checked')) {
//            $(this).find('input').removeAttr('checked');
//            $(this).find('span').removeClass('checked');
//        }else {
//            $(this).find('input').attr('checked', true);
//            $(this).find('span').addClass('checked');
//        }
//    });
//  $('#tabRelease thead .checkbox-datatables').on('ifChecked', 'input', function(event){
//  $('input').iCheck('check');
//});

//$('#tabRelease thead .checkbox-datatables').on('ifUnchecked', 'input', function(event){
//  $('input').iCheck('uncheck');
//});
	
    //全选
    $('table thead .checkbox-datatables').on('click', 'input', function(event){
        if($(this).is(':checked')) {
            $('table tbody tr').find('span:first').addClass('checked');
            $('table tbody tr').find('input').attr('checked', true);
        }else {
            $('table tbody tr').find('input').removeAttr('checked');
            $('table tbody tr').find('span:first').removeClass('checked');
        }
    });
    
//    $('body').on('click', function(event){
//        initCheckBox();
//    });
    
    //日期选择
    $('.date-picker').datepicker({
        language: 'zh-CN',
        autoclose: true,
        todayHighlight: true
    })
    
    //下拉框.select2
    refreshSelect2();
    
    //tr选取变色
    $('table tbody').on( 'click', 'tr', function () {
        if ($(this).hasClass('selected')) {
            $(this).removeClass('selected');
        }else {
            $('table tbody tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
    });
    
    //表头hover当前表头下的所有表格高亮变色
    $('table thead tr th').hover(function () {
    	var idx = $(this).parent('tr').find('th').index(this);
        var dc = $(this).closest('.dataTables_scroll');
        var _tbodyContent = dc.find('.dataTables_scrollBody').find('tbody tr');
        _tbodyContent.find('td:eq('+ idx +')').addClass('th-hover-td ');
    },function(){
    	var idx = $(this).parent('tr').find('th').index(this);
        var dc = $(this).closest('.dataTables_scroll');
        var _tbodyContent = dc.find('.dataTables_scrollBody').find('tbody tr');
        _tbodyContent.find('td:eq('+ idx +')').removeClass('th-hover-td ');
    });
    var obj;
    $('table thead tr th').click(function () {
    	var idx = $(this).parent('tr').find('th').index(this);
        var dc = $(this).closest('.dataTables_scroll');
        var _tbodyContent = dc.find('.dataTables_scrollBody').find('tbody tr');
        _tbodyContent.find('td:eq('+ idx +')').removeClass('th-hover-td ');
    	
    	obj = $(this);
    	setTimeout(function(){
    		var idx = obj.parent('tr').find('th').index(obj);
    		var dc = obj.closest('.dataTables_scroll');
    		var _tbodyContent = dc.find('.dataTables_scrollBody').find('tbody tr');
    		_tbodyContent.find('td:eq('+ idx +')').addClass('th-hover-td ');
    	},100);
    });
    //非scollX类型表格表头hover当前表头下的所有表格高亮变色
    $('table thead tr th').hover(function () {
    	var idx = $(this).parent('tr').find('th').index(this);
        var _table = $(this).closest('table');
        var _tbodyContent = _table.find('tbody tr');
        _tbodyContent.find('td:eq('+ idx +')').addClass('th-hover-td ');
    },function(){
    	var idx = $(this).parent('tr').find('th').index(this);
        var _table = $(this).closest('table');
        var _tbodyContent = _table.find('tbody tr');
        _tbodyContent.find('td:eq('+ idx +')').removeClass('th-hover-td ');
    });
    $('table thead tr th').click(function () {
    	var idx = $(this).parent('tr').find('th').index(this);
        var _table = $(this).closest('table');
        var _tbodyContent = _table.find('tbody tr');
        _tbodyContent.find('td:eq('+ idx +')').removeClass('th-hover-td ');
    	obj = $(this);
    	setTimeout(function(){
        	var idx = obj.parent('tr').find('th').index(obj);
            var _table = obj.closest('table');
            var _tbodyContent = _table.find('tbody tr');
    		_tbodyContent.find('td:eq('+ idx +')').addClass('th-hover-td ');
    	},100);
    });
    
    javascript:window.history.forward(1);
    window.onbeforeunload=function (){}
});
