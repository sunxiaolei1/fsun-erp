<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>		
<%@include file="/view/base_resource.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>库存信息管理</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/gh-buttons.css'/>" />
<script type="text/javascript"
	src="<c:url value='/js/jquery-easyui/jquery.edatagrid.js'/>"></script>
</head>
<body>	
		
	<table id="list-table" pageSize="10" pagination="true" idField="id" nowrap="false"
		fit="true" rownumbers="true" fitColumns="false" singleSelect="false" >
		
	</table>
	
	<%@include file="operate/toolbar.jsp"%> 

	<%@include file="operate/stock.jsp"%> 
	
	<script>
	    var detail = function(value,row,index){
		     return '<div>'+		                
		     			'<sec:authorize  ifAllGranted="STOCK_EDIT"><a class="button danger icon edit" onclick="editStock(\''+row.id+'\');">编辑</a></sec:authorize>'+
		     			'<sec:authorize  ifAllGranted="STOCK_DELETE"><a class="button danger icon trash" onclick="delOneStock(\''+row.id+'\',\''+row.artNum+'\');">删除</a></sec:authorize>'+
			     	'</div>';
		} 
	
		$(function() {
    		
			$('#list-table').datagrid({
				url: '<c:url value="/bus/stock/search"/>?id=${stockId}',
				loadMsg:'加载中，请稍等。。。',
				columns:[[
							{field:'id',checkbox:true},
							{field:'name',sortable:true, title: '货物名称',width:"150"},							
							{field:'artNum',sortable:true,title: '货号',width:"150"},
							{field:'storeName',sortable:true,title: '所属仓库',width:"100"},
							{field:'rackNum',sortable:true,title: '机架号',width:"100"}, 
							{field:'operate',title: '操作',width:"200",editor:{type:'linkbutton'},formatter:detail},
							{field:'description',title: '备注',width:"300"}											
		            	]],
		        toolbar:"#toolbar", 
	            onBeforeLoad: function(param){
				   $('#list-table').datagrid('clearSelections');	    
				},
				onLoadSuccess : function () {
	        		$(this).datagrid("fixRownumber");
	        	}
			});				
			
		});

	</script>
</body>
</html>