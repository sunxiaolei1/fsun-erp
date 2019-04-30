<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="searchbar"  style="padding:2px;display:none;" >	
	<sec:authorize  ifAllGranted="ORDER_REFRESH">
		<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-reload" plain="true"	onclick="javascript:$('#list-table').datagrid('reload')">刷新</a>
	</sec:authorize>
	<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-redo" plain="true"	onclick="javascript:window.parent.toAddMadeListPage('${deliveryCode}')">返回</a>
</div>

<script type="text/javascript">


$(function() {

	$("#searchbar").show();

});
</script>