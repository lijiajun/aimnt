<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>团队成员统计模块</title>
<%@include file="../../included/includedStyle.jsp" %>

</head>

<body>
    <div class="wrapper">
        <div class="wrapper-content">
            <div class="portlet-title">
                <div class="caption font-dark">
                    <i class=" icon-layers font-green"></i> <span class="caption-subject bold uppercase"> 团队成员统计 </span>
                </div>
            </div>
            <div class="portlet-body">
                <form action="#" class="form-horizontal" id="form-module">
                    <div class="row border-txt">
                        <div class="col-md-6">
                            <div class="form-group form-md-line-input">
                                <label class="col-md-4 control-label" for="form_control_1">
                                    编号 <span class="required">*</span>
                                </label>
                                <div class="col-md-8">
                                    <p  class="form-control-static">${mntTeamMemberStat.id}</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group form-md-line-input">
                                <label class="col-md-4 control-label" for="form_control_1">
                                     <span class="required">*</span>
                                </label>
                                <div class="col-md-8">
                                    <p  class="form-control-static">${mntTeamMemberStat.teamId}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row border-txt">
                        <div class="col-md-6">
                            <div class="form-group form-md-line-input">
                                <label class="col-md-4 control-label" for="form_control_1">
                                     <span class="required">*</span>
                                </label>
                                <div class="col-md-8">
                                    <p  class="form-control-static">${mntTeamMemberStat.memberNum}</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group form-md-line-input">
                                <label class="col-md-4 control-label" for="form_control_1">
                                    1正式成员 2实习生 3外援 4出差成员 <span class="required">*</span>
                                </label>
                                <div class="col-md-8">
                                    <p  class="form-control-static">${mntTeamMemberStat.memberType}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row border-txt">
                        <div class="col-md-6">
                            <div class="form-group form-md-line-input">
                                <label class="col-md-4 control-label" for="form_control_1">
                                    周期 1周 2月 3季 4年 <span class="required">*</span>
                                </label>
                                <div class="col-md-8">
                                    <p  class="form-control-static">${mntTeamMemberStat.cycle}</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group form-md-line-input">
                                <label class="col-md-4 control-label" for="form_control_1">
                                    周期开始时间 <span class="required">*</span>
                                </label>
                                <div class="col-md-8">
                                    <p  class="form-control-static">${mntTeamMemberStat.cycleBeginDate}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row border-txt">
                        <div class="col-md-6">
                            <div class="form-group form-md-line-input">
                                <label class="col-md-4 control-label" for="form_control_1">
                                     <span class="required">*</span>
                                </label>
                                <div class="col-md-8">
                                    <p  class="form-control-static">${mntTeamMemberStat.cycleEndDate}</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group form-md-line-input">
                                <label class="col-md-4 control-label" for="form_control_1">
                                     <span class="required">*</span>
                                </label>
                                <div class="col-md-8">
                                    <p  class="form-control-static">${mntTeamMemberStat.remark}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row border-txt">
                        <div class="col-md-6">
                            <div class="form-group form-md-line-input">
                                <label class="col-md-4 control-label" for="form_control_1">
                                    创建人 <span class="required">*</span>
                                </label>
                                <div class="col-md-8">
                                    <p  class="form-control-static">${mntTeamMemberStat.creator}</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group form-md-line-input">
                                <label class="col-md-4 control-label" for="form_control_1">
                                    创建时间 <span class="required">*</span>
                                </label>
                                <div class="col-md-8">
                                    <p  class="form-control-static">${mntTeamMemberStat.createDate}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row border-txt">
                        <div class="col-md-6">
                            <div class="form-group form-md-line-input">
                                <label class="col-md-4 control-label" for="form_control_1">
                                    修改人 <span class="required">*</span>
                                </label>
                                <div class="col-md-8">
                                    <p  class="form-control-static">${mntTeamMemberStat.modifier}</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group form-md-line-input">
                                <label class="col-md-4 control-label" for="form_control_1">
                                    修改时间 <span class="required">*</span>
                                </label>
                                <div class="col-md-8">
                                    <p  class="form-control-static">${mntTeamMemberStat.modifyDate}</p>
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