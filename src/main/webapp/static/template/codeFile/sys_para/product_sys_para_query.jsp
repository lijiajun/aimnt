<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html>
<html>
<head>
<title>系统参数表XG.SYSPARA</title>
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
                                    <label class="control-label col-md-4">参数编号</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="paraId">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">地区代码，系统中对应的地区代码表内容，如果是0表示对所有的地区有效</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="regionCode">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">县区代码，系统中对应的县区代码表内容，如果是0表示对所有的县区有效</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="countyCode">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">参数代码</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="paramCode">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">参数名称</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="paramName">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">所属系统
            系统基础参数所属的子系统：
            1 －－ 系统管理
            2 －－ 业务管理
            3 －－ 综合客服
            4 －－ 帐务管理
            5 －－ 帐务处理
            6 －－ 接口管理</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="paramClass">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">参数类型 参数的数据类别：(1--Char  2--Number  3--Boolean  4？Date 5－Long 6-String 7-Double)SYS_BASE_TYPE.code_type=1</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="paramDataType">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">参数取值</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="paramValue">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">参数说明</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="paramDesc">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">安装点</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="baseId">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">所属产品</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="prodId">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">产品版本</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="verCode">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">发布版本</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="relCode">
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
                        <table class="table table-striped table-bordered table-hover table-checkable order-column" id="tabSysPara" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th class="checkbox-datatables"><input type="checkbox" id="tab-th-chk" /></th>
                                    <th>地区代码，系统中对应的地区代码表内容，如果是0表示对所有的地区有效</th>
                                    <th>县区代码，系统中对应的县区代码表内容，如果是0表示对所有的县区有效</th>
                                    <th>参数代码</th>
                                    <th>参数名称</th>
                                    <th>所属系统
            系统基础参数所属的子系统：
            1 －－ 系统管理
            2 －－ 业务管理
            3 －－ 综合客服
            4 －－ 帐务管理
            5 －－ 帐务处理
            6 －－ 接口管理</th>
                                    <th>参数类型 参数的数据类别：(1--Char  2--Number  3--Boolean  4？Date 5－Long 6-String 7-Double)SYS_BASE_TYPE.code_type=1</th>
                                    <th>参数取值</th>
                                    <th>参数说明</th>
                                    <th>安装点</th>
                                    <th>所属产品</th>
                                    <th>产品版本</th>
                                    <th>发布版本</th>
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

        var tableObj = $('#tabSysPara').DataTable(getConfig());
        $('#btnQuery').click(function(e) {
            var strParaId = $("#paraId").val();
            var strRegionCode = $("#regionCode").val();
            var strCountyCode = $("#countyCode").val();
            var strParamCode = $("#paramCode").val();
            var strParamName = $("#paramName").val();
            var strParamClass = $("#paramClass").val();
            var strParamDataType = $("#paramDataType").val();
            var strParamValue = $("#paramValue").val();
            var strParamDesc = $("#paramDesc").val();
            var strBaseId = $("#baseId").val();
            var strProdId = $("#prodId").val();
            var strVerCode = $("#verCode").val();
            var strRelCode = $("#relCode").val();
            var sUrl = "product/sys_para/query?";
            sUrl += 
                "&paraId=" + strParaId +
                "&regionCode=" + strRegionCode +
                "&countyCode=" + strCountyCode +
                "&paramCode=" + strParamCode +
                "&paramName=" + strParamName +
                "&paramClass=" + strParamClass +
                "&paramDataType=" + strParamDataType +
                "&paramValue=" + strParamValue +
                "&paramDesc=" + strParamDesc +
                "&baseId=" + strBaseId +
                "&prodId=" + strProdId +
                "&verCode=" + strVerCode +
                "&relCode=" + strRelCode;
            tableObj.ajax.url(sUrl).load();
        });
        
        $('.reload').on('click', function() {
            $('#paraId').val('');
            $('#regionCode').val('');
            $('#countyCode').val('');
            $('#paramCode').val('');
            $('#paramName').val('');
            $('#paramClass').val('');
            $('#paramDataType').val('');
            $('#paramValue').val('');
            $('#paramDesc').val('');
            $('#baseId').val('');
            $('#prodId').val('');
            $('#verCode').val('');
            $('#relCode').val('');
            tableObj.ajax.url('product/sys_para/query?paraId=-1').load();
        });
        
        //修改按钮
        $('.div_right').on('click', '.dt-buttons>#btnUpdate',function() {
            var checkedBox = $("#tabSysPara tbody tr td .checked");
            var checkedLength = checkedBox.length;
            if(checkedLength == 0) {
                showMsg("请选择需要修改的数据！");
                return;
            }
            if(checkedLength > 1) {
                showMsg("只能选择一条数据进行修改操作！");
                return;
            }
            var strParaId = checkedBox.find('input:checkbox').val();
            showModal(2, "修改发布信息", [ '650px', '500px' ], "product/sys_para/update_page/" + strParaId, tableObj);
        });
        
        //新增
        $('.div_right').on('click', '.dt-buttons>#btnAdd', function(){
            showModal(2, " ", ['650px', '500px'], "product/sys_para/add_page", tableObj);
        });
        
        //删除按钮
        $('.div_right').on('click', '.dt-buttons>#btnDelete',function() {
            
            var checkedBox = $("#tabSysPara tbody tr td .checked");
            var checkedLength = checkedBox.length;
            if(checkedLength == 0) {
                showMsg("请选择需要删除的数据！");
                return;
            }
            var paraIdAry = [];
            checkedBox.find('input:checkbox').each(function(){
                paraIdAry.push($(this).val());
            });
            $.ajax({
                url: 'product/sys_para/delete/' + paraIdAry,
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
                "url" : "product/sys_para/query?paraId=-1"
            //    "async": false
            },
            "columns" : [ {
                "data" : "paraId"
            }, {
                "data" : "regionCode"
            }, {
                "data" : "countyCode"
            }, {
                "data" : "paramCode"
            }, {
                "data" : "paramName"
            }, {
                "data" : "paramClass"
            }, {
                "data" : "paramDataType"
            }, {
                "data" : "paramValue"
            }, {
                "data" : "paramDesc"
            }, {
                "data" : "baseId"
            }, {
                "data" : "prodId"
            }, {
                "data" : "verCode"
            }, {
                "data" : "relCode"
            }],
            "columnDefs": [{
                "orderable" : false,
                "searchable" : false,
                "targets": [0],
                "data": "paraId",
                "render": function (data, type, full) {
                    return '<input type="checkbox" name="data-checkbox" value="' + data + '" />';
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