<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@include file="./printProxys.jsp"%>

<script type="text/javascript">

//删除生产单
function deleteProxys(){
	
	var rows = detailGird.datagrid("getSelections");
   	if(rows!=null && rows.length>0){
   		
   		   var proxyCodes="";
		   for(var i=0;i< rows.length;i++){
			   if(!rows[i].enabled){
				   $.messager.alert('提示',"单号为:"+rows[i].proxyCode+"的状态是'完成',不能删除!",'info');
				   return;
			   }
			   proxyCodes +="proxyCodes="+rows[i].proxyCode+"&";
		   }
		   proxyCodes = proxyCodes.substring(0,proxyCodes.length-1);
		   $.messager.confirm('操作','确定要删除吗?', function(r) {
			    if(r){				    	
				    $.ajax({
						type:"GET",
			            url: '<c:url value="/bus/proxyOrder/deleteEntry"/>',
			            data: proxyCodes,
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
   		$.messager.alert('提示',"请选择至少一个单据!",'info');
   	}
	
}
   
   
//完成生产单
function completeProxys(){
	
	var rows = detailGird.datagrid("getSelections");
   	if(rows!=null && rows.length>0){
   		
   		   var proxyCodes="";
		   for(var i=0;i< rows.length;i++){
			   if(!rows[i].enabled){
				   $.messager.alert('提示',"单号为:"+rows[i].proxyCode+"的状态已经是'完成'状态!",'info');
				   return;
			   }
			   proxyCodes +="proxyCodes="+rows[i].proxyCode+"&";
		   }
		   proxyCodes = proxyCodes.substring(0,proxyCodes.length-1);
		   $.messager.confirm('操作','确定要结单吗?', function(r) {
			    if(r){				    	
				    $.ajax({
						type:"GET",
			            url: '<c:url value="/bus/proxyOrder/completeProxys"/>',
			            data: proxyCodes,
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
   		$.messager.alert('提示',"请选择至少一个单据!",'info');
   	}
	
}

   
</script>
