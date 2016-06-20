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
                            产品版本信息
                            </span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <table class="table table-striped table-bordered table-hover table-checkable order-column" id="tabProdVer" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th class="checkbox-datatables"><input type="checkbox" id="tab-th-chk" /> </th>
                                    <th>产品编号</th>
                                    <th>版本号</th>
                                    <th>版本名称</th>
                                    <th>版本描述</th>
                                    <th>生效时间</th>
                                    <th>创建人</th>
                                    <th>创建时间</th>
                                    <th>修改人</th>
                                    <th>修改时间</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${prodVerList}" var="prodVer">
                                    <tr>
                                        <td class="checkbox-datatables"><input type="checkbox" value="${prodVer.verId}" /></td>
                                        <td>${prodVer.prodId}</td>
                                        <td><a href="prod/info">${prodVer.verCode}</a></td>
                                        <td>${prodVer.verName}</td>
                                        <td>${prodVer.verDesc}</td>
                                        <td><fmt:formatDate value="${prodVer.validDate}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
                                        <td>${prodVer.creator}</td>
                                        <td><fmt:formatDate value="${prodVer.createDate}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
                                        <td>${prodVer.modifier}</td>
                                        <td><fmt:formatDate value="${prodVer.modifyDate}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
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

    
    var tableObj = $("#tabProdVer").DataTable(getConfig());
    
    $("#btnQuery").click(function (e) {
        var strCustID = $("#custId").val() == "" ? "-1" : $("#custId").val();
        var strCustName = $("#custName").val() == "" ? "-1" : $("#custName").val();
        var sUrl = "prod/" + strCustID + "/" + strCustName + "/0/5/";
            tableObj.ajax.url(sUrl).load();
    });
    
//     $('#tabProdVer tbody').on( 'click', 'tr', function () {
//     	if ($(this).hasClass('selected') ) {
//             $(this).removeClass('selected');
//         }else {
//         	   tableObj.$('tr.selected').removeClass('selected');
//             $(this).addClass('selected');
//         }
//     } );
    
    
    $('#btnModifyVer').on('click', function(){
        showModal(2, "修改产品信息", ['960px', '600px'], "prod/info");
    });
    $('#btnAddVer').on('click', function(){
        if(showModal(2, "新增产品", ['700px', '400px'], "prod/addProdShow")) {
            alert("12311");
        }
    });
});

    function getConfig() {
        return config = {
            "processing" : true,
            "pageLength" : 5,
            "lengthMenu" : [ [5, 10, 20, -1 ], [ 5, 10, 20, "All" ] ],
            "columnDefs": [{
                'orderable': false,
                'targets': [0]
            }, {
                "searchable": false,
                "targets": [0]
            }],
            "order": [
                [1, "asc"]
            ],
            "serverSide" : false, //true服务端处理模式， false 客户端处理模式（浏览器处理）
//             "ajax" : {
//                 "url" : "prod/prodList",
//             },
//             "scrollY": true,
//             "scrollX": true,
//             "columns" : [ {
//                 "data" : "序号"
//             }, {
//                 "data" : "产品名称"
//             }, {
//                 "data" : "产品描述"
//             }, {
//                 "data" : "创建人"
//             }, {
//                 "data" : "创建时间"
//             }, {
//                 "data" : "修改人"
//             }, {
//                 "data" : "修改时间"
//             } ],
            "sScrollX": "100%",
            "dom": '<"top"lf<"div_right">>rt<"bottom"ip><"clear">',
            //"dom": '<"float_right"l><"float_right"f>rtip',
//             initComplete:initTab,
            "language" : {
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
    
//     function initTab() {
//     	//alert("Success! ");
//         //var topPlugin='<button   class="btn btn-danger btn-sm" id="deleteAll">批量删除</button> <button   class="btn btn-primary btn-sm addBtn" >新 增</button>             <iframe id="exp" style="display:none;"></iframe><button  class="btn btn-info btn-sm" id="expCsv">导 出全部</button>             <button  class="btn btn-warning btn-sm" id="reset">重置搜索条件</button>' ;
//         var operPlugin = '<span class="dt-buttons"><a class="dt-button buttons-copy btn red btn-outline" id="btnDeleteVer"><span>删除</span></a></span>';
//         operPlugin += '<span class="dt-buttons"><a class="dt-button buttons-excel btn yellow btn-outline" id="btnModifyVer"><span>修改</span></a></span>';
//         operPlugin += '<span class="dt-buttons"><a class="dt-button buttons-print btn dark btn-outline" id="btnAddVer"><span>添加</span></a></span>';
//         $(".div_right").append(operPlugin);//在表格上方topPlugin DIV中追加HTML
//     }
</script>
</body>
</html>