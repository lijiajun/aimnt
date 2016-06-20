<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>${modelNameCn}模块</title>
<%@include file="../../included/includedStyle.jsp" %>

</head>

<body>
    <div class="wrapper">
        <div class="wrapper-content">
            <div class="portlet-title">
                <div class="caption font-dark">
                    <i class=" icon-layers font-green"></i> <span class="caption-subject bold uppercase"> ${modelNameCn} </span>
                </div>
            </div>
            <div class="portlet-body">
                <form action="#" class="form-horizontal" id="form-module">
                    <#list columns as column>
                    <#if column_index % 2 == 0>
                    <div class="row border-txt">
                    </#if>
                        <div class="col-md-6">
                            <div class="form-group form-md-line-input">
                                <label class="col-md-4 control-label" for="form_control_1">
                                    ${column.columnComment} <span class="required">*</span>
                                </label>
                                <div class="col-md-8">
                                    <p  class="form-control-static">${'${'}${modelName?uncap_first}.${column.javaField}}</p>
                                </div>
                            </div>
                        </div>
                    <#if column_index % 2 == 1 || columns?size -1 == column_index>
                    </div>
                    </#if>
                    </#list>
                </form>
            </div>
        </div>
    </div>

<%@include file="../../included/includedJs.jsp" %>

</body>
</html>