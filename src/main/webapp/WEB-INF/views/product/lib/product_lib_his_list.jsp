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
                            ${libName}发布历史明细
                            </span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <table class="table table-striped table-bordered table-hover table-checkable order-column noscoll" id="tabProc" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>LIB库名称</th>
                                    <th>LIB库版本号</th>
                                    <th>MD5值</th>
                                    <th>发布版本</th>
                                    <th>发布时间</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${mntLibRelHisList}" var="mntLibRelHis" varStatus="status">
                                    <tr>
                                        <td>${status.index + 1}</td>
                                        <td>${mntLibRelHis.mntModuleLib.libName}</td>
                                        <td>${mntLibRelHis.libCode}</td>
                                        <td>${mntLibRelHis.md5Val}</td>
                                        <td>${mntLibRelHis.mntReleaseRec.relCode}</td>
                                        <td><fmt:formatDate value="${mntLibRelHis.mntReleaseRec.relDate}" pattern="yyyy-MM-dd" /></td>
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
    var tableObj = $("#tabProc").DataTable(getConfig());
});

function getConfig() {
    return config = {
        "processing" : true,
        "pageLength" : 10,
        "lengthMenu" : [ [5, 10, 20, -1 ], [ 5, 10, 20, "All" ] ],
        "order" : [ [ 1, "asc" ] ],
//         "scrollX": "2000px",
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