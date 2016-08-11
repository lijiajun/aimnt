<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html>
<html>
<head>
<title>部门需求故障跟踪</title>
<%@include file="../../included/includedStyle.jsp" %>
</head>

<body>
    <div class="wrapper">
        <div class="portlet light bordered">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-search"></i>
                    <span class="caption-subject font-blue-hoki bold uppercase">查询条件</span>
                </div>
                <div class="tools">
                    <a href="" class="collapse"></a>
                    <a href="" class="reload"></a>
                </div>
            </div>
            <div class="portlet-body form">
                <form action="#" class="form-horizontal">
                    <div class="form-body">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">安装点</label>
                                    <div class="col-md-8">
                                         <select name="baseId" class="form-control select2" id="baseId">
                                            <option value="-1">全部</option>
                                            <c:forEach items="${baseIdEnums}" var="baseIdEnum">
                                                <option value="${baseIdEnum.key}">${baseIdEnum.value}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>
                           <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">所属产品</label>
                                    <div class="col-md-8">
                                         <select name="prodId" class="form-control select2" id="prodId">
                                            <option value="-1">全部</option>
                                            <c:forEach items="${prodEnums}" var="prodEnum">
                                                <option value="${prodEnum.key}">${prodEnum.value}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">需求编号</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="bizNo">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                           <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">录入日期</label>
                                    <div class="col-md-8">
                                        <div class="input-group date-picker input-daterange" data-date="2012-12-12" data-date-format="yyyy-mm-dd">
                                            <input type="text" class="form-control" name="from" id="beginDate" readonly AUTOCOMPLETE="off">
                                            <span class="input-group-addon"> 到 </span>
                                            <input type="text" class="form-control" name="to" id="endDate" readonly AUTOCOMPLETE="off">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">处理时长超过(天)</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="dealDays" >
                                    </div>
                                </div>
                            </div>
                             <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4"></label>
                                    <div class="col-md-4">
                                        <button type="button" id="btnQuery" class="btn green btn-mnt">查询</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="wrapper-content">
