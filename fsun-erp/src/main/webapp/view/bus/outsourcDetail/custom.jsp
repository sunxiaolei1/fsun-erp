<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>

<%@include file="/view/resource.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>

<title>Plupload - Custom example</title>

<!-- production -->
<script type="text/javascript" src="<c:url value='/js/plupload2.1.2/plupload.full.min.js'/>"></script>
</head>
<body style="font: 13px Verdana; background: #eee; color: #333">

<h1>图片上传界面</h1>

<div id="filelist">您的浏览器不支持 Flash, Silverlight 或者  HTML5</div>
<br />

<div id="container">
    <a id="pickfiles" href="javascript:;">[选择图片]</a> 
    <a id="uploadfiles" href="javascript:;">[上传]</a>
</div>

<br />
<pre id="console"></pre>


<script type="text/javascript">
	var files = [];
    var errors = [];
	var uploader = new plupload.Uploader({
		runtimes : 'html5,flash,silverlight,html4',
		browse_button : 'pickfiles', // you can pass in id...
		container: document.getElementById('container'), // ... or DOM Element itself
		url : "<c:url value='/bus/outsourcDetail/upload'/>?outSideId=${param.outSideId}",
		flash_swf_url : "<c:url value='/js/plupload2.1.2/Moxie.swf'/>",
		//flash_swf_url : "<c:url value='/js/plupload/plupload.flash.swf'/>",
		silverlight_xap_url : "<c:url value='/js/plupload2.1.2/Moxie.xap'/>",
		
		filters : {
			max_file_size : '5mb',
			prevent_duplicates : true, //不允许选取重复文件
			mime_types: [
				{title : "Image files", extensions : "jpeg,bmp,png,jpg,gif"},
			]
		},
	
		init: {
			PostInit: function() {
				document.getElementById('filelist').innerHTML = '';
	
				document.getElementById('uploadfiles').onclick = function() {
					uploader.start();
					return false;
				};
			},
	
			FilesAdded: function(up, files) {
				plupload.each(files, function(file) {
					document.getElementById('filelist').innerHTML += '<div id="' + file.id + '">' + file.name + ' (' + plupload.formatSize(file.size) + ') <b></b></div>';
				});
			},
	
			UploadProgress: function(up, file) {
				document.getElementById(file.id).getElementsByTagName('b')[0].innerHTML = '<span>' + file.percent + "%</span>";
			},
	
			Error: function(up, err) {
				document.getElementById('console').innerHTML += "\nError #" + err.code + ": " + err.message;
			},
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
				$.messager.alert('提示', "上传完成！共"+fs.length+"个。成功"+files.length+e, 'info', function(){target.window("close");});	
			}
		}
	});
	
	uploader.init();

</script>
</body>
</html>
