<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html>
<html>
<head>
<title>库文件信息</title>
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
                                    <label class="control-label col-md-4">所属模块</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="moduleName">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">在用状态</label>
                                    <div class="col-md-8">
                                        <select name="isUsed" class="form-control select2" id="isUsed">
                                            <option value="-1">全部</option>
                                            <c:forEach items="${isUsedEnums}" var="isUsedEnum">
                                                <option value="${isUsedEnum.key}">${isUsedEnum.value}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">业务库名称</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="libName">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4"></label>
                                    <div class="col-md-8">
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
                        <table class="table table-striped table-bordered table-hover table-checkable order-column" id="tabMntLibInfo" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th class="checkbox-datatables"><input type="checkbox" id="tab-th-chk" /></th>
                                    <th>业务库名称</th>
                                    <th>业务库类型</th>
                                    <th>所属产品</th>
                                    <th>大版本</th>
                                    <th>所属模块</th>
                                    <th>在用状态</th>
                                    <th>创建时间</th>
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
    <div style="display:none" id="btn-data-tools">
        <shiro:hasPermission name="prod:operate">
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

    	//loadVerCodeSelect(2);
        $('#prodId').change(function(){
            loadVerCodeSelect(2);
        });
        
        var tableObj = $('#tabMntLibInfo').DataTable(getConfig());
        $('#btnQuery').click(function(e) {
            var strProdId = $("#prodId").val();
            var strVerCode = $("#verCode").val();
            var strLibName = $("#libName").val();
            var strModuleName = $("#moduleName").val();
            var strIsUsed = $("#isUsed").val();
            strVerCode = strVerCode == -1 ? "" : strVerCode;
            strProdId = strProdId == -1 ? "" : strProdId;
            strIsUsed = strIsUsed == -1 ? "" : strIsUsed;
            var sUrl = "prod/lib/query?";
            sUrl += "prodId=" + strProdId + 
                "&verCode=" + strVerCode + 
                "&libName=" + strLibName +
                "&moduleName=" + strModuleName +
                "&isUsed=" + strIsUsed;
            tableObj.ajax.url(sUrl).load();
        });
        
        $('.reload').on('click', function() {
            $('#prodId').val(-1);
            $('#verCode').val(-1);
            $('#moduleName').val('');
            $('#libName').val('');
            $('#isUsed').val(-1);
            tableObj.ajax.url('prod/lib/query?libId=-1').load();
        });
        
        //修改按钮
        $('.div_right').on('click', '.dt-buttons>#btnUpdate',function() {
            var checkedBox = $("#tabMntLibInfo tbody tr td .checked");
            var checkedLength = checkedBox.length;
            if(checkedLength == 0) {
                showMsg("请选择需要修改的数据！");
                return;
            }
            if(checkedLength > 1) {
                showMsg("只能选择一条数据进行修改操作！");
                return;
            }
            var strLibId = checkedBox.find('input:checkbox').val();
            showModal(2, "修改发布信息", [ '1000px', '600px' ], "prod/lib/update_page/" + strLibId, tableObj);
        });
        
        //新增
        $('.div_right').on('click', '.dt-buttons>#btnAdd', function(){
            showModal(2, " ", ['1000px', '600px'], "prod/lib/add_page", tableObj);
        });
        
        //删除按钮
        $('.div_right').on('click', '.dt-buttons>#btnDelete',function() {
            
            var checkedBox = $("#tabMntLibInfo tbody tr td .checked");
            comfirmDeleteData(tableObj, checkedBox, 'prod/lib/delete/');
            
//             var checkedBox = $("#tabMntLibInfo tbody tr td .checked");
//             var checkedLength = checkedBox.length;
//             if(checkedLength == 0) {
//                 showMsg("请选择需要删除的数据！");
//                 return;
//             }
//             var libIdAry = [];
//             checkedBox.find('input:checkbox').each(function(){
//                 libIdAry.push($(this).val());
//             });
//             $.ajax({
//                 url: 'prod/lib/delete/' + libIdAry,
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
        
        //库导入
        $('.div_right').on('click', '.dt-buttons>#btnImport', function() {
            showModal(2, " ", [ '1000px', '400px' ], "prod/lib/page_import", tableObj);
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
               "url" : "prod/lib/query?libId=-1"
            //    "async": false
            },
            "columns" : [{
                "data" : "libId"
            }, {
                "data" : "libName"
            }, {
                "data" : "libTypeTxt"
            }, {
                "data" : "mntProdModule.prodName"
            }, {
                "data" : "mntProdModule.verName"
            }, {
                "data" : "moduleName"
            }, {
                "data" : "isUsedTxt"
            }, {
                "data" : "createDate"
            }, {
                "data" : "libId"
            }],
            "columnDefs": [{
                "orderable" : false,
                "searchable" : false,
                "targets": [0],
                "data": "libId",
                "render": function (data, type, full) {
                    return '<input type="checkbox" name="data-checkbox" value="' + data + '" />';
                 }
            },{
                "targets": [7],
                "data": "createDate",
                "render": function (data, type, full) {
                    if(data == null || data == "") {
                        return "";
                    }
                    return new Date(data).format("yyyy-MM-dd hh:mm:ss");
                 }
            },{
                "targets": [8],
                "data": "libId",
                "render": function (data, type, full) {
                    return '<a href="javascript:;" style="padding-right: 3px" onclick="showLibInfo(' + data + ')"><span class="label label-sm label-info"> 详细信息 </span></a> ' + 
                    '<a href="javascript:;" onclick="showHisRelDetail(' + data + ')"><span class="label label-sm label-warning"> 发布历史 </span></a>';
                 }
            }],
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
                "info" : "第 _PAGE_ 页 ( 总共 _PAGES_ 页 _MAX_ 条记录)",
                "infoEmpty" : "无记录",
                "infoFiltered" : "(从 _MAX_ 条记录过滤)",
                "paginate" : {
                    "previous" : "上一页",
                    "next" : "下一页"
                }
            }
        };
    }
    
    function showHisRelDetail(libId) {
        showFullModal(2, [ '1000px', '600px' ], "prod/lib/his/" + libId + "/page");
    }
    
    function showLibInfo(libId) {
        showFullModal(2, [ '1000px', '600px' ], "prod/lib/info/" + libId + "/page");
    }
    
</script>
</body>
</html>