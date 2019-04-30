<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="openDetailTackWin" class="easyui-window" shadow= "false" title="&nbsp;" closed="true" align="center" style="display:none;width:800px;height:500px;top:10px;" modal="true">
	<iframe frameborder="0" width="100%" height="100%"></iframe>
</div> 

<script type="text/javascript">

    var detailTackWin;
    $(function(){
    	detailTackWin = $('#openDetailTackWin');
    	detailTackWin.window({
			 onBeforeClose:function(){ 
				 detailTackWin.find('iframe').removeAttr("src");		
	      	 }
		});

    	detailTackWin.show();
		
	});
	
	//展示订单明细
	function openDetailTackWin(param){	         			
		detailTackWin.find('iframe').attr('src','<c:url value="/bus/deliveryOrder/detail/tack-${deliveryCode}"/>');
		detailTackWin.window("open");		
	}
 
	function closeDetailTackWin(){
		detailTackWin.window("close");	
	}
	
	/**
	 * 获取当前送货单头部信息
	 **/
	function getCurrDeliveryInfo(){
	    var deliveryHeaderDto = serializeObject($("#orderfm"));
	    return deliveryHeaderDto;
	}
	
	/**
	 * 添加追加明细
	 **/
	function addTackInfo(tackInfos){
		if(tackInfos!=null && tackInfos.length>0){
			addDeliveryDetailDtos(tackInfos);
		}	
	}
	
</script>