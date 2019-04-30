<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/view/base_resource.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>采购单物料明细汇总</title>
</head>
<body>
	<table id="list-table" title="物料采购明细列表" toolbar="#toolbar" data-options="nowrap:false"
		pagination="true"  fit="true" rownumbers="true" pageSize="40"
		fitColumns="true" singleSelect="true" style="display:none;" >
	</table>
	
	
	<div id="toolbar" style="padding:5px;display:none;">
		<div id="buttonbar">
			<label>采购单号：</label>
			<input type="text" value="" id="purchaseId"  class="search_text" style="vertical-align: middle;width:110px"/>
			<label>物料名称：</label>
			<input id="materielId" />      
			<label>存放仓库：</label>
			<input id="storeId" style="width:110px" />     
			<label>供货厂家：</label>
			<input id="factoryId" />     
			<input type="button" style="vertical-align: middle;" class="search-btn" value="搜索" onMouseOver="this.className='on-search-btn'" onMouseOut="this.className='search-btn'" onfocus="this.blur()" onclick="javascript:searchA()"/>
			<input type="button" style="vertical-align: middle;" class="reset-btn" value="重置" onMouseOver="this.className='on-reset-btn'" onMouseOut="this.className='reset-btn'" onfocus="this.blur()" onclick="javascript:reset()" />
			<sec:authorize  ifAllGranted="BUYINFO_TEMPLETE_EXPORT">
				<input style="vertical-align: middle;" type="button" class="excel-btn" value="日志导出" onMouseOver="this.className='on-excel-btn'" onMouseOut="this.className='excel-btn'" onfocus="this.blur()" onclick="javascript:templateDownload()" />
			</sec:authorize>
		</div>
    </div>
	
	
	<script>
		
	    $(function() {
	    	
	        $("#toolbar").show();
	        $('#list-table').show();
	
			createCombox('materielId',false,'id','name','<c:url value="/bus/materiel/list"/>');
			createCombox('factoryId',false,'id','name','<c:url value="/bus/factoryInfo/list"/>');	
			createCombox('storeId',false,'id','name','<c:url value="/bus/store/listEnabled"/>','auto');				

			$('#list-table').datagrid({
				url:'<c:url value="/bus/summary/buyDetail/list"/>',
				loadMsg:'加载中，请稍等。。。',
				columns:[[
					  
					{field:'purchaseId',title: '采购单号',width:"75"},           							
					{field:'materielName',title: '物料名称',width:"140"},
					{field:'spec',title: '规格型号',width:"80"},
					{field:'factoryName',title: '供货厂家',width:"140"},
					{field:'inStatus',title: '验收状况',width:"58",formatter:function(value,row,index){  								   
							if(!row.enabled){
								return "<font color='yellow' >"+ value +"</font>";
							}
						    return "<font>"+ value +"</font>";								    
							  
	            		}  
	        		},
					{field:'number',title: '数量',width:"70"},
					{field:'unit',title: '单位',width:"36"},
					{field:'onePrice',title: '单价(元)',width:"55"},
					{field:'allPrice',title: '总价(元)',width:"60"},
					{field:'expire',title: '需求日期',width:"70"},
					{field:'storeName',title: '存放仓库',width:"60"},		
					{field:'consignee',title: '收货人',width:"70"},	
					{field:'createManName',title: '计划人',width:"70"},					
					{field:'description',title: '备注',width:"80"}
	           	]],	
	           	onLoadSuccess : function () {
	        		$(this).datagrid("fixRownumber");
	        	},
	            rowStyler: function(index,row){
					//已验收通过，背景色置灰  
	                if(row && row.enabled==false){ 		                
	                    return 'background-color:#FA8072;';  
	                }  
			   	}        
			});
		
		});	

	    function searchA(){
			 var materielId =  $('#materielId').combobox('getValue');
			 var factoryId =  $('#factoryId').combobox('getValue');
			 var storeId =  $('#storeId').combobox('getValue');
			 var purchaseId = $('#purchaseId').val();	
	         $('#list-table').datagrid('reload',
	        	{
	        	  materielId:materielId,        	  
	        	  factoryId:factoryId,
	        	  storeId:storeId,
	        	  purchaseId:purchaseId
	        	}
	         );
	     };	
			
	    function reset() {
	    	 $('#materielId').combobox('clear');	    
	         $('#factoryId').combobox('clear');
	         $('#storeId').combobox('clear');
	         $('#purchaseId').val('');         
	    };
    	 
		//excel表模板导出
		function templateDownload(){
			 var materielId =  $('#materielId').combobox('getValue');			
			 var factoryId =  $('#factoryId').combobox('getValue');
			 var storeId =  $('#storeId').combobox('getValue');
			 var purchaseId = $('#purchaseId').val();
			 $.messager.progress({title: '请等待',msg: '明细导出中...',text: '',interval: 700});
	         $.ajax({
	             type: "post",
	             dataType: "json",
	             async:false,
	             url: '<c:url value="/bus/summary/detail/buyInfo/writeExcel"/>',
	             data: {
		             "materielId":materielId,
		             "factoryId":factoryId,
		             "storeId":storeId,
		             "purchaseId":purchaseId
		            },
	             success: function(result) {
	             	$.messager.progress('close');
	             	if(result.success){
	             		var fileName = "物料采购明细表";
	             		window.location.href = '<c:url value="/bus/summary/detail/excelExport1?file='
	             			+ encodeURI(encodeURI(result.rows))+'&fileName='+ encodeURI(encodeURI(fileName))+'"/>';
	             	}else{
	             		$.messager.show({ title: '提示信息', msg : '导出明细异常!' });                 	
	             	}    			                				                															                	
	             }
	         });              
		}

	 /***************************************** 订单的增删改查 结束  **************************************************/
			 
	</script>
</body>
</html>