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
                            <i class="icon-layers font-green"></i> <span class="caption-subject bold uppercase"> 新增部门需求故障跟踪 </span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <form action="#" class="form-horizontal" id="form-add">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            安装点 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <select name="baseId" class="selectpicker form-control" id="baseId">
<!--                                                 <option value="" selected>--请选择--</option> -->
                                                <c:forEach items="${baseIdEnums}" var="baseIdEnum">
                                                    <option value="${baseIdEnum.key}">${baseIdEnum.value}</option>
                                                </c:forEach>
                                            </select>
                                           <!--  <input type="text" class="form-control" placeholder="" name="baseId" id="baseId"> -->
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入安装点</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            安装点名称 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                        <%-- <select name="baseName" class="selectpicker form-control" id="baseName">
<!--                                                 <option value="" selected>--请选择--</option> -->
                                                <c:forEach items="${baseIdEnums}" var="baseIdEnum">
                                                    <option value="${baseIdEnum.key}">${baseIdEnum.value}</option>
                                                </c:forEach>
                                            </select> --%>
                                            <input type="text" class="form-control" placeholder="" name="baseName" id="baseName">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入安装点名称</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            产品编号 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                           <select name="prodId" class="selectpicker form-control" id="prodId">
                                                <c:forEach items="${prodEnums}" var="prodEnum">
                                                    <option value="${prodEnum.key}">${prodEnum.value}</option>
                                                </c:forEach>
                                            </select>
                                            <!--  <input type="text" class="form-control" placeholder="" name="prodId" id="prodId"> -->
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入产品编号</span>
                                        </div>
                                    </div>
                                </div>
                                 <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            产品名称 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            
                                             <input type="text" class="form-control" placeholder="" name="prodName" id="prodName">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入产品名称</span>
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
                                            <input type="text" class="form-control" placeholder="" name="bizNo" id="bizNo">
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
                                            <input type="text" class="form-control" placeholder="" name="bizName" id="bizName">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入需求名称</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            需求类型 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <select name="bizType" class="selectpicker form-control" id="bizType">
                                                <c:forEach items="${bizEnums}" var="bizEnums">
                                                    <option value="${bizEnums.key}">${bizEnums.value}</option>
                                                </c:forEach>
                                            </select>
                                           <!--  <input type="text" class="form-control" placeholder="" name="bizType" id="bizType"> -->
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入需求类型</span>
                                        </div>
                                    </div>
                                </div>
                                 <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            需求来源 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" name="bizSrc" id="bizSrc">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入需求来源</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            需求当前状态 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" name="bizSts" id="bizSts">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入需求当前状态</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            节点责任人 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" name="nodePerson" id="nodePerson">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入节点责任人</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            优先级 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" name="priority" id="priority">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入优先级</span>
                                        </div>
                                    </div>
                                </div>
                                 <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            紧急程度 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" name="urgentLevel" id="urgentLevel">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入紧急程度</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            录入日期 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="date-picker form-control" readonly data-date-format="yyyy-mm-dd" name="submitDate" id="submitDate">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入录入日期</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            期望发布日期 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="date-picker form-control" readonly data-date-format="yyyy-mm-dd" name="askEndDate" id="askEndDate">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入期望发布日期</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            计划发布日期 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="date-picker form-control" readonly data-date-format="yyyy-mm-dd" name="planReleaseDate" id="planReleaseDate">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入计划发布日期</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            计划上线日期 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="date-picker form-control" readonly data-date-format="yyyy-mm-dd" name="planOnlineDate" id="planOnlineDate">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入计划上线日期</span>
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

<script type="text/javascript">

jQuery(document).ready(function() {
    
    //[1]自定义校验规则
    var rules = {
    	   /*  baseId:"required",
            baseName:"required",
            prodId:"required",
            prodName:"required",
            bizNo:"required",
            bizName:"required",
            bizType:"required",
            bizSrc:"required",
            bizSts:"required",
            nodePerson:"required",
            priority:"required",
            urgentLevel:"required",  */
            /* submitDate:"required",
            dealDays:"required",
            askEndDate:"required",
            planReleaseDate:"required",
            planOnlineDate:"required", */
           
    };
    //[2]表单校验初始化
    initFormValidate('form-add', rules, 'inst/track/add', 'add');
    
});

</script>
</body>
</html>