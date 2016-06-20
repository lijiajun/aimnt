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
                <div class="wrapper-body">
                    <div class="portlet-title">
                        <div class="caption font-dark">
                            <i class="icon-layers font-green"></i> <span class="caption-subject bold uppercase"> 新增${modelNameCn} </span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <form action="#" class="form-horizontal" id="form-add">
                            <#list columns as column>
                            <#if column_index % 2 == 0>
                            <div class="row">
                            </#if>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            ${column.columnComment} <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <#if column.javaType == "Date">
                                            <input type="text" class="date-picker form-control" readonly data-date-format="yyyy-mm-dd" name="${column.javaField}" id="${column.javaField}">
                                            <#else>
                                            <input type="text" class="form-control" placeholder="" name="${column.javaField}" id="${column.javaField}">
                                            </#if>
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入${column.columnComment}</span>
                                        </div>
                                    </div>
                                </div>
                            <#if column_index % 2 == 1 || columns?size - 1 == column_index>
                            </div>
                            </#if>
                            </#list>
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
    var rules = {
        <#list columns as column>
            <#if columns?size -1 == column_index>
            ${column.javaField}:"required"
            <#else>
            ${column.javaField}:"required",
            </#if>
        </#list>
    };
    //[2]表单校验初始化
    initFormValidate('form-add', rules, '${module}/${sub_module}/add', 'add');
    
});

</script>
</body>
</html>