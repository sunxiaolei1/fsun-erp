<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/view/base_resource.jsp" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>生产单管理</title>
<link rel="stylesheet" href="<c:url value='/css/style.css'/>"  media="all" />
<script type="text/javascript"  src="<c:url value='/js/commons/LodopFuncs.js'/>"></script>
</head>
<body>
	<div class="easyui-layout" fit="true" id='bt_order_layout'>
		<%@include file="operate/searchbar.jsp"%>
		<div region="center" border="false">
			<table id="list-table" toolbar="#toolbar"
				pagination="true" idField="id" fit="true" rownumbers="true" pageSize="20"
				fitColumns="false" singleSelect="false" ctrlSelect="false" nowrap="false">
				
			</table>
		</div>
	</div> 	
	
	<div id="mm" class="easyui-menu" style="display:none;width:100px;border: 2px solid rgb(211, 211, 211);" title="操作">
	     <sec:authorize  ifAllGranted="PRODUCE_EDIT">
	     	 <div onClick="editProduce($('#list-table').datagrid('getSelected'))" data-options="iconCls:'icon-edit'">编辑</div>
	     </sec:authorize>
	     <div onClick="makeProduce()" data-options="iconCls:'icon-print'">制作生产单</div>
	     <div onClick="makeDeliver('')" data-options="iconCls:'icon-print'">制作送货单</div>
	     <div onClick="openOrderDetails($('#list-table').datagrid('getSelected'));" data-options="iconCls:'icon-reset'">详情</div>        
	</div>
	
	<%@include file="operate/produce.jsp"%>
	
</body>
<script type="text/javascript">

	var detail = function(value,row,index){ 
		if(row.status=='已下单'){
			return '<a class="end-order-btn" value="'+ row.id +'" href="javascript:void(0);"><span style="color:red;" >结单</span></a>';
		}
		return '';
	} 

	//点击状态修改操作的处理
	function handleOrderStatus(param){
		param.grid.datagrid("clearSelections");	
		$.messager.confirm('Confirm','确定要'+ param.operateName +'吗?', function(r) {
			if (r) {
				$.post('<c:url value="/bus/order/changeStatus"/>', {"orderId":param.orderId},function(result){
					if(result.success){
						param.newStatus = "已"+param.operateName;
						renderRowChange(param);
					}else{
						$.messager.alert('提示',param.operateName+'失败!','info');
					}
				},'json');
			}
		});
	}


	//对单条订单中的信息进行修改，并刷新订单操作
	function renderRowChange(param){
		var row = param.grid.datagrid('getSelected');
	    var index = param.grid.datagrid('getRowIndex', row);
	    row.status = param.newStatus;	                 
        param.grid.datagrid('refreshRow', index);
       
	}	

	//初始化grid中的点击事件
	function initGridEventsListen(param){		
		$("a.end-order-btn").on('click',function(){
		    param.orderId = $(this).attr("value");
		    param.operateName = "结单";
		    param.currStatus = "已下单";
			handleOrderStatus(param);   
		});
	}

	var printStatus = function (value, row, index) {
        if("已打印"==value){
        	  return 'color:red';
          }        
    }

	$(function() {	
		
		$('#list-table').datagrid({
			url: '<c:url value="/bus/produce/getOrderList"/>',
			loadMsg:'加载中，请稍等。。。',
			onLoadSuccess : function () {
				var param = new Object();
   				param.grid = $(this);  
   				initGridEventsListen(param); 
   				
        		$(this).datagrid("fixRownumber");
        	},
			columns:[[
				{field:'id',checkbox:true},
				{field:'code',sortable:"true", title: '订单编号',width:"90"},
				{field:'orderType',sortable:"true",title: '订单类型',width:"70"},
				{field:'customerName',sortable:"true",title: '客户名称',width:"180",formatter:contentWrap},
				{field:'hasPrintStatus',title: '送货单打印',width:"70",styler:printStatus},
				{field:'hasProducePrintStatus',title: '生产单打印',width:"70",styler:printStatus},
				{field:'receiveTime',sortable:"true",title: '交货时间',width:"80"},
				{field:'strip',sortable:"true",title: '款数',width:"33",formatter:function(value,rec){return value!=null?value:0}},	
				{field:'status',sortable:"true",title: '订单状态',width:"70"},							
				{field:'detail',title: '操作',width:"50",editor:{type:'linkbutton'},formatter:detail,styler: function (value, row, index) {
									              return 'background-color:yellow;';
									          }
				},	
				{field:'merchandTime',sortable:"true",title: '下单时间',width:"80"},					
				{field:'description',sortable:"true",title: '备注',width:"160",formatter:contentWrap},
				{field:'createManName',sortable:"true",title: '制单人',width:"70"}
           	]],
        	onDblClickRow : function(rowIndex, rowData) {
        		var param = new Object();
   				param.grid = $(this);  
   				param.orderId = rowData.id;
 		    	handleDetial(param);
 		    			
			},onRowContextMenu: function(e, rowIndex, rowData){
        		e.preventDefault();
        		$(this).datagrid('clearSelections');
    		    $(this).datagrid('selectRow', rowIndex);
    		    $('#mm').menu('show', {
    		        left:e.pageX,
    		        top:e.pageY
    		    }); 
	    	}
		});
	});

	//展示订单明细
	function handleDetial(param){	         			
		param.grid.datagrid("unselectAll");	
		param.grid.datagrid("selectRecord",param.orderId);
		$("#orderDetailswin").find('iframe').attr('src','<c:url value="/bus/produce/orderDetail-"/>'+param.orderId+"-"+false);
		$("#orderDetailswin").window("open");
			
	}	

	function openOrderDetails(orderDto){
		$("#orderDetailswin").find('iframe').attr('src','<c:url value="/bus/produce/orderDetail-"/>'+ orderDto.id +"-"+false);
		$("#orderDetailswin").window("open");
	}

</script>
</html>