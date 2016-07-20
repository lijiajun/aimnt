<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
                
                
                <!--comment begin -->
              
                
                <!-- 评论发表输出 -->
                <div >
                    <div class="portlet light article">
                        <div>
                            评论(${mntArticleComment.totalCount}) 
                        </div> <hr>
                        <div  id="content">
                            <c:forEach items="${commentList }" var="comment">
                                <c:if test="${comment.aritcleId==mntArticle.id}">
                                    <div>
                                        <a href="#"><strong>${comment.userName }</strong></a>  &nbsp; 发表于 &nbsp;
                                        <fmt:formatDate value="${comment.commentDate }" pattern="yyyy-MM-dd HH:mm:ss" />                               
                                        <div style="text-align:right" >
<%--                                             <button type="button" id="qwe_${comment.commentId}">回复此评论</button> --%>
                                            <a href="javascript:;" onclick="showInput(${comment.commentId})">回复</a>
                                        </div>
                                    </div>
                                    <c:if test="${comment.parentId ==-1}">
                                        <div class="">
                                            ${comment.commentContent }
                                         </div>
                                    </c:if>
                                    <c:if test="${comment.parentId !=-1}">
                                        <div>
                                            对<a href="#"><strong>${comment.parentUserName}</strong></a>的回复:
                                        </div><br>
                                        <div class="">
                                            ${comment.commentContent }
                                        </div>
                                    </c:if>
                                    <br>
                                    <div id="qwe_${comment.commentId }" style="display:none" class="comInp">              <!--  点击回复后，在评论下弹出一个文本框 不点击就隐藏 -->
                                        <textarea rows="3" class="form-control" id="reInp${comment.commentId}"  placeholder="请输入评论，不要超过1000字"></textarea><br>
                                        <div class="" style="text-align:right">
                                            <span class="publish">
                                                <a href="javascript:;" onclick="showReply(${comment.commentId})">回复评论</a>
                                                <!-- <button type="button" class="commend-edit" id="reply-submit2" >回复</button> -->
                                            </span>
                                        </div>
                                    </div>
                                    <hr>
                                </c:if>
                            </c:forEach>
                        </div>
                        <div class="portlet-foot" style="text-align: center;margin-top:30px" >
                            <div id="page-selection"></div>
                        </div>
                        <!-- <div id="content">Dynamic Content goes here</div>
                        <div id="page-selection">Pagination goes here</div> -->
                    </div>
                    <div class="reply-title">
                        <strong>发表我的看法</strong>
                    </div>
                    <div>
                            <div>
                            
                            </div>
                            <div class="">
                                <textarea rows="3" class="form-control" id="commentContend" placeholder="请输入评论，不要超过1000字"></textarea><br>
                                <div class="" style="text-align:right">
                                    <span class="publish">
                                        <button type="button" class="commend-edit"  id="reply-submit">发表评论</button>
                                    </span>
                                </div>
                            </div>
                    </div>
               </div>
                <!--comment end -->
                
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
<script src="static/plugins/bootpag/jquery.bootpag.min.js" type="text/javascript"></script>

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
        
        $('button#reply-submit').click(function(){
        	//alert("==================");
            var _commentContent = $('#commentContend').val();
            var _articleId = ${mntArticle.id};
            var surl = 'article/add_article_comment?commentContent=' + _commentContent + "&aritcleId=" + _articleId;
           
            $.ajax({
                url: surl,
                type: 'POST',
                dataType: "json",
                success:function (data) {
                    showMsg("评论成功！");
                    window.location.href = "article/full_content/${mntArticle.id}";
                    //return;
                },
                error:function(xhr, ajaxOptions, thrownError) {
                    console.log(thrownError);
                    showMsg("评论出现错误，请稍后重试！");
                    return false;
                }
            });
        });
        
        $('#page-selection').bootpag({
            total:${mntArticleComment.totalPage},
            page: ${mntArticleComment.currentPage},
            maxVisible: 10,
            leaps: false,
            next: ' > ',
            prev: ' < '
        }).on("page", function(event,num){
             window.location.href = "article/full_content/${mntArticle.id}?currentPage=" + num;
            // alert("num: " + num);
        });
        
       /*  $('button#reply-submit2').click(function(){
        	var _commentContent2 = $("#commentContend2").val();
            alert(_commentContent2);
        }); */
        
        
    });
   
       /*  function comment() {
        	
            var _url = 'article/comment/page?currentPage='+num;
        	$.ajax({
                url: _url,
                dataType: "json",
                async:false,
                success:function (data) {
                   
                },
                error:function() {
                    showMsg("加载下拉框出现错误！");
                }
            });
} */

function showInput(_cId) {
	//alert(_cId);
	if($(".comInp").is(":visible")==true){
		$(".comInp").hide();
	};
	$("#qwe_"+_cId).toggle();
	
}


function showReply(_commentId){
	var _articleId2 = ${mntArticle.id};
	var _commentContent2 = $("#reInp"+_commentId).val();
	var _parentId = _commentId;
	var _url2 = 'article/add_article_comment2?commentContent='+	 _commentContent2 +'&aritcleId=' +_articleId2 + '&parentId=' +_parentId;
		 
	$.ajax({
             url: _url2,
             type: 'POST',
             dataType: "json",
             success:function (data) {
                 showMsg("评论成功！");
                 window.location.href = "article/full_content/${mntArticle.id}";
                 //return;
             },
             error:function(xhr, ajaxOptions, thrownError) {
                 console.log(thrownError);
                 showMsg("评论出现错误，请稍后重试！");
                 return false;
             }
         });
}

</script>
</body>
</html>