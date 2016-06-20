<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../../included/includedStyle.jsp" %>
<link href="static/plugins/bootstrap-fileinput/bootstrap-fileinput.css" rel="stylesheet" type="text/css" />
</head>

<body>
    <div class="wrapper">
        <div class="row">
            <div class="col-md-12">
                <div class="wrapper-content">
                    <div class="portlet-title">
                        <div class="caption font-dark">
                            <i class="icon-layers font-green"></i> <span class="caption-subject bold uppercase"> 我的资料 </span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <div class="tabbable-line">
                            <ul class="nav nav-tabs ">
                                <li class="active">
                                    <a href="#role_attr" data-toggle="tab"> 我的信息 </a>
                                </li>
                                <li>
                                    <a href="#role_res" data-toggle="tab"> 修改密码 </a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="role_attr">
                                    <form action="priv/info_update" method="post" enctype="multipart/form-data" class="form-horizontal" id="form-info">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group form-md-line-input">
                                                        <label class="col-md-12">
                                                            头像：
                                                        </label>
                                                    </div>
                                                </div>
                                             </div>
                                             <div class="row">
                                                <div class="col-md-12" style="padding-left:36px">
                                                    <div class="form-group">
                                                        <div class="fileinput fileinput-new" data-provides="fileinput">
                                                            <div class="fileinput-new thumbnail" style="width: 250px; height: 200px;">
                                                                <img src="static/img/avatar/${currentUser.userAvatar}" alt="" style="width: 250px; height: 200px;"/>
                                                            </div>
                                                            <div class="fileinput-preview fileinput-exists thumbnail" style="width: 250px; height: 200px;"> </div>
                                                            <div>
                                                                <span class="btn default btn-file">
                                                                    <span class="fileinput-new"> 选择图片... </span>
                                                                    <span class="fileinput-exists"> 修改 </span>
                                                                    <input type="file" name="file"> </span>
                                                                <a href="javascript:;" class="btn default fileinput-exists" data-dismiss="fileinput"> 删除 </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-9">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group form-md-line-input">
                                                        <label class="col-md-4 control-label" for="form_control_1">
                                                            用户名称：
                                                        </label>
                                                        <div class="col-md-7">
                                                            <input type="text" class="form-control" readonly value="${currentUser.userName}" name="userName" id="userName">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group form-md-line-input">
                                                        <label class="col-md-4 control-label" for="form_control_1">
                                                            真实名称：
                                                        </label>
                                                        <div class="col-md-6">
                                                            <input type="text" class="form-control" readonly value="${currentUser.realName}"  name="realName" id="realName">
                                                            <div class="form-control-focus"></div>
                                                            <span class="help-block">请输入真实名称</span>
                                                        </div>
                                                        <label class="col-md-2 control-label fieldEdit" for="form_control_1">
                                                            <a href="javascript:void(0);">编辑</a>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group form-md-line-input">
                                                        <label class="col-md-4 control-label" for="form_control_1">
                                                            所属组：
                                                        </label>
                                                        <div class="col-md-7">
                                                            <input type="text" class="form-control" readonly value="${sysRole.roleName}" name="roleName" id="roleName">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group form-md-line-input">
                                                        <label class="col-md-4 control-label" for="form_control_1">
                                                            安装点：
                                                        </label>
                                                        <div class="col-md-6">
                                                            <div class="base-input">
                                                                <input type="text" class="form-control" readonly value="${currentUser.baseId}" name="baseIdInput" >
                                                            </div>
                                                            <div class="base-select" style="display:none">
                                                                <select name="baseId" class="selectpicker form-control" id="baseId">
                                                                    <c:forEach items="${baseIdEnums}" var="baseIdEnum">
                                                                        <c:if test="${baseIdEnum.key == currentUser.baseId}">
                                                                            <option value="${baseIdEnum.key}" selected>${baseIdEnum.value}</option>
                                                                        </c:if>
                                                                        <c:if test="${baseIdEnum.key != currentUser.baseId}">
                                                                            <option value="${baseIdEnum.key}">${baseIdEnum.value}</option>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </select>
                                                                <div class="form-control-focus"></div>
                                                                <span class="help-block">请选择安装点</span>
                                                            </div>
                                                        </div>
                                                        <label class="col-md-2 control-label baseFieldEdit" for="form_control_1">
                                                            <a href="javascript:void(0);">编辑</a>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group form-md-line-input">
                                                        <label class="col-md-4 control-label" for="form_control_1">
                                                            最近登录时间：
                                                        </label>
                                                        <div class="col-md-7">
                                                            <input type="text" class="form-control" readonly 
                                                            value="<fmt:formatDate value='${currentUser.lastLoginDate}' pattern='yyyy-MM-dd hh:mm:ss' />"
                                                            name="lastLoginDate" id="lastLoginDate">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group form-md-line-input">
                                                        <label class="col-md-4 control-label" for="form_control_1">
                                                            手机号码：
                                                        </label>
                                                        <div class="col-md-6">
                                                            <input type="text" class="form-control" readonly value="${currentUser.phoneId}" name="phoneId" id="phoneId">
                                                            <div class="form-control-focus"></div>
                                                            <span class="help-block">请输入手机号码</span>
                                                        </div>
                                                        <label class="col-md-2 control-label fieldEdit" for="form_control_1">
                                                            <a href="javascript:void(0);">编辑</a>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group form-md-line-input">
                                                        <label class="col-md-4 control-label" for="form_control_1">
                                                            最近登录IP：
                                                        </label>
                                                        <div class="col-md-7">
                                                            <input type="text" class="form-control" readonly value="${currentUser.lastLoginIp}" name="lastLoginIp" id="lastLoginIp">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group form-md-line-input">
                                                        <label class="col-md-4 control-label" for="form_control_1">
                                                            Email：
                                                        </label>
                                                        <div class="col-md-6">
                                                            <input type="text" class="form-control" readonly value="${currentUser.email}" name="email" id="email">
                                                            <div class="form-control-focus"></div>
                                                            <span class="help-block">请输入Email</span>
                                                        </div>
                                                        <label class="col-md-2 control-label fieldEdit" for="form_control_1">
                                                            <a href="javascript:void(0);">编辑</a>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group form-md-line-input">
                                                        <label class="col-md-2 control-label" for="form_control_1">
                                                            关于我：
                                                        </label>
                                                        <div class="col-md-9">
                                                            <textarea class="form-control" name="remark" readonly id="remark"rows="3">${currentUser.remark}</textarea>
                                                            <div class="form-control-focus"></div>
                                                            <span class="help-block">请输入个人描述</span>
                                                        </div>
                                                        <label class="col-md-1 control-label fieldEdit" for="form_control_1">
                                                            <a href="javascript:void(0);">编辑</a>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="col-md-9 model-hidden">
                                                        <input type="hidden" value="${currentUser.userId}" name="userId" id="userId">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-actions">
                                                <div class="row">
                                                    <div class="col-md-offset-3 col-md-9 infoCommit" style="display:none">
                                                        <button type="submit" class="btn green">保 存</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        </form>
                                    </div>
                                </div>
                                <div class="tab-pane" id="role_res">
                                    <form action="#" class="form-horizontal" id="form-passwd">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group form-md-line-input">
                                                    <label class="col-md-2 control-label" for="form_control_1">
                                                        当前密码： <span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-10">
                                                        <input type="password" class="form-control" placeholder="" name="passwd" id="passwd">
                                                        <div class="form-control-focus"></div>
                                                        <span class="help-block">请输入当前密码</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group form-md-line-input">
                                                    <label class="col-md-2 control-label" for="form_control_1">
                                                        新密码： <span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-10">
                                                        <input type="password" class="form-control" placeholder="" name="newPasswd" id="newPasswd">
                                                        <div class="form-control-focus"></div>
                                                        <span class="help-block">请输入新密码</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group form-md-line-input">
                                                    <label class="col-md-2 control-label" for="form_control_1">
                                                        确认密码： <span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-10">
                                                        <input type="password" class="form-control" placeholder="" name="newPasswd2" id="newPasswd2">
                                                        <div class="form-control-focus"></div>
                                                        <span class="help-block">请确认密码</span>
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
            </div>
        </div>
    </div>

