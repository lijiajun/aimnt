<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html>
<html>
<head>
<title>安装点上线信息</title>
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
                                    <label class="control-label col-md-4">上线产品</label>
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
                                    <label class="control-label col-md-4">产品版本</label>
                                    <div class="col-md-8">
                                        <select name="verCode" class="form-control select2" id="verCode">
                                            <option value="-1">全部</option>
                                            <c:forEach items="${verEnums}" var="verEnum">
                                                <option value="${verEnum.key}">${verEnum.value}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">上线日期</label>
                                    <div class="col-md-8">
                                        <div class="input-group date-picker input-daterange" data-date="2012-12-12" data-date-format="yyyy-mm-dd">
                                            <input type="text" class="form-control" name="from" id="beginDate" readonly AUTOCOMPLETE="off">
                                            <span class="input-group-addon"> 到 </span>
                                            <input type="text" class="form-control" name="to" id="endDate" readonly AUTOCOMPLETE="off">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
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
                                    <label class="control-label col-md-4">上线版本</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="relCode">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">是否已上线</label>
                                    <div class="col-md-8">
                                        <select name="isOnlined" class="form-control select2" id="isOnlined">
                                            <option value="-1">全部</option>
                                            <c:forEach items="${isOnlinedEnums}" var="isOnlinedEnum">
                                                <option value="${isOnlinedEnum.key}">${isOnlinedEnum.value}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-9">
                            </div>
                            <div class="col-md-2">
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
                        <table class="table table-striped table-bordered table-hover table-checkable order-column" id="tabMntInstallOnlineInfo" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th class="checkbox-datatables"><input type="checkbox" id="tab-th-chk" /></th>
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
    <div style="display:none" id="btn-data-tools">
        <shiro:hasPermission name="inst:operate">
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

        $('#prodId').change(function(){
            loadVerCodeSelect(2);
        });
        
        var tableObj = $('#tabMntInstallOnlineInfo').DataTable(getConfig());
        $('#btnQuery').click(function(e) {
            var strBaseId = $("#baseId").val();
            var strProdId = $("#prodId").val();
            var strVerCode = $("#verCode").val();
            var strRelCode = $("#relCode").val();
            var strBeginDate = $("#beginDate").val();
            var strEndDate = $("#endDate").val();
            var strIsOnlined = $("#isOnlined").val();
            strVerCode = strVerCode == -1 ? "" : strVerCode;
            strProdId = strProdId == -1 ? "" : strProdId;
            strIsOnlined = strIsOnlined == -1 ? "" : strIsOnlined;
            strBaseId = strBaseId == -1 ? "" : strBaseId;
            var sUrl = "inst/online/query?";
            sUrl += "baseId=" + strBaseId +
                "&prodId=" + strProdId +
                "&verCode=" + strVerCode +
                "&relCode=" + strRelCode +
                "&beginDate=" + strBeginDate +
                "&endDate=" + strEndDate +
                "&isOnlined=" + strIsOnlined;
            tableObj.ajax.url(sUrl).load();
        });
        
        $('.reload').on('click', function() {
            $('#baseId').val(-1);
            $('#prodId').val(-1);
            $('#verCode').val(-1);
            $('#relCode').val('');
            $('#beginDate').val('');
            $('#endDate').val('');
            $('#isOnlined').val(-1);
            tableObj.ajax.url('inst/online/query?onlineId=-1').load();
        });
        
        //修改按钮
        $('.div_right').on('click', '.dt-buttons>#btnUpdate',function() {
            var checkedBox = $("#tabMntInstallOnlineInfo tbody tr td .checked");
            var checkedLength = checkedBox.length;
            if(checkedLength == 0) {
                showMsg("请选择需要修改的数据！");
                return;
            }
            if(checkedLength > 1) {
                showMsg("只能选择一条数据进行修改操作！");
                return;
            }
            var strOnlineId = checkedBox.find('input:checkbox').val();
            showModal(2, " ", [ '1000px', '600px' ], "inst/online/update_page/" + strOnlineId, tableObj);
        });
        
        //新增
        $('.div_right').on('click', '.dt-buttons>#btnAdd', function(){
            showModal(2, " ", ['1000px', '600px'], "inst/online/add_page", tableObj);
        });
        
        //删除按钮
        $('.div_right').on('click', '.dt-buttons>#btnDelete',function() {
            var checkedBox = $("#tabMntInstallOnlineInfo tbody tr td .checked");
            comfirmDeleteData(tableObj, checkedBox, 'inst/online/delete/');
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
                "url" : "inst/online/query?onlineId=-1"
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
            "columnDefs": [{
                "orderable" : false,
                "searchable" : false,
                "targets": [0],
                "data": "onlineId",
                "render": function (data, type, full) {
                    return '<input type="checkbox" name="data-checkbox" value="' + data + '" />';
                 }
            },
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
            "dom" : '<"top"l<"div_right">>rt<"bottom"ip><"clear">',
            "initComplete" : initTab,
            "createdRow": function ( row, data, index ) {
                $('td', row).eq(0).addClass('checkbox-datatables');
             },
            "language" : {
                "processing" : "努力加载数据中...",
                "lengthMenu" : "_MENU_ 条记录每页",
                "zeroRecords" : "没有查询到数据",
                "info" : "第 _PAGE_ 页 ( 总共 _PAGES_ 页 _MAX_ 条记录 )",
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