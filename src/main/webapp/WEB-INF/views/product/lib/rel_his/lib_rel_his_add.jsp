<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../../../included/includedStyle.jsp" %>
</head>

<body class="body-bg">
    <div class="wrapper-box">
        <div class="row">
            <div class="col-md-12">
                <div class="wrapper-body">
                    <div class="portlet-title">
                        <div class="caption font-dark">
                            <i class="icon-layers font-green"></i> <span class="caption-subject bold uppercase"> 新增库文件发布历史明细 </span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <form action="#" class="form-horizontal" id="form-add">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            产品类型 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <select name="prodId" class="selectpicker form-control" id="prodId">
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
                                            发布版本 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <select name="relId" class="selectpicker form-control" data-live-search="true" id="relId">
                                            </select>
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请选择产品发布版本号</span>
                                        </div>
                                    </div>
                                </div>
                                
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            库文件 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <select name="libId" id="libId" class="selectpicker form-control" data-live-search="true">
                                            </select>
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请选择库文件</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            MD5值 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" name="md5Val" id="md5Val">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入MD5值</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            安装点 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <select name="baseId" class="selectpicker form-control" id="baseId">
    <!--                                                 <option value="" selected>--请选择--</option> -->
                                                <c:forEach items="${baseIdEnums}" var="baseIdEnum">
                                                    <option value="${baseIdEnum.key}">${baseIdEnum.value}</option>
                                                </c:forEach>
                                            </select>
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请选择安装点</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            输出文件
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" name="outputFile" id="outputFile">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入输出文件</span>
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
                                            <textarea class="form-control" name="remark" id="remark"rows="3"></textarea>
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入备注</span>
                                        </div>
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

<%@include file="../../../included/includedJs.jsp" %>

<script type="text/javascript">

jQuery(document).ready(function() {
    
    loadVerCodeSelect();
    loadModuleSelect();
    loadRelSelect();
    loadLibSelect();
    $('#prodId').change(function(){
        loadVerCodeSelect();
        loadModuleSelect();
        loadRelSelect();
        loadLibSelect();
    });
    
    $('#verCode').change(function(){
        loadModuleSelect();
        loadRelSelect();
        loadLibSelect();
    });
	
    $('#moduleId').change(function(){
        loadLibSelect();
    });
    
	
    //表单校验提交
    //[1]自定义校验规则
    var rules = {
    		moduleId:"required",
            libId:"required",
            md5Val:"required",
            relId:"required",
            baseId:"required",
            outputFile:"required",
    };
    //[2]表单校验初始化
    initFormValidate('form-add', rules, 'prod/lib/rel_his/add', 'add');
    
});

</script>
</body>
</html>