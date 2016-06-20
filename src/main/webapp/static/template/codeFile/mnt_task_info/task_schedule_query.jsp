<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html>
<html>
<head>
<title>任务信息</title>
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
                                    <label class="control-label col-md-4"></label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="taskId">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">任务名称</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="taskName">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">任务描述</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="taskDesc">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">分派人</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="creator">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">处理人</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="dealPerson">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">上级任务</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="parentTaskId">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">分派时间</label>
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
                                    <label class="control-label col-md-4">预计完成时间</label>
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
                                    <label class="control-label col-md-4">处理时间</label>
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
                                    <label class="control-label col-md-4"></label>
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
                                    <label class="control-label col-md-4">处理状态 1未分派 2处理中 3已完成</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="dealSts">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">删除标识 1已删除 0未删除</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="deleteFlag">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">备注</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="taskRemark">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
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
                        <table class="table table-striped table-bordered table-hover table-checkable order-column" id="tabMntTaskInfo" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th class="checkbox-datatables"><input type="checkbox" id="tab-th-chk" /></th>
                                    <th>任务名称</th>
                                    <th>任务描述</th>
                                    <th>分派人</th>
                                    <th>处理人</th>
                                    <th>上级任务</th>
                                    <th>分派时间</th>
                                    <th>预计完成时间</th>
                                    <th>处理时间</th>
                                    <th></th>
                                    <th>处理状态 1未分派 2处理中 3已完成</th>
                                    <th>删除标识 1已删除 0未删除</th>
                                    <th>备注</th>
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

        var tableObj = $('#tabMntTaskInfo').DataTable(getConfig());
        $('#btnQuery').click(function(e) {
            var strTaskId = $("#taskId").val();
            var strTaskName = $("#taskName").val();
            var strTaskDesc = $("#taskDesc").val();
            var strCreator = $("#creator").val();
            var strDealPerson = $("#dealPerson").val();
            var strParentTaskId = $("#parentTaskId").val();
            var strCreateDate = $("#createDate").val();
            var strExpectDate = $("#expectDate").val();
            var strDealDate = $("#dealDate").val();
            var strFinishDate = $("#finishDate").val();
            var strDealSts = $("#dealSts").val();
            var strDeleteFlag = $("#deleteFlag").val();
            var strTaskRemark = $("#taskRemark").val();
            var sUrl = "task/schedule/query?";
            sUrl += 
                "&taskId=" + strTaskId +
                "&taskName=" + strTaskName +
                "&taskDesc=" + strTaskDesc +
                "&creator=" + strCreator +
                "&dealPerson=" + strDealPerson +
                "&parentTaskId=" + strParentTaskId +
                "&createDate=" + strCreateDate +
                "&expectDate=" + strExpectDate +
                "&dealDate=" + strDealDate +
                "&finishDate=" + strFinishDate +
                "&dealSts=" + strDealSts +
                "&deleteFlag=" + strDeleteFlag +
                "&taskRemark=" + strTaskRemark;
            tableObj.ajax.url(sUrl).load();
        });
        
        $('.reload').on('click', function() {
            $('#taskId').val('');
            $('#taskName').val('');
            $('#taskDesc').val('');
            $('#creator').val('');
            $('#dealPerson').val('');
            $('#parentTaskId').val('');
            $('#createDate').val('');
            $('#expectDate').val('');
            $('#dealDate').val('');
            $('#finishDate').val('');
            $('#dealSts').val('');
            $('#deleteFlag').val('');
            $('#taskRemark').val('');
            tableObj.ajax.url('task/schedule/query?taskId=-1').load();
        });
        
        //修改按钮
        $('.div_right').on('click', '.dt-buttons>#btnUpdate',function() {
            var checkedBox = $("#tabMntTaskInfo tbody tr td .checked");
            var checkedLength = checkedBox.length;
            if(checkedLength == 0) {
                showMsg("请选择需要修改的数据！");
                return;
            }
            if(checkedLength > 1) {
                showMsg("只能选择一条数据进行修改操作！");
                return;
            }
            var strTaskId = checkedBox.find('input:checkbox').val();
            showModal(2, "修改发布信息", [ '650px', '500px' ], "task/schedule/update_page/" + strTaskId, tableObj);
        });
        
        //新增
        $('.div_right').on('click', '.dt-buttons>#btnAdd', function(){
            showModal(2, " ", ['650px', '500px'], "task/schedule/add_page", tableObj);
        });
        
        //删除按钮
        $('.div_right').on('click', '.dt-buttons>#btnDelete',function() {
            
            var checkedBox = $("#tabMntTaskInfo tbody tr td .checked");
            var checkedLength = checkedBox.length;
            if(checkedLength == 0) {
                showMsg("请选择需要删除的数据！");
                return;
            }
            var taskIdAry = [];
            checkedBox.find('input:checkbox').each(function(){
                taskIdAry.push($(this).val());
            });
            $.ajax({
                url: 'task/schedule/delete/' + taskIdAry,
                dataType: 'json',
                async:false,
                success:function (data) {
                    showMsg("删除成功！");
                    tableObj.ajax.reload(null,false);
                },
                error:function() {
                    showMsg("删除操作发生错误！");
                }
            });
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
                "url" : "task/schedule/query?taskId=-1"
            //    "async": false
            },
            "columns" : [ {
                "data" : "taskId"
            }, {
                "data" : "taskName"
            }, {
                "data" : "taskDesc"
            }, {
                "data" : "creator"
            }, {
                "data" : "dealPerson"
            }, {
                "data" : "parentTaskId"
            }, {
                "data" : "createDate"
            }, {
                "data" : "expectDate"
            }, {
                "data" : "dealDate"
            }, {
                "data" : "finishDate"
            }, {
                "data" : "dealSts"
            }, {
                "data" : "deleteFlag"
            }, {
                "data" : "taskRemark"
            }],
            "columnDefs": [{
                "orderable" : false,
                "searchable" : false,
                "targets": [0],
                "data": "taskId",
                "render": function (data, type, full) {
                    return '<input type="checkbox" name="data-checkbox" value="' + data + '" />';
                 }
            },
            {
                "targets": [6],
                "data": "createDate",
                "render": function (data, type, full) {
                    if(data == null || data == "") {
                        return "";
                    }
                    return new Date(data).format("yyyy-MM-dd hh:mm:ss");
                 }
            },
            {
                "targets": [7],
                "data": "expectDate",
                "render": function (data, type, full) {
                    if(data == null || data == "") {
                        return "";
                    }
                    return new Date(data).format("yyyy-MM-dd hh:mm:ss");
                 }
            },
            {
                "targets": [8],
                "data": "dealDate",
                "render": function (data, type, full) {
                    if(data == null || data == "") {
                        return "";
                    }
                    return new Date(data).format("yyyy-MM-dd hh:mm:ss");
                 }
            },
            {
                "targets": [9],
                "data": "finishDate",
                "render": function (data, type, full) {
                    if(data == null || data == "") {
                        return "";
                    }
                    return new Date(data).format("yyyy-MM-dd hh:mm:ss");
                 }
            },
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