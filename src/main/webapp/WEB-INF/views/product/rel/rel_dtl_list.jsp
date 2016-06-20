<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                            <i class=" icon-layers font-green"></i>
                            <span class="caption-subject bold uppercase">
                            ${relCode}发布明细
                            </span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <table class="table table-striped table-bordered table-hover table-checkable order-column noscoll" id="tabDtl" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>发布版本号</th>
                                    <th>明细类型</th>
                                    <th>需求编号</th>
                                    <th>需求名称</th>
                                    <th>安装点</th>
<!--                                     <th>需求描述</th> -->
                                    <th>创建人</th>
                                    <th>创建时间</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${relDtlList}" var="relDtl" varStatus="status">
                                    <tr>
                                        <td>${status.index + 1}</td>
                                        <td>${relDtl.relCode}</td>
                                        <td>${relDtl.dtlTypeTxt}</td>
                                        <td>${relDtl.dtlCode}</td>
                                        <td>${relDtl.dtlName}</td>
                                        <td>${relDtl.baseIdTxt}</td>
<%--                                         <td>${relDtl.dtlDesc}</td> --%>
                                        <td>${relDtl.creator}</td>
                                        <td><fmt:formatDate value="${relDtl.createDate}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
                                    </tr>
                                </c:forEach >
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
<%@include file="../../included/includedJs.jsp" %>
<script>

$(function() {
    var tableObj = $("#tabDtl").DataTable(getConfig());
});

    function getConfig() {
        return config = {
            "processing" : true,
            "pageLength" : 5,
            "lengthMenu" : [ [5, 10, 20, -1 ], [ 5, 10, 20, "All" ] ],
            "serverSide" : false,
//             "scrollX": "2000px",
            "dom": '<"top"lf<"div_right">>rt<"bottom"ip><"clear">',
            "language" : {
                "processing" : "努力加载数据中...",
                "lengthMenu" : "_MENU_ 条记录每页",
                "zeroRecords" : "没有找到记录",
                "info" : "第 _PAGE_ 页 ( 总共 _PAGES_ 页 )",
                "infoEmpty" : "无记录",
                "infoFiltered" : "(从 _MAX_ 条记录过滤)",
                "paginate" : {
                    "previous" : "上一页",
                    "next" : "下一页"
                }
            }
        };
    }
</script>
</body>
</html>