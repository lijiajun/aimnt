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
                            <i class=" icon-layers font-green"></i> <span class="caption-subject bold uppercase"> 产品版本信息修改 </span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <form action="#" class="form-horizontal" id="form-ver">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            产品类型 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <select name="prodId" class="selectpicker form-control" id="prodId">
                                                <c:forEach items="${prodEnums}" var="prodEnum">
                                                    <c:if test="${prodEnum.key == mntProdVersion.prodId}">
                                                        <option value="${prodEnum.key}" selected>${prodEnum.value}</option>
                                                    </c:if>
                                                    <c:if test="${prodEnum.key != mntProdVersion.prodId}">
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
                                            产品版本号 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" value="${mntProdVersion.verCode}" placeholder="" name="verCode" id="verCode">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入产品版本</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            产品版本名称
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" value="${mntProdVersion.verName}" name="verName" id="verName">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入产品版本名称</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            生效日期 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="date-picker form-control" 
                                                value="<fmt:formatDate value="${mntProdVersion.validDate}" pattern="yyyy-MM-dd"/>" 
                                                readonly data-date-format="yyyy-mm-dd" name="validDate" id="validDate">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请选择产品版本生效时间</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-2 control-label" for="form_control_1">
                                            版本描述
                                        </label>
                                        <div class="col-md-10">
                                            <input type="text" class="form-control" placeholder="" value="${mntProdVersion.verDesc}" name="verDesc" id="verDesc">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入产品版本描述</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="col-md-9 model-hidden">
                                        <input type="hidden" value="${mntProdVersion.verId}" name="verId" id="verId">
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
    
    
    //表单校验提交
    //[1]自定义校验规则
    var rules = {
            prodId:"required",
            verCode:"required",
            validDate:"required",
        };
    //[2]表单校验初始化
    initFormValidate('form-ver', rules, 'prod/ver/update', 'update');
});

</script>
</body>
</html>