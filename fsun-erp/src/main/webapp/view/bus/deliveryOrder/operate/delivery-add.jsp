<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/view/base_resource.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />	
<link type="text/css" rel="stylesheet" media="all" href="<c:url value='/css/common.v4.1.0.css' />" />
<link type="text/css" rel="stylesheet" media="all" href="<c:url value='/css/order.1.2.css' />" />
<script type="text/javascript" src="<c:url value='/js/jquery-easyui/jquery.edatagrid.js'/>"></script>
<link type="text/css" rel="stylesheet" media="all" href="<c:url value='/css/message_box.css' />" />
<script type="text/javascript" src="<c:url value='/js/commons/MessageBox.js'/>"></script>
<script type="text/javascript"  src="<c:url value='/view/bus/deliveryOrder/operate/delivery-add.js'/>"></script>
<script type="text/javascript"  src="<c:url value='/view/bus/order/operate/edit_product_common.js'/>"></script>
<script type="text/javascript">


$(function(){

	var $form = $("#orderfm");
	
	$('#deliveryType', $form).combobox({
		method:'get',
	    required: true,
	 	valueField: 'id',
	  	textField: 'value',
	  	url: '<c:url value="/json/deliveryType.json"/>',
	    panelHeight: 100
	});
	
	
	$("#customerCode",$form).combogrid({
		  panelWidth: 500,
	      panelHeight: 320,
	      idField: 'code',
	      textField: 'name',
	      url: '<c:url value="/bus/customer/search"/>',
	      queryParams: {enabled: true,q:'${customerCode}'},
	      multiple: false,
	      fitColumns: true,
	      striped: true,
	      editable: true,
	      pagination: true,
	      rownumbers: true,
	      collapsible: false,
	      pageNumber : parseInt('${pageNumber}')||1,
	      pageSize : parseInt('${pageSize}')||10,
	      method: 'post',
	      mode:'remote',
	      columns: [[
	        {field: "id", checkbox: true},
	        {field: "code", title: "客户编号", width: 40,align:'center'},
	        {field: "name", title: "客户名称", width: 140},
	        {field: "address", title: "地址", width: 140} 
	      ]],
	      onSelect:function(index, data){
	    	  $("input[name=address]",$form).val(data.address);
	    	  $("input[name=tel]",$form).val(data.tel);
	    	  $("input[name=contacts]",$form).val(data.contacts);
	    	  $("input[name=customerName]",$form).val(data.name);
	      },
	      loadMsg: "数据加载中请稍后……",
	      emptyMsg: "没有符合条件的记录"
	    });
	
	$.ajax({
		type: "post",
       	url:'<c:url value="/bus/deliveryOrder/getDetailsByIds" />',
       	dataType: "json",
       	data:{orderDetailIds:'${orderDetailIds}' },
       	success:function(rowData){
       		var orderCodes = new Array();
       		$.each(rowData,function(){
       			var row = this;		
       			row.deliveryCode = "${deliveryCode}";
       			addOrderCodes(orderCodes,row.orderCode);
       			addDetail(row);
       		});
       		
       		var headerData = {
       			deliveryType: 1,
       			orderCode:orderCodes,
       			deliveryDate:GetDateStr(0),
       			deliveryCode: '${deliveryCode}',
       			customerCode: '${customerCode}'
       		}
       		
       		$form.form("load", headerData);
       		$('#detailTable').edatagrid({
       			loadMsg:'加载中，请稍等。。。',
       			onClickRow:function(rowIndex, rowData){
       				$(this).datagrid('acceptChanges');
       				$(this).datagrid("unselectAll");
       				$(this).datagrid("beginEdit",rowIndex);
       				$(this).datagrid("selectRow",rowIndex);
       				setEditing($(this),rowIndex,"onePrice","number","allPrice");
       			}
       		}).datagrid("loadData",deliveryDetailDtos);
       	}
    });
       	
	
	$('#finishBtn').on('click',function(){
		
		if(!gridIsValidate("detailTable")){
			return;
	    }       
	    var $form = $("#orderfm");
	    
	    $('input[name=deliveryCode]', $form).attr("disabled",false);
	    $('input[name=orderCode]', $form).attr("disabled",false);
	    var deliveryHeaderDto = serializeObject($form);
	    deliveryHeaderDto.deliveryDate += " 00:00:00";
	    
	    $('#detailTable').datagrid("acceptChanges");
	    
	    var deliveryOrderDto = {
	   		"deliveryHeaderDto":deliveryHeaderDto,
	       	"deliveryDetailDtos":deliveryDetailDtos
	    };
	    
	    MessageBox.loading();
		$.ajax({
	        type: "post",
	        dataType: "json",
	        contentType:"application/json;charset=utf-8",
	        async:false,
	        url: '<c:url value="/bus/deliveryOrder/saveEntry"/>',
	        data: JSON.stringify(deliveryOrderDto),
	        success: function(result) {
	        	MessageBox.closeLoading();     
	        	if(result.success){
	        		window.parent.toAddMadeListPage('${deliveryCode}'); 	
	        	}else{
	        		MessageBox.error("保存失败!");                  	
	        	}    			                				                															                	
	        }
	    });  
		
	});
  	
	 $('#cancelBtn').click(function(){
		 window.parent.toAddMadeListPage('${deliveryCode}');
	 });

});


