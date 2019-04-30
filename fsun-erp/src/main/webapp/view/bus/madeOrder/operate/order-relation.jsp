<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/view/base_resource.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>订单管理</title>
<script type="text/javascript" src="<c:url value='/js/jquery-easyui/datagrid-detailview.js'/>"></script>
</head>
<body>
	<div class="easyui-layout" fit= true >
		<div region="center" border="false">
			<table id="list-table"  data-options="nowrap:false"
				pagination="true" idField="id" fit="true" rownumbers="true"
				fitColumns="false" singleSelect="false" ctrlSelect="false">
				
			</table>
		</div>
	</div>	 
	
	<%@include file="./searchbar.jsp"%>
	
	<div id="orderDetailswin" class="easyui-window" shadow= "false" title="订单详情" closed="true" align="center" style="display:none;width:900px;height:500px;top:10px;" modal="true">
		<iframe frameborder="0" width="100%" height="100%"></iframe>
	</div> 	
	
	<script type="text/javascript">

		var lastExpandRowIndex = '';
	    
		var detail = function(value,row,index){ 
			var entryMode = '<a class="detail-order-btn" value="'+ row.id +'"  href="javascript:handleDetial(\''+ row.id +'\');">详情</a>';
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
				url:'<c:url value="/bus/order/search"/>',
				queryParams:{madeCode:'${madeCode}'},
				loadMsg:'加载中，请稍等。。。',
				columns:[[
							//{field:'id',checkbox:true},
							{field:'id',hidden:true},
							{field:'code',sortable:"true",title: '订单编号',width:"110"},
							{field:'orderType',sortable:"true", title: '订单类型',width:"60"},
							{field:'customerName',sortable:"true", title: '客户名称',width:"160",formatter:contentWrap},
							{field:'receiveTime',sortable:"true",title: '交货时间',width:"80"},
							{field:'strip',title: '款数',width:"30",formatter:function(value,rec){return value!=null?value:0}},
							//{field:'number',title: '总数量',width:"60",formatter:function(value,rec){return value!=null?value:0}},													
							{field:'allPrice',title: '总价（元）',width:"60",formatter:function(value,rec){return value!=null?value:0}},	
							{field:'isGet',title: '已付款',width:"50",formatter:hasGetChange},
							{field:'status',sortable:"true",title: '订单状态',width:"60"},							
							{field:'detail',title: '操作',width:"50",editor:{type:'linkbutton'},formatter:detail,styler: function (value, row, index) {
												              return 'background-color:yellow;color:red';
												          }
							},	
							{field:'createTime',title: '制单时间',width:"80"},
							{field:'merchandTime',sortable:"true",title: '下单时间',width:"80"},
							{field:'description',title: '备注',width:"140",formatter:contentWrap},	
							{field:'createManName',sortable:"true",title: '制单人',width:"70"}		
		            	]],
	           	toolbar :"#searchbar",
	            onSortColumn: function(sort,order){
				    dataGridSort = sort;
				    dataGridOrder = order;
		        },	
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
 		        	$(this).datagrid("unselectAll");
    				$(this).datagrid("selectRecord",row.id);	
 		            $('#detailForm-'+index).panel({  
 		                doSize:true,  
 		                border:false,  
 		                cache:false,  
 		               	href:'<c:url value="/bus/orderDetail/order-detail-'+ index +'-'+ row.id +'"/>',
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
		function handleDetial(orderId){	 
			$('#list-table').datagrid("unselectAll");
			$("#orderDetailswin").find('iframe').attr('src','<c:url value="/bus/order/orderDetail-"/>'+orderId);
			$("#orderDetailswin").window("open");
				
		}
		
</script>
</body>
</html>