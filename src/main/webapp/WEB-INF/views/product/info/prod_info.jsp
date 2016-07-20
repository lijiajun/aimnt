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
                            产品信息
                            </span>
                            <shiro:hasPermission name="prod:delete">
                            <span class="dt-buttons">
                                <a class="dt-button buttons-copy btn red btn-outline btn-mnt" id="btnDelete">
                                <span>删除</span>
                                </a>
                            </span>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="prod:update">
                            <span class="dt-buttons">
                                <a class="dt-button buttons-excel btn yellow btn-outline btn-mnt" id="btnModify">
                                <span>修改</span>
                                </a>
                            </span>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="prod:add">
                            <span class="dt-buttons">
                                <a class="dt-button buttons-print btn dark btn-outline btn-mnt" id="btnAdd">
                                <span>添加</span>
                                </a>
                            </span>
                            </shiro:hasPermission>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <table class="table table-striped table-bordered table-hover table-checkable order-column noscoll" id="tabProd" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>产品编号</th>
                                    <th>产品名称</th>
                                    <th>产品描述</th>
                                    <th>创建时间</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="wrapper">
        <div class="row">
            <div class="col-md-12">
                <div class="wrapper-content">
                    <div class="portlet-title">
                        <div class="caption font-dark">
                            <i class=" icon-layers font-green"></i>
                            <span class="caption-subject bold uppercase">
                            产品版本信息
                            </span>
                            <shiro:hasPermission name="ver:delete">
                            <span class="dt-buttons">
                                <a class="dt-button buttons-copy btn red btn-outline btn-mnt" id="btnDeleteVer">
                                <span>删除</span>
                                </a>
                            </span>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="ver:update">
                            <span class="dt-buttons">
                                <a class="dt-button buttons-excel btn yellow btn-outline btn-mnt" id="btnModifyVer">
                                <span>修改</span>
                                </a>
                            </span>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="ver:add">
                            <span class="dt-buttons">
                                <a class="dt-button buttons-print btn dark btn-outline btn-mnt" id="btnAddVer">
                                <span>添加</span>
                                </a>
                            </span>
                            </shiro:hasPermission>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <table class="table table-striped table-bordered table-hover table-checkable order-column" id="tabProdVer" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>版本编号</th>
                                    <th>产品名称</th>
                                    <th>版本号</th>
                                    <th>版本名称</th>
                                    <th>版本描述</th>
                                    <th>生效时间</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

<%@include file="../../included/includedJs.jsp" %>


<script>