</script>
</head>
<body>
	<div class="content" style='font-family:"微软雅黑";height:92%'>
		<div class="left" style="margin-left:5px;">
			<input id="cancelBtn" type="button" value="取消" class="corres-gray-btn"/>
		</div>
		<div class="right" style="margin-right:10px;">
			<input type="button" class="blue-btn" id="finishBtn" value="生成送货单" />
		</div>
		<h3 class="title" style="margin-top:4px;">新增送货明细</h3>
		<div class="step-wrap" style="width:99%;">
			<div class="step-content display" style="padding: 15px 0 0 0;"> 
				<form id="orderfm" name="orderfm" method="post" >						
					<input id="customerName" name="customerName" hidden=true />		
					<ul>												
						<li class="tr2">送货单号：</li>
						<li class="tl11" >&nbsp; <input name="deliveryCode" disabled=true style="width:180px;" /></li>				
						<li class="tr2">客户名称：</li>
						<li class="tl11" >&nbsp; <input id="customerCode" name="customerCode" type=text style="width:180px;" /></li>
						<li class="tr2">单据类型：</li>
						<li class="tl11" >&nbsp; <input type="text" editable="false" style="width:180px;" 
							 name="deliveryType" id="deliveryType" /></li>
						
 						<li class="tr2">地址：</li>
						<li class="tl11" >&nbsp; <input name="address" type="text" style="width:180px;" /></li>			
 						<li class="tr2">联系方式：</li>
						<li class="tl11" >&nbsp; <input name="tel" type="text" style="width:180px;" /></li>	
						<li class="tr2">联系人：</li>
						<li class="tl11" >&nbsp; <input name="contacts" type="text" style="width:180px;" /></li>
						
						<li class="tr2">发货日期：</li>
						<li class="tl11" >&nbsp; <input name="deliveryDate" class="easyui-datebox" editable="false" 
							type="text" style="width:180px;" /></li>
						<li class="tr2">合同号：</li>
						<li class="tl11" >&nbsp; <input name="contract" type="text" style="width:180px;" /></li>					
						<li class="tr2">快件单号：</li>
						<li class="tl11" >&nbsp; <input name="express" type="text" style="width:180px;" /></li>
						
						
 						
 						<li class="tr2">备注：</li>
						<li class="tl11" >&nbsp; <input name="description" type=text style="width:180px;" /></li>
						<li class="tr2">订单编号：</li>
						<li class="tl12" >&nbsp; <input name="orderCode" disabled=true style="width:520px;" /></li>						
			 					    
					</ul>
				</form>						
				<div class="clear"></div>
				<div style="width:98%;height:70%;margin-left:10px;margin-right:10px;">
					<table id="detailTable"  toolbar="#detailToolbar" pagination="false"  fit="true" nowrap="false" 
						style="display:none;" fitColumns="true" data-options="rownumbers:true,singleSelect:false">
						<thead>
							<tr>						
								<th field="deliveryCode" hidden="true" >送货单号</th>									
								<th field="productCode" width="40" >产品编号</th>
								<th field="productName" width="100" formatter="contentWrap" >产品名称</th>						
								<th field="style" width="60" >款号</th>	
								<th field="orderCode" width="120" >订单号</th>							
								<th field="number" width="40" editor="{type:'numberbox',options:{required:true}}">数量</th>											
								<th field="unit" width="30" >单位</th>
								<th field="onePrice" width="30" editor="{type:'numberbox',options:{min:'0',precision:'2'}}">单价</th>
								<th field="allPrice" width="40" editor="{type:'numberbox',options:{min:'0',precision:'2'}}">总价</th>
								<th field="description" width="140" formatter="contentWrap" editor="{type:'text'}">备注</th>							
							</tr>
						</thead>	
					</table>
				 </div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
	
	<div id="detailToolbar" style="display:none">	
		 <a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-save" plain="true"  onclick="saveEdits($('#detailTable'))">保存</a>
		 <a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-undo" plain="true"  onclick="cancelEdits($('#detailTable'))">取消</a>
		 <a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-delete" plain="true"  onclick="delEdits($('#packageTable'),$('#orderfm'))">删除</a>	
		 <a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-add" plain="true"  onclick="openOrderWin()">新增</a>			
		 <a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-redo" plain="true"  onclick="openDetailTackWin()">追加</a>			
	</div>
	
	<%@include file="./order-reSelect.jsp" %>
	
	<%@include file="./detail-tack.jsp" %>
	
</body>
</html>