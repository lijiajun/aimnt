<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../../included/includedStyle.jsp" %>
</head>

<body class="body-bg">
    <div class="wrapper-box">
        <div class="row">
            <div class="col-md-12">
                <div class="wrapper-content">
                    <div class="portlet-title">
                        <div class="caption font-dark">
                            <i class="icon-layers font-green"></i> <span class="caption-subject bold uppercase"> 更新库文件信息 </span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <form action="#" class="form-horizontal" id="form-update">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            产品类型 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <select name="prodId" class="selectpicker form-control" id="prodId">
                                                <c:forEach items="${prodEnums}" var="prodEnum">
                                                    <c:if test="${prodEnum.key == mntModuleLib.mntProdModule.prodId}">
                                                        <option value="${prodEnum.key}" selected>${prodEnum.value}</option>
                                                    </c:if>
                                                    <c:if test="${prodEnum.key != mntModuleLib.mntProdModule.prodId}">
                                                        <option value="${prodEnum.key}">${prodEnum.value}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请选择产品类型</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            产品版本 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <select name="verCode" class="selectpicker form-control" id="verCode">
                                                <c:forEach items="${verEnums}" var="verEnum">
                                                    <c:if test="${verEnum.key == mntModuleLib.mntProdModule.verCode}">
                                                        <option value="${verEnum.key}" selected>${verEnum.value}</option>
                                                    </c:if>
                                                    <c:if test="${verEnum.key != mntModuleLib.mntProdModule.verCode}">
                                                        <option value="${verEnum.key}">${verEnum.value}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请选择产品版本</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            所属模块 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <select name="moduleId" id="moduleId" class="selectpicker form-control" data-live-search="true">
                                            </select>
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请选择进程所属模块</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            库文件名称 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" value="${mntModuleLib.libName}" name="libName" id="libName">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入库文件名称</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            业务库类型 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <select name="libType" class="selectpicker form-control" id="libType">
                                                <c:forEach items="${libTypeEnums}" var="libTypeEnum">
                                                    <c:if test="${libTypeEnum.key == mntModuleLib.libType}">
                                                        <option value="${libTypeEnum.key}" selected>${libTypeEnum.value}</option>
                                                    </c:if>
                                                    <c:if test="${libTypeEnum.key != mntModuleLib.libType}">
                                                        <option value="${libTypeEnum.key}">${libTypeEnum.value}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请选择业务库类型</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            是否在用 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <select name="isUsed" class="selectpicker form-control" id="isUsed">
                                                <c:forEach items="${isUsedEnums}" var="isUsedEnum">
                                                    <c:if test="${isUsedEnum.key == mntModuleLib.isUsed}">
                                                        <option value="${isUsedEnum.key}" selected>${isUsedEnum.value}</option>
                                                    </c:if>
                                                    <c:if test="${isUsedEnum.key != mntModuleLib.isUsed}">
                                                        <option value="${isUsedEnum.key}">${isUsedEnum.value}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请选择是否在用</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-2 control-label" for="form_control_1">
                                            库文件描述
                                        </label>
                                        <div class="col-md-10">
                                            <textarea class="form-control" name="libDesc" id="libDesc"rows="3">${mntModuleLib.libDesc}</textarea>
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入库文件描述</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group form-md-line-input">
                                    <label class="col-md-2 control-label" for="form_control_1">
                                        依赖库
                                    </label>
                                    <div class="col-md-10">
                                        <div class="show-modal" style="margin-bottom: 3px">
                                            <a class="dt-button btn red btn-outline btn-mnt" data-toggle="modal" href="#relLibModal"> 添加一行 </a>
                                        </div>
                                        <table class="table table-striped table-bordered table-hover table-checkable order-column" id="tabMntLibRelation" cellspacing="0" width="100%">
                                            <thead>
                                                <tr>
                                                    <th>当前库id</th>
                                                    <th>依赖库</th>
                                                    <th>依赖描述</th>
                                                    <th>产品ID</th>
                                                    <th>版本Code</th>
                                                    <th>模块ID</th>
                                                    <th>依赖库库ID</th>
                                                    <th>操作</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${relLibs}" var="relLib">
                                                    <tr>
                                                        <td>${mntModuleLib.libId}</td>
                                                        <td>${relLib.libName}</td>
                                                        <td>${relLib.libDesc}</td>
                                                        <td>${relLib.mntProdModule.prodId}</td>
                                                        <td>${relLib.mntProdModule.verCode}</td>
                                                        <td>${relLib.moduleId}</td>
                                                        <td>${relLib.libId}</td>
                                                        <td>
                                                            <a href="javascript:;" style="margin-right: 3px" class="row-update"><span class="label label-sm label-info"> 修改 </span></a>
                                                            <a href="javascript:;" class="row-remove"><span class="label label-sm label-danger"> 删除 </span></a>
                                                        </td>
                                                    </tr>
                                                </c:forEach >
                                            </tbody>
                                        </table>
                                    </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="col-md-9 model-hidden">
                                        <input type="hidden" value="${mntModuleLib.libId}" name="libId" id="libId">
                                    </div>
                                </div>
                            </div>
                            <div class="form-actions">
                                <div class="row">
                                    <div class="col-md-offset-3 col-md-9">
                                        <button type="submit" class="btn green">提交</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade bs-modal-lg baseModal" id="relLibModal" tabindex="-1" role="relLibModal" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <form action="#" class="form-horizontal" id="form-rel-lib">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                        <h4 class="modal-title">添加关联Lib</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group form-md-line-input">
                                    <label class="col-md-3 control-label" for="form_control_1">
                                        产品类型 <span class="required">*</span>
                                    </label>
                                    <div class="col-md-9">
                                        <select name="prodIdExt" class="selectpicker form-control" id="prodIdExt">
                                            <c:forEach items="${prodEnums}" var="prodEnum">
                                                <option value="${prodEnum.key}">${prodEnum.value}</option>
                                            </c:forEach>
                                        </select>
                                        <div class="form-control-focus"></div>
                                        <span class="help-block">请选择产品类型</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group form-md-line-input">
                                    <label class="col-md-3 control-label" for="form_control_1">
                                        产品版本 <span class="required">*</span>
                                    </label>
                                    <div class="col-md-9">
                                        <select name="verCodeExt" class="selectpicker form-control" id="verCodeExt">
                                        </select>
                                        <div class="form-control-focus"></div>
                                        <span class="help-block">请选择产品版本</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group form-md-line-input">
                                    <label class="col-md-3 control-label" for="form_control_1">
                                        所属模块 <span class="required">*</span>
                                    </label>
                                    <div class="col-md-9">
                                        <select name="moduleIdExt" id="moduleIdExt" class="selectpicker form-control" data-live-search="true">
                                        </select>
                                        <div class="form-control-focus"></div>
                                        <span class="help-block">请选择进程所属模块</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group form-md-line-input">
                                    <label class="col-md-3 control-label" for="form_control_1">
                                        依赖库 <span class="required">*</span>
                                    </label>
                                    <div class="col-md-9">
                                        <select name="relLibIdExt" id="relLibIdExt" class="selectpicker form-control" data-live-search="true">
                                        </select>
                                        <div class="form-control-focus"></div>
                                        <span class="help-block">请选择依赖库</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group form-md-line-input">
                                    <label class="col-md-1 control-label" for="form_control_1">
                                        描述
                                    </label>
                                    <div class="col-md-11">
                                        <textarea class="form-control" name="relDesc" id="relDesc"rows="3"></textarea>
                                        <div class="form-control-focus"></div>
                                        <span class="help-block">请输入依赖描述</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn dark btn-outline" data-dismiss="modal">取消</button>
                        <button type="submit" class="btn green oper-data relLibAdd">添加</button>
