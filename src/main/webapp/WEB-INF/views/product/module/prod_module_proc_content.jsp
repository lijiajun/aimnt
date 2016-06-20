<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>进程信息</title>
<%@include file="../../included/includedStyle.jsp" %>
</head>

<body class="body-bg">
    <div class="wrapper-box">
        <div class="row">
            <div class="col-md-12">
                <div class="wrapper-body">
                    <div class="portlet-title">
                        <div class="caption font-dark">
                            <i class=" icon-layers font-green"></i> 
                            <span class="caption-subject bold uppercase"> 进程信息 </span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <form action="#" class="form-horizontal" id="form-rel">
                            <div class="row border-txt">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            进程名称:
                                        </label>
                                        <div class="col-md-8">
                                             <p class="form-control-static"> ${mntProdProc.procName} </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            所属产品:
                                        </label>
                                        <div class="col-md-8">
                                             <p class="form-control-static"> ${mntProdProc.mntProdModule.prodName} </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row border-txt">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            产品版本:
                                        </label>
                                        <div class="col-md-8">
                                            <p class="form-control-static"> ${mntProdProc.mntProdModule.verName} </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            所属模块:
                                        </label>
                                        <div class="col-md-8">
                                            <p class="form-control-static"> ${mntProdProc.mntProdModule.moduleName} </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row border-txt">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            创建时间:
                                        </label>
                                        <div class="col-md-8">
                                            <p class="form-control-static">
                                                <fmt:formatDate value="${mntProdProc.createDate}" pattern="yyyy-MM-dd" />
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row border-txt">
                                <div class="col-md-12">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-2 control-label" for="form_control_1">
                                            进程功能描述:
                                        </label>
                                        <div class="col-md-10">
                                            <p class="form-control-static"> ${mntProdProc.procDesc} </p>
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