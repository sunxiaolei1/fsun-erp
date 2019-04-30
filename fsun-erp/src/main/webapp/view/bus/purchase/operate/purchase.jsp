<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">

	/***************************************** 订单的操作 开始  **************************************************/

	//子页面数据更改时,刷新选中行的数据
	function refreshSelectedRow(order,rowIndex){
		var grid = $('#list-table');
		grid.datagrid("unselectAll");
		grid.datagrid("selectRecord",order.id);
		$("#datagrid-row-r1-2-"+ rowIndex +" td[field=allPrice]").find(".datagrid-cell-c1-allPrice").html(order.allPrice);  
		//$("#datagrid-row-r1-2-"+ rowIndex +" td[field=strip]").find(".datagrid-cell-c1-strip").html(order.strip);             
	}

	//通过id选中一行
	function selectRowById(param){
		param.grid.datagrid("unselectAll");
		param.grid.datagrid("selectRecord",param.orderId);
	}

    //判别有没操作权限
	function operatePower(purchaseId){	
		var hasPower = true;			
		$.ajax({
            type: "get",
            dataType: "json",
            async:false,
            url: '<c:url value="/bus/purchase/operatePower?"/>purchaseId='+purchaseId,
            success: function(result) {
            	if(!result.success){	
            		hasPower = false;     
            		$.messager.alert('提示','采购单('+ id +')的下物料已全部验收,无法进行此操作!','info');   		          		         			                		 
            	}			                				                														                	
            }
        });	
        return hasPower;				
	}
    
	//制作返单
    function addOrder(){   
		 var pageInfo = getPageInfo($('#list-table'));
		 window.location.href = "<c:url value='/bus/purchase/operateOrder'/>--"+ pageInfo.currPageNumber +"-"+ pageInfo.currPageSize;;  	  	
    }

	//编辑订单
	function editOrder(){	 
		 var purchase = $('#list-table').datagrid('getSelections');
		 if(purchase.length==1){
		 	var id = purchase[0].id;
		 	var pageInfo = getPageInfo($('#list-table'));
		 	window.location.href = "<c:url value='/bus/purchase/operateOrder'/>-"+ id +"-"+ pageInfo.currPageNumber +"-"+ pageInfo.currPageSize;
		}else{
			$.messager.alert('提示','请选择一项进行修改!','info');
			$('#list-table').datagrid('unselectAll');
		}
	}

	//获取当前页的分页信息
	function getPageInfo(grid){
		var pageInfo = new Object();
	 	var options = grid.datagrid('getPager').data("pagination").options;  
	 	//var total = options.total;  
	 	pageInfo.currPageSize = options.pageSize;
	 	pageInfo.currPageNumber = options.pageNumber;
	 	//pageInfo.maxPage = Math.ceil(total/options.pageSize);	
		return pageInfo;
	}
	 
    //删除订单
	function delOrder() {

		var rows = $('#list-table').datagrid('getSelections');
		if (rows.length > 0) {
		    var ids = '';				  
			for ( var i = 0; i < rows.length; i++) {
				ids += rows[i].id + ',';						
			}
			ids = ids.substring(0, ids.length - 1);										
			$.messager.confirm('Confirm','确定要删除选择的数据吗?', function(r) {
				if (r) {
					$.ajax({
		                type: "post",
		                dataType: "json",
		                url: '<c:url value="/bus/purchase/delete"/>',
		                data: {"id":ids},
		                success: function(returnData) {
		                	if(returnData.success){		       
		                		changeCurrPageForDataGrid(rows,$('#list-table'));
		                		$('#list-table').datagrid('reload');
			                }else{
			                	$.messager.show({ title: '提示信息', msg : '删除失败' }); 
			                }				                				                															                	
		                }
		            });
				}
			});
		} else {
			$.messager.alert('消息', '请选择要删除的数据!','info');
		}
	}

    //刷新订单列表(如果存在选中项将不会去掉)
	function refresh(){			
		$('#list-table').datagrid('reload');				
	}

 /*****************************************  订单的操作 结束  **************************************************/

</script>