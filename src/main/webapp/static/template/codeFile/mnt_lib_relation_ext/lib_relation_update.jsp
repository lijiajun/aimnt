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
                            <i class="icon-layers font-green"></i> <span class="caption-subject bold uppercase"> 新增库文件扩展关联信息 </span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <form action="#" class="form-horizontal" id="form-update">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                             <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" value="${mntLibRelationExt.id}" name="id" id="id">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            产品编号 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" value="${mntLibRelationExt.prodId}" name="prodId" id="prodId">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入产品编号</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            产品大版本编号 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" value="${mntLibRelationExt.verCode}" name="verCode" id="verCode">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入产品大版本编号</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            库文件 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" value="${mntLibRelationExt.libName}" name="libName" id="libName">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入库文件</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            关联库文件 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" value="${mntLibRelationExt.relLibName}" name="relLibName" id="relLibName">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入关联库文件</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            关联描述 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" value="${mntLibRelationExt.relDesc}" name="relDesc" id="relDesc">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入关联描述</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            删除标识，1删除，0未删除 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" value="${mntLibRelationExt.deleteFlag}" name="deleteFlag" id="deleteFlag">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入删除标识，1删除，0未删除</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            创建人 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" value="${mntLibRelationExt.creator}" name="creator" id="creator">
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
                                                value="<fmt:formatDate value="${mntLibRelationExt.createDate}" pattern="yyyy-MM-dd"/>" name="createDate" id="createDate">
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
                                            <input type="text" class="form-control" placeholder="" value="${mntLibRelationExt.modifier}" name="modifier" id="modifier">
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
                                                value="<fmt:formatDate value="${mntLibRelationExt.modifyDate}" pattern="yyyy-MM-dd"/>" name="modifyDate" id="modifyDate">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入修改时间</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="col-md-9 model-hidden">
                                        <input type="hidden" value="${mntLibRelationExt.id}" name="id" id="id">
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
            id:"required",
            prodId:"required",
            verCode:"required",
            libName:"required",
            relLibName:"required",
            relDesc:"required",
            deleteFlag:"required",
            creator:"required",
            createDate:"required",
            modifier:"required",
            modifyDate:"required"
    };
    //[2]表单校验初始化
    initFormValidate('form-update', rules, 'lib/relation/update', 'update');
    
});

</script>
</body>
</html>