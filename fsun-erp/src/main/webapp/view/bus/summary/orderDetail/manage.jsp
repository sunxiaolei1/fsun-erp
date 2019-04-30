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
<title>订单产品明细汇总</title>
</head>
<body>
	<div class="easyui-layout" fit="true" id='bt_saleInfo_layout'>
		<div id="searchbar" class="ui-search-panel" region="north" style="height:65px;;padding:5px 5px;" title="搜索"
			data-options="striped: true,collapsible:false,iconCls:'icon-search',border:false">				      
				<label>产品名称：</label>
				<input type="text" value="" id="productName" name="productName" data-options="width:140" /> 
				<label>客户名称：</label>
				<input type="text" value="" id="customerName" name="customerName" data-options="width:180" /> 
				<label>交货日期起：</label>
				<input type="text" id="startDate" class="easyui-datebox" editable="false" data-options="width:90" validType="startDate" /> 
				<label>交货日期止：</label>
				<input type="text"  id="endDate" class="easyui-datebox" editable="false" data-options="width:90" validType="endDate" />							  
				<input type="button" class="search-btn" value="搜索" onMouseOver="this.className='on-search-btn'" onMouseOut="this.className='search-btn'" onfocus="this.blur()" onclick="javascript:searchA()"/>
				<input type="button" class="reset-btn" value="重置" onMouseOver="this.className='on-reset-btn'" onMouseOut="this.className='reset-btn'" onfocus="this.blur()" onclick="javascript:reset()" />
				<input type="button" class="excel-btn" value="导出明细" onMouseOver="this.className='on-excel-btn'" onMouseOut="this.className='excel-btn'" onfocus="this.blur()" onclick="javascript:templateDownload()" />
		</div>
		<div region="center" border="false">
			<table id="list-table" title="订单产品明细列表" toolbar="#toolbar" pageSize="30"
				pagination="true" idField="id" fit="true" rownumbers="true" nowrap="false"
	            singleSelect="true">
				
			</table>
		</div>
	</div>		
	
	<script>

		$.extend($.fn.validatebox.defaults.rules, {
	     	startDate: {// 验证
	        	validator: function (value) {
	     			var endDate =  $('#endDate').datebox('getValue');
	     			if(endDate!=null && endDate!=''){
						if(value > endDate){
							return false;
						}
	         		}
	         		return true;
	         	},
	         	message: '开始日期不能晚于结束日期'
	     	},
	     	endDate: {// 验证
	        	validator: function (value) {
	         		var startDate =  $('#startDate').datebox('getValue');
	     			if(startDate!=null && startDate!=''){
						if(value < startDate){
							return false;
						}
	         		}
	         		return true;
	         	},
	         	message: '结束日期不能早于开始日期'
	 		}
		});

		function searchA(){
			var customerName =  $('#customerName').combobox("getValue");
			var productName = $('#productName').combobox("getValue");
			var startDate = $("#startDate").datebox("getValue");
        	var endDate = $("#endDate").datebox("getValue");
	        $('#list-table').datagrid('reload',
	    	        {
    	                customerName:customerName,
    	        	    productName:productName,
    	        	    startDate:startDate,
    	        	    endDate:endDate
    	        	}
       	    );
	     };	
			
	    function reset() {
	         $("#productName").combobox("clear");
	         $("#customerName").combobox("clear"); 
	         $("#startDate").datebox("clear");
	         $("#endDate").datebox("clear");  
	    };
	    
		$(function() {

			$('#productName').combobox({
        		method:'get',
                required: false,
        	 	valueField: 'name',
        	  	textField: 'name',
        	  	url: '<c:url value="/bus/product/getNames"/>',
        	    panelHeight: 'auto'
        	});

			$('#customerName').combobox({
        		method:'get',
                required: false,
        	 	valueField: 'name',
        	  	textField: 'name',
        	  	url: '<c:url value="/bus/customer/getNames"/>',
        	    panelHeight: 'auto'
        	});
							
			var url = '<c:url value="/bus/summary/getDetailSummary"/>';
			$('#list-table').datagrid({
				url:url,
				loadMsg:'加载中，请稍等。。。',
				columns:[[
							{field:'orderCode',title: '订单编号',width:"70"},
							{field:'productCode',title: '产品编号',width:"70"},
							{field:'productName',title: '产品名称',width:"120"},	
							{field:'style',title: '产品款号',width:"70"},
							{field:'customerName',title: '客户名称',width:"140",formatter:contentWrap},							
							{field:'receiveTime',title: '交货日期',width:"70"},																					
							{field:'number',title: '数量',width:"70"},
							{field:'realNumber',title: '实际数量',width:"70"},
							{field:'unit',title: '单位',width:"30"},																	
							{field:'onePrice',title: '单价(元)',width:"55"},
							{field:'allPrice',title: '金额(元)',width:"70"},	
							{field:'papers',title: '大张数量',width:"70"},
							{field:'prints',title: '印次',width:"70"},										
							{field:'description',title: '备注',width:"140",formatter:contentWrap}
		            	]],
            	onLoadSuccess : function () {
            		$(this).datagrid("fixRownumber");
            	},
		        onSortColumn: function(sort,order){
				    dataGridSort = sort;
				    dataGridOrder = order;
		        }
			});
		});	
     /***************************************** 订单的增删改查 开始  **************************************************/
		//excel表模板导出
		function templateDownload(){				
			 var customerName =  $('#customerName').combobox("getValue");			
			 var productName = $('#productName').combobox("getValue");
			 var startDate = $("#startDate").datebox("getValue");
	         var endDate = $("#endDate").datebox("getValue");
	         
	         $.messager.progress({title: '请等待',msg: '明细导出中...',text: '',interval: 700});
	         $.ajax({
	             type: "post",
	             dataType: "json",
	             async:false,
	             url: '<c:url value="/bus/summary/detail/writeExcel"/>',
	             data: {
		             "customerName":customerName,
		             "productName":productName,
		             "sort":dataGridSort,
		             "order":dataGridOrder,
		             "startDate":startDate,
		             "endDate":endDate
		            },
	             success: function(result) {
	             	$.messager.progress('close');  
	             	if(result.success){
	             		var fileName = "订单明细表";
	             		window.location.href = '<c:url value="/bus/summary/detail/excelExport1?file='
	             			+ encodeURI(encodeURI(result.rows))+'&fileName='+ encodeURI(encodeURI(fileName))+'"/>';
	             	}else{
	             		$.messager.show({ title: '提示信息', msg : '导出明细异常!' });                 	
	             	}    			                				                															                	
	             }
	         });  
            
		}

		//获取datagrid的排序
	    var dataGridSort ='';
		var dataGridOrder = '';

	 /***************************************** 订单的增删改查 结束  **************************************************/
			 
	</script>
</body>
</html>