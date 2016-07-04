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
                <div class="portlet light">
                    <div class="full-article-title">
                        ${mntArticle.title}
                    </div>
                    <div class="full-article-rel">
                        作者：${mntArticle.creator} &nbsp;&nbsp;&nbsp;&nbsp; <fmt:formatDate value="${mntArticle.createDate}" pattern="yyyy-MM-dd HH:mm:ss" />
                        <c:if test="${mntArticle.creator == mntArticle.creator}">
                        &nbsp;&nbsp;<a href="article/update_page/${mntArticle.id}">编辑</a>&nbsp;&nbsp;<a href="article/delete/${mntArticle.id}">删除</a>
                        </c:if>
                    </div>
                    <div class="full-article-body">
                        ${mntArticle.content}
                    </div>
                    <div class="full-article-up">
                        <i id="article-like" class="fa fa-thumbs-o-up"></i>
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
                            <span id="ctitle" class="caption-subject bold">阅读排行</span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <c:forEach items="${artiTopTenList}" var="topTen">
                            <div class="_summary">
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
        
    });


</script>
</body>
</html>