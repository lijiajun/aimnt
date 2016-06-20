<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html>
<html>
<head>
<title>安装点上线信息</title>
<%@include file="../included/includedStyle.jsp" %>
</head>

<body>
    <div class="wrapper">
        <div class="row">
            <div class="col-md-12">
                <div class="wrapper-content">
                    <div class="portlet-title">
                        <div class="caption font-dark">
                            <i class=" icon-layers font-green"></i> <span class="caption-subject bold uppercase"> ${onlineDate}上线记录 </span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <table class="table table-striped table-bordered table-hover table-checkable order-column" id="tabMntInstallOnlineInfo" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>安装点编号</th>
                                    <th>产品编号</th>
                                    <th>产品版本</th>
                                    <th>上线版本</th>
                                    <th>需求或故障编号</th>
                                    <th>需求或故障名称</th>
                                    <th>上线模块</th>
                                    <th>是否申请R&D现场支持</th>
                                    <th>是否申请R&D远程支持</th>
                                    <th>计划上线日期</th>
                                    <th>延期上线日期</th>
                                    <th>实际上线日期</th>
                                    <th>是否已上线</th>
                                    <th>未上线原因</th>
                                    <th>备注</th>
                                    <th>创建人</th>
                                    <th>创建时间</th>
                                    <th>修改人</th>
                                    <th>修改时间</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

<%@include file="../included/includedJs.jsp" %>

<script>
    $(function() {
        
        var tableObj = $('#tabMntInstallOnlineInfo').DataTable(getConfig());
        
        tableObj.on('order.dt search.dt',
                function() {
                    tableObj.column(0, {
                        search: 'applied',
                        order: 'applied'
                    }).nodes().each(function(cell, i) {
                        cell.innerHTML = i + 1;
                    });
                }).draw();
        
    });

    var _onlineDate = '${onlineDate}';
    function getConfig() {
        return config = {
            "processing" : true,
            "pageLength" : 10,
            //"destroy": true,
            "lengthMenu" : [ [ 5, 10, 20, -1 ], [ 5, 10, 20, "All" ] ],
            "order" : [ [ 1, "asc" ] ],
            "serverSide" : false,
            "ajax" : {
                "url" : "inst/online/list/" + _onlineDate
            //    "async": false
            },
            "columns" : [ {
                "data" : "onlineId"
            }, {
                "data" : "baseName"
            }, {
                "data" : "prodName"
            }, {
                "data" : "verCode"
            }, {
                "data" : "relCode"
            }, {
                "data" : "mntReleaseRecDtl.dtlCode"
            }, {
                "data" : "mntReleaseRecDtl.dtlName"
            }, {
                "data" : "moduleName"
            }, {
                "data" : "isOnsiteSupport"
            }, {
                "data" : "isRemoteSupport"
            }, {
                "data" : "planOnlineDate"
            }, {
                "data" : "delayOnlineDate"
            }, {
                "data" : "onlineDate"
            }, {
                "data" : "isOnlined"
            }, {
                "data" : "unOnlineReason"
            }, {
                "data" : "onlineRemark"
            }, {
                "data" : "creator"
            }, {
                "data" : "createDate"
            }, {
                "data" : "modifier"
            }, {
                "data" : "modifyDate"
            }],
            "columnDefs": [
            {
                "targets": [10],
                "data": "planOnlineDate",
                "render": function (data, type, full) {
                    if(data == null || data == "") {
                        return "";
                    }
                    return new Date(data).format("yyyy-MM-dd hh:mm:ss");
                 }
            },
            {
                "targets": [12],
                "data": "onlineDate",
                "render": function (data, type, full) {
                    if(data == null || data == "") {
                        return "";
                    }
                    return new Date(data).format("yyyy-MM-dd hh:mm:ss");
                 }
            },
            {
                "targets": [11],
                "data": "delayOnlineDate",
                "render": function (data, type, full) {
                    if(data == null || data == "") {
                        return "";
                    }
                    return new Date(data).format("yyyy-MM-dd hh:mm:ss");
                 }
            },
            {
                "targets": [17],
                "data": "createDate",
                "render": function (data, type, full) {
                    if(data == null || data == "") {
                        return "";
                    }
                    return new Date(data).format("yyyy-MM-dd hh:mm:ss");
                 }
            },
            {
                "targets": [19],
                "data": "modifyDate",
                "render": function (data, type, full) {
                    if(data == null || data == "") {
                        return "";
                    }
                    return new Date(data).format("yyyy-MM-dd hh:mm:ss");
                 }
            }
            ],
            "sScrollX": "2000px",
            "dom" : '<"top"lf<"div_right">>rt<"bottom"ip><"clear">',
            "language" : {
                "processing" : "努力加载数据中...",
                "lengthMenu" : "_MENU_ 条记录每页",
                "zeroRecords" : "没有查询到数据",
                "info" : "第 _PAGE_ 页 ( 总共 _PAGES_ 页)",
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