<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../../included/includedStyle.jsp" %>
</head>

<body class="body-bg">

   <div  class="portlet-body">
       <div class="row">
            <div class="col-md-12">
                <div class="wrapper-content">
<!--                     <div class="portlet-title"> -->
<!--                         <div class="caption font-dark"> -->
<!--                             <i class=" icon-layers font-green"></i> <span class="caption-subject bold uppercase"> 产品发布信息 </span> -->
<!--                         </div> -->
<!--                     </div> -->
                    <div class="portlet-body">
                         <table id="example" class="table table-striped table-bordered table-hover table-checkable order-column" cellspacing="0" width="100%">
                        <thead>
                        <tr>
                            <th rowspan="2">安装点</th>
                            <th rowspan="2">汇总</th>
                            <th colspan="4">账管</th>
                            <th colspan="4">账处</th>
                            <th colspan="4">openbilling</th>
                            <th colspan="4">VB60计费系统</th>
                            <th colspan="4">VB60帐务处理</th>
                        </tr>
                        <tr>
                          
                            <c:forEach begin="0" end="4" >
                                <th>SCCB</th>
                                <th>需求分析</th>
                                <th>开发</th>
                                <th>测试</th>
                            </c:forEach>
                        </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>NG自优化</td>
                                <td>3</td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>2</td>
                                
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                
                                 <td></td>
                                <td></td>
                                <td>1</td>
                                <td></td>
                                
                                 <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>北京</td>
                                <td>7</td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                
                                <td>1</td>
                                <td></td>
                                <td></td>
                                <td>1</td>
                                
                                 <td>2</td>
                                <td>3</td>
                                <td></td>
                                <td></td>
                                
                                 <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                    </div>
                </div>
            </div>
        </div>
      
   </div>

<%@include file="../../included/includedJs.jsp" %>

<script type="text/javascript">
jQuery(document).ready(function() {
	$('#example').dataTable({
		"paging":   false,    //不分页 
		"searching": false,           //不搜索 
		 "bInfo" : false                      //不显示第几项到第几项 
	});
   
    
});

</script>
</body>
</html>