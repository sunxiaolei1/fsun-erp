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
</head>
<body>
	<div id="p" style="padding:10px;">
		<div id="plugin">
			<ul>
			    <li>
			       <span id="install_lodop32">install_lodop32.exe</span>
			       <br />
			       <br />
			       <a href="#" class="easyui-linkbutton" style="font-size: 18px" iconCls="icon-edit" plain="true" onclick="lodopDownload('install_lodop32');">
	               		<span style="color:#CC3399;">点击下载</span>
	               </a>
			    </li>
			    <br />
			    <li>
			       <span id="install_lodop64">install_lodop64.exe</span>
			       <br />
			       <br />
			       <a href="#" class="easyui-linkbutton" style="font-size: 18px" iconCls="icon-edit" plain="true" onclick="lodopDownload('install_lodop64');">
	               		<span style="color:#CC3399;">点击下载</span>
	               </a>
			    </li>
			    <br />
			    <li>
			       <span id="CLodop_Setup_for_Win32NT">CLodop_Setup_for_Win32NT.exe</span>
			       <br />
			       <br />
			       <a href="#" class="easyui-linkbutton" style="font-size: 18px" iconCls="icon-edit" plain="true" onclick="lodopDownload('CLodop_Setup_for_Win32NT');">
	               		<span style="color:#CC3399;">点击下载</span>
	               </a>
			    </li>
			</ul>
		</div>
	</div>
</body>
<script type="text/javascript">

    function lodopDownload(id){
		var fileName = document.getElementById(id).innerHTML;
		window.location.href = '<c:url value="/sys/plugin/lodopDownload?fileName='+ encodeURI(encodeURI(fileName)) +'"/>';
    }
</script>
</html>