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
                            <i class="icon-layers font-green"></i> <span class="caption-subject bold uppercase"> 更新安装点上线反馈信息 </span>
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
                                            <select name="baseId" class="selectpicker form-control" id="baseId">
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
                                            上线产品 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <select name="prodId" class="selectpicker form-control" id="prodId">
                                                <c:forEach items="${prodEnums}" var="prodEnum">
                                                    <c:if test="${prodEnum.key == mntInstallOnlineInfo.prodId}">
                                                        <option value="${prodEnum.key}" selected>${prodEnum.value}</option>
                                                    </c:if>
                                                    <c:if test="${prodEnum.key != mntInstallOnlineInfo.prodId}">
                                                        <option value="${prodEnum.key}">${prodEnum.value}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请选择上线产品</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
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
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            上线版本号 <span class="required">*</span>
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
                                            上线模块 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <select name="moduleId" id="moduleId" class="selectpicker form-control" data-live-search="true">
                                            </select>
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请选择上线模块</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            需求或故障编号 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <select name="relDtlId" id="relDtlId" class="selectpicker form-control" data-live-search="true">
                                            </select>
<%--                                             <input type="text" class="form-control" value="${mntInstallOnlineInfo.relDtlId}" name="relDtlId" id="relDtlId"> --%>
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入需求或故障编号</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            是否申请R&D现场支持<span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <select name="isOnsiteSupport" class="selectpicker form-control" id="isOnsiteSupport">
                                                <c:forEach items="${isOnsiteSupportEnums}" var="isOnsiteSupportEnum">
                                                    <option value="${isOnsiteSupportEnum.key}">${isOnsiteSupportEnum.value}</option>
                                                </c:forEach>
                                            </select>
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请选择是否申请R&D现场支持</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            是否申请R&D远程支持<span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <select name="isRemoteSupport" class="selectpicker form-control" id="isRemoteSupport">
                                                <c:forEach items="${isRemoteSupportEnums}" var="isRemoteSupportEnum">
                                                    <option value="${isRemoteSupportEnum.key}">${isRemoteSupportEnum.value}</option>
                                                </c:forEach>
                                            </select>
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请选择是否申请R&D远程支持</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            计划上线日期 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="date-picker form-control" readonly data-date-format="yyyy-mm-dd" 
                                                value="<fmt:formatDate value="${mntInstallOnlineInfo.planOnlineDate}" pattern="yyyy-MM-dd"/>" name="planOnlineDate" id="planOnlineDate">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入计划上线日期</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            实际上线日期
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="date-picker form-control" readonly data-date-format="yyyy-mm-dd" 
                                                value="<fmt:formatDate value="${mntInstallOnlineInfo.onlineDate}" pattern="yyyy-MM-dd"/>" name="onlineDate" id="onlineDate">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入实际上线日期</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            是否已上线 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <select name="isOnlined" class="selectpicker form-control" id="isOnlined">
                                                <c:forEach items="${isOnlinedEnums}" var="isOnlinedEnum">
                                                    <option value="${isOnlinedEnum.key}">${isOnlinedEnum.value}</option>
                                                </c:forEach>
                                            </select>
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请选择是否已上线</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            延期上线日期
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="date-picker form-control" readonly data-date-format="yyyy-mm-dd" 
                                                value="<fmt:formatDate value="${mntInstallOnlineInfo.delayOnlineDate}" pattern="yyyy-MM-dd"/>" name="delayOnlineDate" id="delayOnlineDate">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入延期上线日期</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-2 control-label" for="form_control_1">
                                            是否有故障 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-10">
                                            <select name="isFault" class="selectpicker form-control" id="isFault">
                                                <c:forEach items="${isFaultEnums}" var="isFaultEnum">
                                                    <option value="${isFaultEnum.key}">${isFaultEnum.value}</option>
                                                </c:forEach>
                                            </select>
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请选择是否有故障</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-2 control-label" for="form_control_1">
                                            未上线原因
                                        </label>
                                        <div class="col-md-10">
                                            <textarea class="form-control" name="unOnlineReason" id="unOnlineReason"rows="3">${mntInstallOnlineInfo.unOnlineReason}</textarea>
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入未上线原因</span>
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
                                            <textarea class="form-control" name="onlineRemark" id="onlineRemark"rows="3">${mntInstallOnlineInfo.onlineRemark}</textarea>
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入备注</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="col-md-9 model-hidden">
                                        <input type="hidden" value="${mntInstallOnlineInfo.onlineId}" name="onlineId" id="onlineId">
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
    
    loadVerCodeSelect();
    //产品版本赋值
    var _verCode = '${mntInstallOnlineInfo.verCode}';
    $('#verCode').val(_verCode);
    $('#verCode').selectpicker('refresh');
    //加载模块
    loadModuleSelect();
    var _moduleId = '${mntInstallOnlineInfo.moduleId}';
    $('#moduleId').val(_moduleId);
    $('#moduleId').selectpicker('refresh');
    //加载发布版本
    loadRelSelect();
    var _relId = '${mntInstallOnlineInfo.relId}';
    $('#relId').val(_relId);
    $('#relId').selectpicker('refresh');
    
    loadRelDtlSelect();
    var _relDtlId = '${mntInstallOnlineInfo.relDtlId}';
    $('#relDtlId').val(_relDtlId);
    $('#relDtlId').selectpicker('refresh');
    
    var _baseId = '${mntInstallOnlineInfo.baseId}';
    $('#baseId').val(_baseId);
    $('#baseId').selectpicker('refresh');
    
    var _isOnsiteSupport = '${mntInstallOnlineInfo.isOnsiteSupport}';
    $('#isOnsiteSupport').val(_isOnsiteSupport);
    $('#isOnsiteSupport').selectpicker('refresh');
    
    var _isRemoteSupport = '${mntInstallOnlineInfo.isRemoteSupport}';
    $('#isRemoteSupport').val(_isRemoteSupport);
    $('#isRemoteSupport').selectpicker('refresh');
    
    var _isOnlined = '${mntInstallOnlineInfo.isOnlined}';
    $('#isOnlined').val(_isOnlined);
    $('#isOnlined').selectpicker('refresh');
    
    var _isFault = '${mntInstallOnlineInfo.isFault}';
    $('#isFault').val(_isFault);
    $('#isFault').selectpicker('refresh');
    
    $('#prodId').change(function(){
        loadVerCodeSelect();
        loadModuleSelect();
        loadRelSelect();
        loadRelDtlSelect();
    });
    
    $('#verCode').change(function(){
        loadModuleSelect();
        loadRelSelect();
        loadRelDtlSelect();
    });
    
    $('#relId').change(function(){
        loadRelDtlSelect();
    });
    
    //表单校验提交
    //[1]自定义校验规则
    var rules = {
            onlineId:"required",
            baseId:"required",
            prodId:"required",
            verCode:"required",
            relCode:"required",
            relDtlId:"required",
            moduleId:"required",
            isOnsiteSupport:"required",
            isRemoteSupport:"required",
            planOnlineDate:"required",
            isOnlined:"required",
            isFault:"isFault"
    };
    //[2]表单校验初始化
    initFormValidate('form-update', rules, 'inst/online/update', 'update');
    
});

</script>
</body>
</html>