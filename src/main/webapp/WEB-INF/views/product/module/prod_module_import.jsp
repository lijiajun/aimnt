<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>产品模块导入</title>
<%@include file="../../included/includedStyle.jsp" %>
</head>

<body>
    <div class="wrapper" >
        <div class="wrapper-content">
            <div class="portlet-title">
                <div class="caption font-dark">
                    <i class=" icon-layers font-green"></i> <span class="caption-subject bold uppercase"> 产品模块导入 </span>
                </div>
            </div>
            <div class="portlet-body">
                <form action="#" action="prod/module/import" method="post" enctype="multipart/form-data" class="form-horizontal" id="form-upload">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group form-md-line-input">
                                <label class="col-md-4 control-label" for="form_control_1">
                                    产品类型 <span class="required">*</span>
                                </label>
                                <div class="col-md-8">
                                    <select name="prodId" class="selectpicker form-control" id="prodId">
                                        <option value='-1' selected>请选择</option>
                                        <c:forEach items="${prodEnums}" var="prodEnum">
                                            <option value="${prodEnum.key}">${prodEnum.value}</option>
                                        </c:forEach>
                                    </select>
                                    <div class="form-control-focus"></div>
                                    <span class="help-block">请选择产品类型</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group form-md-line-input">
                                <label class="col-md-4 control-label" for="form_control_1">
                                    产品版本 <span class="required">*</span>
                                </label>
                                <div class="col-md-8">
                                    <select name="verCode" class="selectpicker form-control" id="verCode">
                                        <option value='-1' selected>请选择</option>
                                        <c:forEach items="${verEnums}" var="verEnum">
                                            <option value="${verEnum.key}">${verEnum.value}</option>
                                        </c:forEach>
                                    </select>
                                    <div class="form-control-focus"></div>
                                    <span class="help-block">请选择产品版本</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label class="col-md-2 control-label" for="form_control_1">
                                    导入文件 <span class="required">*</span>
                            </label>
                            <div class="col-md-10 form-group">
                                <input type="file" name="file" id="tempFile">
                                <div class="form-control-focus"></div>
                                <span class="help-block">请选择导入文件</span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label class="col-md-12 control-label" for="form_control_1">
                                <button type="button" id="commit" class="btn green">提 交</button>
                            </label>
                        </div>
                    </div>
                    <hr/>
                    <div class="row">
                        <div class="col-md-12">
                            <label class="col-md-2 control-label" for="form_control_1">
                                模板下载：
                            </label>
                            <div class="col-md-10 form-group">
                                <a id="templete" href="javascript:void(0)">产品模块模板</a>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

<%@include file="../../included/includedJs.jsp" %>


<script type="text/javascript">

jQuery(document).ready(function() {
    
    //赋值
    loadVerCodeSelect();
    var _verCode = '${prodModule.verCode}';
    $('#verCode').val(_verCode);
    loadParentModuleSelect();
    $('#verCode').selectpicker('refresh');
    
    
    $('#prodId').change(function(){
        loadVerCodeSelect();
    });
    
    $('#templete').click(function(){
    	var fname = $('#templete').html();
    	window.location.href='prod/module/down/' + fname;
    });
    
    
    $('#commit').click(function(){
        var _prodId = $('#prodId').val();
        if(_prodId == -1) {
            showMsg("请选择产品类型！");
            return;
        }
        var _verCode = $('#verCode').val();
        if(verCode == -1) {
            showMsg("请选择产品版本！");
            return;
        }
        if($('#tempFile').val() == '') {
            showMsg("请选择需要导入的excel文件！");
            return;
        }
        var formData = new FormData($("#form-upload")[0]);
        $.ajax({
            url: 'prod/module/import',
            type: 'POST',
            dataType: "json",
            data: formData,
            processData: false,  
            contentType: false,
            async:false,
            success:function (data) {
                if(data.status == 0) {
                    showMsg(data.error);
                }else {
                    showMsg(data.info);
                }
            },
            error:function() {
                showMsg("上传操作发生错误！");
            }
        });
        $('#prodId').val(-1);
        $('#verCode').val(-1);
        $('#tempFile').val("");
        $('#prodId').selectpicker('refresh');
        $('#verCode').selectpicker('refresh');
    });
    
});

</script>
</body>
</html>