<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>团队类型模块</title>
<%@include file="../../included/includedStyle.jsp" %>

</head>

<body>
    <div class="wrapper">
        <div class="wrapper-content">
            <div class="portlet-title">
                <div class="caption font-dark">
                    <i class=" icon-layers font-green"></i> <span class="caption-subject bold uppercase"> 团队类型 </span>
                </div>
            </div>
            <div class="portlet-body">
                <form action="#" class="form-horizontal" id="form-module">
                    <div class="row border-txt">
                        <div class="col-md-6">
                            <div class="form-group form-md-line-input">
                                <label class="col-md-4 control-label" for="form_control_1">
                                    团队编号 <span class="required">*</span>
                                </label>
                                <div class="col-md-8">
                                    <p  class="form-control-static">${mntTeamType.teamId}</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group form-md-line-input">
                                <label class="col-md-4 control-label" for="form_control_1">
                                    团队英文名称 <span class="required">*</span>
                                </label>
                                <div class="col-md-8">
                                    <p  class="form-control-static">${mntTeamType.teamNameEn}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row border-txt">
                        <div class="col-md-6">
                            <div class="form-group form-md-line-input">
                                <label class="col-md-4 control-label" for="form_control_1">
                                    团队中文名称 <span class="required">*</span>
                                </label>
                                <div class="col-md-8">
                                    <p  class="form-control-static">${mntTeamType.teamNameCn}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

<%@include file="../../included/includedJs.jsp" %>

</body>
</html>