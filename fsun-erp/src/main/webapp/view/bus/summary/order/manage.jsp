<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/view/base_resource.jsp" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="<c:url value='/css/main.css'/>" />
<head>
<style type="text/css">
.textField{text-align:right;}
.table-new{font-size:12px;}
a {color:#07519A; text-decoration: none}
a:hover {color: #FF6600; text-decoration: underline}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>订单汇总</title>
</head>
<body>		
	<div class="easyui-layout" fit="true" id='bt_buyInfo_layout'>
		<div id="searchbar" class="ui-search-panel" region="north" style="height:65px;;padding:5px 5px;" title="搜索"
			data-options="striped: true,collapsible:false,iconCls:'icon-search',border:false">
				<label>客户名称：</label>
				<input id="orderCustomer"  class="easyui-combobox" />
				<label>订单类型：</label>
				<input id="orderType" class="easyui-combobox" editable="false" data-options="width:70,required:false,data:orderType,valueField:'id',textField:'text',panelHeight:'auto'" />     
				<label>订单状态：</label>
				<input id="orderStatus" class="easyui-combobox" editable="false" data-options="width:70,required:false,data:orderStatus,valueField:'id',textField:'text',panelHeight:'auto'" />     				 
				<label>交货日期起：</label>
				<input type="text" id="startDate" class="easyui-datebox" editable="false" data-options="width:90" validType="startDate" /> 
				<label>交货日期止：</label>
				<input type="text"  id="endDate" class="easyui-datebox" editable="false" data-options="width:90" validType="endDate" />							  
				<label>已付款：</label>
				<input id="orderIsGet"  class="easyui-combobox" editable="false" data-options="width:50,required:false,data:isGet,valueField:'id',textField:'text',panelHeight:'auto'" />     
				<input type="button" class="search-btn" value="搜索" onMouseOver="this.className='on-search-btn'" onMouseOut="this.className='search-btn'" onfocus="this.blur()" onclick="javascript:searchA()"/>
				<input type="button" class="reset-btn" value="重置" onMouseOver="this.className='on-reset-btn'" onMouseOut="this.className='reset-btn'" onfocus="this.blur()" onclick="javascript:reset()" />				
		</div>
		<div region="center" border="false">
			<table id="list-table" toolbar="#toolbar" pagination="true" fit="true" pageSize="50"
				rownumbers="true" fitColumns="true" singleSelect="true"  data-options="nowrap:false" >
			</table>
		</div>	
		
		<div id="toolbar" style="display:none">
	    	<div id="buttonbar" >
		       <span style="float:right">	 	
		      		<label ><font color="red" >设置分组：</font></label>
		      	 	<input id="groupQuery"  class="easyui-combobox" multiple="true" editable="false" /> 
		       </span>
		       <sec:authorize  ifAllGranted="ORDER_SUMMARY_REFRESH">
			       	<span>
			        	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload" plain="true" onclick="refreshData()">刷新</a>
			        </span>
		       </sec:authorize>
		       <sec:authorize  ifAllGranted="ORDER_SUMMARY_EXPORT">	            
			       	<span>
			        	<a href="javascript:void(0)" id="export"  class="easyui-linkbutton" iconCls="icon-export" plain="true" onclick="templateDownload()">EXCEL导出</a>
			        </span>			        
		       </sec:authorize>
			</div>     
	    </div>
	    
	</div>	
	
	<script>

	    //用于查询的字段列
		var gridColumns = [											
			{field:'code',sortable:"true",title: '订单编号',width:"80"},
			{field:'orderType',sortable:"true", title: '订单类型',width:"60"},
			{field:'customerName',sortable:"true", title: '客户名称',width:"160"},
			{field:'receiveTime',sortable:"true",title: '交货时间',width:"70"},
			{field:'strip',sortable:"true",title: '款数',width:"30",formatter:function(value,rec){return value!=null?value:0}},
			//{field:'number',title: '总数量',width:"60",formatter:function(value,rec){return value!=null?value:0}},													
			{field:'allPrice',sortable:"true",title: '总价（元）',width:"60",formatter:function(value,rec){return value!=null?value:0}},	
			{field:'isGet',sortable:"true",title: '已付款',width:"50",formatter:hasGetChange},
			{field:'status',sortable:"true",title: '订单状态',width:"60"},
			{field:'createTime',sortable:"true",title: '制单时间',width:"70"},
			{field:'merchandTime',sortable:"true",title: '下单时间',width:"70"},	
			{field:'createManName',sortable:"true",title: '制单人',width:"70"},		
			{field:'description',title: '备注',width:"180",formatter:showAllItem}
    	];

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
			var orderType =  $('#orderType').combobox('getValue');
			var status =  $('#orderStatus').combobox('getValue');
			var customerName =  $('#orderCustomer').combobox('getValue');
			var groupBy =  $('#groupQuery').combobox('getValues');
			var isGet =  $('#orderIsGet').combobox('getValue');	
			var startDate = $("#startDate").datebox("getValue");
        	var endDate = $("#endDate").datebox("getValue");
    	
            var url = '<c:url value="/bus/order/search"/>'; 
        	if(groupBy.length>0){
        		url = '<c:url value="/bus/summary/order"/>';
			}
        	$('#list-table').datagrid({ 
        		onLoadSuccess : function () {
	        		$(this).datagrid("fixRownumber");
	        	},
                url:url,  
                queryParams:{
        			orderType:orderType,
        			status:status,
        			customerName:customerName,
                 	isGet:isGet,
                 	groupBy:groupBy.join(','),
    		        startDate:startDate,
    		        endDate:endDate
    		    }
            });  
	 
	     };	
			
	    function reset() {
	    	clearData(); 
	         searchA();   
	    };

	    function clearData(){
	    	$('#orderType').combobox('clear');
	         $('#orderStatus').combobox('clear');
	         $('#orderCustomer').combobox('clear');
	         $('#orderIsGet').combobox('clear');	
	         $("#startDate").datebox("clear");
	         $("#endDate").datebox("clear");
		}

		function searchB(grid,url,gridColumns){

			var orderType =  $('#orderType').combobox('getValue');
			var status =  $('#orderStatus').combobox('getValue');
			var customerName =  $('#orderCustomer').combobox('getValue');
			var groupBy =  $('#groupQuery').combobox('getValues');
			var isGet =  $('#orderIsGet').combobox('getValue');	
			var startDate = $("#startDate").datebox("getValue");
        	var endDate = $("#endDate").datebox("getValue"); 
            
        	$('#'+grid).datagrid({  
                url:url,
                queryParams:{
	        		orderType:orderType,
	    			status:status,
	    			customerName:customerName,
	             	isGet:isGet,
	             	groupBy:groupBy.join(','),
			        startDate:startDate,
			        endDate:endDate
    		    },
                columns:[gridColumns]                 
            });   	 
	     }	

		function getAllColumns(grid,gridColumns,dataGroup){
			//用于分组的字段列
			var gridGroupColumns = [											       			
	   			{field:'customerName',title: '客户名称',align:"center", sortable:true,width:80},		
	   			{field:'orderType',title: '订单类型',align:"center",sortable:true,width:80},		
	   			{field:'status',title: '订单状态',align:"center",sortable:true,width:80},		       										
	   			{field:'allPrice',title: '金额(元)',align:"center",sortable:true,width:70},
	   			{field:'hasGet',title: '已付',align:"center",sortable:true,width:80},												
	   			{field:'receiveTime',title: '交货日期',align:"center",sortable:true,width:80},	
	   			{field:'updateTime',title: '最后统计时间',align:"center",sortable:true,width:120}		       		
	       	];
			var columnList = new Array();
		    var url = '<c:url value="/bus/order/search"/>'; 
		    var groupBy = $('#groupQuery').combobox('getValues');
	  		if(groupBy.length > 0){

	  			//要显示的column的宽度的总和	  			
	  			var columnsWidth = 0;
	  			
	  			url = '<c:url value="/bus/summary/order"/>'; 			
	  			for(var i=0;i<gridGroupColumns.length;i++){	  				
		  			for(var j=0;j<groupBy.length;j++){
		  				if(gridGroupColumns[i].field == map.get(groupBy[j])){
		  					columnList.push(gridGroupColumns[i]);
		  					columnsWidth += gridGroupColumns[i].width;
		  					break;
			  			}	
			  		}
			  		var isIn = false;
			  		for(var k=0;k<dataGroup.length;k++){
			  			if(gridGroupColumns[i].field==dataGroup[k].name){
			  				isIn = true;
			  				break;
			  			}
				  	}
				  	if(!isIn){
				  		columnList.push(gridGroupColumns[i]);
				  		columnsWidth += gridGroupColumns[i].width;
					}						  											
                } 
                //div的宽度	  			
	  			var divWidth = $("#list-table").datagrid("options").width;	  		    
			    for(var t=0;t<columnList.length;t++){
			    	columnList[t].width = ((divWidth-50)*columnList[t].width/columnsWidth+"").split(".")[0];;
				}
			    $("#export").hide();
		    }else{
		    	columnList = gridColumns;
		    	$("#export").show();
		    } 
	  		searchB(grid,url,columnList);	  
		}

        function getDataGroup(){
            var aa ;
        	$.ajax({
                type: "get",
                dataType: "json",
                async:false,
                url: '<c:url value="/sys/dictionary/getGroupList?key=ORDER_SUMMARY_GROUP_BY"/>',
                success: function(data) {
                	aa = data;    				     			    					    				    			                                     	
    	    	} 
            });
        	return aa; 
        }
        
		
		$(function() {
			
			 //设置text须要验证
	        $('#startDate').validatebox();
	        $('#endDate').validatebox();	        
			createComboxForWidth('orderCustomer',false,'name','name','<c:url value="/bus/customer/list"/>','auto',120);    					
			$('#toolbar').show();
			var dataGroup = getDataGroup();
			var aa = $('#groupQuery').combobox({
		        required: false,
			 	valueField: 'key',
			  	textField: 'value',
			  	data: dataGroup,
			  	width: 300,
			    panelHeight: 'auto',
			    onSelect: function(record){
			  		getAllColumns("list-table",gridColumns,dataGroup);					       
				},
				onUnselect: function(record){
					getAllColumns("list-table",gridColumns,dataGroup);				    
				}, 
				onSortColumn: function(sort,order){
				    dataGridSort = sort;
				    dataGridOrder = order;
		        }
			    
			});	
		
			clearData();			
			var vmuser;
			$('#list-table').datagrid({  
				loadMsg:'加载中，请稍等。。。',   
				url: '<c:url value="/bus/order/search"/>',
				columns:[gridColumns]
			});
		});	
        /***************************************** 订单的增删改查 开始  **************************************************/
		 
		//获取datagrid的排序
	    var dataGridSort ='';
		var dataGridOrder = '';
		    
	    //excel表模板导出
		function templateDownload(){	
			var orderType =  $('#orderType').combobox('getValue');
			var status =  $('#orderStatus').combobox('getValue');
			var customerName =  $('#orderCustomer').combobox('getValue');
			var groupBy =  $('#groupQuery').combobox('getValues');
			var isGet =  $('#orderIsGet').combobox('getValue');	
			var startDate = $("#startDate").datebox("getValue");
        	var endDate = $("#endDate").datebox("getValue");
			window.location.href = '<c:url value="/bus/order/excelExport?orderType='+ orderType +'&customerName='+ encodeURI(encodeURI(customerName)) 
				+'&status='+ status +'&isGet='+ isGet +'&sort='+ dataGridSort +'&order='+ dataGridOrder +'&startDate='+ startDate +'&endDate='+ endDate +'"/>';
		}

		//刷新
		function refreshData(){
			window.location.href = '<c:url value="/bus/summary/order/manage"/>';
		}

			
	 /***************************************** 订单的增删改查 结束  **************************************************/
			 
	</script>
</body>
</html>