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
                            <i class=" icon-layers font-green"></i> <span class="caption-subject bold uppercase"> 修改产品信息 </span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <form action="#" class="form-horizontal" id="form_sample_1">
                            <div class="form-body">
                                <div class="form-group form-md-line-input">
                                    <label class="col-md-3 control-label" for="form_control_1">产品名称 <span class="required">*</span>
                                    </label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" placeholder="" value="${mntProd.prodName}" name="prodName" id="prodName">
                                        <div class="form-control-focus"></div>
                                        <span class="help-block">请输入产品名称</span>
                                    </div>
                                </div>
                                <div class="form-group form-md-line-input">
                                    <label class="col-md-3 control-label" for="form_control_1">产品描述 <span class="required">*</span>
                                    </label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" placeholder="" value="${mntProd.prodDesc}" name="prodDesc" id="prodDesc">
                                        <div class="form-control-focus"></div>
                                        <span class="help-block">请对产品进行简单描述</span>
                                    </div>
                                </div>
                                <div class="col-md-9 model-hidden">
                                    <input type="hidden" value="${mntProd.prodId}" name="prodId" id="prodId">
                                </div>
                            </div>
                            <div class="form-actions">
                                <div class="row">
                                    <div class="col-md-offset-3 col-md-9">
                                        <a href="javascript:;" class="btn green" id="modifyCommit">提 交</a>
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
    
	$('#modifyCommit').on('click', function (e) {
		var prodName = $('#prodName').val();
		var prodDesc = $('#prodDesc').val();
		var prodId = $('#prodId').val();
        $.ajax({
            url:"prod/info/update",
            dataType: "json",
            data:{"prodName":prodName, "prodDesc":prodDesc, "prodId":prodId},
            async:false,
            success:function (data) {
            	showMsg("修改成功！");
                window.parent.reloadData();
                var index = parent.layer.getFrameIndex(window.name);
                parent.layer.close(index);
            },
            error:function() {
            	showMsg("修改操作发生错误！");
            }
        });
	});
    
});

</script>
</body>
</html>