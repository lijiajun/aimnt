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
                            <i class="icon-layers font-green"></i> <span class="caption-subject bold uppercase"> 新增计费数据源 </span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <form action="#" class="form-horizontal" id="form-update">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            安装点 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" value="${mntJfDataResource.baseId}" name="baseId" id="baseId">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入安装点</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            业务名称 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" value="${mntJfDataResource.busiName}" name="busiName" id="busiName">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入业务名称</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            解码模板 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" value="${mntJfDataResource.decodeTemplate}" name="decodeTemplate" id="decodeTemplate">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入解码模板</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            分析模板 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" value="${mntJfDataResource.analysisTemplate}" name="analysisTemplate" id="analysisTemplate">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入分析模板</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            xdr_type <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" value="${mntJfDataResource.xdrType}" name="xdrType" id="xdrType">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入xdr_type</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            服务编号 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" value="${mntJfDataResource.serviceId}" name="serviceId" id="serviceId">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入服务编号</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            dr_type <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" value="${mntJfDataResource.drType}" name="drType" id="drType">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入dr_type</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            业务是否下线 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <select name="isOffline" class="selectpicker form-control" id="isOffline">
                                                <c:forEach items="${isFaultEnums}" var="isFaultEnum">
                                                    <c:if test="${isFaultEnum.key == mntJfDataResource.isOffline}">
                                                        <option value="${isFaultEnum.key}" selected>${isFaultEnum.value}</option>
                                                    </c:if>
                                                    <c:if test="${isFaultEnum.key != mntJfDataResource.isOffline}">
                                                        <option value="${isFaultEnum.key}">${isFaultEnum.value}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入业务是否下线</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            是否送计费 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <select name="isToJf" class="selectpicker form-control" id="isToJf">
                                                <c:forEach items="${isFaultEnums}" var="isFaultEnum">
                                                    <c:if test="${isFaultEnum.key == mntJfDataResource.isToJf}">
                                                        <option value="${isFaultEnum.key}" selected>${isFaultEnum.value}</option>
                                                    </c:if>
                                                    <c:if test="${isFaultEnum.key != mntJfDataResource.isToJf}">
                                                        <option value="${isFaultEnum.key}">${isFaultEnum.value}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入是否送计费</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            是否需要处理 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <select name="isNeedDeal" class="selectpicker form-control" id="isNeedDeal">
                                                <c:forEach items="${isFaultEnums}" var="isFaultEnum">
                                                    <c:if test="${isFaultEnum.key == mntJfDataResource.isNeedDeal}">
                                                        <option value="${isFaultEnum.key}" selected>${isFaultEnum.value}</option>
                                                    </c:if>
                                                    <c:if test="${isFaultEnum.key != mntJfDataResource.isNeedDeal}">
                                                        <option value="${isFaultEnum.key}">${isFaultEnum.value}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入是否需要处理</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-2 control-label" for="form_control_1">
                                            附件名称 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-10">
                                            <input type="text" class="form-control" placeholder="" value="${mntJfDataResource.fileName}" name="fileName" id="fileName">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入附件名称</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-2 control-label" for="form_control_1">
                                            备注 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-10">
                                            <textarea class="form-control" name="remark" id="remark"rows="3">${mntJfDataResource.remark}</textarea>
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入备注</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="col-md-9 model-hidden">
                                        <input type="hidden" value="${mntJfDataResource.id}" name="id" id="id">
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
    var rules = {
            id:"required",
            baseId:"required",
            busiName:"required",
            decodeTemplate:"required",
            analysisTemplate:"required",
            xdrType:"required",
            serviceId:"required",
            drType:"required",
            isOffline:"required",
            isToJf:"required",
            isNeedDeal:"required",
            fileName:"required",
            remark:"required",
            deleteFlag:"required",
            creator:"required",
            createDate:"required",
            modifier:"required",
            modifyDate:"required"
    };
    //[2]表单校验初始化
    initFormValidate('form-update', rules, 'inst/jf_ds/update', 'update');
    
});

</script>
</body>
</html>