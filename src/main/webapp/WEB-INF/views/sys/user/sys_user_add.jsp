<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../../included/includedStyle.jsp" %>
</head>

<body>
    <div class="wrapper">
        <div class="row">
            <div class="col-md-12">
                <div class="wrapper-content">
                    <div class="portlet-title">
                        <div class="caption font-dark">
                            <i class="icon-layers font-green"></i> <span class="caption-subject bold uppercase"> 新增角色 </span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <form action="#" class="form-horizontal" id="form-user">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            用户名称 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" name="userName" id="userName">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入用户名称</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            用户密码 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                        <input type="password" class="form-control" placeholder="" name="password" id="password">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入用户密码</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            用户角色 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <select class="selectpicker form-control" name="roleIds"  id="roleIds" multiple>
                                                <c:forEach items="${sysRoleEnums}" var="sysRoleEnum">
                                                    <option value="${sysRoleEnum.key}">${sysRoleEnum.value}</option>
                                                </c:forEach>
                                            </select>
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请选择用户角色</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            真实姓名
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" name="realName" id="realName">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入真实姓名 </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            安装点
                                        </label>
                                        <div class="col-md-8">
                                            <select class="selectpicker form-control" name="baseId"  id="baseId">
                                                <c:forEach items="${baseNameEnums}" var="baseNameEnum">
                                                    <option value="${baseNameEnum.key}">${baseNameEnum.value}</option>
                                                </c:forEach>
                                            </select>
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入安装点</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            电子邮箱
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" name="email" id="email">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入电子邮箱 </span>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            电话号码
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" name="phoneId" id="phoneId">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入电话号码</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            用户状态
                                        </label>
                                        <div class="col-md-8">
                                            <select class="selectpicker form-control" name="userSts"  id="userSts">
                                                <c:forEach items="${userStsEnums}" var="userStsEnum">
                                                    <option value="${userStsEnum.key}">${userStsEnum.value}</option>
                                                </c:forEach>
                                            </select>
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请选择用户状态 </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-2 control-label" for="form_control_1">
                                            备注
                                        </label>
                                        <div class="col-md-10">
                                            <input type="text" class="form-control" placeholder="" name="remark" id="remark">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入备注</span>
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
    
    $('.bs-select').selectpicker({
        iconBase: 'fa',
        tickIcon: 'fa-check'
    });
    
    
    //表单校验提交
    //[1]自定义校验规则
    $.validator.setDefaults({
        rules: {
            userName:"required",
            password: {
            	required: true,
            	minlength: 8
            },
            roleIds:"required",
            email: "email"
        },
        submitHandler: function(form) {
        	var strRoleId = $("#roleIds").val();
            ajaxSubmitForm('sys/user/add/' + strRoleId, form);
        }
    });
    //[2]表单校验初始化
    initFormValidate1('form-user');
    
});



</script>



</body>
</html>