<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/view/base_resource.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>订单管理</title>
<script type="text/javascript"  src="<c:url value='/js/commons/LodopFuncs.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-easyui/datagrid-detailview.js'/>"></script>
</head>
<body>
	<div class="easyui-layout" fit="true" id='bt_order_layout'>
		<%@include file="operate/searchbar.jsp"%>
		<div region="center" border="false">
			<table id="list-table"  data-options="nowrap:false"
				pagination="true" idField="id" fit="true" rownumbers="true"
				fitColumns="false" singleSelect="false" ctrlSelect="false">
				
			</table>
		</div>
	</div>	

	<%@include file="operate/purchase.jsp"%>  
	
	<div id="orderDetailswin" class="easyui-window" shadow= "false" title="订单详情" closed="true" align="center" style="display:none;width:900px;height:500px;top:10px;" modal="true">
		<iframe frameborder="0" width="100%" height="100%"></iframe>
	</div> 	
	
	<script type="text/javascript">

		var lastExpandRowIndex = '';
	    
		var detail = function(value,row,index){ 
			var entryMode = '<a class="detail-order-btn" value="'+ row.id +'"  href="javascript:void(0);">详情</a>';
	    	switch(row.status){
				case '制单中':
					entryMode = '<a class="start-order-btn" value="'+ row.id +'" href="javascript:void(0);">下单</a>'+ entryMode;
					break;
				case '已下单':
					entryMode = '<a class="end-order-btn" value="'+ row.id +'" href="javascript:void(0);">结单</a>'+ entryMode;
					break;
			}
			return entryMode;
		} 
		
		$(function() {

			$('#orderDetailswin').window({
				 onBeforeClose:function(){ 
				      $("#orderDetailswin").find('iframe').removeAttr("src");		
		      	 }
			});

			$('#orderDetailswin').show();
    		
			$('#list-table').datagrid({
				pageNumber: parseInt('${pageNumber}')||1,
				pageSize: parseInt('${pageSize}')||10,
				url:'<c:url value="/bus/purchase/search"/>',
				loadMsg:'加载中，请稍等。。。',
				columns:[[
							{field:'uuid',checkbox:true},
							{field:'id',title: '采购单号',width:"100"},		
							{field:'storeName',title: '存放仓库',width:"120"},		
							{field:'consignee',title: '收货人',width:"80"},		
							{field:'allPrice',title: '总价（元）',width:"100",formatter:function(value,rec){return value!=null?value:0}},				
							{field:'carriage',title: '运费（元）',width:"80"},	
							{field:'detail',hidden:true, title: '操作',width:"120",editor:{type:'linkbutton'},formatter:detail,styler: function (value, row, index) {
												              return 'background-color:yellow;color:red';
												          }
							},	
							{field:'createTime',title: '计划时间',width:"140"},	
							{field:'expire',title: '需求日期',width:"80"},	
							{field:'description',title: '采购说明',width:"200"},	
							{field:'createManName',title: '计划人',width:"80"}		
		            	]],
	           	toolbar : [ <sec:authorize  ifAllGranted="PURCHASE_ADD_IN">{text: '新增采购计划',iconCls: 'icon-add',handler: addOrder},</sec:authorize>
			            	<sec:authorize  ifAllGranted="PURCHASE_EDIT">{text: '编辑采购计划',iconCls: 'icon-edit',handler: editOrder},</sec:authorize>
			            	<sec:authorize  ifAllGranted="PURCHASE_DELETE">{text: '删除',iconCls: 'icon-delete',handler: delOrder},</sec:authorize>
			            	<sec:authorize  ifAllGranted="PURCHASE_DELETE">{text: '生成采购单',iconCls: 'icon-print',handler: function(){ makePos(''); }},</sec:authorize>
			            	<sec:authorize  ifAllGranted="PURCHASE_REFRESH">{text: '刷新',iconCls: 'icon-reload',handler: refresh}</sec:authorize>            	
	            		],	
	            onBeforeLoad: function(param){				   		 				   
		        	$(this).datagrid('clearSelections');             		 
        		}, 
        		onLoadSuccess:function(data){		       			
       				if(data.rows.length>0){         				
       					$(this).datagrid('selectRecord','${purchaseId}'!=''?'${purchaseId}':data.rows[0].id);      		   	  	
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
 		        	$(this).datagrid("unselectAll");
    				$(this).datagrid("selectRecord",row.id);	
 		            $('#detailForm-'+index).panel({  
 		                doSize:true,  
 		                border:false,  
 		                cache:false,  
 		               	href:'<c:url value="/bus/buyInfo/manage_edit-'+ index +'-'+ row.id +'"/>',
 		                onLoad:function(){
 		                    $('#list-table').datagrid('selectRow',index);
 		                    $('#list-table').datagrid('fixDetailRowHeight',index);
 		                }  
 		            });
 		            $('#list-table').datagrid('fixDetailRowHeight',index);
 		            lastExpandRowIndex = index;
 		        }, 		    			       
				onDblClickRow : function(rowIndex, rowData) {
    				$(this).datagrid("unselectAll");
    				$(this).datagrid("selectRecord",rowData.id);
        			//initBottomView(rowData);
				}
			});
		});

		//展示订单明细
		function handleDetial(param){	         			
			param.grid.datagrid("unselectAll");	
			$("#orderDetailswin").find('iframe').attr('src','<c:url value="/bus/purchase/orderDetail-"/>'+param.orderId);
			$("#orderDetailswin").window("open");		
		}

         
</script>
</body>
</html>