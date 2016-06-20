<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>任务信息模块</title>
<%@include file="../../included/includedStyle.jsp" %>

</head>

<body class="body-bg">
    <div class="wrapper-box">
        <div class="row">
            <div class="col-md-12">
                <div class="wrapper-body">
                    <div class="portlet-title">
                        <div class="caption font-dark">
                            <i class=" icon-layers font-green"></i> <span class="caption-subject bold uppercase"> 任务信息 </span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <form action="#" class="form-horizontal" id="form-module">
                            <div class="row border-txt">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            任务名称：
                                        </label>
                                        <div class="col-md-8">
                                            <p  class="form-control-static">${mntTaskInfo.taskName}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            上级任务：
                                        </label>
                                        <div class="col-md-8">
                                            <p  class="form-control-static"><a href="task/schedule/${mntTaskInfo.parentTaskId}/page">${mntTaskInfo.parentTaskName}</a></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row border-txt">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            分派人：
                                        </label>
                                        <div class="col-md-8">
                                            <p  class="form-control-static">${mntTaskInfo.creator}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            创建时间：
                                        </label>
                                        <div class="col-md-8">
                                            <p  class="form-control-static">
                                            <fmt:formatDate value="${mntTaskInfo.createDate}" pattern="yyyy-MM-dd" />
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row border-txt">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            处理人：
                                        </label>
                                        <div class="col-md-8">
                                            <p  class="form-control-static">${mntTaskInfo.dealPerson}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            预计完成时间：
                                        </label>
                                        <div class="col-md-8">
                                            <p  class="form-control-static">
                                            <fmt:formatDate value="${mntTaskInfo.expectDate}" pattern="yyyy-MM-dd" />
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row border-txt">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                             实际完成时间：
                                        </label>
                                        <div class="col-md-8">
                                            <p  class="form-control-static">
                                            <fmt:formatDate value="${mntTaskInfo.finishDate}" pattern="yyyy-MM-dd" />
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            处理状态：
                                        </label>
                                        <div class="col-md-8">
                                            <p  class="form-control-static">${mntTaskInfo.dealStsTxt}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row border-txt">
                                <div class="col-md-12">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-2 control-label" for="form_control_1">
                                            任务描述：
                                        </label>
                                        <div class="col-md-10">
                                            <p  class="form-control-static">${mntTaskInfo.taskDesc}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row border-txt">
                                <div class="col-md-12">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-2 control-label" for="form_control_1">
                                            备注：
                                        </label>
                                        <div class="col-md-10">
                                            <p  class="form-control-static">${mntTaskInfo.taskRemark}</p>
                                        </div>
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

</body>
</html>