<!--                         <button type="submit" class="btn green relLibUpdate">更新</button> -->
                    </div>
                </form>
            </div>
        </div>
    </div>
<%@include file="../../included/includedJs.jsp" %>

<script type="text/javascript">

jQuery(document).ready(function() {
    
    
    loadVerCodeSelect();
    //产品版本赋值
    var _verCode = '${mntModuleLib.mntProdModule.verCode}';
    $('#verCode').val(_verCode);
    $('#verCode').selectpicker('refresh');
    //加载模块select
    loadModuleSelect();
    var _moduleId = '${mntModuleLib.moduleId}';
    $('#moduleId').val(_moduleId);
    $('#moduleId').selectpicker('refresh');
    
    
    $('#prodId').change(function(){
        loadVerCodeSelect();
        loadModuleSelect();
    });
    
    $('#verCode').change(function(){
        loadModuleSelect();
    });
    
    
//     //表单校验提交
//     //[1]自定义校验规则
//     var rules = {
//             prodId: "required",
//             verCode: "required",
//             libName:"required",
//             moduleId:"required",
//             isUsed:"required",
//     };
//     //[2]表单校验初始化
//     initFormValidate('form-update', rules, 'prod/lib/update', 'update');
    
    //表单校验提交
    //[1]自定义校验规则
    $.validator.setDefaults({
        rules: {
            prodId: "required",
            verCode: "required",
            libName:"required",
            moduleId:"required",
            isUsed:"required",
            libType:"required",
        },
        submitHandler: function(form) {
            var formData = $(form).serialize();
            var param = "";
            //表格数据
            tableObj.data().each( function (d, index) {
                param += "&mntLibRelations[" + index + "].relLibId=" + d['relLibId'] + 
                        "&mntLibRelations[" + index + "].relDesc=" + d['relDesc'];
            });
            formData += param;
            console.log(formData);
            $.ajax({
                url: 'prod/lib/update',
                type: 'POST',
                dataType: "json",
                data: formData,
                async:false,
                success:function (data) {
                    showMsg("修改成功！");
                    window.parent.reloadData();
                    var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                    parent.layer.close(index); //再执行关闭 
                },
                error:function() {
                    showMsg("修改操作发生错误！");
                }
            });
        }
    });
    //[2]表单校验初始化
    initFormValidate1('form-update');
    
    
    //================modal=============================================
    //关联Lib
    var tableObj = $('#tabMntLibRelation').DataTable(getConfig());
    
    $('.show-modal').on('click', 'a', function(){
        $('#relDesc').val('');
        if($('.oper-data').hasClass('relLibUpdate')) {
            $('.oper-data').removeClass("relLibUpdate");
            $('.oper-data').addClass("relLibAdd");
        }
        $('.oper-data').html("添加");
        //modal内容加载
        initModalContent();
    });
    
    //删除
    $('#tabMntLibRelation tbody').on('click', 'tr>td>a.row-remove', function(e) {
        if (confirm("确定要删除该行数据？")) {
            tableObj.row($(this).parents('tr')).remove().draw();
        }
    });
    
    //更新
    $('#tabMntLibRelation tbody').on('click', 'tr>td>a.row-update', function(e) {
        $('.show-modal a').click();
        
        $('.oper-data').removeClass("relLibAdd");
        $('.oper-data').addClass("relLibUpdate");
        $('.oper-data').html("更新");
        
        rowObj = tableObj.row($(this).parents('tr'));
        
        $('#prodIdExt').val(rowObj.data()['prodId']);
        initVerCodeExt();
        $('#verCodeExt').val(rowObj.data()['verCode']);
        $('#verCodeExt').selectpicker('refresh');
        initModuleIdExt();
        $('#moduleIdExt').val(rowObj.data()['moduleId']);
        $('#moduleIdExt').selectpicker('refresh');
        initRelLibIdExt();
        $('#relLibIdExt').val(rowObj.data()['moduleId']);
        $('#relLibIdExt').selectpicker('refresh');
        
        $('#relDesc').val(rowObj.data()['relDesc']);
        
    });
    
    //modal数据提交
    var rowObj;
    //表单校验提交
    //[1]自定义校验规则
    $.validator.setDefaults({
        rules: {
            prodIdExt: "required",
            verCodeExt: "required",
            moduleIdExt:"required",
            relLibIdExt:"required",
        },
        submitHandler: function(form) {
            
            //若果是更新则先删除再添加 间接实现更新
            if($('.oper-data').hasClass('relLibUpdate')) {
                if(rowObj) {
                    rowObj.remove().draw();
                    $('.oper-data').removeClass("relLibUpdate");
                    $('.oper-data').addClass("relLibAdd");
                }
            }
            
            var _prodIdExt = $('#prodIdExt').val();
            var _verCodeExt = $('#verCodeExt').val();
            var _moduleIdExt = $('#moduleIdExt').val();
            var _relLibIdExt = $('#relLibIdExt').val();
            var _relDesc = $('#relDesc').val();
            
            var _relLibIdExtTxt = $("#relLibIdExt").find("option:selected").text();
            
            tableObj.row.add({
                'relLibName': _relLibIdExtTxt,
                'relDesc': _relDesc,
                'prodId': _prodIdExt,
                'verCode': _verCodeExt,
                'moduleId': _moduleIdExt,
                'relLibId': _relLibIdExt,
                'libId': 0,
            }).draw();
            $('#relLibModal').modal('hide');
        }
    });
    //[2]表单校验初始化
    initFormValidate1('form-rel-lib');
    
    
    //切换操作
    $('#prodIdExt').change(function(){
        initVerCodeExt();
        initModuleIdExt();
        initRelLibIdExt();
    });
    $('#verCodeExt').change(function(){
        initModuleIdExt();
        initRelLibIdExt();
    });
    $('#moduleIdExt').change(function(){
        //加载库
        initRelLibIdExt();
    });
    
    
});

