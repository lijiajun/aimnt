<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html>
<html>
<head>
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
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="control-label col-md-5">安装点名称</label>
                                    <div class="col-md-7">
                                        <input type="text" class="form-control" id="baseName">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="control-label col-md-4">状态</label>
                                    <div class="col-md-8">
                                        <select name="verId" class="form-control" id="deleteFlag">
                                            <option value="-1">全部</option>
                                            <c:forEach items="${deleteFlagEnums}" var="deleteFlagEnum">
                                                <option value="${deleteFlagEnum.key}">${deleteFlagEnum.value}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">创建日期</label>
                                    <div class="col-md-8">
                                        <div class="input-group date-picker input-daterange" data-date="10/11/2012" data-date-format="yyyy-mm-dd">
                                            <input type="text" class="form-control" name="from" id="beginDate" readonly AUTOCOMPLETE="off">
                                            <span class="input-group-addon"> 到 </span>
                                            <input type="text" class="form-control" name="to" id="endDate" readonly AUTOCOMPLETE="off">
                                        </div>
                                    </div>
                                </div>
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
                        <table class="table table-striped table-bordered table-hover table-checkable order-column" id="tabBase" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th class="checkbox-datatables"><input type="checkbox" id="tab-th-chk" /></th>
                                    <th>安装点名称</th>
                                    <th>状态</th>
                                    <th>描述</th>
                                    <th>创建时间</th>
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

        var tableObj = $('#tabBase').DataTable(getConfig());
        $('#btnQuery').click(function(e) {
            var strBaseName = $("#baseName").val();
            var strDeleteFlag = $("#deleteFlag").val();
            var strBeginDate = $("#beginDate").val();
            var strEndDate = $("#endDate").val();
            strDeleteFlag = strDeleteFlag == -1 ? "" : strDeleteFlag;
            var sUrl = "inst/base/query?";
            sUrl += "&baseName=" + strBaseName + 
                         "&deleteFlag=" + strDeleteFlag +
                         "&beginDate=" + strBeginDate +
                         "&endDate=" + strEndDate;
            tableObj.ajax.url(sUrl).load();
        });
        
        $('.reload').on('click', function() {
            $('#baseName').val('');
            $('#beginDate').val('');
            $('#endDate').val('');
            $('#deleteFlag').val(-1);
            tableObj.ajax.url('inst/base/query?baseId=-1').load();
        });
        
        //修改按钮
        $('#btnUpdate').on('click',function() {
        	console.log(tableObj.row('.selected').data());
            var checkedBox = $("#tabBase tbody tr td .checked");
            var checkedLength = checkedBox.length;
            if(checkedLength == 0) {
                showMsg("请选择需要修改的数据！");
                return;
            }
            if(checkedLength > 1) {
                showMsg("只能选择一条数据进行修改操作！");
                return;
            }
            var strBaseId = checkedBox.find('input:checkbox').val();
            showModal(2, "修改发布信息", [ '650px', '500px' ], "inst/base/page_update/" + strBaseId, tableObj);
        });
        
        //新增
        $('#btnAdd').on('click', function(){
            showModal(2, " ", ['650px', '500px'], "inst/base/page_add", tableObj);
        });
        
        //删除按钮
        $('#btnDelete').on('click',function() {
            
            var checkedBox = $("#tabBase tbody tr td .checked");
            comfirmDeleteData(tableObj, checkedBox, 'inst/base/delete/');
            
//             var checkedBox = $("#tabBase tbody tr td .checked");
//             var checkedLength = checkedBox.length;
//             if(checkedLength == 0) {
//                 showMsg("请选择需要删除的数据！");
//                 return;
//             }
//             var userIdAry = [];
//             checkedBox.find('input:checkbox').each(function(){
//             	userIdAry.push($(this).val());
//             });
//             $.ajax({
//                 url: 'inst/base/delete/' + userIdAry,
//                 dataType: 'json',
//                 async:false,
//                 success:function (data) {
//                     showMsg("删除成功！");
//                     tableObj.ajax.reload(null,false);
//                 },
//                 error:function() {
//                     showMsg("删除操作发生错误！");
//                 }
//             });
        });
        
        $('table tbody .checkbox-datatables').on('click', 'input', function(event){
            console.log($(this));
            if($(this).attr('checked')) {
                $(this).removeAttr('checked');
            }else {
                $(this).attr('checked', true);
            }
        });
        
    });

    function getConfig() {
        return config = {
            "processing" : true,
            "pageLength" : 5,
            //"destroy": true,
            "lengthMenu" : [ [ 5, 10, 20, -1 ], [ 5, 10, 20, "All" ] ],
            "order" : [ [ 2, "desc" ] ],
            "serverSide" : false,
            "ajax" : {
                "url" : 'inst/base/query',
                "async": false
            },
            "columns" : [ {
                "data" : "baseId"
            }, {
                "data" : "baseName"
            }, {
                "data" : "deleteFlagTxt"
            }, {
                "data" : "baseDesc"
            }, {
                "data" : "createDate"
            }],
            'columnDefs': [{
                'orderable' : false,
                "searchable" : false,
                "targets": [0],
                "data": "userId",
                "render": function (data, type, full) {
                    return '<input type="checkbox" name="data-checkbox" value="' + data + '" />';
                 }
            },
            {
                "targets": [4],
                "data": "createDate",
                "render": function (data, type, full) {
                    if(data == null || data == '') {
                        return '';
                    }
                    return new Date(data).format("yyyy-MM-dd hh:mm:ss");
                 }
            }],
            "sScrollX": "100%",
//             "sScrollXInner": "150%",
//             "bScrollCollapse": true,
            "dom" : '<"top"l<"div_right">>rt<"bottom"ip><"clear">',
            'initComplete' : initTab,
            "createdRow": function ( row, data, index ) {
                $('td', row).eq(0).addClass('checkbox-datatables');
             },
            "language" : {
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