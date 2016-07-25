<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>发布计划导入</title>
<%@include file="../../included/includedStyle.jsp" %>
</head>

<body>
    <div class="wrapper" >
        <div class="wrapper-content">
            <div class="portlet-title">
                <div class="caption font-dark">
                    <i class=" icon-layers font-green"></i> <span class="caption-subject bold uppercase"> 发布计划批量导入 </span>
                </div>
            </div>
            <div class="portlet-body">
                <form action="#" action="prod/lib/import" method="post" enctype="multipart/form-data" class="form-horizontal" id="form-upload">
                    <div class="row" style="padding-top:20px">
                        <div class="col-md-6">
                            <label class="col-md-4 control-label" for="form_control_1">
                                    导入文件 <span class="required">*</span>
                            </label>
                            <div class="col-md-8 form-group">
                                <input type="file" name="file" id="tempFile">
                                <div class="form-control-focus"></div>
                                <span class="help-block">请选择导入文件</span>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label class="col-md-6 control-label" for="form_control_1">
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
                                <a id="templete" href="javascript:void(0)">发布计划模板(开发)</a>
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
    
//     //赋值
//     loadVerCodeSelect();
//     var _verCode = '${prodModule.verCode}';
//     $('#verCode').val(_verCode);
//     loadParentModuleSelect();
//     $('#verCode').selectpicker('refresh');
    
    
//     $('#prodId').change(function(){
//         loadVerCodeSelect();
//     });
    
    $('#templete').click(function(){
    	var fname = $('#templete').html();
    	window.location.href='prod/module/down/' + fname;
    });
    
    
    $('#commit').click(function(){
        if($('#tempFile').val() == '') {
            showMsg("请选择需要导入的excel文件！");
            return;
        }
        var formData = new FormData($("#form-upload")[0]);
        $.ajax({
            url: 'rel/plan/import',
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
        $('#tempFile').val("");
    });
    
});

</script>
</body>
</html>