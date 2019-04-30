<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="<c:url value='/js/jquery-easyui/jquery.role_edatagrid.js'/>"></script>

<div style="height:305px;" >
	<table id="list-detial-table-${currIndex}" nowrap="false" 
		pagination="false" idField="id" fit="true" rownumbers="true" fitColumns="true" singleSelect="false" >
	</table>
</div>
	
<script>
	 	
	 $(function() {

		 var detailGird = $('#list-detial-table-${currIndex}');
		
		detailGird.datagrid({
			loadMsg:'加载中，请稍等。。。',
			url:'<c:url value="/bus/orderDetail/search?orderId=${orderId}"/>',
			onBeforeLoad: function(param){				   		 				   
	        	$(this).datagrid('clearSelections');             		 
    		},
    		columns: [
    		    [{   
       				field:'id', checkbox:true
   				 },{   
        			field:'orderCode', hidden:true
    			 },{   
   					field:'orderId',title:'订单ID', hidden:true
   				 },{   
   	   				field:'productCode', title:'产品编号', width:50
   				 },{   
    	   			field:'productName', title:'产品名称', width:100,  formatter:contentWrap
       		     },{   
   	   				field:'style', title:'款号', width:60 
   				 },{   
   	   				field:'number', title:'数量', width:50 
   				 },{   
   	   				field:'realNumber', title:'实际数量', width:50
   				 },{   
   	   				field:'unit', title:'单位', width:50
   				 },{   
   	   				field:'description', title:'备注', formatter:contentWrap, width:100
   				 }]        
			],
			onSelect: function(rowIndex, rowData){
				addSelectedDetail(rowData);
			},onUnselect: function(rowIndex, rowData){			
				delUnSelectedDetail(rowData);
			},onSelectAll: function(rows){	
				$.each(rows, function() {
					addSelectedDetail(this);
				});	
			},onUnselectAll: function(rows){			
				$.each(rows, function() {
					delUnSelectedDetail(this);
				});	
			}
		});	

	});

</script>