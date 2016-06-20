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
                            <i class=" icon-layers font-green"></i> <span class="caption-subject bold uppercase"> 新增产品版本信息 </span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <form action="#" class="form-horizontal" id="form-rel">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            产品类型 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <select name="prodId" class="selectpicker form-control" id="prodId">
                                                <c:forEach items="${prodEnums}" var="prodEnum">
                                                    <c:if test="${prodEnum.key == releaseRec.prodId}">
                                                        <option value="${prodEnum.key}" selected>${prodEnum.value}</option>
                                                    </c:if>
                                                    <c:if test="${prodEnum.key != releaseRec.prodId}">
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
                                                    <c:if test="${verEnum.key == releaseRec.verCode}">
                                                        <option value="${verEnum.key}" selected>${verEnum.value}</option>
                                                    </c:if>
                                                    <c:if test="${verEnum.key != releaseRec.verCode}">
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
                                            发布版本号 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" value="${releaseRec.relCode}" name="relCode" id="relCode">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入产品发布版本号</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            发布日期 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="date-picker form-control" readonly  
                                            value="<fmt:formatDate value="${releaseRec.relDate}" pattern="yyyy-MM-dd"/>" 
                                            data-date-format="yyyy-mm-dd" name="relDate" id="relDate">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入发布时间</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-2 control-label" for="form_control_1">
                                            发布类型
                                        </label>
                                        <div class="col-md-10">
                                            <select name="relType" class="selectpicker form-control" id="relType">
                                                <c:forEach items="${relTypeEnums}" var="relTypeEnum">
                                                    <c:if test="${relTypeEnum.key == releaseRec.relType}">
                                                        <option value="${relTypeEnum.key}" selected>${relTypeEnum.value}</option>
                                                    </c:if>
                                                    <c:if test="${relTypeEnum.key != releaseRec.relType}">
                                                        <option value="${relTypeEnum.key}">${relTypeEnum.value}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请选择版本发布类型</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-2 control-label" for="form_control_1">
                                            发布描述
                                        </label>
                                        <div class="col-md-10">
                                            <input type="text" class="form-control" placeholder=""  value="${releaseRec.relDesc}" name="relDesc" id="relDesc">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入产品版本描述</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="col-md-9 model-hidden">
                                        <input type="hidden" value="${releaseRec.relId}" name="relId" id="relId">
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
    
// 	$('.selectpicker').selectpicker('refresh');

    loadVerCodeSelect();
    initSelect();
    $('#prodId').change(function(){
    	loadVerCodeSelect();
    });
    
    //表单校验提交
    //[1]自定义校验规则
    var rules = {
            prodId:"required",
            verCode:"required",
            relDate:"required",
            relCode:"required",
        };
    //[2]表单校验初始化及提交
    initFormValidate('form-rel', rules, 'rel/rec/update', 'update');
});

function initSelect() {
    loadVerCodeSelect();
    //赋值
    var _verCode = '${releaseRec.verCode}';
    $('#verCode').val(_verCode);
    $('#verCode').selectpicker('refresh');
}
</script>
</body>
</html>