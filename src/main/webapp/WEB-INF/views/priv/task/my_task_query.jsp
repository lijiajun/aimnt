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
                                    <label class="control-label col-md-4">任务名称</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="taskName">
                                    </div>
                                </div>
                            </div>
<!--                             <div class="col-md-4"> -->
<!--                                 <div class="form-group"> -->
<!--                                     <label class="control-label col-md-4">分派人</label> -->
<!--                                     <div class="col-md-8"> -->
<!--                                         <input type="text" class="form-control" id="creator"> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">处理状态</label>
                                    <div class="col-md-8">
                                        <select name="dealSts" class="form-control select2" id="dealSts">
                                            <option value="-1">全部</option>
                                            <c:forEach items="${taskStsEnums}" var="taskStsEnum">
                                                <option value="${taskStsEnum.key}">${taskStsEnum.value}</option>
                                            </c:forEach>
                                        </select>
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
<!--                         <div class="row"> -->
<!--                             <div class="col-md-4"> -->
<!--                                 <div class="form-group"> -->
<!--                                     <label class="control-label col-md-4">分派时间</label> -->
<!--                                     <div class="col-md-8"> -->
<!--                                         <div class="input-group date-picker input-daterange" data-date="2012-12-12" data-date-format="yyyy-mm-dd"> -->
<!--                                             <input type="text" class="form-control" name="from" id="beginDate" readonly AUTOCOMPLETE="off"> -->
<!--                                             <span class="input-group-addon"> 到 </span> -->
<!--                                             <input type="text" class="form-control" name="to" id="endDate" readonly AUTOCOMPLETE="off"> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
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
                                    <th>任务名称</th>
                                     <th>处理状态</th> <!--1未分派 2处理中 3已完成 -->
                                    <th>分派人</th>
                                    <th>处理人</th>
                                    <th>上级任务</th>
                                    <th>创建时间</th>
                                    <th>预计完成时间</th>
                                    <th>完成时间</th>
                                    <th>操作</th>
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
    var tableObj;
    $(function() {

        tableObj = $('#tabMntTaskInfo').DataTable(getConfig());
        $('#btnQuery').click(function(e) {
            var strTaskName = $("#taskName").val();
            var strDealSts = $("#dealSts").val();
            strDealSts = strDealSts == -1 ? "" : strDealSts;
            var sUrl = "priv/task/query?";
            sUrl += 
                "taskName=" + strTaskName +
                "&dealSts=" + strDealSts;
            tableObj.ajax.url(sUrl).load();
        });
        
        $('.reload').on('click', function() {
            $('#taskName').val('');
            $('#dealSts').val('');
            tableObj.ajax.url('priv/task/query?taskId=-1').load();
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
            showModal(2, "修改发布信息", [ '1000px', '550px' ], "task/schedule/update_page/" + strTaskId, tableObj);
        });
        
        //新增
        $('.div_right').on('click', '.dt-buttons>#btnAdd', function(){
            showModal(2, " ", ['1000px', '550px'], "task/schedule/add_page", tableObj);
        });
        
        //删除按钮
        $('.div_right').on('click', '.dt-buttons>#btnDelete',function() {
            var checkedBox = $("#tabMntTaskInfo tbody tr td .checked");
            var checkedLength = checkedBox.length;
            if(checkedLength == 0) {
                showMsg("请选择需要删除的数据！");
                return;
            }
            layer.confirm("确认删除选择数据？", {
                btn: ['是','否'] //按钮
            }, function(index){
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
                        layer.close(index);
                    },
                    error:function() {
                        showMsg("删除操作发生错误！");
                    }
                });
            }, function(index){
                layer.close(index);
            });
        });
        
    });

    function getConfig() {
        return config = {
            "processing" : true,
            "pageLength" : 10,
            //"destroy": true,
            "lengthMenu" : [ [ 5, 10, 20, -1 ], [ 5, 10, 20, "All" ] ],
            "order" : [ [ 1, "asc" ] ],
            "serverSide" : false,
            "ajax" : {
                "url" : "priv/task/query?dealSts=2"
            //    "async": false
            },
            "columns" : [{
                "data" : "taskName"
            }, {
                "data" : "dealSts"
            }, {
                "data" : "creator"
            }, {
                "data" : "dealPerson"
            }, {
                "data" : "parentTaskName"
            }, {
                "data" : "createDate"
            }, {
                "data" : "expectDate"
            }, {
                "data" : "finishDate"
            },{
                "data" : "taskId"
            }],
            "columnDefs": [
            {
                "targets": [1],
                "data": "dealSts",
                "render": function (data, type, full) {
                	if(data == 1) {
                		return '<a href="javascript:;" ><span class="label label-sm label-primary"> 未分派 </span></a>';
                	}else if(data == 2){
                        return '<a href="javascript:;" ><span class="label label-sm label-warning"> 处理中 </span></a>';
                    }else if(data == 3) {
                        return '<a href="javascript:;" ><span class="label label-sm label-success"> 已完成 </span></a>';
                    }else if(data == 4) {
                        return '<a href="javascript:;" ><span class="label label-sm label-danger"> 已超时 </span></a>';
                    }else {
                        return '<span class="label label-sm label-info"> 未知 </span>';
                    }
                 }
            },
            {
                "targets": [5],
                "data": "createDate",
                "render": function (data, type, full) {
                    if(data == null || data == "") {
                        return "";
                    }
                    return new Date(data).format("yyyy-MM-dd hh:mm:ss");
                 }
            },
            {
                "targets": [6],
                "data": "expectDate",
                "render": function (data, type, full) {
                    if(data == null || data == "") {
                        return "";
                    }
                    return new Date(data).format("yyyy-MM-dd hh:mm:ss");
                 }
            },
            {
                "targets": [7],
                "data": "finishDate",
                "render": function (data, type, full) {
                    if(data == null || data == "") {
                        return "";
                    }
                    return new Date(data).format("yyyy-MM-dd hh:mm:ss");
                 }
            },{
                "targets": [8],
                "data": "taskId",
                "render": function (data, type, full) {
                    return '<a href="javascript:;" style="margin-right: 3px;" onclick="showDetailContent(' + data + ')"><span class="label label-sm label-success"> 查看任务 </span></a>'
                    + '<a href="javascript:;" onclick="dealTask(' + data + ')"><span class="label label-sm label-info"> 完成点我 </span></a>';;
                 }
            }
            ],
            "sScrollX": "2000px",
            "dom" : '<"top"l<"div_right">>rt<"bottom"ip><"clear">',
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
    
function dealTask(taskId) {
	showConfirm("确定已完成该任务？", function(){//带参数的使用函数表达式
		completeTask(taskId);
	});
	
// 	layer.confirm("确定已完成该任务？", {
//         btn: ['是','否'] //按钮
//     }, function(index){
//         $.ajax({
//             url: 'priv/task/update',
//             data: {'taskId': taskId},
//             dataType: 'json',
//             async:false,
//             success:function (data) {
//             	if(data.status == 0) {
//             		showMsg(data.msg);
//             		return;
//             	}
//                 layer.close(index);
//                 tableObj.ajax.reload(null,false);
//                 showMsg(data.msg);
//             },
//             error:function() {
//                 showMsg("操作发生错误，请稍后重试！");
//             }
//         });
//     }, function(index){
//         layer.close(index);
//     });
}


function completeTask(taskId) {
	$.ajax({
        url: 'priv/task/update',
        data: {'taskId': taskId},
        dataType: 'json',
        async:false,
        success:function (data) {
            if(data.status == 0) {
                showMsg(data.msg);
                return;
            }
//             layer.close(index);
            tableObj.ajax.reload(null,false);
            showMsg(data.msg);
        },
        error:function() {
            showMsg("操作发生错误，请稍后重试！");
        }
    });
}

function showDetailContent(taskId) {
    showFullModal(2, [ '1000px', '550px' ], "task/schedule/" + taskId + "/page");
}
</script>
</body>
</html>