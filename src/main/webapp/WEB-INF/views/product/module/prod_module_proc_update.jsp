<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>更新模块进程</title>
<%@include file="../../included/includedStyle.jsp" %>
</head>

<body class="body-bg">
    <div class="wrapper-box">
        <div class="row">
            <div class="col-md-12">
                <div class="wrapper-body">
                    <div class="portlet-title">
                        <div class="caption font-dark">
                            <i class=" icon-layers font-green"></i> <span class="caption-subject bold uppercase"> 更新模块进程 </span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <form action="#" class="form-horizontal" id="form-proc">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            产品类型 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <select name="prodId" class="selectpicker form-control" id="prodId">
                                                <c:forEach items="${prodEnums}" var="prodEnum">
                                                    <c:if test="${prodEnum.key == mntProdProc.mntProdModule.prodId}">
                                                        <option value="${prodEnum.key}" selected>${prodEnum.value}</option>
                                                    </c:if>
                                                    <c:if test="${prodEnum.key != mntProdProc.mntProdModule.prodId}">
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
                                                    <option value="${verEnum.key}">${verEnum.value}</option>
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
                                            进程名称(中文) <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" value="${mntProdProc.procNameCn}" name="procNameCn" id="procNameCn">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block"> 请输入进程名称(中文)</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                           进程名称(英文) <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" value="${mntProdProc.procNameEn}" name="procNameEn" id="procNameEn">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入进程名称(英文)</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-2 control-label" for="form_control_1">
                                            所属模块 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-10">
                                            <select name="moduleId" id="moduleId" class="selectpicker form-control" data-live-search="true" multiple>
                                            </select>
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请选择进程所属模块</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-2 control-label" for="form_control_1">
                                            进程描述
                                        </label>
                                        <div class="col-md-10">
                                            <input type="text" class="form-control" placeholder="" value="${mntProdProc.procDesc}" name="procDesc" id="procDesc">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入进程描述</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="col-md-9 model-hidden">
                                        <input type="hidden" value="${mntProdProc.procId}" name="procId" id="procId">
                                    </div>
                                </div>
                            </div>
                            <div class="form-actions">
                                <div class="row">
                                    <div class="col-md-offset-3 col-md-9">
                                        <button type="submit" class="btn green">提 交</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

<%@include file="../../included/includedJs.jsp" %>


<script type="text/javascript">

jQuery(document).ready(function() {
    
    loadVerCodeSelect();
    //产品版本赋值
    var _verCode = '${mntProdProc.mntProdModule.verCode}';
    $('#verCode').val(_verCode);
    $('#verCode').selectpicker('refresh');
    //加载模块select
    loadModuleSelect();
    //获取该进程所属的模块并赋值
    initModuleSelect();
    
    $('#prodId').change(function(){
        loadVerCodeSelect();
        loadModuleSelect();
    });
    
    $('#verCode').change(function(){
    	loadModuleSelect();
    });
    
    //表单校验提交
    //[1]自定义校验规则
    var rules = {
            prodId: "required",
            verCode: "required",
            moduleId: "required",
            procNameCn:"required",
            procNameEn: "required",
        };
    //[2]表单校验初始化
    initFormValidate('form-proc', rules, 'prod/module/proc/update', 'update');
});

function initModuleSelect() {
	var _procId = $('#procId').val();
    $.ajax({
        url: "prod/module/proc/relation/" + _procId,
        dataType: "json",
        async:false,
        success:function (data) {
        	var modules = [];
            for(var index in data) {
            	modules.push(data[index]['moduleId']);
            }
        	$('#moduleId').val(modules);
            $('#moduleId').selectpicker('refresh');
        },
        error:function() {
            showMsg("加载下拉框出现错误！");
        }
    });
}


</script>
</body>
</html>