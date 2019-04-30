<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/view/base_resource.jsp"%>		
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>客户管理</title>
</head>
<body>	
	
	<table id="list-table" pageSize="20" pagination="true" idField="id" nowrap="false" data-options="nowrap:false"
		fit="true" rownumbers="true" fitColumns="true" singleSelect="true" >
		
	</table>
	
	<%@include file="operate/toolbar.jsp"%> 
	
	<%@include file="operate/customer.jsp"%> 
	
	<script>
	
		$(function() {

			var url = '<c:url value="/bus/customer/search"/>';
    		
			$('#list-table').datagrid({
				url: url,
				loadMsg:'加载中，请稍等。。。',
				columns:[[
							{field:'id',checkbox:true},
							{field:'code',sortable:true, title: '客户编号',width:"60"},
							{field:'type',sortable:true,  title: '客户类型',width:"100",formatter:function(value,row){
								var customerType = '非加工类';
								if(row.type!=null && row.type==1){
									customerType = '加工类';
								}
								return customerType;
							}},
							{field:'name',sortable:true,  title: '客户名称',width:"200"},
							{field:'contacts',sortable:true,title: '联系人',width:"100"},
							{field:'address',sortable:true,title: '地址',width:"200"},
							{field:'tel',sortable:true,title: '联系电话',width:"150"},
							{field:'fax',sortable:true,title: '传真',width:"100"},
							{field:'description',title: '描述',width:"100"}							
		            	]],
		        toolbar :"#toolbar", 
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