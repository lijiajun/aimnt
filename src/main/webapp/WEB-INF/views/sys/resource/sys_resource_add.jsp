<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../../included/includedStyle.jsp" %>
<link href="static/plugins/bootstrap-select/css/bootstrap-select.min.css" rel="stylesheet" type="text/css" />
</head>

<body>
    <div class="wrapper">
        <div class="row">
            <div class="col-md-12">
                <div class="wrapper-content">
                    <div class="portlet-title">
                        <div class="caption font-dark">
                            <i class="icon-layers font-green"></i> <span class="caption-subject bold uppercase"> 新增资源 </span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <form action="#" class="form-horizontal" id="form-res">
                            <div class="form-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group form-md-line-input">
                                            <label class="col-md-4 control-label" for="form_control_1">
                                                资源名称 <span class="required">*</span>
                                            </label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control" placeholder="" name="resName" id="resName">
                                                <div class="form-control-focus"></div>
                                                <span class="help-block">请输入资源名称</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group form-md-line-input">
                                            <label class="col-md-4 control-label" for="form_control_1">
                                                资源类型 <span class="required">*</span>
                                            </label>
                                            <div class="col-md-8">
                                                <select class="selectpicker form-control" name="resType"  id="resType">
                                                    <c:forEach items="${resTypeEnums}" var="resTypeEnum">
                                                        <option value="${resTypeEnum.key}">${resTypeEnum.value}</option>
                                                    </c:forEach>
                                                </select>
                                                <div class="form-control-focus"></div>
                                                <span class="help-block">请选择资源类型</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group form-md-line-input">
                                            <label class="col-md-4 control-label" for="form_control_1">
                                                资源URL
                                            </label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control" placeholder="" name="resUrl" id="resUrl">
                                                <div class="form-control-focus"></div>
                                                <span class="help-block">请输入资源URL</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group form-md-line-input">
                                            <label class="col-md-4 control-label" for="form_control_1">
                                                资源父节点 <span class="required">*</span>
                                            </label>
                                            <div class="col-md-8">
                                                <select class="selectpicker form-control" data-live-search="true" name="parentId"  id="parentId">
                                                    <c:forEach items="${resIdEnums}" var="resIdEnum">
                                                        <option value="${resIdEnum.key}">${resIdEnum.value}</option>
                                                    </c:forEach>
                                                </select>
                                                <div class="form-control-focus"></div>
                                                <span class="help-block">请选择资源父节点</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group form-md-line-input">
                                            <label class="col-md-4 control-label" for="form_control_1">
                                                资源图标
                                            </label>
                                            <div class="col-md-8">
                                                <select class="bs-select form-control" data-show-subtext="true" name="resIcon" id="resIcon">
                                                    <option data-icon="">无</option>
                                                    <option data-icon="icon-diamond">icon-diamond</option>
                                                    <option data-icon="icon-bulb">icon-bulb</option>
                                                    <option data-icon="icon-layers">icon-layers</option>
                                                    <option data-icon="icon-crop">icon-crop</option>
                                                    <option data-icon="icon-directions">icon-directions</option>
                                                    <option data-icon="icon-target">icon-target</option>
                                                    <option data-icon="icon-settings">icon-settings</option>
                                                    <option data-icon="icon-social-dropbox">icon-social-dropbox</option>
                                                    <option data-icon="icon-social-dribbble">icon-social-dribbble</option>
                                                    <option data-icon="icon-bar-chart">icon-bar-chart</option>
                                                    <option data-icon="icon-globe">icon-globe</option>
                                                    <option data-icon="icon-eyeglasses">icon-eyeglasses</option>
                                                </select>
                                                <div class="form-control-focus"></div>
                                                <span class="help-block">请输入资源图标</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group form-md-line-input">
                                            <label class="col-md-4 control-label" for="form_control_1">
                                                资源状态 <span class="required">*</span>
                                            </label>
                                            <div class="col-md-8">
                                                <select class="selectpicker form-control" name="resSts"  id="resSts">
                                                    <c:forEach items="${resStsEnums}" var="resStsEnum">
                                                        <option value="${resStsEnum.key}">${resStsEnum.value}</option>
                                                    </c:forEach>
                                                </select>
                                                <div class="form-control-focus"></div>
                                                <span class="help-block">请输入资源状态</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group form-md-line-input">
                                            <label class="col-md-4 control-label" for="form_control_1">
                                                资源权限 
                                            </label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control" placeholder="" name="permission" id="permission">
                                                <div class="form-control-focus"></div>
                                                <span class="help-block">请输入资源权限</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group form-md-line-input">
                                            <label class="col-md-4 control-label" for="form_control_1">
                                                资源顺序
                                            </label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control" placeholder="" name="resOrder" id="resOrder">
                                                <div class="form-control-focus"></div>
                                                <span class="help-block">请输入资源顺序</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group form-md-line-input">
                                            <label class="col-md-2 control-label" for="form_control_1">备注 <span class="required"></span>
                                            </label>
                                            <div class="col-md-10">
                                                <input type="text" class="form-control" placeholder="" name="remark" id="remark">
                                                <div class="form-control-focus"></div>
                                                <span class="help-block">请输入备注信息</span>
                                            </div>
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

<%@include file="../../included/includedJs.jsp" %>
<script src="static/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="static/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
<script src="static/plugins/jquery-validation/js/localization/messages_zh.js" type="text/javascript"></script>
<script src="static/plugins/bootstrap-touchspin/bootstrap.touchspin.min.js" type="text/javascript"></script>
<script src="static/plugins/bootstrap-select/js/bootstrap-select.min.js" type="text/javascript"></script>

<script type="text/javascript">

jQuery(document).ready(function() {
	
    $("#resOrder").TouchSpin({
        initval: 1
    });
    addClassSpin();
    
    $('.bs-select').selectpicker({
        iconBase: 'fa',
        tickIcon: 'fa-check'
    });
    
    //表单校验提交
    //[1]自定义校验规则
    var rules = {
            resName:"required",
            resType:"required",
            parentId:"required",
            resSts:"required",
            resOrder:"number",
        };
    //[2]表单校验初始化
    initFormValidate('form-res', rules, 'sys/res/add', 'add');
    
});




</script>



</body>
</html>