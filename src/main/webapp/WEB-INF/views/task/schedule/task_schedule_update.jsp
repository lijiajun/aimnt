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
                            <i class="icon-layers font-green"></i> <span class="caption-subject bold uppercase"> 修改任务信息 </span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <form action="#" class="form-horizontal" id="form-update">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            任务名称 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" value="${mntTaskInfo.taskName}" name="taskName" id="taskName">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入任务名称</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            处理人
                                        </label>
                                        <div class="col-md-8">
                                            <select name="dealPerson" class="selectpicker form-control" id="dealPerson" data-live-search="true">
                                                <option value="-1">无</option>
                                                <c:forEach items="${userEnums}" var="userEnum">
<%--                                                     <c:if test="${userEnum.key == mntTaskInfo.dealPerson}"> --%>
<%--                                                         <option value="${userEnum.key}" selected>${userEnum.value}</option> --%>
<%--                                                     </c:if> --%>
<%--                                                     <c:if test="${userEnum.key != mntTaskInfo.dealPerson}"> --%>
                                                        <option value="${userEnum.key}">${userEnum.value}</option>
<%--                                                     </c:if> --%>
                                                </c:forEach>
                                            </select>
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入处理人</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            上级任务
                                        </label>
                                        <div class="col-md-8">
                                            <select name="parentTaskId" class="selectpicker form-control" id="parentTaskId" data-live-search="true">
                                                        <option value="-1">无</option>
                                                <c:forEach items="${taskEnums}" var="taskEnum">
<%--                                                     <c:if test="${taskEnum.key == mntTaskInfo.parentTaskId}"> --%>
<%--                                                         <option value="${taskEnum.key}" selected>${prodEnum.value}</option> --%>
<%--                                                     </c:if> --%>
<%--                                                     <c:if test="${taskEnum.key != mntTaskInfo.parentTaskId}"> --%>
                                                        <option value="${taskEnum.key}">${taskEnum.value}</option>
<%--                                                     </c:if> --%>
                                                </c:forEach>
                                            </select>
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请选择上级任务</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            预计完成时间
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="date-picker form-control" 
                                            value='<fmt:formatDate value="${mntTaskInfo.expectDate}" pattern="yyyy-MM-dd" />'
                                            readonly data-date-format="yyyy-mm-dd" name="expectDate" id="expectDate">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入预计完成时间</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-2 control-label" for="form_control_1">
                                            任务描述
                                        </label>
                                        <div class="col-md-10">
                                            <textarea class="form-control" name="taskDesc" id="taskDesc"rows="3">${mntTaskInfo.taskDesc}</textarea>
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入任务描述</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-2 control-label" for="form_control_1">
                                            任务备注
                                        </label>
                                        <div class="col-md-10">
                                            <textarea class="form-control" name="taskRemark" id="taskRemark"rows="3">${mntTaskInfo.taskRemark}</textarea>
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入备注</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="col-md-9 model-hidden">
                                        <input type="hidden" value="${mntTaskInfo.taskId}" name="taskId" id="taskId">
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
            taskName:"required"
    };
    //[2]表单校验初始化
    initFormValidate('form-update', rules, 'task/schedule/update', 'update');
    
    var _dealPerson = '${mntTaskInfo.dealPerson}';
    var _parentTaskId = '${mntTaskInfo.parentTaskId}';
    $('#dealPerson').val(_dealPerson);
    $('#parentTaskId').val(_parentTaskId);
    $('#dealPerson').selectpicker('refresh');
    $('#parentTaskId').selectpicker('refresh');
});

</script>
</body>
</html>