<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>${prodModule.moduleNameCn}模块</title>
<%@include file="../../included/includedStyle.jsp" %>

</head>

<body>
    <div class="wrapper-box">
        <div class="row">
            <div class="col-md-12">
                <div class="wrapper-body">
                    <div class="portlet-title">
                        <div class="caption font-dark">
                            <i class=" icon-layers font-green"></i> <span class="caption-subject bold uppercase"> ${prodModule.moduleNameCn} </span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <form action="#" class="form-horizontal" id="form-module">
                            <div class="row border-txt">
                                <div class="col-md-4">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-6 control-label" for="form_control_1">
                                            所属产品:
                                        </label>
                                        <div class="col-md-6">
                                            <p  class="form-control-static">${prodModule.prodName}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-6 control-label" for="form_control_1">
                                            产品版本:
                                        </label>
                                        <div class="col-md-6">
                                            <p  class="form-control-static">${prodModule.verCode}</p>
                                        </div>
                                    </div>
                                </div>
                                 <div class="col-md-4">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            上级模块:
                                        </label>
                                        <div class="col-md-8">
                                            <p  class="form-control-static">${prodModule.parentModuleName}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row border-txt">
                                <div class="col-md-4">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-6 control-label" for="form_control_1">
                                            模块名称(中文):
                                        </label>
                                        <div class="col-md-6">
                                            <p  class="form-control-static">${prodModule.moduleNameCn}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-6 control-label" for="form_control_1">
                                           模块名称(英文):
                                        </label>
                                        <div class="col-md-6">
                                            <p  class="form-control-static">${prodModule.moduleNameEn}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                           是否在用:
                                        </label>
                                        <div class="col-md-8">
                                            <p  class="form-control-static">${prodModule.isUsedTxt}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row border-txt">
                                <div class="col-md-4">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-6 control-label" for="form_control_1">
                                           输出物类型:
                                        </label>
                                        <div class="col-md-6">
                                            <p  class="form-control-static">${prodModule.outputTypeTxt}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-6 control-label" for="form_control_1">
                                           输出物:
                                        </label>
                                        <div class="col-md-6">
                                            <p  class="form-control-static">${prodModule.output}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row border-txt">
                                <div class="col-md-12">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-2 control-label" for="form_control_1">
                                           启动命令:
                                        </label>
                                        <div class="col-md-10">
                                            <p  class="form-control-static">${prodModule.startCommand}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row border-txt">
                                <div class="col-md-12">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-2 control-label" for="form_control_1">
                                           SVN路径:
                                        </label>
                                        <div class="col-md-10">
                                            <p  class="form-control-static">
                                            <a href="${prodModule.svnPath}" target="_blank">${prodModule.svnPath}</a>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row border-txt">
                                <div class="col-md-12">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-2 control-label" for="form_control_1">
                                            模块描述:
                                        </label>
                                        <div class="col-md-10">
                                            <p  class="form-control-static">${prodModule.moduleDesc}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row border-txt">
                                <div class="col-md-12">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-2 control-label" for="form_control_1">
                                            备注:
                                        </label>
                                        <div class="col-md-10">
                                            <p class="form-control-static">${prodModule.remark}</p>
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