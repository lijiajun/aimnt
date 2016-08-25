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
                                    <th>创建时间</th>
                                    <th>创建人</th>
                                </tr>
                            </thead>
                            <tbody>
                               <%--  <c:forEach items="${relDtlList}" var="relDtl" varStatus="status">
                                    <tr>
                                        <td>${status.index + 1}</td>
                                        <td>${relDtl.relCode}</td> 
                                        <td>${relDtl.dtlTypeTxt}</td>
                                        <td>${relDtl.dtlCode}</td>
                                        <td>${relDtl.dtlName}</td>
                                        <td>${relDtl.baseIdTxt}</td>
                                        <td>${relDtl.creator}</td>
                                        <td><fmt:formatDate value="${relDtl.createDate}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
                                        <td  style="display:none;">${relDtl.dtlId}</td>
                                    </tr>
                                </c:forEach > --%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div style="display:none" id="btn-data-tools">
        <shiro:hasPermission name="prod:operate">
        <span class="dt-buttons">
            <a class="dt-button btn red btn-outline btn-mnt" id="btnDelete" >
                <span>删除</span>
            </a>
        </span>
        <span class="dt-buttons">
            <a class="dt-button btn yellow btn-outline btn-mnt" id="btnModify">
                <span>修改</span>
            </a>
         </span>
        <span class="dt-buttons">
            <a class="dt-button btn dark btn-outline btn-mnt btnAdd" id="btnAdd">
                <span>添加</span>
            </a>
         </span>
         </shiro:hasPermission>
    </div>
    
<%@include file="../../included/includedJs.jsp" %>
<script>

$(function() {
    var tableObj = $("#tabDtl").DataTable(getConfig());
    //修改 
   $('.div_right').on('click', '.dt-buttons>#btnModify', function() {
	  // console.log(tableObj.row('.selected').data());
        if($('#tabDtl tbody tr').hasClass('selected') && tableObj.row('.selected') != null) {
           var strDtlId = tableObj.row('.selected').data()['dtlId'];
          // console.log(tableObj.row('.selected').data()['dtlId']);
           showModal(2, "修改产品", [ '1000px', '550px'], "rel/rec/page_update_1/" + strDtlId, tableObj); 
        	
        } else {
            showMsg("请选择需要修改的数据！");
        }
    });
    
    //增加 
    $('.div_right').on('click', '.dt-buttons>#btnAdd', function() {
    	console.log("${relId}")
    	showModal(2, " ", [ '1000px', '550px' ], "rel/rec/dtl/page_add/" + '${relId}', tableObj);
    });
    
    //删除按钮
    $('.div_right').on('click', '.dt-buttons>#btnDelete',function() {
    	if($('#tabDtl tbody tr').hasClass('selected') && tableObj.row('.selected') != null) {
            // console.log(tableObj.row('.selected').data());
    		var strDtlId = tableObj.row('.selected').data()['dtlId'];
            $.ajax({
                url:"rel/dtl/delete/" + strDtlId,
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
    
  
});
    function getConfig() {
        return config = {
        	"destroy": true,
        	"searching": false,
            "processing" : true,
            "pageLength" : 5,
            "lengthMenu" : [ [5, 10, 20, -1 ], [ 5, 10, 20, "All" ] ],
            "serverSide" : false,
            "ajax" : {
                "url" : 'rel/dtl/query?relId=${relId}'
//                 "async": false
            },
            "columns" : [ {
                "data" : "dtlId"
            } , {
                "data" : "mntReleaseRec.relCode"
            }, /*  {
                "data" : "mntReleaseRec.prodName",
            },  {
                "data" : "mntReleaseRec.verName"
            },  */ {
                "data" : "dtlTypeTxt"
            }, {
                "data" : "dtlCode"
            }, {
                "data" : "dtlName",
            }, {
                "data" : "baseIdTxt"
            }, {
                "data" : "mntReleaseRec.relDate"
            }, {
                "data" : "creator"
            } ],
            
            "columnDefs": [{
                "targets": [6],
                "data": "mntReleaseRec.relDate",
                "render": function (data, type, full) {
                    if(data == null || data == "") {
                        return "";
                    }
                    return new Date(data).format("yyyy-MM-dd hh:mm:ss");
                 }
            }],
            
             "scrollX": "2000px",
            "dom" : '<"top"l<"div_right">>rt<"bottom"ip><"clear">',
            'initComplete' : initTab,
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