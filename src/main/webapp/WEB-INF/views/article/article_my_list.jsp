<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html>
<html>
<head>
<title>运维文章</title>
<%@include file="../included/includedStyle.jsp" %>
</head>

<body>
    <div class="wrapper">
        <div class="row">
            <div class="col-md-12 col-sm-12">
                <div class="portlet light">
                    <div class="portlet-title">
                        <div class="caption">
        <!--                     <i class="fa fa-search"></i> -->
                            <span class="caption-subject font-blue-hoki bold uppercase">我的文章</span>
                        </div>
                    </div>
<!--                     <div class="pub-article"> -->
<!--                     </div> -->
                    <div class="portlet-body">
                        <span class="publish"><a href="article/add_page">发布新文章</a></span>
                        <table class="table table-striped table-bordered table-hover table-checkable order-column" id="myArticles" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>文章标题</th>
                                    <th>发布时间</th>
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


<%@include file="../included/includedJs.jsp" %>

<script>

    var tableObj;
    $(function() {
        
    	tableObj = $('#myArticles').DataTable(getConfig());
    	addTableNoCol(tableObj);
    	
    	
    });

    function getConfig() {
        return config = {
            "processing" : true,
            "pageLength" : 15,
            "lengthMenu" : [ [ 5, 10, 20, -1 ], [ 5, 10, 20, "All" ] ],
            "order" : [ [ 2, "asc" ] ],
            "serverSide" : false,
            "ajax" : {
               "url" : "article/my_articles/query"
            //    "async": false
            },
//             "columns" : [{
//                 "data" : "id"
//             }, {
//                 "data" : "title"
//             }, {
//                 "data" : "createDate"
//             }, {
//                 "data" : "id"
//             }],
            "columnDefs": [{
                "orderable" : false,
                "searchable" : false,
                "targets": [0],
                "data": "id",
            },{
                "targets": [1],
                "data": "title",
                "createdCell": function (td, cellData, rowData, row, col) {
                	$(td).html('<a href="article/full_content/' + rowData.id + '">' + cellData + '</a>');
                }
            },{
                "targets": [2],
                "data": "createDate",
                "render": function (data, type, full) {
                    if(data == null || data == "") {
                        return "";
                    }
                    return new Date(data).format("yyyy-MM-dd hh:mm:ss");
                 }
            },{
                "targets": [3],
                "data": "id",
                "render": function (data, type, full) {
                    return '<a href="javascript:;" style="padding-right: 3px" onclick="updateArticle(' + data + ')"><span class="label label-sm label-info"> 编辑 </span></a>&nbsp;' + 
                    '<a href="javascript:;" onclick="showHisRelDetail(' + data + ')"><span class="label label-sm label-success"> 置顶 </span></a> &nbsp;' + 
                    '<a href="javascript:;" onclick="deleteArticle(' + data + ')"><span class="label label-sm label-warning"> 删除 </span></a>';
                 }
            }],
            "sScrollX": "2000px",
            "dom" : '<"top"<"div_right">>rt<"bottom"ip><"clear">',
//             "rowCallback": function( row, data, displayIndex, displayIndexFull ) {
//             	id(data.title){
//             		$('td:eq(1)', row).html( '<b>A</b>' );
//             	}
//             },
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

    function deleteArticle(aId) {
    	$.ajax({
            url:"article/delete/" + aId,
            dataType: "json",
            async:false,
            success:function (data) {
                showMsg("删除成功！");
                tableObj.ajax.reload(null,false);
            },
            error:function() {
                showMsg("修改操作发生错误！");
            }
        });
    }
    
    function updateArticle(aId) {
    	window.location.href = "article/update_page/" + aId;
    }
</script>
</body>
</html>