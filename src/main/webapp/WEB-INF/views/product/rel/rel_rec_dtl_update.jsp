<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>修改产品版本明细信息</title>
<%@include file="../../included/includedStyle.jsp" %>
</head>

<body>
    <div class="wrapper">
        <div class="row">
            <div class="col-md-12">
                <div class="wrapper-content">
                    <div class="portlet-title">
                        <div class="caption font-dark">
                            <i class=" icon-layers font-green"></i> <span class="caption-subject bold uppercase"> 修改发布明细 </span>
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
                                                    <c:if test="${prodEnum.key == releaseRecDtl.mntReleaseRec.prodId}">
                                                        <option value="${prodEnum.key}" selected>${prodEnum.value}</option>
                                                    </c:if>
                                                    <c:if test="${prodEnum.key != releaseRecDtl.mntReleaseRec.prodId}">
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
                                            发布版本号 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <select name="relId" class="selectpicker form-control" data-live-search="true" id="relId">
<%--                                                 <c:forEach items="${relCodeEnums}" var="relCodeEnum"> --%>
<%--                                                     <option value="${relCodeEnum.key}">${relCodeEnum.value}</option> --%>
<%--                                                 </c:forEach> --%>
                                            </select>
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请选择产品发布版本号</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            明细类型 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <select name="dtlType" class="selectpicker form-control" id="dtlType">
                                                <c:forEach items="${dtlTypeEnums}" var="dtlTypeEnum">
                                                    <c:if test="${dtlTypeEnum.key == releaseRecDtl.dtlType}">
                                                        <option value="${dtlTypeEnum.key}" selected>${dtlTypeEnum.value}</option>
                                                    </c:if>
                                                    <c:if test="${dtlTypeEnum.key != releaseRecDtl.dtlType}">
                                                        <option value="${dtlTypeEnum.key}">${dtlTypeEnum.value}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请选择明细类型</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            需求编号 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" value="${releaseRecDtl.dtlCode}" placeholder="" name="dtlCode" id="dtlCode">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入需求编号</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            需求名称 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" value="${releaseRecDtl.dtlName}" name="dtlName" id="dtlName">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入需求名称</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-2 control-label" for="form_control_1">
                                            安装点 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-10">
                                            <select name="baseId" class="selectpicker form-control" id="baseId" >
                                                <c:forEach items="${baseIdEnums}" var="baseIdEnum">
                                                    <c:if test="${baseIdEnum.key == releaseRecDtl.mntReleaseRec.baseId}">
                                                        <option value="${baseIdEnum.key}" selected>${baseIdEnum.value}</option>
                                                    </c:if>
                                                    <c:if test="${baseIdEnum.key != releaseRecDtl.mntReleaseRec.baseId}">
                                                        <option value="${baseIdEnum.key}">${baseIdEnum.value}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请选择安装点</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-2 control-label" for="form_control_1">
                                            需求描述
                                        </label>
                                        <div class="col-md-10">
                                            <input type="text" class="form-control" placeholder="" value="${releaseRecDtl.dtlDesc}" name="dtlDesc" id="dtlDesc">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入需求描述</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="col-md-9 model-hidden">
                                        <input type="hidden" value="${releaseRecDtl.dtlId}" name="dtlId" id="dtlId">
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
    
	initSelect();
    $('#prodId').change(function(){
        loadVerCodeSelect();
        loadRelSelect();
    });
    
    $('#verCode').change(function(){
        loadRelSelect();
    });
    
    //表单校验提交
    //[1]自定义校验规则
    var rules = {
            prodId: "required",
            verCode: "required",
            relId: "required",
            dtlType:"required",
            dtlCode: "required",
            dtlName: "required",
            baseIds: "required",
            dtlId: "required",
        };
    //[2]表单校验初始化
    initFormValidate('form-rel', rules, 'rel/dtl/update', 'update');
});

function initSelect() {
	//加载产品版本select
    loadVerCodeSelect();
    //赋值
    var _verCode = '${releaseRecDtl.mntReleaseRec.verCode}';
    $('#verCode').val(_verCode);
    
    //加载发布版本select
    loadRelSelect();
    var _relId = '${releaseRecDtl.relId}';
    $('#relId').val(_relId);
    $('#verCode').selectpicker('refresh');
    $('#relId').selectpicker('refresh');
    
    var _baseId = '${releaseRecDtl.baseId}';
    $('#baseId').val(_baseId);
    $('#baseId').selectpicker('refresh');
}
</script>
</body>
</html>