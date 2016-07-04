<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>更新产品模块</title>
<%@include file="../../included/includedStyle.jsp" %>
</head>

<body>
    <div class="wrapper popmodal" >
        <div class="row">
            <div class="col-md-12">
                <div class="wrapper-body">
                    <div class="portlet-title">
                        <div class="caption font-dark">
                            <i class=" icon-layers font-green"></i> <span class="caption-subject bold uppercase"> 更新产品模块 </span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <form action="#" class="form-horizontal" id="form-module">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            产品类型 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <select name="prodId" class="selectpicker form-control" id="prodId">
                                                <c:forEach items="${prodEnums}" var="prodEnum">
                                                    <c:if test="${prodEnum.key == prodModule.prodId}">
                                                        <option value="${prodEnum.key}" selected>${prodEnum.value}</option>
                                                    </c:if>
                                                    <c:if test="${prodEnum.key != prodModule.prodId}">
                                                        <option value="${prodEnum.key}">${prodEnum.value}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                             <!-- 
                                             <c:forEach items="${prodEnums}" var="prodEnum">
                                                    <option value="${prodEnum.key}">${prodEnum.value}</option>
                                                </c:forEach>
                                                <c:forEach items="${verEnums}" var="verEnum">
                                                     <c:if test="${verEnums.key == sysPara.verCode}">
                                                       <option value="${verEnum.key}" selected>${verEnum.value}</option>
                                                     </c:if>
                                                     <c:if test="${verEnums.key != sysPara.verCode}">
                                                            <option value="${verEnums.key}">${verEnums.value}</option>
                                                     </c:if>   
                                                 </c:forEach>
                                             -->
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
                                            上级模块 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <select name="parentModuleId" class="selectpicker form-control" data-live-search="true" id="parentModuleId">
<%--                                                 <c:forEach items="${relCodeEnums}" var="relCodeEnum"> --%>
<%--                                                     <option value="${relCodeEnum.key}">${relCodeEnum.value}</option> --%>
<%--                                                 </c:forEach> --%>
                                            </select>
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请选择父模块</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            模块名称(中文) <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" value="${prodModule.moduleNameCn}" name="moduleNameCn" id="moduleNameCn">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block"> 模块名称(中文)</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                           模块名称(英文) <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" value="${prodModule.moduleNameEn}" name="moduleNameEn" id="moduleNameEn">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入模块名称(英文)</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                           SVN路径
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" value="${prodModule.svnPath}" name="svnPath" id="svnPath">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入SVN路径</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                           输出物类型
                                        </label>
                                        <div class="col-md-8">
                                            <select name="outputType" class="selectpicker form-control" id="outputType">
                                                <option value='0' selected>不知道</option>
                                                <c:forEach items="${outPutEnums}" var="outPutEnum">
                                                    <option value="${outPutEnum.key}">${outPutEnum.value}</option>
                                                </c:forEach>
                                            </select>
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请选择输出类型</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                           输出物
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" value="${prodModule.output}" name="output" id="output">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入输出物</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                           启动命令
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" value="${prodModule.startCommand}" name="startCommand" id="startCommand">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入启动命令</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                           是否在用
                                        </label>
                                        <div class="col-md-8">
                                            <select name="isUsed" class="selectpicker form-control" id="isUsed">
                                                <c:forEach items="${isUsedEnums}" var="isUsedEnum">
                                                    <option value="${isUsedEnum.key}">${isUsedEnum.value}</option>
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
                                            模块描述
                                        </label>
                                        <div class="col-md-10">
                                            <textarea class="form-control" name="moduleDesc" id="moduleDesc"rows="3">${prodModule.moduleDesc}
                                            </textarea>
<%--                                             <input type="text" class="form-control" value="${prodModule.moduleDesc}" name="moduleDesc" id="moduleDesc"> --%>
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入模块描述</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-2 control-label" for="form_control_1">
                                            备注
                                        </label>
                                        <div class="col-md-10">
                                            <textarea class="form-control" name="remark" id="remark"rows="3">${prodModule.remark}
                                            </textarea>
<%--                                             <input type="text" class="form-control"  value="${prodModule.remark}" name="remark" id="remark"> --%>
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入备注</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="col-md-9 model-hidden">
                                        <input type="hidden" value="${prodModule.moduleId}" name="moduleId" id="moduleId">
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
    
    //赋值
    loadVerCodeSelect();
    var _verCode = '${prodModule.verCode}';
    $('#verCode').val(_verCode);
    loadParentModuleSelect();
    var _parentModuleId = '${prodModule.parentModuleId}';
    $('#parentModuleId').val(_parentModuleId);
    $('#verCode').selectpicker('refresh');
    $('#parentModuleId').selectpicker('refresh');
    
    
    var _outputType = '${prodModule.outputType}';
    $('#outputType').val(_outputType);
    var _isUsed = '${prodModule.isUsed}';
    $('#isUsed').val(_isUsed);
    $('#outputType').selectpicker('refresh');
    $('#isUsed').selectpicker('refresh');
    
    $('#prodId').change(function(){
        loadVerCodeSelect();
        loadParentModuleSelect();
    });
    
    $('#verCode').change(function(){
        loadParentModuleSelect();
    });
    
    
    //表单校验提交
    //[1]自定义校验规则
    var rules = {
            prodId: "required",
            verCode: "required",
            parentModuleId: "required",
            moduleNameCn:"required",
            moduleNameEn: "required",
        };
    //[2]表单校验初始化
    initFormValidate('form-module', rules, 'prod/module/update', 'update');
});

</script>
</body>
</html>