<!--                     <div class="portlet-title"> -->
<!--                         <div class="caption font-dark"> -->
<!--                             <i class=" icon-layers font-green"></i> <span class="caption-subject bold uppercase"> 产品发布信息 </span> -->
<!--                         </div> -->
<!--                     </div> -->
                    <div class="portlet-body">
                        <table class="table table-striped table-bordered table-hover table-checkable order-column" id="tabMntReqTrack" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th class="checkbox-datatables"><input type="checkbox" id="tab-th-chk" /></th>
                                    <th>安装点</th>
                                    <th>安装点名称</th>
                                    <th>所属产品</th>           
                                    <th>产品名称</th>
                                    <th>需求编号</th>
                                    <th>需求名称</th>
                                    <th>需求类型</th>
                                    <th>需求来源</th>
                                    <th>需求当前状态</th>
                                    <th>节点责任人</th>
                                    <th>优先级</th>
                                    <th>紧急程度</th>
                                    <th>录入日期</th>
                                    <th>处理时长(天)</th>
                                    <th>期望发布日期</th>
                                    <th>计划发布日期</th>
                                    <th>计划上线日期</th>
                                    <th>删除标识</th>
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
    <div style="display:none" id="btn-data-tools">
        <shiro:hasPermission name="prod:delete">
        <span class="dt-buttons">
            <a class="dt-button btn purple btn-outline btn-mnt" id="btnStatistics">
                <span>统计</span>
            </a>
         </span>
        <span class="dt-buttons">
            <a class="dt-button btn red btn-outline btn-mnt" id="btnDelete" >
                <span>删除</span>
            </a>
        </span>
        <span class="dt-buttons">
            <a class="dt-button btn yellow btn-outline btn-mnt" id="btnUpdate">
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

        var tableObj = $('#tabMntReqTrack').DataTable(getConfig());
        $('#btnQuery').click(function(e) {
           // var strBaseId = $("#baseId").val();
           // var strProdId = $("#prodId").val();
            var strBizNo = $("#bizNo").val();
            var strBeginDate = $("#beginDate").val();
            var strEndDate = $("#endDate").val();
            var strDealDays = $("#dealDays").val();
            var strBaseId = $("#baseId").find("option:selected").text();
            var strProdId = $("#prodId").find("option:selected").text();
            //alert("33")
            //alert(strBaseId);
            strProdId = strProdId == "全部" ? "" : strProdId;      //如果strProdId为-1 那就就让他变成空  这里的设置对于查询条件为全部的时候管用 
            strBaseId = strBaseId == "全部" ? "" : strBaseId;
            var sUrl = "inst/track/query?";
            sUrl += "prodName=" + strProdId +
                "&baseName=" + strBaseId +
                "&bizNo=" + strBizNo +
                "&beginDate=" + strBeginDate +
                "&dealDays=" + strDealDays +
                "&endDate=" + strEndDate ;
            tableObj.ajax.url(sUrl).load();
        });
        
        $('.reload').on('click', function() {
        	
            $('#baseId').val('');
            $('#prodId').val('');
            $('#bizNo').val('');
            $('#submitDate').val('');
            tableObj.ajax.url('inst/track/query?trackId=-1').load();
        });
        
        //修改按钮
        $('.div_right').on('click', '.dt-buttons>#btnUpdate',function() {
            var checkedBox = $("#tabMntReqTrack tbody tr td .checked");
            var checkedLength = checkedBox.length;
            if(checkedLength == 0) {
                showMsg("请选择需要修改的数据！");
                return;
            }
            if(checkedLength > 1) {
                showMsg("只能选择一条数据进行修改操作！");
                return;
            }
            var strTrackId = checkedBox.find('input:checkbox').val();
            showModal(2, " ", [ '1000px', '500px' ], "inst/track/update_page/" + strTrackId, tableObj);
        });
        
        //新增
        $('.div_right').on('click', '.dt-buttons>#btnAdd', function(){
            showModal(2, " ", ['1000px', '500px'], "inst/track/add_page", tableObj);
        });
        
        //删除按钮
        $('.div_right').on('click', '.dt-buttons>#btnDelete',function() {
            var checkedBox = $("#tabMntReqTrack tbody tr td .checked");
            comfirmDeleteData(tableObj, checkedBox, 'inst/track/delete/');
        });
        //统计按钮 
        $('.div_right').on('click','.dt-buttons>#btnStatistics',function(){
        	/*  var strBaseId = $("#baseId").val();
             var strProdId = $("#prodId").val(); */
             var strBaseId = $("#baseId").find("option:selected").text();
             var strProdId = $("#prodId").find("option:selected").text();
             var strBizNo = $("#bizNo").val();
             var strBeginDate = $("#beginDate").val();
             var strEndDate = $("#endDate").val();
             var strDealDays = $("#dealDays").val();
             //alert(strBaseId);
             
             strProdId = strProdId == "全部" ? "" : strProdId;      //如果strProdId为-1 那就就让他变成空  这里的设置对于查询条件为全部的时候管用 
             strBaseId = strBaseId == "全部" ? "" : strBaseId;
             var ssUrl = "inst/track/stats_page?";
             ssUrl += "prodName=" + strProdId +
                 "&baseName=" + strBaseId +
                 "&bizNo=" + strBizNo +
                 "&beginDate=" + strBeginDate +
                 "&dealDays=" + strDealDays +
                 "&endDate=" + strEndDate ;
        	showModal(2," ",['1000px','500px'],ssUrl , tableObj);
        });
        
        
    });

    function getConfig() {
        return config = {
            "processing" : true,
            "pageLength" : 5,
            //"destroy": true,
            "lengthMenu" : [ [ 5, 10, 20, -1 ], [ 5, 10, 20, "All" ] ],
            "order" : [ [ 1, "asc" ] ],
            "serverSide" : false,
            "ajax" : {
                "url" : "inst/track/query?trackId=-1"
            //    "async": false
            },
            "columns" : [ {
                "data" : "trackId"
            }, {
                "data" : "baseName"                   //这里显示数据，id  name 转换  
            }, {
                "data" : "baseName"
            }, {
                "data" : "prodName"
            }, {
                "data" : "prodName"
            }, {
                "data" : "bizNo"
            }, {
                "data" : "bizName"
            }, {
                "data" : "bizType"
            }, {
                "data" : "bizSrc"
            }, {
                "data" : "bizSts"
            }, {
                "data" : "nodePerson"
            }, {
                "data" : "priority"
            }, {
                "data" : "urgentLevel"
            }, {
                "data" : "submitDate"
            }, {
                "data" : "dealDays"
            }, {
                "data" : "askEndDate"
            }, {
                "data" : "planReleaseDate"
            }, {
                "data" : "planOnlineDate"
            }, {
                "data" : "deleteFlag"
            }, {
                "data" : "creator"
            }, {
                "data" : "createDate"
            }, {
                "data" : "modifier"
            }, {
                "data" : "modifyDate"
            }],
            "columnDefs": [{
                "orderable" : false,
                "searchable" : false,
                "targets": [0],
                "data": "trackId",
                "render": function (data, type, full) {
                    return '<input type="checkbox" name="data-checkbox" value="' + data + '" />';
                 }
            },
            {
                "targets": [13],  
                "data": "submitDate",
                "render": function (data, type, full) {
                    if(data == null || data == "") {
                        return "";
                    }
                    return new Date(data).format("yyyy-MM-dd");
                 }
            },
            {
                "targets": [15],
                "data": "askEndDate",
                "render": function (data, type, full) {
                    if(data == null || data == "") {
                        return "";
                    }
                    return new Date(data).format("yyyy-MM-dd");
                 }
            },
            {
                "targets": [16],
                "data": "planReleaseDate",
                "render": function (data, type, full) {
                    if(data == null || data == "") {
                        return "";
                    }
                    return new Date(data).format("yyyy-MM-dd");
                 }
            },
            {
                "targets": [17],
                "data": "planOnlineDate",
                "render": function (data, type, full) {
                    if(data == null || data == "") {
                        return "";
                    }
                    return new Date(data).format("yyyy-MM-dd");
                 }
            },
            {
                "targets": [20],
                "data": "createDate",
                "render": function (data, type, full) {
                    if(data == null || data == "") {
                        return "";
                    }
                    return new Date(data).format("yyyy-MM-dd");
                 }
            },
            {
                "targets": [22],
                "data": "modifyDate",
                "render": function (data, type, full) {
                    if(data == null || data == "") {
                        return "";
                    }
                    return new Date(data).format("yyyy-MM-dd");
                 }
            }
            ],
            "sScrollX": "2000px",
            "dom" : '<"top"l<"div_right">>rt<"bottom"ip><"clear">',
            "initComplete" : initTab,
            "createdRow": function ( row, data, index ) {
                $('td', row).eq(0).addClass('checkbox-datatables');
             },
            "language" : {
                "processing" : "努力加载数据中...",
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