<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html>
<html>
<head>
<title>产品功能模块信息</title>
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
                                    <label class="control-label col-md-4">功能编号</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="moduleId">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">模块英文名称</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="moduleNameEn">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">模块中文名称</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="moduleNameCn">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">产品编号</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="prodId">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">产品大版本编号</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="verCode">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">父模块编号</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="parentModuleId">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">输出类型  1程序、2库、3模板</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="outputType">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">输出物</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="output">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">启动命令</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="startCommand">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">SVN路径</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="svnPath">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">模块描述</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="moduleDesc">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">是否在用 1是，0否</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="isUsed">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">删除标识，1删除，0未删除</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="deleteFlag">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">备注</label>
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
                        <table class="table table-striped table-bordered table-hover table-checkable order-column" id="tabMntProdModule" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th class="checkbox-datatables"><input type="checkbox" id="tab-th-chk" /></th>
                                    <th>模块英文名称</th>
                                    <th>模块中文名称</th>
                                    <th>产品编号</th>
                                    <th>产品大版本编号</th>
                                    <th>父模块编号</th>
                                    <th>输出类型  1程序、2库、3模板</th>
                                    <th>输出物</th>
                                    <th>启动命令</th>
                                    <th>SVN路径</th>
                                    <th>模块描述</th>
                                    <th>是否在用 1是，0否</th>
                                    <th>删除标识，1删除，0未删除</th>
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

        var tableObj = $('#tabMntProdModule').DataTable(getConfig());
        $('#btnQuery').click(function(e) {
            var strModuleId = $("#moduleId").val();
            var strModuleNameEn = $("#moduleNameEn").val();
            var strModuleNameCn = $("#moduleNameCn").val();
            var strProdId = $("#prodId").val();
            var strVerCode = $("#verCode").val();
            var strParentModuleId = $("#parentModuleId").val();
            var strOutputType = $("#outputType").val();
            var strOutput = $("#output").val();
            var strStartCommand = $("#startCommand").val();
            var strSvnPath = $("#svnPath").val();
            var strModuleDesc = $("#moduleDesc").val();
            var strIsUsed = $("#isUsed").val();
            var strDeleteFlag = $("#deleteFlag").val();
            var strRemark = $("#remark").val();
            var strCreator = $("#creator").val();
            var strCreateDate = $("#createDate").val();
            var strModifier = $("#modifier").val();
            var strModifyDate = $("#modifyDate").val();
            var sUrl = "product/module/query?";
            sUrl += 
                "&moduleId=" + strModuleId +
                "&moduleNameEn=" + strModuleNameEn +
                "&moduleNameCn=" + strModuleNameCn +
                "&prodId=" + strProdId +
                "&verCode=" + strVerCode +
                "&parentModuleId=" + strParentModuleId +
                "&outputType=" + strOutputType +
                "&output=" + strOutput +
                "&startCommand=" + strStartCommand +
                "&svnPath=" + strSvnPath +
                "&moduleDesc=" + strModuleDesc +
                "&isUsed=" + strIsUsed +
                "&deleteFlag=" + strDeleteFlag +
                "&remark=" + strRemark +
                "&creator=" + strCreator +
                "&createDate=" + strCreateDate +
                "&modifier=" + strModifier +
                "&modifyDate=" + strModifyDate;
            tableObj.ajax.url(sUrl).load();
        });
        
        $('.reload').on('click', function() {
            $('#moduleId').val('');
            $('#moduleNameEn').val('');
            $('#moduleNameCn').val('');
            $('#prodId').val('');
            $('#verCode').val('');
            $('#parentModuleId').val('');
            $('#outputType').val('');
            $('#output').val('');
            $('#startCommand').val('');
            $('#svnPath').val('');
            $('#moduleDesc').val('');
            $('#isUsed').val('');
            $('#deleteFlag').val('');
            $('#remark').val('');
            $('#creator').val('');
            $('#createDate').val('');
            $('#modifier').val('');
            $('#modifyDate').val('');
            tableObj.ajax.url('product/module/query?moduleId=-1').load();
        });
        
        //修改按钮
        $('#btnUpdate').on('click',function() {
            var checkedBox = $("#tabMntProdModule tbody tr td .checked");
            var checkedLength = checkedBox.length;
            if(checkedLength == 0) {
                showMsg("请选择需要修改的数据！");
                return;
            }
            if(checkedLength > 1) {
                showMsg("只能选择一条数据进行修改操作！");
                return;
            }
            var strModuleId = checkedBox.find('input:checkbox').val();
            showModal(2, "修改发布信息", [ '650px', '500px' ], "product/module/update_page/" + strModuleId, tableObj);
        });
        
        //新增
        $('#btnAdd').on('click', function(){
            showModal(2, " ", ['650px', '500px'], "product/module/add_page", tableObj);
        });
        
        //删除按钮
        $('#btnDelete').on('click',function() {
            
            var checkedBox = $("#tabMntProdModule tbody tr td .checked");
            var checkedLength = checkedBox.length;
            if(checkedLength == 0) {
                showMsg("请选择需要删除的数据！");
                return;
            }
            var moduleIdAry = [];
            checkedBox.find('input:checkbox').each(function(){
                moduleIdAry.push($(this).val());
            });
            $.ajax({
                url: 'product/module/delete/' + moduleIdAry,
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
            "destroy": true,
            "lengthMenu" : [ [ 5, 10, 20, -1 ], [ 5, 10, 20, "All" ] ],
            "order" : [ [ 1, "asc" ] ],
            "serverSide" : false,
            //"ajax" : {
            //    "url" : "product/module/query?moduleId=-1"
                //"async": false
            //},
            "columns" : [ {
                "data" : "moduleId"
            }, {
                "data" : "moduleNameEn"
            }, {
                "data" : "moduleNameCn"
            }, {
                "data" : "prodId"
            }, {
                "data" : "verCode"
            }, {
                "data" : "parentModuleId"
            }, {
                "data" : "outputType"
            }, {
                "data" : "output"
            }, {
                "data" : "startCommand"
            }, {
                "data" : "svnPath"
            }, {
                "data" : "moduleDesc"
            }, {
                "data" : "isUsed"
            }, {
                "data" : "deleteFlag"
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
                "data": "moduleId",
                "render": function (data, type, full) {
                    return '<input type="checkbox" name="data-checkbox" value="' + data + '" />';
                 }
            },
            {
                "targets": [15],
                "data": "createDate",
                "render": function (data, type, full) {
                    if(data == null || data == "") {
                        return "";
                    }
                    return new Date(data).format("yyyy-MM-dd hh:mm:ss");
                 }
            },
            {
                "targets": [17],
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