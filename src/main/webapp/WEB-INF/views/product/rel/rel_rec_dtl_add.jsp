<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>新增产品版本明细信息</title>
<%@include file="../../included/includedStyle.jsp" %>
</head>

<body>
    <div class="wrapper">
        <div class="row">
            <div class="col-md-12">
                <div class="wrapper-content">
                    <div class="portlet-title">
                        <div class="caption font-dark">
                            <i class=" icon-layers font-green"></i> <span class="caption-subject bold uppercase"> 新增发布明细 </span>
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
                                                    <option value="${dtlTypeEnum.key}">${dtlTypeEnum.value}</option>
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
                                            <input type="text" class="form-control" placeholder="" name="dtlCode" id="dtlCode">
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
                                            <input type="text" class="form-control" placeholder="" name="dtlName" id="dtlName">
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
                                            <select name="baseIds" class="selectpicker form-control" id="baseIds">
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
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-2 control-label" for="form_control_1">
                                            需求描述
                                        </label>
                                        <div class="col-md-10">
                                            <input type="text" class="form-control" placeholder="" name="dtlDesc" id="dtlDesc">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入需求描述</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-actions">
                                <div class="row">
                                    <div class="row">
                                     <span class="dt-buttons">
                                            <button type="reset" class="btn green">重 置</button>
                                    </span>
                                     <span class="dt-buttons">
                                            <button type="submit" class="btn green">提 交</button>
                                     </span>
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
    loadRelSelect();
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
        };
    //[2]表单校验初始化
    initFormValidate('form-rel', rules, 'rel/dtl/add', 'add');
});

function initSelect() {
    
    var _prodId = $("#prodId").val();
//     alert(_prodId);
    
    //获取该产品下的产品版本
    $.ajax({
        url: "load/select/ver/" + _prodId,
        dataType: "json",
        data: {"prodId": _prodId},
        async:false,
        success:function (data) {
            $("#verCode").empty();
            console.log(data);
            for(var index in data) {
                for(var d in data[index]) {
                    $("#verCode").append("<option value=" + d + ">" + data[index][d] + "</option>");
                }
            }
            $('#verCode').selectpicker('refresh');
        },
        error:function() {
            showMsg("加载下拉框出现错误！");
        }
    });
    
    
}
</script>
</body>
</html>