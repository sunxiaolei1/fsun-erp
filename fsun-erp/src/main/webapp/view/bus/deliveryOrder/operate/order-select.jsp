<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="openOrderWin" class="easyui-window" shadow= "false" title="可选订单列表" closed="true" align="center" style="display:none;width:960px;height:500px;top:10px;" modal="true">
	<iframe frameborder="0" width="100%" height="100%"></iframe>
</div> 

<script type="text/javascript">
	var madeTypeJson ='';

    $(function(){
    	
    	$('#openOrderWin').window({
			 onBeforeClose:function(){ 
			      $("#openOrderWin").find('iframe').removeAttr("src");		
	      	 }
		});

		$('#openOrderWin').show();
		
	});
	
	//展示订单明细
	function openOrderWin(param){	         			
		$("#openOrderWin").find('iframe').attr('src','<c:url value="/bus/deliveryOrder/orderList"/>');
		$("#openOrderWin").window("open");		
	}
 
	function closeOrderWin(){
		$("#openOrderWin").window("close");	
	}
	
</script>