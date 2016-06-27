<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html>
<html>
<head>
<title>运维文章</title>
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
                                    <label class="control-label col-md-4">文章编号</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="id">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">文章类型</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="typeId">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">文章标题</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="title">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">关键字</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="keyword">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">摘要</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="summary">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">文章内容</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="content">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">作者</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="author">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">阅读次数</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="readCount">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">评论次数</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="commentCount">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">是否允许评论 ： 1允许 0不允许 默认1</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="allowComment">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">是否置顶  1是 0否 默认0</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="isTop">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">是否显示  1显示 0不显示 默认1</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="isShow">
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
                                    <label class="control-label col-md-4">创建人</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="creator">
                                    </div>
                                </div>
                            </div>
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
                        </div>
                        <div class="row">
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
                        <table class="table table-striped table-bordered table-hover table-checkable order-column" id="tabMntArticle" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th class="checkbox-datatables"><input type="checkbox" id="tab-th-chk" /></th>
                                    <th>文章类型</th>
                                    <th>文章标题</th>
                                    <th>关键字</th>
                                    <th>摘要</th>
                                    <th>文章内容</th>
                                    <th>作者</th>
                                    <th>阅读次数</th>
                                    <th>评论次数</th>
                                    <th>是否允许评论 ： 1允许 0不允许 默认1</th>
                                    <th>是否置顶  1是 0否 默认0</th>
                                    <th>是否显示  1显示 0不显示 默认1</th>
                                    <th>删除标识，1删除，0未删除</th>
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

        var tableObj = $('#tabMntArticle').DataTable(getConfig());
        $('#btnQuery').click(function(e) {
            var strId = $("#id").val();
            var strTypeId = $("#typeId").val();
            var strTitle = $("#title").val();
            var strKeyword = $("#keyword").val();
            var strSummary = $("#summary").val();
            var strContent = $("#content").val();
            var strAuthor = $("#author").val();
            var strReadCount = $("#readCount").val();
            var strCommentCount = $("#commentCount").val();
            var strAllowComment = $("#allowComment").val();
            var strIsTop = $("#isTop").val();
            var strIsShow = $("#isShow").val();
            var strDeleteFlag = $("#deleteFlag").val();
            var strCreator = $("#creator").val();
            var strCreateDate = $("#createDate").val();
            var strModifier = $("#modifier").val();
            var strModifyDate = $("#modifyDate").val();
            var sUrl = "article/posts/query?";
            sUrl += 
                "&id=" + strId +
                "&typeId=" + strTypeId +
                "&title=" + strTitle +
                "&keyword=" + strKeyword +
                "&summary=" + strSummary +
                "&content=" + strContent +
                "&author=" + strAuthor +
                "&readCount=" + strReadCount +
                "&commentCount=" + strCommentCount +
                "&allowComment=" + strAllowComment +
                "&isTop=" + strIsTop +
                "&isShow=" + strIsShow +
                "&deleteFlag=" + strDeleteFlag +
                "&creator=" + strCreator +
                "&createDate=" + strCreateDate +
                "&modifier=" + strModifier +
                "&modifyDate=" + strModifyDate;
            tableObj.ajax.url(sUrl).load();
        });
        
        $('.reload').on('click', function() {
            $('#id').val('');
            $('#typeId').val('');
            $('#title').val('');
            $('#keyword').val('');
            $('#summary').val('');
            $('#content').val('');
            $('#author').val('');
            $('#readCount').val('');
            $('#commentCount').val('');
            $('#allowComment').val('');
            $('#isTop').val('');
            $('#isShow').val('');
            $('#deleteFlag').val('');
            $('#creator').val('');
            $('#createDate').val('');
            $('#modifier').val('');
            $('#modifyDate').val('');
            tableObj.ajax.url('article/posts/query?id=-1').load();
        });
        
        //修改按钮
        $('.div_right').on('click', '.dt-buttons>#btnUpdate',function() {
            var checkedBox = $("#tabMntArticle tbody tr td .checked");
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
            showModal(2, " ", [ '1000px', '500px' ], "article/posts/update_page/" + strId, tableObj);
        });
        
        //新增
        $('.div_right').on('click', '.dt-buttons>#btnAdd', function(){
            showModal(2, " ", ['1000px', '500px'], "article/posts/add_page", tableObj);
        });
        
        //删除按钮
        $('.div_right').on('click', '.dt-buttons>#btnDelete',function() {
            var checkedBox = $("#tabMntArticle tbody tr td .checked");
            comfirmDeleteData(tableObj, checkedBox, 'article/posts/delete/');
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
                "url" : "article/posts/query?id=-1"
            //    "async": false
            },
            "columns" : [ {
                "data" : "id"
            }, {
                "data" : "typeId"
            }, {
                "data" : "title"
            }, {
                "data" : "keyword"
            }, {
                "data" : "summary"
            }, {
                "data" : "content"
            }, {
                "data" : "author"
            }, {
                "data" : "readCount"
            }, {
                "data" : "commentCount"
            }, {
                "data" : "allowComment"
            }, {
                "data" : "isTop"
            }, {
                "data" : "isShow"
            }, {
                "data" : "deleteFlag"
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
                "targets": [14],
                "data": "createDate",
                "render": function (data, type, full) {
                    if(data == null || data == "") {
                        return "";
                    }
                    return new Date(data).format("yyyy-MM-dd hh:mm:ss");
                 }
            },
            {
                "targets": [16],
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