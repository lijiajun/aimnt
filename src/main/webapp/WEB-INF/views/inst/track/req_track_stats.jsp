<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%-- <%@include file="../../included/includedStyle.jsp" %> --%>
 <link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
   <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
   <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
</head>

<body class="body-bg">

<div class="table-responsive">
   <table id="stas" class="table table-striped table-bordered table-hover table-checkable order-column">
        <thead>
            <tr>
                <th rowspan="2">安装点</th>
                <th rowspan="2">汇总</th>
                <th colspan="4">账管</th>
                <th colspan="4">账处</th>
                <th colspan="4">openbilling</th>
                <th colspan="4">VB60计费系统</th>
                <th colspan="4">VB60帐务处理</th>
                <th colspan="4">其他</th>
                
            </tr>
            <tr>

                <c:forEach begin="0" end="5">
                    <th>SCCB</th>
                    <th>需求分析</th>
                    <th>开发</th>
                    <th>测试</th>
                </c:forEach>
            </tr>
        </thead>
        <tbody>
           <c:forEach items="${statMap }" var="stat">
                <tr>
                    <td>${stat.key}</td>
                    <td>${stat.value[0].baseTotalCount} </td>
                    <c:forEach items = "${stat.value }" var="sVal">
                        <td >${sVal.sccbCount }</td>
                        <td>${sVal.reqAnalyCount }</td>
                        <td>${sVal.devCount }</td>
                        <td>${sVal.qaCount }</td>
                    </c:forEach>
                </tr>
           </c:forEach>
        </tbody>
        <tfoot>
            <tr>
                <th>汇总</th>
                <c:forEach items="${prodCount }" var="prod" begin="0" end="0"> 
                    <th>${prod }</th>
                </c:forEach>
                <c:forEach items="${prodCount }" var="prod" begin="1" end="6">
                    <th colspan="4">${prod }</th>
                </c:forEach>
            </tr>
        </tfoot>
   </table>
</div>  
<%@include file="../../included/includedJs.jsp" %>
<script type="text/javascript">
/* $(function() {
    var tableObj = $('#stas').DataTable(getConfig());
     $.ajax({   
        type: "post",   
        url: "/inst/track/stats",   
        dataType: "json",   
        success: function (data) {   
        	alert(data);
                   },   
        error: function (XMLHttpRequest, textStatus, errorThrown) {   
                                            alert(errorThrown);   
                }   
  });  
});
function getConfig() {
    return config = {
    		"info" : false ,
    		"ordering": false,
    		 "searching": false,
    		 "order-column":false,
    		 paging: false,
    		 
    }
}  */
</script>
</body>
</html>