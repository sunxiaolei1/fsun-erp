<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/view/base_resource.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>订单管理</title>
</head>
<body>

<table id="dataGrid"></table>			
	


<%@include file="./toolbar.jsp" %>

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

	
</script>
<!---------------------------------------------公共方法代码---------------------------------------------->



<!---------------------------------------------显示DataGrid代码---------------------------------------------->
<script type="text/javascript">

	var detailGird = '';
	
	
	//页面加载时，初始化datagrid
    $(function () {  
    	initDataGrid();				  	
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
		{field:"id",hidden:true},
		{field:"deliveryCode",title:"送货单号",width:110,align:"center"},
		{field:"deliveryTypeName",title:"单据类型",width:60,align:"center",sortable:true},
		{field:"customerCode",title:"客户编号",width:60,align:"center",sortable:true},
		{field:"customerName",title:"客户名称",width:80,align:"center",sortable:true},
		{field:"productCode",title:"产品编号",width:60,align:"center"},
		{field:"productName",title:"产品名称",width:80,align:"center"},
		{field:"style",title:"款号",width:80,align:"center"},
		{field:"number",title:"数量",width:50,align:"center"},
		{field:"unit",title:"单位",width:40,align:"center"},
		
		{field:"receiveTime",title:"收货时间",width:100,align:"center",sortable:true},
		{field:"receiveStatus",title:"收货状态",width:60,align:"center",sortable:true},
		{field:"orderCode",title:"相关订单号",width:180,align:"center"},
		{field:"createManName",title:"制单人",width:60,align:"center"},
		{field:"createTime",title:"制单时间",width:100,align:"center",sortable:true},
		{field:"onePrice",title:"单价",width:40,align:"center"},
		{field:"allPrice",title:"总价",width:50,align:"center"},
		{field:"description",title:"备注",width:80,align:"center"}
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
            url:'<c:url value="/bus/summary/deliveryDetail/getDetailSummary"/>',
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
		   	onLoadSuccess:function(data){		       			
   				if(data.rows.length>0){         				   	
       				//调整行号的宽度
    	        	$(this).datagrid("fixRownumber");       	        	  					    						     			
       			}       					  					     			        			
    		}
        });
    	
    }
    
      
</script>
<!---------------------------------------------显示DataGrid代码---------------------------------------------->


</body>
</html>