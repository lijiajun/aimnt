<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
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
                            系统缓存信息
                            </span>
                            <shiro:hasPermission name="sys:operate">
                            <span class="dt-buttons">
                                <a class="dt-button buttons-copy btn red btn-outline btn-mnt" id="btnRefresh">
                                <span>刷新</span>
                                </a>
                            </span>
                            </shiro:hasPermission>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <table class="table table-striped table-bordered table-hover table-checkable order-column" id="tabCache" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>缓存编码</th>
                                    <th>缓存名称</th>
                                    <th>缓存KEY</th>
                                    <th>缓存VALUE</th>
                                    <th>排序</th>
                                    <th>加载时间</th>
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

<%@include file="../../included/includedJs.jsp" %>

<script>

$(function() {
    
    var tableObj = $("#tabCache").DataTable(getConfig());
    tableObj.on('order.dt search.dt',
            function() {
                tableObj.column(0, {
                    search: 'applied',
                    order: 'applied'
                }).nodes().each(function(cell, i) {
                    cell.innerHTML = i + 1;
                });
            }).draw();
    
    $('#btnRefresh').on('click', function(){
        var sUrl = "sys/cache/refresh";
        tableObj.ajax.url(sUrl).load();
    });

});
jQuery(function($) {
    $(document).ready( function() {
      $('.dataTables_scrollHead').stickUp({
          marginTop: '5'
      });
    });
  });

function getConfig() {
    return config = {
        "processing" : true,
        "pageLength" : 15,
        "lengthMenu" : [ [10, 15, 30, -1 ], [ 10, 15, 30, "All" ] ],
        "serverSide" : false,
        "dom": '<"top"lf<"div_right">>rt<"bottom"ip><"clear">',
        "ajax": {
             "url": "sys/cache/query",
        },
        "order": [[1, 'asc'], [5, 'asc']],
        "columns" : [{
            "data" : "paramGroupCode"
        },  {
            "data" : "paramGroupCode"
        }, {
            "data" : "paramGroupName"
        }, {
            "data" : "paramCode"
        }, {
            "data" : "paramValue"
        }, {
            "data" : "paramOrder",
            "visible": false
        }, {
            "data" : "createDate"
        }],
        "columnDefs": [{
            "searchable": false,
            "orderable": false,
            "targets": 0
        },{
            "targets": [6],
            "data": "createDate",
            "render": function (data, type, full) {
                return new Date(data).format("yyyy-MM-dd hh:mm:ss");
             }
        }],
        "sScrollX": "100%",
        "language" : {
            "processing" : "努力加载数据中...",
            "lengthMenu" : "_MENU_ 条记录每页",
            "zeroRecords" : "没有找到记录",
            "info" : "第 _PAGE_ 页 ( 总共 _PAGES_ 页)",
            "infoEmpty" : "无记录",
            "infoFiltered" : "(从 _MAX_ 条记录过滤)",
            "paginate" : {
                "previous" : "上一页",
                "next" : "下一页",
            }
        }
    };
}
</script>
</body>
</html>