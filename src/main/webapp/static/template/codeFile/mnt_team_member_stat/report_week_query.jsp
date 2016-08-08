<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html>
<html>
<head>
<title>团队成员统计</title>
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
                                    <label class="control-label col-md-4">编号</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="id">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4"></label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="teamId">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4"></label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="memberNum">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">1正式成员 2实习生 3外援 4出差成员</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="memberType">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">周期 1周 2月 3季 4年</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="cycle">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">周期开始时间</label>
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
                                    <label class="control-label col-md-4"></label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="remark">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">创建人</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="creator">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">创建时间</label>
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
                                    <label class="control-label col-md-4">修改人</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="modifier">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">修改时间</label>
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
                        <table class="table table-striped table-bordered table-hover table-checkable order-column" id="tabMntTeamMemberStat" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th class="checkbox-datatables"><input type="checkbox" id="tab-th-chk" /></th>
                                    <th></th>
                                    <th></th>
                                    <th>1正式成员 2实习生 3外援 4出差成员</th>
                                    <th>周期 1周 2月 3季 4年</th>
                                    <th>周期开始时间</th>
                                    <th></th>
                                    <th></th>
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

        var tableObj = $('#tabMntTeamMemberStat').DataTable(getConfig());
        $('#btnQuery').click(function(e) {
            var strId = $("#id").val();
            var strTeamId = $("#teamId").val();
            var strMemberNum = $("#memberNum").val();
            var strMemberType = $("#memberType").val();
            var strCycle = $("#cycle").val();
            var strCycleBeginDate = $("#cycleBeginDate").val();
            var strCycleEndDate = $("#cycleEndDate").val();
            var strRemark = $("#remark").val();
            var strCreator = $("#creator").val();
            var strCreateDate = $("#createDate").val();
            var strModifier = $("#modifier").val();
            var strModifyDate = $("#modifyDate").val();
            var sUrl = "report/week/query?";
            sUrl += 
                "&id=" + strId +
                "&teamId=" + strTeamId +
                "&memberNum=" + strMemberNum +
                "&memberType=" + strMemberType +
                "&cycle=" + strCycle +
                "&cycleBeginDate=" + strCycleBeginDate +
                "&cycleEndDate=" + strCycleEndDate +
                "&remark=" + strRemark +
                "&creator=" + strCreator +
                "&createDate=" + strCreateDate +
                "&modifier=" + strModifier +
                "&modifyDate=" + strModifyDate;
            tableObj.ajax.url(sUrl).load();
        });
        
        $('.reload').on('click', function() {
            $('#id').val('');
            $('#teamId').val('');
            $('#memberNum').val('');
            $('#memberType').val('');
            $('#cycle').val('');
            $('#cycleBeginDate').val('');
            $('#cycleEndDate').val('');
            $('#remark').val('');
            $('#creator').val('');
            $('#createDate').val('');
            $('#modifier').val('');
            $('#modifyDate').val('');
            tableObj.ajax.url('report/week/query?id=-1').load();
        });
        
        //修改按钮
        $('.div_right').on('click', '.dt-buttons>#btnUpdate',function() {
            var checkedBox = $("#tabMntTeamMemberStat tbody tr td .checked");
            var checkedLength = checkedBox.length;
            if(checkedLength == 0) {
                showMsg("请选择需要修改的数据！");
                return;
            }
            if(checkedLength > 1) {
                showMsg("只能选择一条数据进行修改操作！");
                return;
            }
            var strId = checkedBox.find('input:checkbox').val();
            showModal(2, " ", [ '1000px', '500px' ], "report/week/update_page/" + strId, tableObj);
        });
        
        //新增
        $('.div_right').on('click', '.dt-buttons>#btnAdd', function(){
            showModal(2, " ", ['1000px', '500px'], "report/week/add_page", tableObj);
        });
        
        //删除按钮
        $('.div_right').on('click', '.dt-buttons>#btnDelete',function() {
            var checkedBox = $("#tabMntTeamMemberStat tbody tr td .checked");
            comfirmDeleteData(tableObj, checkedBox, 'report/week/delete/');
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
                "url" : "report/week/query?id=-1"
            //    "async": false
            },
            "columns" : [ {
                "data" : "id"
            }, {
                "data" : "teamId"
            }, {
                "data" : "memberNum"
            }, {
                "data" : "memberType"
            }, {
                "data" : "cycle"
            }, {
                "data" : "cycleBeginDate"
            }, {
                "data" : "cycleEndDate"
            }, {
                "data" : "remark"
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
                "data": "id",
                "render": function (data, type, full) {
                    return '<input type="checkbox" name="data-checkbox" value="' + data + '" />';
                 }
            },
            {
                "targets": [5],
                "data": "cycleBeginDate",
                "render": function (data, type, full) {
                    if(data == null || data == "") {
                        return "";
                    }
                    return new Date(data).format("yyyy-MM-dd hh:mm:ss");
                 }
            },
            {
                "targets": [6],
                "data": "cycleEndDate",
                "render": function (data, type, full) {
                    if(data == null || data == "") {
                        return "";
                    }
                    return new Date(data).format("yyyy-MM-dd hh:mm:ss");
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
            },
            {
                "targets": [11],
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