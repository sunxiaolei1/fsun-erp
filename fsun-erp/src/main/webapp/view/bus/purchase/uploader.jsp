<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>文件导入</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/js/jquery-easyui/themes/default/easyui.css'/>" />
    <link rel="stylesheet" href="<c:url value='/js/plupload/queue/css/jquery.plupload.queue.css'/>" type="text/css"></link>

    <script type="text/javascript" src="<c:url value='/js/jquery-easyui/jquery-1.8.0.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/js/jquery-easyui/jquery.easyui.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/plupload/plupload.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/plupload/plupload.html4.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/plupload/plupload.html5.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/plupload/plupload.flash.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/plupload/zh_CN2.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/js/plupload/queue/jquery.plupload.queue.js'/>"></script>
  </head>
  <body style="padding: 0;margin: 0;">
    <div id="uploader">&nbsp;</div>
<script type="text/javascript">
var files = [];
var errors = [];
var type = 'file';
var chunk = eval('${param.chunk}');
var max_file_size = '5mb';
var filters = {title : "Excel files", extensions : "xls"};
$("#uploader").pluploadQueue($.extend({
	runtimes : 'flash,html4,html5',
	url : "<c:url value='/bus/vmuser/excelImport'/>?parentNodeId=${param.parentNodeId}",
	max_file_size : max_file_size,
	file_data_name:'file',
	unique_names:true,
	filters : [filters],
	flash_swf_url : "<c:url value='/js/plupload/plupload.flash.swf'/>",
	init:{
		FileUploaded:function(uploader,file,response){
			if(response.response){	
				var rs = $.parseJSON(response.response);
				if(rs.status){
					files.push(file.name);
				}else{
					errors.push(file.name);
				}
			}
		},
		UploadComplete:function(uploader,fs){
			var e= errors.length ? ",失败"+errors.length+"个("+errors.join("、")+")。" : "。";
			$.messager.alert('提示', "导入完成！共"+fs.length+"个。成功"+files.length+e, 'info', function(){target.window("close");});
		}
	}
	},(chunk ? {chunk_size:'2mb'} : {chunk_size:'2mb'})));
</script>
  </body>
</html>
