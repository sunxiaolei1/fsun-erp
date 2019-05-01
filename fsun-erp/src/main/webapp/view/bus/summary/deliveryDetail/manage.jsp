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
	var mergeCells = ["deliveryCode","deliveryTypeName","customerCode","customerName","receiveTime",
	                  "receiveStatus","orderCode","createManName","createTime","description"];
	var mergeUnique = "deliveryCode";

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
		{field:"deliveryCode",title:"送货单号",width:120,align:"center"},
		{field:"deliveryTypeName",title:"单据类型",width:80,align:"center",sortable:true},
		{field:"customerCode",title:"客户编号",width:80,align:"center",sortable:true},
		{field:"customerName",title:"客户名称",width:160,align:"center",sortable:true},
		{field:"productCode",title:"产品编号",width:60,align:"center"},
		{field:"productName",title:"产品名称",width:160,align:"center"},
		{field:"style",title:"款号",width:160,align:"center"},
		{field:"number",title:"数量",width:70,align:"center"},
		{field:"unit",title:"单位",width:50,align:"center"},
		{field:"onePrice",title:"单价",width:50,align:"center"},
		{field:"allPrice",title:"总价",width:60,align:"center"},
		
		{field:"receiveTime",title:"收货时间",width:130,align:"center",sortable:true},
		{field:"receiveStatus",title:"收货状态",width:60,align:"center",sortable:true},
		{field:"orderCode",title:"相关订单号",width:140,align:"center"},
		{field:"createManName",title:"制单人",width:80,align:"center"},
		{field:"createTime",title:"制单时间",width:130,align:"center",sortable:true},
		{field:"description",title:"备注",width:120,align:"center"}
		
		
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
            sortName:"deliveryCode desc, detail.productCode asc, detail.style",
            sortOrder:"asc",
            singleSelect:true,//是否单选
            remoteFilter:true,
            rownumbers:true,//行号
            pagination:true,//分页控件
            pageNumber : parseInt('${pageNumber}')||1,
            pageSize : parseInt('${pageSize}')||30,
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
    	        	autoMergeCells(data.rows, mergeCells);
       			}       					  					     			        			
    		}
        });
    	
    }

    
    /**
     * 合并相同行数据
     */
    function autoMergeCells(rows, mergeCells){
    	//只有相同行合并唯一性字段和是否支持相同行单元格合并同时满足才可进行合并		        	
    	if(mergeCells && mergeUnique){
    		//data是默认的表格加载数据，包括rows和Total
       		var mark=1;                                                 
        	//这里涉及到简单的运算，mark是计算每次需要合并的格子数
        	for (var i=1; i <rows.length; i++) {     
        		//这里循环表格当前的数据
        		if (rows[i][mergeUnique] == rows[i-1][mergeUnique]) {   
        			//后一行的值与前一行的值做比较，相同就需要合并
       				mark += 1; 
        			$.each(mergeCells, function(){
        				var field = this;
        				detailGird.datagrid('mergeCells',{ 
            				//datagrid的index，表示从第几行开始合并；紫色的内容需是最精髓的，就是记住最开始需要合并的位置
    						index: i+1-mark,
            				//合并单元格的区域，就是clomun中的filed对应的列
            				field: field, 
            				//纵向合并的格数，如果想要横向合并，就使用colspan：mark
            				rowspan:mark                   
            			});
        			});   			 
        		}else{
        			//一旦前后两行的值不一样了，那么需要合并的格子数mark就需要重新计算
       				mark=1;                                         
        		}
        	}
    	}
    }

      
</script>
<!---------------------------------------------显示DataGrid代码---------------------------------------------->


</body>
</html>