function initModalContent() {
    initVerCodeExt();
    initModuleIdExt();
    initRelLibIdExt();
}

function initVerCodeExt() {
    
    //加载产品版本
    var _prodIdExt = $("#prodIdExt").val();
    var _url = "load/select/ver/" + _prodIdExt;
    loadSelectUI(_url, "verCodeExt", 1);
 
}

function initModuleIdExt() {
 
    //加载模块
    var _verCodeExt = $("#verCodeExt").val();
    var _prodIdExt = $("#prodIdExt").val();
    var _url = "load/select/module/" + _prodIdExt + "/" + _verCodeExt;
    loadSelectUI(_url, "moduleIdExt", 1);
 
}

function initRelLibIdExt() {
 
    //加载库
    var _moduleIdExt = $("#moduleIdExt").val();
    var _url = "load/select/lib/" + _moduleIdExt;
    loadSelectUI(_url, "relLibIdExt", 1);
 
}

function getConfig() {
    return config = {
        "processing" : true,
        "pageLength" : -1,
        "lengthMenu" : [ [ 5, 10, 20, -1 ], [ 5, 10, 20, "All" ] ],
        //"order" : [ [ 1, "asc" ] ],
        "serverSide" : false,
        "columns" : [ {
            "data" : "libId",
            "visible" : false
        }, {
            "data" : "relLibName"
        }, {
            "data" : "relDesc",
            "visible" : false
        }, {
            "data" : "prodId",
            "visible" : false
        }, {
            "data" : "verCode",
            "visible" : false
        }, {
            "data" : "moduleId",
            "visible" : false
        }, {
            "data" : "relLibId",
            "visible" : false
        }, {
            "data" : "libId"
        }],
        "columnDefs": [{
            "targets": [7],
            "data": "libId",
            "render": function (data, type, full) {
                return '<a href="javascript:;" style="margin-right: 3px" class="row-update"><span class="label label-sm label-info"> 修改 </span></a> ' + 
                '<a href="javascript:;" class="row-remove"><span class="label label-sm label-danger"> 删除 </span></a>';
             }
        }],
        "sScrollX": "2000px",
        "dom" : '',
        "language" : {
            "lengthMenu" : "_MENU_ 条记录每页",
            "zeroRecords" : "没有查询到数据",
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
</script>
</body>
</html>