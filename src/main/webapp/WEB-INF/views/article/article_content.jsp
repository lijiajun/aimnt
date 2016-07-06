<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html>
<html>
<head>
<title>运维文章</title>
<%@include file="../included/includedStyle.jsp" %>
</head>

<body>
    <div class="wrapper">
        <div class="row">
            <div class="col-md-9 col-sm-12">
                <div class="portlet light article">
                    <div class="full-article-title">
                        ${mntArticle.title}
                    </div>
                    <div class="full-article-rel">
                        作者：${mntArticle.author} &nbsp;&nbsp;&nbsp;&nbsp; <fmt:formatDate value="${mntArticle.createDate}" pattern="yyyy-MM-dd HH:mm:ss" />
                        <c:if test="${mntArticle.creator == currentUserName}">
                        &nbsp;&nbsp;<a href="article/update_page/${mntArticle.id}">编辑</a>&nbsp;&nbsp;<a id="article-delete" href="javascript:void(0);">删除</a>
                        </c:if>
                    </div>
                    <div class="full-article-body">
                        ${mntArticle.content}
                    </div>
                    <div class="full-article-up">
                        <i id="article-like" class="fa fa-thumbs-o-up"></i>
                    </div>
                    <div class="full-article-footer" style="margin-bottom: 10px">
                        <div class="col-md-6 col-sm-12" style="text-align: left">
                            上一篇：
                            <c:if test="${hasPre == 1}">
                                <a href="article/full_content/${preArticle.id}">${preArticle.title}</a>
                            </c:if>
                            <c:if test="${hasPre != 1}">
                                ${preArticle.title}
                            </c:if>
                        </div>
                        <div class="col-md-6 col-sm-12" style="text-align: right">
                            下一篇：
                            <c:if test="${hasNext == 1}">
                                <a href="article/full_content/${nextArticle.id}">${nextArticle.title}</a>
                            </c:if>
                            <c:if test="${hasNext != 1}">
                                ${nextArticle.title}
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-12">
                  <div class="portlet light cale">
                    <div class="portlet-title" style="padding:10px 0px;">
                            <div style="padding:2px 0px">
                            <input id="sContent" type="text" style="width:85%;height:30px;float:left;border-left:0px;border-top:0px;border-right:0px;border-bottom:1px" class="form-control" placeholder="Search...">
                            <i id="articleSearch" class="fa fa-search" style="cursor:pointer;padding:7px 0px;font-size:17px;width:30px;height:30px;float:right"></i>
                            </div>
                    </div>
                    <div class="portlet-title" style="padding:10px 0px;">
                        <div class="caption">
                            <span id="ctitle" class="caption-subject bold">热门阅读</span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <c:forEach items="${artiTopTenList}" var="topTen">
                            <div class="_titleTopTen">
                                <a href="article/full_content/${topTen.id}">${topTen.title}</a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>


<%@include file="../included/includedJs.jsp" %>
<script>
    $(function() {
        
        $('#articleSearch').click(function(){
            var _searchContent = $('#sContent').val();
            window.location.href = "article/page?title=" + _searchContent;
        });
        
        $('#article-like').click(function(){
            
        	$('#article-like').removeClass('fa fa-thumbs-o-up');
        	$('#article-like').addClass('fa fa-thumbs-up');
        	
        });
        
        $('#article-delete').click(function(){
        	$.ajax({
                url:"article/delete/" + ${mntArticle.id},
                dataType: "json",
                async:false,
                success:function (data) {
                    showMsg("删除成功！");
                    //tableObj.ajax.reload(null,false);
                    window.location.href = "article/page";
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