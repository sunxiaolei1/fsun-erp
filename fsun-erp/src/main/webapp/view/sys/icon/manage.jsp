<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>图标管理</title>
<%@include file="/view/resource.jsp" %>
<script type="text/javascript">
/**
 * 创建上传窗口 公共方法
 * @param chunk 是否分割大文件
 * @param callBack 上传成功之后的回调
 */
function Uploader(chunk,callBack){
	var addWin = $('<div style="overflow: hidden;"/>');
	var upladoer = $('<iframe/>');
	upladoer.attr({'src':'<%=basePath%>view/sys/icon/uploader.jsp?chunk='+chunk,width:'100%',height:'100%',frameborder:'0',scrolling:'no'});
	addWin.window({
		title:"上传文件",
		height:350,
		width:550,
		minimizable:false,
		modal:true,
		collapsible:false,
		maximizable:false,
		resizable:false,
		content:upladoer,
		onClose:function(){
			var fw = GetFrameWindow(upladoer[0]);
			var files = fw.files;
			$(this).window('destroy');
			callBack.call(this,files);
		},
		onOpen:function(){
			var target = $(this);
			setTimeout(function(){
				var fw = GetFrameWindow(upladoer[0]);
				fw.target = target;
			},100);
		}
	});
}

/**
 * 根据iframe对象获取iframe的window对象
 * @param frame
 * @returns {Boolean}
 */
function GetFrameWindow(frame){
	return frame && typeof(frame)=='object' && frame.tagName == 'IFRAME' && frame.contentWindow;
}
 
function makerUpload(chunk){
 Uploader(chunk,function(files){
	 if(files && files.length>0){
		 listPic();
	 }
 });
}
</script>
<script>
	$(function(){
		$('#p').panel({background:'#fafafa',width:'1200',height:'500',title: '图标管理',tools: [<sec:authorize  ifAllGranted="ICON_ADD">{iconCls:'icon-add',handler:function(){makerUpload(false);}},</sec:authorize><sec:authorize  ifAllGranted="ICON_DELETE">{iconCls:'icon-delete',handler:function(){deletePic();}}</sec:authorize>]});
		listPic();
	});

	function listPic(){
		$.get('<c:url value="/sys/icon/list?t='+Math.random()+'"/>',"", function(result){
			var html = "<form method='post' id='picInfo'>";
			var data = eval('(' + result + ')');
			for(var picture in data){
				var src = '<%=basePath%>' + data[picture].path;
				var singlePic = "<div style='text-align:center;width:260px;height:250px;float:left'><input type='checkbox' name='filePath' value='"+ data[picture].path +"'/><img alt='"+data[picture].name+"' src='" + src +"'/></div>";
				html +=singlePic;
			}
			html += '</form>';
			$('#pictrue').html(html);
		
		});
	}
	
	function deletePic() {
		var checkedPic = $('input:checked');
		if (checkedPic.length > 0) {
		    var filePath = '';
			for ( var i = 0; i < checkedPic.length; i++) {
				filePath += checkedPic[i].defaultValue+',';
			}
			filePath = filePath.substring(0, filePath.length - 1);
			$.ajax({
                type: "post",
                dataType: "json",
                url: '<c:url value="/sys/icon/delete"/>',
                data: {"filePath":filePath},
                success: function(returnData) {
                	if (returnData.success){ 
                		$('input:checked').parent().remove();
                		$.messager.alert('提示', '删除照片成功', 'info');
					} else {  
						$.messager.alert('提示', '删除照片失败', 'info');
					} 
                }
            });
		} else {
			$.messager.alert('消息', '请选择要删除的数据!','info');
			return false;
		}
	}
</script>
</head>
<body>
	<div id="p" style="padding:10px;">
	<div id="pictrue"></div>
	</div>
</body>
</html>