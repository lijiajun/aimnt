<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html>
<html>
<head>
<title>${modelNameCn}</title>
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
                    <#list columns as column>
                        <#if column_index % 3 == 0>
                        <div class="row">
                        </#if>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">${column.columnComment}</label>
                                    <div class="col-md-8">
                                    <#if column.javaType == "Date">
                                        <div class="input-group date-picker input-daterange" data-date="2012-12-12" data-date-format="yyyy-mm-dd">
                                            <input type="text" class="form-control" name="from" id="beginDate" readonly AUTOCOMPLETE="off">
                                            <span class="input-group-addon"> 到 </span>
                                            <input type="text" class="form-control" name="to" id="endDate" readonly AUTOCOMPLETE="off">
                                        </div>
                                    <#else>
                                        <input type="text" class="form-control" id="${column.javaField}">
                                    </#if>
                                    </div>
                                </div>
                            </div>
                        <#if column_index % 3 == 2 || columns?size -1 == column_index>
                        </div>
                        </#if>
                    </#list> 
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
                        <table class="table table-striped table-bordered table-hover table-checkable order-column" id="tab${modelName}" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th class="checkbox-datatables"><input type="checkbox" id="tab-th-chk" /></th>
                                <#list columns as column>
                                    <#if column.javaField == pkJavaField>
                                    <#else>
                                    <th>${column.columnComment}</th>
                                    </#if>
                                </#list>
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

        var tableObj = $('#tab${modelName}').DataTable(getConfig());
        $('#btnQuery').click(function(e) {
        <#list columns as column>
            var str${column.javaField?cap_first} = $("#${column.javaField}").val();
        </#list>
            var sUrl = "${module}/${sub_module}/query?";
            sUrl += 
            <#list columns as column>
                <#if columns?size - 1 == column_index>
                "&${column.javaField}=" + str${column.javaField?cap_first};
                <#else>
                "&${column.javaField}=" + str${column.javaField?cap_first} +
                </#if>
            </#list>
            tableObj.ajax.url(sUrl).load();
        });
        
        $('.reload').on('click', function() {
        <#list columns as column>
            $('#${column.javaField}').val('');
        </#list>
            tableObj.ajax.url('${module}/${sub_module}/query?${pkJavaField}=-1').load();
        });
        
        //修改按钮
        $('.div_right').on('click', '.dt-buttons>#btnUpdate',function() {
            var checkedBox = $("#tab${modelName} tbody tr td .checked");
            var checkedLength = checkedBox.length;
            if(checkedLength == 0) {
                showMsg("请选择需要修改的数据！");
                return;
            }
            if(checkedLength > 1) {
                showMsg("只能选择一条数据进行修改操作！");
                return;
            }
            var str${pkJavaField?cap_first} = checkedBox.find('input:checkbox').val();
            showModal(2, " ", [ '1000px', '500px' ], "${module}/${sub_module}/update_page/" + str${pkJavaField?cap_first}, tableObj);
        });
        
        //新增
        $('.div_right').on('click', '.dt-buttons>#btnAdd', function(){
            showModal(2, " ", ['1000px', '500px'], "${module}/${sub_module}/add_page", tableObj);
        });
        
        //删除按钮
        $('.div_right').on('click', '.dt-buttons>#btnDelete',function() {
            var checkedBox = $("#tab${modelName} tbody tr td .checked");
            comfirmDeleteData(tableObj, checkedBox, '${module}/${sub_module}/delete/');
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
                "url" : "${module}/${sub_module}/query?${pkJavaField}=-1"
            //    "async": false
            },
            "columns" : [ {
            <#list columns as column>
            <#if columns?size - 1 == column_index>
                "data" : "${column.javaField}"
            <#else>
                "data" : "${column.javaField}"
            }, {
            </#if>
            </#list>
            }],
            "columnDefs": [{
                "orderable" : false,
                "searchable" : false,
                "targets": [0],
                "data": "${pkJavaField}",
                "render": function (data, type, full) {
                    return '<input type="checkbox" name="data-checkbox" value="' + data + '" />';
                 }
            },
            <#list columns as column>
            <#if column.javaType == "Date">
            {
                "targets": [${column_index}],
                "data": "${column.javaField}",
                "render": function (data, type, full) {
                    if(data == null || data == "") {
                        return "";
                    }
                    return new Date(data).format("yyyy-MM-dd hh:mm:ss");
                 }
            <#if columns?size - 1 == column_index>
            }
            <#else>
            },
            </#if>
            </#if>
            </#list>
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