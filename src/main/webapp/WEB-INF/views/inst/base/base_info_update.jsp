<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../../included/includedStyle.jsp" %>
</head>

<body>
    <div class="wrapper">
        <div class="row">
            <div class="col-md-12">
                <div class="wrapper-content">
                    <div class="portlet-title">
                        <div class="caption font-dark">
                            <i class="icon-layers font-green"></i> <span class="caption-subject bold uppercase"> 新增安装点 </span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <form action="#" class="form-horizontal" id="form-base">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-2 control-label" for="form_control_1">
                                            安装点名称 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-10">
                                            <input type="text" class="form-control" placeholder="" value="${installBaseInfo.baseName}" name="baseName" id="baseName">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入安装点名称</span>
                                        </div>
                                    </div>
                                </div>
                             </div>
                             <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-2 control-label" for="form_control_1">
                                            状态 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-10">
                                            <select class="selectpicker form-control" name="deleteFlag"  id="deleteFlag">
                                                <c:forEach items="${deleteFlagEnums}" var="deleteFlagEnum">
                                                    <c:if test="${deleteFlagEnum.key == installBaseInfo.deleteFlag}">
                                                        <option value="${deleteFlagEnum.key}" selected>${deleteFlagEnum.value}</option>
                                                    </c:if>
                                                    <c:if test="${deleteFlagEnum.key != installBaseInfo.deleteFlag}">
                                                        <option value="${deleteFlagEnum.key}">${deleteFlagEnum.value}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请选择状态</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-2 control-label" for="form_control_1">
                                            描述
                                        </label>
                                        <div class="col-md-10">
                                            <input type="text" class="form-control" placeholder="" value="${installBaseInfo.baseDesc}" name="baseDesc" id="baseDesc">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入描述信息</span>
                                        </div>
                                    </div>
                                </div>
                             </div>
                            <div class="row">
                                <div class="col-md-12">
                                   <div class="col-md-9 model-hidden">
                                        <input type="hidden" value="${installBaseInfo.baseId}" name="baseId" id="baseId">
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

<script type="text/javascript">

jQuery(document).ready(function() {
    
    //表单校验提交
    //[1]自定义校验规则
    $.validator.setDefaults({
        rules: {
            baseName:"required",
            deleteFlag:"required",
        },
        submitHandler: function(form) {
            ajaxSubmitUpdate('inst/base/update', form);
        }
    });
    //[2]表单校验初始化
    initFormValidate1('form-base');
    
});



</script>



</body>
</html>