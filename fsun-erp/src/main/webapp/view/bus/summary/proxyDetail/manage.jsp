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
		{field:"proxyCode",title:"加工单号",width:110,align:"center"},					
		{field:"customerName",title:"客户名称",width:180,align:"center",sortable:true},	
		{field:"customerCode",title:"客户编号",width:60,align:"center",sortable:true},		
		//{field:"number",title:"单据印次",width:80,align:"center"},
		{field:"hasPaid",title:"是否付款",width:80,align:"center"},
		{field:"orderPrice",title:"单据金额",width:80,align:"center"},
		{field:"remark",title:"注意事项",width:190,align:"center"},
		{field:"receiveTime",title:"交货日期",width:90,align:"center",sortable:true},				
		{field:"createManName",title:"制单人",width:70,align:"center"},
		{field:"createTime",title:"制单时间",width:130,align:"center",sortable:true},	
		{field:"productName",title:"产品名称",width:180,align:"center"},
		{field:"model",title:"生产机型",width:90,align:"center"},
		{field:"process",title:"工序",width:90,align:"center"},
		{field:"psNumber",title:"ps版数量",width:80,align:"center"},
		{field:"layout",title:"印刷方式",width:80,align:"center"},
		{field:"colorsName",title:"色数",width:140,align:"center"},
		{field:"number",title:"印刷数量",width:80,align:"center"},
		{field:"loss",title:"印损",width:70,align:"center"},
		{field:"descr",title:"备注",width:180,align:"center"}
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
            url:'<c:url value="/bus/summary/proxyDetail/getDetailSummary"/>',
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