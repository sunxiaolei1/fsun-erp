<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/view/base_resource.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript"  src="<c:url value='/js/commons/LodopFuncs.js'/>"></script>
<title>订单管理</title>
</head>
<body>

<div class="easyui-layout" style="width:100%;height:100%;">
	<div region="center" border="false"  >
		<div id="madeHeaderTabs" class="easyui-tabs" fit=true >
			<div title="送货单列表" data-options="region:'center',split:true,collapsible:false" >
				<div class="easyui-layout" data-options="fit:true">	
					<div data-options="region:'center',border:false"  >
						<table id="dataGrid">
						</table>
					</div>					
				</div>
			</div>
			<div title="送货单及明细" data-options="region:'center',split:true,collapsible:false" style="padding:5px">
			</div>
			<div title="订单详情" data-options="region:'center',split:true,collapsible:false" style="padding:5px">
			</div>
		</div>
	</div>
</div>

<%@include file="./operate/toolbar.jsp" %>

<%@include file="./operate/delivery-operate.jsp"%>

<%@include file="./operate/order-select.jsp" %>

<!---------------------------------------------公共方法代码---------------------------------------------->
<script type="text/javascript">
	
	//清除DataGrid选中的行
	function clearDataGridSelections(){
		detailGird.datagrid("clearSelections");
	}
	
	//刷新DataGrid
	function flushDataGrid(){
		clearDataGridSelections();
		detailGird.datagrid("reload");
	}
	
	//被选中的订单编号
	var selectedOrderDetailIds;
	var currDeliveryCode= '';
	
	//跳转到添加生产单界面
    function toAddDeliveryPage(orderDetailIds){
    	toEdit = false;
    	selectedOrderDetailIds = orderDetailIds;
    	$("#madeHeaderTabs").tabs("select", 1);	
    }
	
    //跳转到生产详情界面
    function toMadeDetailsPage(){
    	var rows = detailGird.datagrid("getSelections");
    	if(rows!=null && rows.length==1){
    		toEdit = true;
    		$("#madeHeaderTabs").tabs("select", 1);
    	}else{
    		$.messager.alert('提示',"请选择一个送货单查看详情!",'info');
    	}
    }
    
    //跳转到订单界面
    function toOrderPage(){
    	var rows = detailGird.datagrid("getSelections");
    	if(rows!=null && rows.length==1){
    		$("#madeHeaderTabs").tabs("select", 2);		
    	}else{
    		$.messager.alert('提示',"请选择一个送货单!",'info');
    	}
    }
	
    //跳转到生产单列表界面
    function toAddMadeListPage(deliveryCode){
    	currDeliveryCode = deliveryCode;
    	$("#madeHeaderTabs").tabs("select", 0);
    }
    
    /**
     * 是否为无效状态
     * @param $_this
     * @returns
     */
    function isGoOn($_this){
    	return $_this.hasClass('grayScale');
    }
	
</script>
<!---------------------------------------------公共方法代码---------------------------------------------->



