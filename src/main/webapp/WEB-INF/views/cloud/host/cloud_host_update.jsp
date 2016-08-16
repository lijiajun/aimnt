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
                            <i class="icon-layers font-green"></i> <span class="caption-subject bold uppercase"> 新增云主机申请结果 </span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <form action="#" class="form-horizontal" id="form-update">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            事业部 <!-- <span class="required">*</span> -->  <!-- 必填标志的那个小红星 -->
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" value="${mntHostApplyResult.dept}" name="dept" id="dept">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入事业部</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            申请人 <!-- <span class="required">*</span> -->
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" value="${mntHostApplyResult.applicant}" name="applicant" id="applicant">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入申请人</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            业务系统 
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" value="${mntHostApplyResult.busiSystem}" name="busiSystem" id="busiSystem">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入业务系统</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            申请人NT账号
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" value="${mntHostApplyResult.applicantNt}" name="applicantNt" id="applicantNt">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入申请人NT账号</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            主机配置 
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" value="${mntHostApplyResult.hostCfg}" name="hostCfg" id="hostCfg">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入主机配置</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            主机类型
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" value="${mntHostApplyResult.hostType}" name="hostType" id="hostType">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入主机类型</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            主机IP 
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" value="${mntHostApplyResult.hostIp}" name="hostIp" id="hostIp">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入主机IP</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            数据盘(G) 
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" value="${mntHostApplyResult.diskSize}" name="diskSize" id="diskSize">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入数据盘(G)</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            puaiuc密码 
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" value="${mntHostApplyResult.puaiucPasswd}" name="puaiucPasswd" id="puaiucPasswd">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入puaiuc密码</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            root密码 
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" value="${mntHostApplyResult.rootPasswd}" name="rootPasswd" id="rootPasswd">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入root密码</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            主机系统 
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" value="${mntHostApplyResult.hostOs}" name="hostOs" id="hostOs">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入主机系统</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            备注
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" value="${mntHostApplyResult.remark}" name="remark" id="remark">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入备注</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="col-md-9 model-hidden">
                                        <input type="hidden" value="${mntHostApplyResult.id}" name="id" id="id">
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
            /* id:"required",
            dept:"required",
            applicant:"required",
            applicantNt:"required",
            busiSystem:"required",
            hostType:"required",
            hostCfg:"required",
            diskSize:"required",
            hostIp:"required",
            rootPasswd:"required",
            puaiucPasswd:"required",
            hostOs:"required",
            remark:"required",
            deleteFlag:"required",
            creator:"required",
            createDate:"required",
            modifier:"required",
            modifyDate:"required" */
    };
    //[2]表单校验初始化
    initFormValidate('form-update', rules, 'cloud/host/update', 'update');
    
});

</script>
</body>
</html>