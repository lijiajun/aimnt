<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html>
<html>
<head>
<title>运维文章</title>
<%@include file="../included/includedStyle.jsp" %>
<link href="static/plugins/summernote/summernote.css" rel="stylesheet" type="text/css" />

<style>
.error_msg {
    color: red;
}
</style>
</head>

<body>
    <div class="wrapper">
        <div class="portlet light bordered">
            <div class="portlet-title">
                <div class="caption">
<!--                     <i class="fa fa-search"></i> -->
                    <span class="caption-subject font-blue-hoki bold uppercase">发布文章</span>
                </div>
            </div>
            <div class="portlet-body form">
                <form class="form-horizontal" id="articleForm">
                <div class="form-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label col-md-2">文章标题</label>
                                <div class="col-md-9">
                                    <input type="text" class="form-control" id="title" name="title" placeholder="请输入文章标题">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label col-md-2">文章分类</label>
                                <div class="col-md-9">
                                    <input type="text" class="form-control" id="typeId" name="typeId" >
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label col-md-2">文章正文</label>
                                <div class="col-md-9">
                                    <div id="summernote"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label col-md-2">关键字</label>
                                <div class="col-md-9">
                                    <input type="text" class="form-control" id="keyword" name="keyword" placeholder="请输入关键字，以逗号分隔">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label col-md-2">摘要</label>
                                <div class="col-md-9">
                                    <textarea rows="3" class="form-control" placeholder="请输入文章摘要信息，如果不输入，默认截取文章前100字" name="summary" id="summary"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label col-md-2">立即发布</label>
                                <div class="col-md-9">
                                    <input type="text" class="form-control" name="isShow" id="isShow" placeholder="请输入关键字，以逗号分隔">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-actions">
                            <div class="row">
                                <div class="col-md-10">
                                    <button type="button" id="publish_art" class="btn green">发 布</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </form>
            </div>
        </div>    
    </div>


<%@include file="../included/includedJs.jsp" %>
<script src="static/plugins/summernote/summernote.min.js" type="text/javascript"></script>
<script src="static/plugins/summernote/lang/summernote-zh-CN.min.js" type="text/javascript"></script>
<script>
    $(function() {
        
    	$('#summernote').summernote({
    		height: 300,
    		lang: 'zh-CN',
    		callbacks: {
    		    onImageUpload: function(files) {
    		    	
    		    	$.ajax({
    	                url: 'articel/upload_pic',
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
    		    	
    		    	
    		      $('#summernote').summernote('insertImage', "static/img/ai-logo.png", "ai-log.png");
    		    }
    		}
    	});
    	
    	$('#publish_art').click(function(){
    		var _title = $('#title').val();
    		if(_title == '') {
    			showMsg("请输入文章标题！");
    			return false;
    		}
            var _typeId = $('#typeId').val();
            if(_typeId == '') {
            	showMsg("请选择文章分类！");
            	return false;
            }
            var _keyword = $('#keyword').val();
            var _summary = $('#summary').val();
            var _isShow = $('#isShow').val();
        	if ($('#summernote').summernote('isEmpty')) {
        		showMsg("请输入要发布的文章！");
        		return false;
        	}
        	var _content = $('#summernote').summernote('code');
            var formData = new FormData($("#articleForm")[0]);
            formData.append('content', _content);
            $.ajax({
                url: 'article/add_article',
                type: 'POST',
                dataType: "json",
                data: formData,
                processData: false, //不处理发送的数据
                contentType: false, //不设置Content-Type请求头
                success:function (data) {
                    showMsg("发布成功！");
                    return;
                },
                error:function(xhr, ajaxOptions, thrownError) {
                	console.log(thrownError);
                    showMsg("发布出现错误，请稍后重试！");
                    return false;
                }
            });
    	});
    	
    	
    });


</script>
</body>
</html>