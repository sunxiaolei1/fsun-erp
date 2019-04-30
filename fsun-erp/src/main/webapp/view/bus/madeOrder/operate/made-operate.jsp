<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@include file="./printMades.jsp"%>

<script type="text/javascript">

//删除生产单
function deleteMades(){
	
	var rows = detailGird.datagrid("getSelections");
   	if(rows!=null && rows.length>0){
   		
   		   var madeCodes="";
		   for(var i=0;i< rows.length;i++){
			   if(!rows[i].enabled){
				   $.messager.alert('提示',"单号为:"+rows[i].madeCode+"的生产单状态是'完成',不能删除!",'info');
				   return;
			   }
			   madeCodes +="madeCodes="+rows[i].madeCode+"&";
		   }
		   madeCodes = madeCodes.substring(0,madeCodes.length-1);
		   $.messager.confirm('操作','确定要删除吗?', function(r) {
			    if(r){				    	
				    $.ajax({
						type:"GET",
			            url: '<c:url value="/bus/madeOrder/deleteEntry"/>',
			            data: madeCodes,
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
   		$.messager.alert('提示',"请选择至少一个生产单!",'info');
   	}
	
}
   
   
//完成生产单
function completeMades(){
	
	var rows = detailGird.datagrid("getSelections");
   	if(rows!=null && rows.length>0){
   		
   		   var madeCodes="";
		   for(var i=0;i< rows.length;i++){
			   if(!rows[i].enabled){
				   $.messager.alert('提示',"单号为:"+rows[i].madeCode+"的生产单状态已经是'完成'状态!",'info');
				   return;
			   }
			   madeCodes +="madeCodes="+rows[i].madeCode+"&";
		   }
		   madeCodes = madeCodes.substring(0,madeCodes.length-1);
		   $.messager.confirm('操作','确定要结单吗?', function(r) {
			    if(r){				    	
				    $.ajax({
						type:"GET",
			            url: '<c:url value="/bus/madeOrder/completeMades"/>',
			            data: madeCodes,
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
