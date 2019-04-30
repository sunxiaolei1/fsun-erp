<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/view/base_resource.jsp"%>		
<script type="text/javascript" src="<c:url value='/js/jquery-easyui/datagrid-detailview.js'/>"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>订单列表</title>

</head>
<body>
	
	<table id="order-table"  data-options="nowrap:false" pagination="true" idField="id" fit="true" rownumbers="true"
		fitColumns="false" singleSelect="false" ctrlSelect="false">           
    </table>

	<div id="order-toolbar"  style="padding:2px;display:none;" >
		 <span style="float:right;margin-top:2px;">	
		 	<label>订单号：</label>
			<input id="order-orderCodeText" style="width:180px"  />  
			<label>产品:</label>
			<input id="productCodeComb" class="easyui-combobox" style="width:120px" />        
			<input type="button" id="searchBtn" class="search-btn" value="搜索" onMouseOver="this.className='on-search-btn'" onMouseOut="this.className='search-btn'" onfocus="this.blur()" onclick="javascript:orderQuery()"/>
			<input type="button" id="resetBtn" class="reset-btn" value="重置" onMouseOver="this.className='on-reset-btn'" onMouseOut="this.className='reset-btn'" onfocus="this.blur()" onclick="javascript:resetSearch()" />		           		
	     </span>
	     
		 <a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-save" plain="true" onclick="javascript:getOrderDetails()">确定</a>	 
	</div>
	<script type="text/javascript">
		
		var lastExpandRowIndex = '';
		
		var iconChange = function(value,row,index){
			
			if(row.icon==null||row.icon==""){
				return '<img class="item-img" onerror="this.style.display='+"'none'"+'"/>';
			}
			var imageFile = '<c:url value="/uploads/product"/>'+ row.icon;
			return '<img class="item-img" src="'+imageFile+'" style="height:29px;with:40px;" onerror="this.style.display='+"'none'"+'"/>';
			//var img = document.getElementById('imgid')[0].src;
		}
		
		$(function(){
			
			initToolBar();
        	
        	//页面加载时，初始化物料datagrid
        	initOrderGrid();
		});
	
	    function initToolBar(){ 
	    	
	    	$("#productCodeComb").combogrid({
    		  panelWidth: 440,
    	      panelHeight: 320,
    	      idField: 'code',
    	      textField: 'name',
    	      url: '<c:url value="/bus/product/search"/>',
    	      queryParams: {enabled: true},
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
    	        {field: "code", title: "产品编号", width: 40,align:'center'},
    	        {field: "name", title: "产品名称", width: 140},
    	        {field: "icon", title: "图片", width: 80, formatter: iconChange} 
    	      ]],
    	      loadMsg: "数据加载中请稍后……",
    	      emptyMsg: "没有符合条件的记录"
    	    });
	    	
	    	var comboList = $("#productCodeComb").next('.combo');
	    	if(typeof(comboList) != "undefined"){
	    		$(comboList[0]).css("margin-top",'-6px');
	    	}
		    	
	 		$("#toolbar").show(); 
	    }
		
		function initOrderGrid(){
			
			$('#order-table').datagrid({
				queryParams:{"status":"已下单"},
				pageNumber: parseInt('${pageNumber}')||1,
				pageSize: parseInt('${pageSize}')||10,
				url:'<c:url value="/bus/order/search"/>',
				loadMsg:'加载中，请稍等。。。',
				columns:[[
							{field:'id',hidden:true},
							//{field:'id',checkbox:true},
							{field:'code',title: '订单编号',width:"100"},
							{field:'orderType', title: '订单类型',width:"60"},
							{field:'customerName',sortable:"true", title: '客户名称',width:"200",formatter:contentWrap},
							{field:'receiveTime',sortable:"true",title: '交货时间',width:"80"},
							{field:'strip',title: '款数',width:"30",formatter:function(value,rec){return value!=null?value:0}},
							{field:'status',title: '订单状态',width:"60"},							
							//{field:'createTime',title: '制单时间',width:"80"},
							{field:'merchandTime',title: '下单时间',width:"80"},
							{field:'description',title: '备注',width:"240",formatter:contentWrap},	
							//{field:'createManName',title: '制单人',width:"70"}		
		            	]],
	           	toolbar:"#order-toolbar",	
	            onBeforeLoad: function(param){				   		 				   
		        	$(this).datagrid('clearSelections');             		 
        		}, 
        		onLoadSuccess:function(data){		       			
       				if(data.rows.length>0){         				 	
           				//调整行号的宽度
        	        	$(this).datagrid("fixRownumber");       	        	  					    						     			
           			}       					  					     			        			
        		},
        		view: detailview,
        		detailFormatter:function(index,row){  
 		            return '<div id="detailForm-'+index+'"></div>';  
 		        }, 
 		        onExpandRow: function(index,row){ 
 	 		        if(lastExpandRowIndex!=index){
 	 		        	$(this).datagrid('collapseRow', lastExpandRowIndex);
 	 	 		    }		        	
 		        	
    				if(!hasExpand(row.id)){
    					$('#detailForm-'+index).panel({  
     		                doSize:true,  
     		                border:false,  
     		                cache:false,  
     		               	href:'<c:url value="/bus/madeOrder/order-detail-'+ index +'-'+ row.id +'"/>',
     		                onLoad:function(){
     		                    $('#order-table').datagrid('selectRow',index);
     		                    $('#order-table').datagrid('fixDetailRowHeight',index);
     		                }  
     		            });
    				}
    				//$(this).datagrid("unselectAll");
    				//$(this).datagrid("selectRecord",row.id);
 		            $('#order-table').datagrid('fixDetailRowHeight',index);
 		            lastExpandRowIndex = index;
 		        }
	        });  
		}
		
		//清空查询BasCodes条件
		function resetSearch() {	   
	        $("#order-orderCodeText").val("");
	        $('#productCodeComb').combobox('clear');
	        var queryParams =  $("#order-table").datagrid("options").queryParams; 
	        queryParams.code = "";
	        queryParams.productCode = "";
	        $("#order-table").datagrid("reload");
	    }
	    
		//根据条件查询BasCodes
		function orderQuery() {
			var orderCode = $("#order-orderCodeText").val();
			var productCode =  $('#productCodeComb').combobox('getValue');
	        var queryParams =  $("#order-table").datagrid("options").queryParams;
	        queryParams.code = orderCode;
	        queryParams.productCode = productCode;
	        $("#order-table").datagrid("reload");
	    }
		
		//展开过的订单id
		var expandedOrderIds = new Array();
		
		//判别该订单是否展开过
		function hasExpand(orderId){			
			for(var i=0; i<expandedOrderIds.length; i++){
				if(expandedOrderIds[i]==orderId){					
					return true;
				}
			}
			expandedOrderIds.push(orderId);
			return false;
		}
		
		//订单明细id添加和删除
		var orderDetails = new Array();
		function addSelectedDetail(detailRow){
			orderDetails.push(detailRow);	
		}
		
		function delUnSelectedDetail(detailRow){
			for(var i=0; i<orderDetails.length; i++){
				if(orderDetails[i].id==detailRow.id){
					orderDetails.splice(i,1);
					break;
				}
			}
		}
		
		//提交明细并返回生产单界面
		function getOrderDetails(){
			if(orderDetails.length>0){
				window.parent.closeOrderWin();
				$.each(orderDetails,function(){
					this.madeCode = "${madeCode}";
				});
				window.parent.addMadePackages(orderDetails);
			}else{
				$.messager.alert('提示',"请选择至少一个订单产品明细!",'info');
			}
			
		}
		
	</script>
	
</body>
</html>