$(function() {
    
    var tableObj = $("#tabProd").DataTable(getProdConfig());
    addTableNoCol(tableObj);
    $('.dataTables_scrollHead').width($(".portlet-body").width());
    
    var tabProdVerObj = $("#tabProdVer").DataTable(getVerConfig());
    addTableNoCol(tabProdVerObj);
    
    //产品信息操作
    //===========================================================
    $('#btnModify').on('click', function(){
    	if($('#tabProd tbody tr').hasClass('selected') && tableObj.row('.selected') != null) {
            var strProdId = tableObj.row('.selected').data()['prodId'];
            showModal(2, "修改产品", ['700px', '400px'], "prod/info/page_update/" + strProdId, tableObj);
    	} else {
    		showMsg("请选择需要修改的数据！");
    	}
    });
    
    $('#btnDelete').on('click', function(){
        if($('#tabProd tbody tr').hasClass('selected') && tableObj.row('.selected') != null) {
            var strProdId = tableObj.row('.selected').data()['prodId'];
            $.ajax({
                url:"prod/info/delete/" + strProdId,
                dataType: "json",
                async:false,
                success:function (data) {
                    showMsg("删除成功！");
                    tableObj.ajax.reload(null,false);
                },
                error:function() {
                    showMsg("修改操作发生错误！");
                }
            });
        } else {
            showMsg("请选择需要删除的数据！");
        }
    });
    
    $('#btnAdd').on('click', function(){
        showModal(2, "新增产品", ['700px', '400px'], "prod/info/page_add", tableObj);
    });
    
    //获取产品版本明细
    $('#tabProd tbody').on( 'click', 'tr', function () {
        if ($(this).hasClass('selected') ) {
            $(this).removeClass('selected');
        }else {
            tableObj.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
            var strProdId = tableObj.row('.selected').data()['prodId'];
            var sUrl = "prod/ver/query/" + strProdId;
            tabProdVerObj.ajax.url(sUrl).load();
        }
    });
    
    //产品信息操作
    //===========================================================
    $('#tabProdVer tbody').on( 'click', 'tr', function () {
        if ($(this).hasClass('selected')) {
            $(this).removeClass('selected');
        }else {
            tabProdVerObj.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
    });
    
    $('#btnAddVer').on('click', function(){
        showModal(2, " ", ['1000px', '500px'], "prod/ver/page_add", tabProdVerObj);
    });
    //版本信息修改
    $('#btnModifyVer').on('click', function(){
        if($('#tabProdVer tbody tr').hasClass('selected') && tableObj.row('.selected') != null) {
            var strVerId = tabProdVerObj.row('.selected').data()['verId'];
            showModal(2, "修改产品", ['1000px', '500px'], "prod/ver/page_update/" + strVerId, tabProdVerObj);
        } else {
            showMsg("请选择需要修改的数据！");
        }
    });
  //版本信息删除
    $('#btnDeleteVer').on('click', function(){
        if($('#tabProdVer tbody tr').hasClass('selected') && tableObj.row('.selected') != null) {
            var strVerId = tabProdVerObj.row('.selected').data()['verId'];
            $.ajax({
                url:"prod/ver/delete/" + strVerId,
                dataType: "json",
                async:false,
                success:function (data) {
                    showMsg("删除成功！");
                    tabProdVerObj.ajax.reload(null,false);
                },
                error:function() {
                    showMsg("修改操作发生错误！");
                }
            });
        } else {
            showMsg("请选择需要删除的数据！");
        }
    });
});


function getProdConfig() {
    return config = {
        "processing" : true,
        "pageLength" : 5,
        "lengthMenu" : [ [5, 10, 20, -1 ], [ 5, 10, 20, "All" ] ],
        "serverSide" : false,
        "autoWidth": false,
        "ajax": {
        	 "url": "prod/info/query",
        },
        "columns" : [ {
            "data" : "prodId",
            "width": "10%"
        },{
            "data" : "prodId",
            "visible":false
        }, {
            "data" : "prodName",
            "width": "25%"
        }, {
            "data" : "prodDesc",
            "width": "45%"
        },{
            "data" : "createDate",
            "width": "20%"
        }],
        "columnDefs": [{
            "width": "20%",
            "targets": [4],
            "data": "createDate",
            "render": function (data, type, full) {
                return new Date(data).format("yyyy-MM-dd hh:mm:ss");
             }
        }],
        "order" : [ [ 2, "asc" ] ],
        "dom": '<"top"lf<"div_right">>rt<"bottom"ip><"clear">',
//         "scrollX": "100%",
//         "scrollXInner": "100%",
        "language" : {
            "processing" : "努力加载数据中...",
            "lengthMenu" : "_MENU_ 条记录每页",
            "zeroRecords" : "没有找到记录",
            "info" : "第 _PAGE_ 页 ( 总共 _PAGES_ 页 )",
            "infoEmpty" : "无记录",
            "infoFiltered" : "(从 _MAX_ 条记录过滤)",
            "paginate" : {
                "previous" : "上一页",
                "next" : "下一页",
            }
        }
    };
}

function getVerConfig() {
    return config = {
        "processing" : true,
        "pageLength" : 5,
        "lengthMenu" : [ [5, 10, 20, -1 ], [ 5, 10, 20, "All" ] ],
        "serverSide" : false,
        "order" : [ [ 1, "asc" ] ],
        "ajax": {
            "url": "prod/ver/query/-1",
       },
        "columns" : [{
            "data" : "verId"
        },{
            "data" : "verId"
        },{
            "data" : "prodName"
        }, {
            "data" : "verCode"
        }, {
            "data" : "verName"
        }, {
            "data" : "verDesc"
        }, {
            "data" : "validDate"
        }],
        "columnDefs": [{
            "targets": [1],
            "visible": false,
            "searchable": false
          },{
            "targets": [6],
            "data": "validDate",
            "render": function (data, type, full) {
            	if(data == null || data == "") {
            		return "";
            	}
                return new Date(data).format("yyyy-MM-dd");
             }
        }],
        "dom": '<"top"lf<"div_right">>rt<"bottom"ip><"clear">',
        "scrollX": "100%",
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