<!---------------------------------------------显示DataGrid代码---------------------------------------------->
<script type="text/javascript">

	var detailGird = '';
	var toEdit = false;
	var first = true;
	
	//页面加载时，初始化datagrid
    $(function () {  
	
    	initDataGrid();		
    	
		initTabs();			
		  	
    });
    
    
    var format_printStatus = function(value,row,index){
    	var printStatus = "未打印";
    	if(row.printStatus){
    		printStatus = "<span style='color:red;'>已打印</span>";
    	}
  	    return printStatus;
     }
  
   //设置要显示的列名
    var columns = 
    [[
		{field:"id",checkbox:true},
		{field:"deliveryCode",title:"送货单号",width:140,align:"center"},
		{field:"orderCode",title:"相关订单号",width:280,align:"center"},
		{field:"deliveryTypeName",title:"单据类型",width:100,align:"center"},
		{field:"deliveryDate",title:"发货日期",width:100,align:"center",sortable:true},
		{field:"receiveStatus",title:"收货状态",width:80,align:"center"},
		{field:"printStatus",title:"打印状态",width:80,align:"center", formatter:format_printStatus},
		{field:"createManName",title:"制单人",width:80,align:"center"},
		{field:"createTime",title:"制单时间",width:130,align:"center",sortable:true}
	]];
	
    
    //初始化datagrid配置
    function initDataGrid() {
    	
    	detailGird = $("#dataGrid");
    	detailGird.datagrid({
    		loadMsg:"努力加载中。。。",
            width:"auto",
            height:"auto",
            nowrap:false,
            striped:true,
            border:true,
            collapsible:false,//是否可折叠的
            fit:true,//自动大小
            url:'<c:url value="/bus/deliveryOrder/search"/>',
            queryParams:{},
            remoteSort:true,
            sortName:"createTime",
            sortOrder:"desc",
            singleSelect:false,//是否单选
            remoteFilter:true,
            rownumbers:true,//行号
            pagination:true,//分页控件
            pageNumber : parseInt('${pageNumber}')||1,
            pageSize : parseInt('${pageSize}')||20,
            fitColumns:false,
            showFooter:false,
            columns:columns,
            toolbar:"#toolbar",
            idField:"id",
            emptyMsg:"没有符合条件的记录",
            onClickRow: function (index, row) {  //easyui封装好的事件（被单击行的索引，被单击行的值）
            	//changeButtonStatus(row.asnStatus);
            },
		   	onLoadSuccess:function(data){		       			
   				if(data.rows.length>0){         				   	
       				//调整行号的宽度
    	        	$(this).datagrid("fixRownumber"); 
    	        	var rows = data.rows;
       				for (var i = 0; i < rows.length; i++) {
						if(currDeliveryCode==rows[i].deliveryCode){
							$(this).datagrid("selectRow", i);
							break;
						}
					}
       			}       					  					     			        			
    		}
        });
    	
    }
    
    function changeButtonStatus(asnStatus){
    	var message = null;    	
    	return message;
    }
    
    //初始化tab，添加选择监听事件
    function initTabs(){
    	$("#madeHeaderTabs").tabs({
			border:false,
			onSelect:function(title, index){
				if(index == 0){					
					if(!first){
						flushDataGrid();			
					}else{
						first = false;
					}
					
				}else if(index == 1){
	    			var currentTab = $(this).tabs("getSelected");
	    			var url = '<c:url value="/bus/deliveryOrder/deliveryAdd-'+ selectedOrderDetailIds +'"/>';
	    			var content = "<iframe scrolling='auto' frameborder='0' src='"+ url +"' style='width:100%;height:100%;'></iframe>";
	    			if(toEdit){
	    				var row = detailGird.datagrid("getSelected");
	    				var deliveryCode = "";
	    				if(row){	
	    					deliveryCode = row.deliveryCode; 
	    				}
	    				url = '<c:url value="/bus/deliveryOrder/deliveryDetail-'+ deliveryCode +'"/>';
	    				content = "<iframe scrolling='auto' frameborder='0' src='"+ url +"' style='width:100%;height:100%;'></iframe>";
	    			}
	    			$(this).tabs("update", {
						tab: currentTab,
						options: {
							content:content
						}
					});
	    		}else if(index == 2){
	    			var currentTab = $(this).tabs("getSelected");
	    			var row = detailGird.datagrid("getSelected");
    				var deliveryCode = "";
    				if(row){	
    					deliveryCode = row.deliveryCode; 
    				}
    				var url = '<c:url value="/bus/deliveryOrder/order-relation-'+ deliveryCode +'"/>';
    				content = "<iframe scrolling='auto' frameborder='0' src='"+ url +"' style='width:100%;height:100%;'></iframe>";
	    			$(this).tabs("update", {
						tab: currentTab,
						options: {
							content:content
						}
					});
	    		}			
	    	}
		});
    	
    }
    
      
</script>
<!---------------------------------------------显示DataGrid代码---------------------------------------------->


</body>
</html>