<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../../included/includedStyle.jsp" %>
</head>

<body class="body-bg">
    <div class="wrapper-box">
        <div class="row">
            <div class="col-md-12">
                <div class="wrapper-content">
                    <div class="portlet-title">
                        <div class="caption font-dark">
                            <i class="icon-layers font-green"></i> <span class="caption-subject bold uppercase"> ${mntModuleLib.libName}详细信息 </span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <form action="#" class="form-horizontal" id="form-add">
                            <div class="row border-txt">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            产品类型：
                                        </label>
                                        <div class="col-md-8">
                                            <p class="form-control-static">${mntModuleLib.mntProdModule.prodName}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            产品版本：
                                        </label>
                                        <div class="col-md-8">
                                            <p class="form-control-static">${mntModuleLib.mntProdModule.verName}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row border-txt">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            所属模块：
                                        </label>
                                        <div class="col-md-8">
                                            <p class="form-control-static">${mntModuleLib.moduleName}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            库文件名称：
                                        </label>
                                        <div class="col-md-8">
                                            <p class="form-control-static">${mntModuleLib.libName}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row border-txt">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            业务库类型：
                                        </label>
                                        <div class="col-md-8">
                                            <p class="form-control-static">${mntModuleLib.libTypeTxt}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            是否在用：
                                        </label>
                                        <div class="col-md-8">
                                            <p class="form-control-static">${mntModuleLib.isUsedTxt}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row border-txt">
                                <div class="col-md-12">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-2 control-label" for="form_control_1">
                                            库文件描述：
                                        </label>
                                        <div class="col-md-10">
                                            <p class="form-control-static">${mntModuleLib.libDesc}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row border-txt">
                                <div class="col-md-12">
                                    <div class="form-group form-md-line-input">
                                    <label class="col-md-2 control-label" for="form_control_1">
                                        关联Lib库
                                    </label>
                                    <div class="col-md-10">
                                        <table class="table table-striped table-bordered table-hover table-checkable order-column" id="tabMntLibRelation" cellspacing="0" width="100%">
                                            <thead>
                                                <tr>
                                                    <th>序号</th>
<!--                                                     <th>Lib库id</th> -->
                                                    <th>关联Lib库</th>
                                                    <th>关联描述</th>
<!--                                                     <th>产品ID</th> -->
<!--                                                     <th>版本Code</th> -->
<!--                                                     <th>模块ID</th> -->
<!--                                                     <th>关联Lib库ID</th> -->
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${relLibs}" var="relLib" varStatus="status">
                                                    <tr>
                                                        <td>${status.index + 1}</td>
<%--                                                         <td>${mntModuleLib.libId}</td> --%>
                                                        <td><a href="prod/lib/info/${relLib.libId}/page">${relLib.libName}</a></td>
                                                        <td>${relLib.libDesc}</td>
<%--                                                         <td>${relLib.mntProdModule.prodId}</td> --%>
<%--                                                         <td>${relLib.mntProdModule.verCode}</td> --%>
<%--                                                         <td>${relLib.moduleId}</td> --%>
<%--                                                         <td>${relLib.libId}</td> --%>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
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
    var tableObj = $('#tabMntLibRelation').DataTable(getConfig());
});

function getConfig() {
    return config = {
        "processing" : true,
        "pageLength" : 10,
        "lengthMenu" : [ [ 5, 10, 20, -1 ], [ 5, 10, 20, "All" ] ],
        "order" : [ [ 0, "asc" ] ],
//         "serverSide" : false,
//         "columns" : [ {
//             "data" : "no",
//         }, {
//             "data" : "libId",
//             "visible" : false
//         }, {
//             "data" : "relLibName"
//         }, {
//             "data" : "relDesc"
//         }, {
//             "data" : "prodId",
//             "visible" : false
//         }, {
//             "data" : "verCode",
//             "visible" : false
//         }, {
//             "data" : "moduleId",
//             "visible" : false
//         }, {
//             "data" : "relLibId",
//             "visible" : false
//         }],
        "sScrollX": "100%",
        "dom": '<"top"lf<"div_right">>rt<"bottom"ip><"clear">',
        "language" : {
            "lengthMenu" : "_MENU_ 条记录每页",
            "zeroRecords" : "没有查询到数据",
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