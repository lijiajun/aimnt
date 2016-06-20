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
                            <i class="icon-layers font-green"></i> <span class="caption-subject bold uppercase"> 新增库文件信息 </span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <form action="#" class="form-horizontal" id="form-update">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            库文件编号 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" value="${mntLibInfo.libId}" name="libId" id="libId">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入库文件编号</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            库文件名称 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" value="${mntLibInfo.libName}" name="libName" id="libName">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入库文件名称</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            所属模块 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" value="${mntLibInfo.moduleId}" name="moduleId" id="moduleId">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入所属模块</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            库文件描述 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" value="${mntLibInfo.libDesc}" name="libDesc" id="libDesc">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入库文件描述</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            是否在用 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" value="${mntLibInfo.isUsed}" name="isUsed" id="isUsed">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入是否在用</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            删除标识，1删除，0未删除 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" value="${mntLibInfo.deleteFlag}" name="deleteFlag" id="deleteFlag">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入删除标识，1删除，0未删除</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            备注 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" value="${mntLibInfo.remark}" name="remark" id="remark">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入备注</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            创建人 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" value="${mntLibInfo.creator}" name="creator" id="creator">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入创建人</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            创建时间 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="date-picker form-control" readonly data-date-format="yyyy-mm-dd" 
                                                value="<fmt:formatDate value="${mntLibInfo.createDate}" pattern="yyyy-MM-dd"/>" name="createDate" id="createDate">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入创建时间</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            修改人 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" value="${mntLibInfo.modifier}" name="modifier" id="modifier">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入修改人</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            修改时间 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="date-picker form-control" readonly data-date-format="yyyy-mm-dd" 
                                                value="<fmt:formatDate value="${mntLibInfo.modifyDate}" pattern="yyyy-MM-dd"/>" name="modifyDate" id="modifyDate">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入修改时间</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="col-md-9 model-hidden">
                                        <input type="hidden" value="${mntLibInfo.libId}" name="libId" id="libId">
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
            libId:"required",
            libName:"required",
            moduleId:"required",
            libDesc:"required",
            isUsed:"required",
            deleteFlag:"required",
            remark:"required",
            creator:"required",
            createDate:"required",
            modifier:"required",
            modifyDate:"required"
    };
    //[2]表单校验初始化
    initFormValidate('form-update', rules, 'prod/lib/update', 'update');
    
});

</script>
</body>
</html>