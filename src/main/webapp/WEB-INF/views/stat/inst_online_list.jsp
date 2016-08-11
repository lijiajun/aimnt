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
                            <i class=" icon-layers font-green"></i> <span class="caption-subject bold uppercase"> ${onlineDate}上线OR发布记录 </span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <div class="tabbable-line">
                         <ul class="nav nav-tabs ">
                                <li class="active">
                                    <a href="#online_feedback" data-toggle="tab"> 已上线记录 </a>
                                </li>
                                <li>
                                    <a href="#not_online" data-toggle="tab"> 未上线记录</a>
                                </li>
                                <li>
                                    <a href="#release_plan" data-toggle="tab"> 发布计划（开发）</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active"  id="online_feedback">
                                  <table class="table table-striped table-bordered table-hover table-checkable order-column" id="tabMntInstallOnlineInfo" cellspacing="0" width="100%">
                                    <thead>
                                        <tr>
                                            <th>序号</th>
                                            <th>安装点</th>
                                            <th>上线产品</th>
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
                                <div class="tab-pane" id="release_plan">
                                     <table class="table table-striped table-bordered table-hover table-checkable order-column" id="tabMntProdRelPlan" cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
                                                <!-- <th class="checkbox-datatables"><input type="checkbox" id="tab-th-chk" /></th> -->
                                                <th>序号</th>
                                                <th>安装点（省份）</th>
                                                <th>计划发布时间</th>
                                                <th>所属产品</th>
                                                <th>产品版本</th>
                                                <th>模块</th>
                                                <th>需求(故障)编号</th>
                                                <th>需求(故障)名称</th>
                                                <th>备注</th>
                                                <th>创建时间</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="tab-pane" id="not_online">
                                    <table class="table table-striped table-bordered table-hover table-checkable order-column" id="tabMntInstallNotOnlineInfo" cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
                                                <th>序号</th>
                                                <th>安装点编号</th>
                                                <th>上线产品</th>
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
        
        var tableObjPlan = $('#tabMntProdRelPlan').DataTable(getConfigPlan());
        
        tableObjPlan.on('order.dt search.dt',         //on()打开表格的监听事件     //前台添加序号
                function() {
            tableObjPlan.column(0, {
                search: 'applied',
                order: 'applied'
            }).nodes().each(function(cell, i) {
                cell.innerHTML = i + 1;
            });
        }).draw();

        var tableObjNotOl = $('#tabMntInstallNotOnlineInfo').DataTable(getConfigNotOl());
        
        tableObjNotOl.on('order.dt search.dt',
                function() {
                 tableObjNotOl.column(0, {
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
            "processing" : true,                                            //开启读取服务器数据时显示正在加载中……  默认false 
            "pageLength" : 10,                                               //每页显示及几条数据  
            //"destroy": true,
            "lengthMenu" : [ [ 5, 10, 20, -1 ], [ 5, 10, 20, "All" ] ],
            "order" : [ [ 1, "asc" ] ],
            "serverSide" : false,                                           //开启服务器模式 
            "ajax" : {                                                      // 异步数据源设置 
                "url" : "inst/online/list/" + _onlineDate
            //    "async": false
            },
            "columns" : [ {                                                 //columns.data 配置每一列的数据源 
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
                "data" : "isOnsiteSupportTxt"
            }, {
                "data" : "isRemoteSupportTxt"
            }, {
                "data" : "planOnlineDate"
            }, {
                "data" : "delayOnlineDate"
            }, {
                "data" : "onlineDate"
            }, {
                "data" : "isOnlinedTxt"
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
            "columnDefs": [                                                        //设置定义列的初始属性 
            {
                "targets": [10],                                                   //target 指定那一列 
                "data": "planOnlineDate",
                "render": function (data, type, full) {                            //渲染 
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
            /* {
            	"targets": [14],
                "data": "unOnlineReason",
                "render": function (data, type, full) {
                	if(data.length > 8){
                		return "数据太长 ";
                	}
                }
            }, */
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
            "sScrollX": "100%",                                       //是否开启水平滚动
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
    
    function getConfigPlan() {
        return config = {
        	"searching": true,
            "processing" : true,
            "pageLength" : 5,
            "lengthMenu" : [ [ 5, 10, 20, -1 ], [ 5, 10, 20, "All" ] ],
            "order" : [ [ 1, "asc" ] ],
            "serverSide" : false,
            "ajax" : {
                "url" : "rel/plan/query?planDate=" + _onlineDate
            },
            "columns" : [ {
                "data" : "id"
            }, {
                "data" : "baseName"
            }, {
                "data" : "planDate"
            }, {
                "data" : "prodName"
            }, {
                "data" : "verCode"
            }, {
                "data" : "moduleName"
            }, {
                "data" : "reqNo"
            }, {
                "data" : "reqName"
            }, {
                "data" : "remark"
            },{
                "data" : "createDate"
            }],
            "columnDefs": [
            {
                "targets": [2],
                "data": "planDate",
                "render": function (data, type, full) {
                    if(data == null || data == "") {
                        return "";
                    }
                    return new Date(data).format("yyyy-MM-dd");
                 }
            },
            {
                "targets": [9],
                "data": "createDate",
                "render": function (data, type, full) {
                    if(data == null || data == "") {
                        return "";
                    }
                    return new Date(data).format("yyyy-MM-dd hh:mm:ss");
                 }
            }
            ],
            "sScrollX": "100%",
            "dom" : '<"top"lf<"div_right">>rt<"bottom"ip><"clear">',                //定义表格控件在页面的显示顺序 l f r t i p
            "language" : {
                "processing" : "努力加载数据中...",
                "lengthMenu" : "_MENU_ 条记录每页",
                "zeroRecords" : "没有查询到数据",
                "info" : "第 _PAGE_ 页 ( 总共 _PAGES_ 页 _MAX_ 条记录)",
                "infoEmpty" : "无记录",
                "infoFiltered" : "(从 _MAX_ 条记录过滤)",
                "paginate" : {
                    "previous" : "上一页",
                    "next" : "下一页"
                }
            }
        };
    }
    
    //未上线
    function getConfigNotOl() {
        return config = {
            "processing" : true,                                            //开启读取服务器数据时显示正在加载中……  默认false 
            "pageLength" : 10,                                               //每页显示及几条数据  
            //"destroy": true,
            "lengthMenu" : [ [ 5, 10, 20, -1 ], [ 5, 10, 20, "All" ] ],
            "order" : [ [ 1, "asc" ] ],
            "serverSide" : false,                                           //开启服务器模式 
            "ajax" : {                                                      // 异步数据源设置 
                "url" : "inst/notonline/list/" + _onlineDate
            //    "async": false
            },
            "columns" : [ {                                                 //columns.data 配置每一列的数据源 
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
            "columnDefs": [                                                        //设置定义列的初始属性 
            {
                "targets": [10],                                                   //target 指定那一列 
                "data": "planOnlineDate",
                "render": function (data, type, full) {                            //渲染 
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
            /* {
                "targets": [14],
                "data": "unOnlineReason",
                "render": function (data, type, full) {
                    if(data.length > 8){
                        return "数据太长 ";
                    }
                }
            }, */
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
            "sScrollX": "100%",                                       //是否开启水平滚动
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