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
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">角色名称</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="roleName">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">角色状态</label>
                                    <div class="col-md-8">
                                        <select name="verId" class="form-control" id="roleSts">
                                            <option value="-1">全部</option>
                                            <option value="1">正常</option>
                                            <option value="2">失效</option>
                                        </select>
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
                        <table class="table table-striped table-bordered table-hover table-checkable order-column" id="tabRole" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th class="checkbox-datatables"><input type="checkbox" id="tab-th-chk" /></th>
                                    <th>角色名称</th>
                                    <th>角色状态</th>
                                    <th>备注</th>
                                    <th>创建日期</th>
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
        <shiro:hasPermission name="auth:operate">
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

        var tableObj = $('#tabRole').DataTable(getConfig());
        $('#btnQuery').click(function(e) {
            var strRoleName = $("#roleName").val();
            var strRoleSts = $("#roleSts").val();
            strRoleSts = strRoleSts == -1 ? "" : strRoleSts;
            var sUrl = "sys/role/query?";
            sUrl += "&roleName=" + strRoleName + 
                         "&roleSts=" + strRoleSts;
            tableObj.ajax.url(sUrl).load();
        });
        
        $('.reload').on('click', function() {
            $('#roleName').val('');
            $('#roleSts').val(-1);
            tableObj.ajax.url('sys/role/query?roleId=-1').load();
        });
        
        //修改按钮
        $('.div_right').on('click', '.dt-buttons>#btnUpdate',function() {
            var checkedBox = $("#tabRole tbody tr td .checked");
            var checkedLength = checkedBox.length;
            if(checkedLength == 0) {
                showMsg("请选择需要修改的数据！");
                return;
            }
            if(checkedLength > 1) {
                showMsg("只能选择一条数据进行修改操作！");
                return;
            }
            console.log(checkedBox.find('input:checkbox'));
            console.log(checkedBox.find('input:checkbox').val());
            var roleId = checkedBox.find('input:checkbox').val();
            showModal(2, "修改发布信息", [ '500px', '600px' ], "sys/role/page_update/" + roleId, tableObj);
        });
        
        //新增
        $('.div_right').on('click', '.dt-buttons>#btnAdd', function(){
            showModal(2, " ", ['500px', '600px'], "sys/role/page_add", tableObj);
        });
        
        //删除按钮
        $('.div_right').on('click', '.dt-buttons>#btnDelete',function() {
            
            var checkedBox = $("#tabRole tbody tr td .checked");
            comfirmDeleteData(tableObj, checkedBox, 'sys/role/delete/');
            
//             var checkedBox = $("#tabRole tbody tr td .checked");
//             var checkedLength = checkedBox.length;
//             if(checkedLength == 0) {
//                 showMsg("请选择需要删除的数据！");
//                 return;
//             }
//             var roleIdAry = [];
            
//             checkedBox.find('input:checkbox').each(function(){
//                 roleIdAry.push($(this).val());
//             });
//             $.ajax({
//                 url: 'sys/role/delete/' + roleIdAry,
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
            "destroy": true,
            "lengthMenu" : [ [ 5, 10, 20, -1 ], [ 5, 10, 20, "All" ] ],
            "order" : [ [ 1, "asc" ] ],
            "serverSide" : false,
            "ajax" : {
                "url" : 'sys/role/query'
//                 "async": false
            },
            "columns" : [ {
                "data" : "roleId"
            }, {
                "data" : "roleName"
            }, {
                "data" : "roleStsTxt"
            }, {
                "data" : "remark"
            },{
                "data" : "createDate"
            }],
            'columnDefs': [{
                'orderable' : false,
                "searchable" : false,
                "targets": [0],
                "data": "roleId",
                "render": function (data, type, full) {
                    return '<input type="checkbox" name="data-checkbox" value="' + data + '" />';
                 }
            },{
                "targets": [4],
                "data": "createDate",
                "render": function (data, type, full) {
                    if(data == null || data == '') {
                        return '';
                    }
                    return new Date(data).format("yyyy-MM-dd");
                 }
            }],
            "dom" : '<"top"l<"div_right">>rt<"bottom"ip><"clear">',
            'initComplete' : initTab,
            "createdRow": function ( row, data, index ) {
                $('td', row).eq(0).addClass('checkbox-datatables');
             },
             "sScrollX": "100%",
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