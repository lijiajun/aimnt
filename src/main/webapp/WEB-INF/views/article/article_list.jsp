<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html>
<html>
<head>
<title>运维文章</title>
<%@include file="../included/includedStyle.jsp" %>

<style type="text/css"> 

a:link { text-decoration: none;color: #00688B} 
a:active { text-decoration:blink} 
a:hover { text-decoration:underline;color: #00688B} 
a:visited { text-decoration: none;color: #00688B} 

</style>
</head>

<body>
    <div class="wrapper">
        <div class="row">
            <div class="col-md-9 col-sm-12">
                <div class="portlet light">
                    <div class="pub-article">
                        <span class="publish"><a href="article/add_page">+发布新文章</a></span>&nbsp;&nbsp;
                        <span class="publish"><a href="article/my_articles">我的文章</a></span> 
                    </div>
                    <div class="portlet-body">
                        <c:forEach items="${articleList}" var="article">
                            <div class="dis_article">
                                <div class="_title">
                                    <c:if test="${article.isTop == 1 }">
                                        <a href="article/full_content/${article.id}">[顶]${article.title}</a>
                                    </c:if>
                                    <c:if test="${article.isTop != 1 }">
                                        <a href="article/full_content/${article.id}">${article.title}</a>
                                    </c:if>
                                </div>
                                <div class="_summary">
                                    ${article.summary}
                                </div>
                                <div class="_article-rel">
                                    <a href="article/page?creator=${article.creator}">${article.creator}</a>
                                    发布于 <fmt:formatDate value="${article.createDate}" pattern="yyyy-MM-dd HH:mm:ss" />
                                    &nbsp;&nbsp;分类：<a href="article/page?typeId=${article.typeId}">${article.typeCn}</a>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="portlet-foot" style="text-align: center;margin-top:30px">
                        <div id="page-selection"></div>
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
<script src="static/plugins/bootpag/jquery.bootpag.min.js" type="text/javascript"></script>
<script>
    $(function() {
        
        $('#articleSearch').click(function(){
        	var _searchContent = $('#sContent').val();
            window.location.href = "article/page?title=" + _searchContent;
        });
        
        $('#page-selection').bootpag({
            total: ${mntArticle.totalPage}, //总页数
            page: ${mntArticle.currentPage}, //当前页
            maxVisible: 10,
            //href: "#pro-page-{{number}}",
            leaps: false,
            next: ' > ',
            prev: ' < '
        }).on("page", function(event, num){
             $("#content").html("Insert content"); // some ajax content loading...
             var searchTopic = '${mntArticle.title}';
             if(searchTopic == '' || searchTopic == 'null') {
            	 
             }
             var _searchContent = $('#sContent').val();
             window.location.href = "article/page?title=" + _searchContent + "&currentPage=" + num;
        });
        
    });


</script>
</body>
</html>