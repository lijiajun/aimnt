<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../../included/includedStyle.jsp" %>
<link href="static/plugins/jstree/themes/default/style.min.css" rel="stylesheet" id="style_components" type="text/css" />
</head>

<body>
    <div class="wrapper">
        <div class="row">
            <div class="col-md-12">
                <div class="wrapper-content">
                    <div class="portlet-title">
                        <div class="caption font-dark">
                            <i class="icon-layers font-green"></i> <span class="caption-subject bold uppercase"> 更新角色 </span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <form action="#" class="form-horizontal" id="form-role">
                            <div class="tabbable-line">
                                <ul class="nav nav-tabs ">
                                    <li class="active">
                                        <a href="#role_attr" data-toggle="tab"> 角色属性 </a>
                                    </li>
                                    <li>
                                        <a href="#role_res" data-toggle="tab"> 资源权限 </a>
                                    </li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="role_attr">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group form-md-line-input">
                                                    <label class="col-md-2 control-label" for="form_control_1">
                                                        角色名称 <span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-10">
                                                        <input type="text" class="form-control" placeholder="" value="${sysRole.roleName}" name="roleName" id="roleName">
                                                        <div class="form-control-focus"></div>
                                                        <span class="help-block">请输入角色名称</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group form-md-line-input">
                                                    <label class="col-md-2 control-label" for="form_control_1">
                                                        角色状态 <span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-10">
                                                        <select class="selectpicker form-control" name="roleSts"  id="roleSts">
                                                            <c:forEach items="${roleStsEnums}" var="roleStsEnum">
                                                                <c:if test="${roleStsEnum.key == sysRole.roleSts}">
                                                                    <option value="${roleStsEnum.key}" selected>${roleStsEnum.value}</option>
                                                                </c:if>
                                                                <c:if test="${roleStsEnum.key != sysRole.roleSts}">
                                                                    <option value="${roleStsEnum.key}">${roleStsEnum.value}</option>
                                                                </c:if>
                                                            </c:forEach>
                                                        </select>
                                                        <div class="form-control-focus"></div>
                                                        <span class="help-block">请选择角色状态</span>
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
                                                        <input type="text" class="form-control" placeholder="" value="${sysRole.remark}" name="remark" id="remark">
                                                        <div class="form-control-focus"></div>
                                                        <span class="help-block">备注</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                               <div class="col-md-9 model-hidden">
                                                    <input type="hidden" value="${sysRole.roleId}" name="roleId" id="roleId">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="role_res">
                                       <div id="res_tree" class="tree-box"> </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-actions">
                                <div class="row">
                                    <div class="col-md-offset-3 col-md-9">
                                        <button type="submit" class="btn green">更 新</button>
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
<script src="static/plugins/jstree/jstree.min.js" type="text/javascript"></script>

<script type="text/javascript">

jQuery(document).ready(function() {
    
    $("#resOrder").TouchSpin({
        initval: 1
    });
    addClassSpin();
    
    $('.bs-select').selectpicker({
        iconBase: 'fa',
        tickIcon: 'fa-check'
    });
    
    
    //表单校验提交
    //[1]自定义校验规则
    $.validator.setDefaults({
        rules: {
            roleName:"required",
            roleSts:"required",
        },
        submitHandler: function(form) {
            var resIds = $('#res_tree').jstree().get_selected();
            resIds = resIds == '' ? 'none' : resIds;
            ajaxSubmitUpdate('sys/role/update/' + resIds, form);
        }
    });
    //[2]表单校验初始化
    initFormValidate1('form-role');
    
    //资源权限树
    $('#res_tree').bind("loaded.jstree", function (event, data) {
        $('#res_tree').jstree("open_all");
    });
    createResTree();
});

function createResTree() {
    $('#res_tree').jstree({
        'plugins': ["wholerow", "checkbox", "types"],
        'checkbox': { cascade: "", three_state: false }, //不级联
        'core': {
            'themes' : {
                "responsive": false
            },    
            'data': {
                'url' : "sys/role/res_tree?roleId=" + $("#roleId").val(),
                'dataType' : "json" 
            }
        },
        'types' : {
            'default' : {
                'icon' : "fa fa-folder icon-state-warning icon-lg"
            },
            'file' : {
                'icon' : "fa fa-file icon-state-warning icon-lg"
            }
        }
    });
}

</script>



</body>
</html>