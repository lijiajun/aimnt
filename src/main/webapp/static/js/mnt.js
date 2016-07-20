
$("#page-content-frame").load(function(){
//	var mainheight = $(this).contents().find("body").height()+30;
//	$(this).height(mainheight);
	//iframeHeight();
}); 


//高度自适应
var iHeight = 0;
var iframeHeight = function() {
	var mainheight = $("#page-content-frame").contents().find("body").height()+130;
	if(iHeight != mainheight) {
		$("#page-content-frame").height(mainheight);
	}
    //setTimeout(iframeHeight, 200);
};
//iframeHeight();


//主题修改
$('.theme-colors').click(function() {
	var color_ = $(this).attr("data-style");
	$('#style_color').attr("href", 'static/css/themes/' + color_ + ".min.css");
});


var menuHtml = "";

function getMenuHtml() {
	$.ajax({
        url:"menu?_ver=" + new Date(),
        dataType: "json",
        cache: false,
        async:false,
        success:function (data) {
//        	console.log(data);
        	createMenu(data);
        },
		error:function() {
			alert("获取菜单错误！");
		}
    });
}

/**
 * build menu tree
 * @param data ： menu json
 */
function createMenu(data) {
	
//	console.log(menuHtml);
	
	for(var index in data) {
		
		menuHtml += "<li class='nav-item'>";
		
		var isEmptyUrl = isEmptyResUrl(data[index].resUrl);
		
		var menuUrl = isEmptyUrl ? "javascript:;" : data[index].resUrl;
		var toggle  = data[index].sysResourceList.length != 0  ? "nav-toggle" : "";
		menuHtml += "<a href='" + menuUrl + "' class='nav-link " + toggle + "' id='menu_" + data[index].resId + "'>";
		
		menuHtml += "<i class=" + data[index].resIcon + "></i>";
		
		menuHtml += "<span class='title'> " + data[index].resName + "</span>";
		
		if(data[index].sysResourceList.length != 0) {
			menuHtml += "<span class='arrow'></span>";
		} else if(isEmptyUrl) {
			menuHtml += "<span class='arrow'></span>";
		}
		menuHtml += "</a>";
		
		createSubMenu(data[index]);
		
		menuHtml += "</li>";
	}
//	console.log(menuHtml);
}


function createSubMenu(data) {
	var subList = data.sysResourceList;
	menuHtml += "<ul class='sub-menu'>";
	for(var index in subList) {
		
		var isEmptyUrl = isEmptyResUrl(subList[index].resUrl);
		var menuUrl = isEmptyUrl ? "javascript:;" : subList[index].resUrl;
		var toggle  = subList[index].sysResourceList.length != 0 ? "nav-toggle" : "";
		
		menuHtml += "<li class='nav-item'>";
		menuHtml += "<a href='" + menuUrl + "' class='nav-link " + toggle + "' id='menu_" + subList[index].resId + "'>";
		menuHtml += "<span class='title'> " + subList[index].resName + "</span>";
		
		if(subList[index].sysResourceList.length != 0) {
			menuHtml += "<span class='arrow'></span>";
		}
		
		menuHtml += "</a>";
		
		if(subList[index].sysResourceList.length != 0) {
			createSubMenu(subList[index]);
		}else {
			createMenu(subList[index].sysResourceList);
		}
		menuHtml += "</li>";
	}
	menuHtml += "</ul>";
	
}

function isEmptyResUrl(resURL) {
	return resURL == null || resURL == "";
}

function genMenu() {
	getMenuHtml();
	$(".heading2").after(menuHtml);
}

function showModal(_type, _title, _area, _content) {
    layer.open({
        type: _type,
        title: _title,
        area: _area,
        shadeClose: false, //点击遮罩关闭
        shade: 0.8,
        //shift: 1,
        maxmin: true, //开启最大化最小化按钮
        scrollbar: false,
        //content: '\<\div style="padding:20px;">自定义内容\<\/div>'
        content: _content,
        cancel : function(index, layero){
            return true;
        }
    });
}

function showFullModal(_type, _title, _area, _content, isFull) {
    var index = layer.open({
        type: _type,
        title: _title,
        area: _area,
        shadeClose: false,
        shade: 0.8,
        maxmin: true,
        scrollbar: false,
        content: _content,
    });
    if(isFull) {
        layer.full(index);
    }
}


function showMsg(_content) {
	layer.alert(_content, {
		  skin: 'layui-layer-molv' //样式类名
		  ,closeBtn: 0
	});
}

function showConfirm(_content, _callBack) {
	layer.confirm(_content, {
		btn: ['是','否'] //按钮
	}, function(index){
//		reloadData();
		console.log(_callBack);
		console.log(typeof(_callBack));
		if(typeof(_callBack) === "function") {
			_callBack();
		}
		layer.close(index);
	}, function(index){
		reloadData();
		layer.closeAll();
	});
}

function showComfirmDelData(_table, _checkedBox, _url) {
	layer.confirm('确认删除选择数据？', {
		btn: ['是','否'] //按钮
	}, function(index){
//		var _frame=document.frames('page-content-frame');
		$("#page-content-frame")[0].contentWindow.deleteData(_table, _checkedBox, _url);
		layer.close(index);
	}, function(index){
		layer.closeAll();
	});
}


var _tableObj;
function showLayer(_type, _title, _area, _content, _tableObj, isFull) {
	tableObj = _tableObj;
	var index = layer.open({
        type: _type,
        title: _title,
        area: _area,
        shadeClose: false, //点击遮罩关闭
        shade: 0.8,
        //shift: 1,
        maxmin: true, //开启最大化最小化按钮
        scrollbar: false,
        content: _content,
        //btn: [''],
//        yes: function(index, layero){
//            //layer.close(index); //如果设定了yes回调，需进行手工关闭
//        },
//        cancel: function(index, layero){
//            return true;
//        },
//        end: function(index, layero){
//            return true;
//        },
    });
    if(isFull) {
        layer.full(index);
    }
}

function reloadData() {
	tableObj.ajax.reload(null,false);
}


jQuery(document).ready(function() {    
	
	genMenu();
	
	javascript:window.history.forward(1);
	
    if ('WebSocket' in window) {
        sock = new WebSocket("ws://localhost:8080/aimnt/my_task");
        console.log('WebSocket');
    }else if ('MozWebSocket' in window) {
        sock = new MozWebSocket("ws://localhost:8080/aimnt/my_task");
        console.log('MozWebSocket');
    }else {
        sock = new SockJS("http://localhost:8080/aimnt/my_task");
        console.log('SockJS');
    }
    
    sock.onopen = function() {
        console.log('open');
    };
    sock.onmessage = function(e) {
        console.log('message', e.data);
        $('.task-count').html(e.data);
        playSound();
    };
    sock.onerror = function() {
        console.log('onerror');
    };
    sock.onclose = function() {
        console.log('close');
    };

    //sock.send('test');
    //sock.close();
    
    var audio;
    var playSound = function() {
        if (audio == null) {
            audio = new Audio('static/sounds/notify.mp3');
        }
        audio.play();
    };
    
    
    var content = $('.page-content');
    var content_bar = $('.page-bar');
    var content_body = $('.page-content-body');
    var available_height = (content.outerHeight() - content_bar.outerHeight() - 10);
    content_body.attr('style', 'min-height:' + available_height + 'px');
    $("#page-content-frame").height(available_height);
});
