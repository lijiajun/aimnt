<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html>
<html>
<head>
<title>云主机申请结果</title>
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
                                    <label class="control-label col-md-4">申请人</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="applicant">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">申请人NT账号</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="applicantNt">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">业务系统</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="busiSystem">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">主机IP</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="hostIp">
                                    </div>
                                </div>
                            </div>
<!--                             <div class="col-md-4"> -->
<!--                                 <div class="form-group"> -->
<!--                                     <label class="control-label col-md-4">主机系统</label> -->
<!--                                     <div class="col-md-8"> -->
<!--                                         <input type="text" class="form-control" id="hostOs"> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
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
                        <table class="table table-striped table-bordered table-hover table-checkable order-column" id="tabMntHostApplyResult" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th class="checkbox-datatables"><input type="checkbox" id="tab-th-chk" /></th>
                                    <th>事业部</th>
                                    <th>申请人</th>
                                    <th>申请人NT账号</th>
                                    <th>业务系统</th>
                                    <th>主机类型</th>
                                    <th>主机配置</th>
                                    <th>数据盘(G)</th>
                                    <th>主机IP</th>
                                    <th>root密码</th>
                                    <th>puaiuc密码</th>
                                    <th>主机系统</th>
                                    <th>备注</th>
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
        <shiro:hasPermission name="cloud:host:operate">
        <span class="dt-buttons">
            <a class="dt-button btn purple btn-outline btn-mnt" id="btnImport" >
                <span>导入</span>
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

        var tableObj = $('#tabMntHostApplyResult').DataTable(getConfig());
        $('#btnQuery').click(function(e) {
            var strApplicant = $("#applicant").val();
            var strApplicantNt = $("#applicantNt").val();
            var strHostIp = $("#hostIp").val();
            var strBeginDate = $("#beginDate").val();
            var strEndDate = $("#endDate").val();
            var sUrl = "cloud/host/query?";
            sUrl += "applicant=" + strApplicant +
                "&applicantNt=" + strApplicantNt +
                "&hostIp=" + strHostIp +
                "&beginDate=" + strBeginDate;
                "&strEndDate=" + strEndDate;
            tableObj.ajax.url(sUrl).load();
        });
        
        $('.reload').on('click', function() {
            $('#applicant').val('');
            $('#applicantNt').val('');
            $('#hostIp').val('');
            $('#beginDate').val('');
            $('#endDate').val('');
            tableObj.ajax.url('cloud/host/query?id=-1').load();
        });
        
        //修改按钮
        $('.div_right').on('click', '.dt-buttons>#btnUpdate',function() {
            var checkedBox = $("#tabMntHostApplyResult tbody tr td .checked");
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
            showModal(2, " ", [ '1000px', '500px' ], "cloud/host/update_page/" + strId, tableObj);
        });
        
        //新增
        $('.div_right').on('click', '.dt-buttons>#btnAdd', function(){
            showModal(2, " ", ['1000px', '500px'], "cloud/host/add_page", tableObj);
        });
        
        //删除按钮
        $('.div_right').on('click', '.dt-buttons>#btnDelete',function() {
            var checkedBox = $("#tabMntHostApplyResult tbody tr td .checked");
            comfirmDeleteData(tableObj, checkedBox, 'cloud/host/delete/');
        });
        
        //导入
        $('.div_right').on('click', '.dt-buttons>#btnImport', function() {
            showModal(2, " ", [ '1000px', '400px' ], "cloud/host/import_page", tableObj);
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
                "url" : "cloud/host/query?id=-1"
            //    "async": false
            },
            "columns" : [ {
                "data" : "id"
            }, {
                "data" : "dept"
            }, {
                "data" : "applicant"
            }, {
                "data" : "applicantNt"
            }, {
                "data" : "busiSystem"
            }, {
                "data" : "hostType"
            }, {
                "data" : "hostCfg"
            }, {
                "data" : "diskSize"
            }, {
                "data" : "hostIp"
            }, {
                "data" : "rootPasswd"
            }, {
                "data" : "puaiucPasswd"
            }, {
                "data" : "hostOs"
            }, {
                "data" : "remark"
            }, {
                "data" : "createDate"
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
                "targets": [13],
                "data": "createDate",
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