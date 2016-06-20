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
                            <i class=" icon-layers font-green"></i> <span class="caption-subject bold uppercase"> 新增产品 </span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <form action="#" class="form-horizontal" id="form_sample_1">
                            <div class="form-body">
                                <div class="form-group form-md-line-input">
                                    <label class="col-md-3 control-label" for="form_control_1">产品名称 <span class="required">*</span>
                                    </label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" placeholder="" name="prodName" id="prodName">
                                        <div class="form-control-focus"></div>
                                        <span class="help-block">请输入产品名称</span>
                                    </div>
                                </div>
                                <div class="form-group form-md-line-input">
                                    <label class="col-md-3 control-label" for="form_control_1">产品描述 <span class="required">*</span>
                                    </label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" placeholder="" name="prodDesc" id="prodDesc">
                                        <div class="form-control-focus"></div>
                                        <span class="help-block">请对产品进行简单描述</span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-actions">
                                <div class="row">
                                    <div class="col-md-offset-3 col-md-9">
                                        <a href="javascript:;" class="btn green" id="addCommit">提交</a>
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
    
	$('#addCommit').on('click', function (e) {
		var prodName = $('#prodName').val();
		var prodDesc = $('#prodDesc').val();
        $.ajax({
            url:"prod/info/add",
            dataType: "json",
            data:{"prodName":prodName, "prodDesc":prodDesc},
            async:false,
            success:function (data) {
            	showConfirm("添加成功，是否继续添加？");
            },
            error:function() {
                alert("添加失败，请稍后重试！");
            }
        });
	});
});

</script>
</body>
</html>