<%@include file="../../included/includedJs.jsp" %>
<script src="static/plugins/bootstrap-fileinput/bootstrap-fileinput.js" type="text/javascript"></script>

<script type="text/javascript">

jQuery(document).ready(function() {
    
    
	//表单校验提交
	//[1]自定义校验规则
// 	var rules = {
// 			passwd: "required",
// 			newPasswd: {
// 			    required: true,
// 			    minLenth: 8
// 			},
// 			newPasswd2:  {
//                 required: true,
//                 minLenth: 8
//             }
// 	    };
    //表单校验提交
    //[1]自定义校验规则
    $.validator.setDefaults({
        rules: {
            passwd: "required",
            newPasswd: {
                required: true,
                minlength: 8
            },
            newPasswd2:  {
                required: true,
                minlength: 8
            }
        },
        submitHandler: function(form) {
            var formData = new FormData($("#form-passwd")[0]);
            $.ajax({
                url: 'priv/passwd_update',
                type: 'POST',
                dataType: "json",
                data: formData,
                processData: false,  
                contentType: false,
                async:false,
                success:function (data) {
                    showMsg(data.info);
                },
                error:function() {
                    showMsg("修改操作发生错误！");
                }
            });
        }
    });
    //[2]表单校验初始化
    initFormValidate1('form-passwd');
	
    //表单校验提交
    //[1]自定义校验规则
    $.validator.setDefaults({
        rules: {
            email: "email"
        },
        submitHandler: function(form) {
            var formData = new FormData($("#form-info")[0]);
            $.ajax({
                url: 'priv/info_update',
                type: 'POST',
                dataType: "json",
                data: formData,
                processData: false,  
                contentType: false,
                async:false,
                success:function (data) {
                    showMsg("修改成功！");
                },
                error:function() {
                    showMsg("修改操作发生错误！");
                }
            });
        }
    });
    //[2]表单校验初始化
    initFormValidate1('form-info');
	
	$('.fieldEdit').on('click','a', function(){
	    $(this).parent('label').siblings('div').children('input, textarea').removeAttr('readonly');
	    $('.infoCommit').css('display', 'block');
	});
	
   $('.baseFieldEdit').on('click','a', function(){
        $(this).parent('label').siblings('div').children('.base-input').css('display', 'none');
        $(this).parent('label').siblings('div').children('.base-select').css('display', 'block');
        $('.infoCommit').css('display', 'block');
    });
   
   $('.fileinput-new').on('click', function(){
       $('.infoCommit').css('display', 'block');
   });
});



</script>



</body>
</html>