<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@include file="./printDeliverys.jsp"%>

<script type="text/javascript">

//删除生产单
function deleteDeliverys(){
	
	var rows = detailGird.datagrid("getSelections");
   	if(rows!=null && rows.length>0){
   		
   		   var deliveryCodes="";
		   for(var i=0;i< rows.length;i++){
			   if(rows[i].received){
				   $.messager.alert('提示',"单号为:"+rows[i].deliveryCode+"的单据状态是'已收货',不能删除!",'info');
				   return;
			   }
			   deliveryCodes +="deliveryCodes="+rows[i].deliveryCode+"&";
		   }
		   deliveryCodes = deliveryCodes.substring(0,deliveryCodes.length-1);
		   $.messager.confirm('操作','确定要删除吗?', function(r) {
			    if(r){				    	
				    $.ajax({
						type:"GET",
			            url: '<c:url value="/bus/deliveryOrder/deleteEntry"/>',
			            data: deliveryCodes,
			            async:true,
			            dataType: "json",
			            success: function(result){
			            	if(result.success){
			            		flushDataGrid();
		    	        	}else{
		    	        		$.messager.alert('提示',"删除失败!",'info');                	
		    	        	} 	
			            }
		 		  });  
			    } 
			});
   		
   	}else{
   		$.messager.alert('提示',"请选择至少一个送货单!",'info');
   	}
	
}
   
   
//确认收货
function received(){
	
	var rows = detailGird.datagrid("getSelections");
   	if(rows!=null && rows.length>0){
   		
   		   var deliveryCodes="";
		   for(var i=0;i< rows.length;i++){
			   if(rows[i].received){
				   $.messager.alert('提示',"单号为:"+rows[i].deliveryCode+"的单据状态是'已收货'!",'info');
				   return;
			   }
			   deliveryCodes +="deliveryCodes="+rows[i].deliveryCode+"&";
		   }
		   deliveryCodes = deliveryCodes.substring(0,deliveryCodes.length-1);
		   $.messager.confirm('操作','确定要结单吗?', function(r) {
			    if(r){				    	
				    $.ajax({
						type:"GET",
			            url: '<c:url value="/bus/deliveryOrder/received"/>',
			            data: deliveryCodes,
			            async:true,
			            dataType: "json",
			            success: function(result){
			            	if(result.success){
			            		flushDataGrid();
		    	        	}else{
		    	        		$.messager.alert('提示',"结单失败!",'info');                	
		    	        	} 	
			            }
		 		  });  
			    } 
			});
   		
   	}else{
   		$.messager.alert('提示',"请选择至少一个生产单!",'info');
   	}
	
}

   
</script>
