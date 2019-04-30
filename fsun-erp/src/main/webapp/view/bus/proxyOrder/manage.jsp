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
		<div id="proxyHeaderTabs" class="easyui-tabs" fit=true >
			<div title="加工单列表" data-options="region:'center',split:true,collapsible:false" >
				<div class="easyui-layout" data-options="fit:true">	
					<div data-options="region:'center',border:false"  >
						<table id="dataGrid">
						</table>
					</div>					
				</div>
			</div>
			<div title="明细" data-options="region:'center',split:true,collapsible:false" style="padding:5px">
			</div>
		</div>
	</div>
</div>

<%@include file="./operate/toolbar.jsp" %>

<%@include file="./operate/proxy-operate.jsp"%>

<!---------------------------------------------公共方法代码---------------------------------------------->
<script type="text/javascript">
	
	//清除DataGrid选中的行
	function clearDataGridSelections(){
		currProxyCode = '';
		detailGird.datagrid("clearSelections");
	}
	
	//刷新DataGrid
	function flushDataGrid(){		
		clearDataGridSelections();
		detailGird.datagrid("reload");
	}
	
	var currProxyCode = '';
	
	//跳转到添加生产单界面
    function toAddHeaderPage(){
    	toEdit = false;
    	$("#proxyHeaderTabs").tabs("select", 1);	
    }
	
    //跳转到生产详情界面
    function toDetailsPage(){
    	var rows = detailGird.datagrid("getSelections");
    	if(rows!=null && rows.length==1){
    		toEdit = true;
    		$("#proxyHeaderTabs").tabs("select", 1);
    	}else{
    		$.messager.alert('提示',"请选择一个加工单查看详情!",'info');
    	}
    }
    
	
    //跳转到生产单列表界面
    function toProxyListPage(proxyCode){
    	currProxyCode = proxyCode;
    	$("#proxyHeaderTabs").tabs("select", 0);
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
    
    var format_proxyStatus = function(value,row,index){
    	var proxyStatus = "未结单";
    	if(!row.enabled){
    		proxyStatus = "<span style='color:red;'>已结单</span>";
    	}
  	    return proxyStatus;
    }
  
   //设置要显示的列名
    var columns = 
    [[
		{field:"id",checkbox:true},
		{field:"proxyCode",title:"加工单号",width:130,align:"center"},			
		{field:"customerName",title:"客户名称",width:250,align:"center"},
		{field:"totalVersions",title:"版子总数",width:60,align:"center"},
		{field:"number",title:"单据数量",width:70,align:"center"},
		{field:"orderPrice",title:"单据金额",width:60,align:"center"},
		{field:"remark",title:"注意事项",width:180,align:"center"},		
		{field:"paid",title:"是否付款",width:60,align:"center", formatter:function(value, row){
			var hasPaid = '未付';
			if(value){
				hasPaid = "<span style='color:red;'>已付</span>";
			}
			return hasPaid;
		}},
		{field:"proxyStatus",title:"单据状态",width:70,align:"center",formatter:format_proxyStatus},
		{field:"printStatus",title:"打印状态",width:70,align:"center", formatter:format_printStatus},
		{field:"receiveTime",title:"交货日期",width:100,align:"center",sortable:true},
		{field:"createManName",title:"制单人",width:80,align:"center"},
		{field:"createTime",title:"制单时间",width:150,align:"center",sortable:true}
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
            url:'<c:url value="/bus/proxyOrder/search"/>',
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
						if(currProxyCode==rows[i].proxyCode){
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
    	$("#proxyHeaderTabs").tabs({
			border:false,
			onSelect:function(title, index){
				if(index == 0){					
					if(!first){
						detailGird.datagrid("clearSelections");
						detailGird.datagrid("reload");
					}else{
						first = false;
					}
					
				}else if(index == 1){
	    			var currentTab = $(this).tabs("getSelected");	    			
	    			var url = '<c:url value="/bus/proxyOrder/toAddProxyPage"/>';
	    			if(toEdit){
	    				var row = detailGird.datagrid("getSelected");	    				
	    				if(row){	
	    					url = '<c:url value="/bus/proxyOrder/proxyDetail-'+ row.proxyCode +'"/>';
	    				}		
	    			}	    			    			
    				var content = "<iframe scrolling='auto' frameborder='0' src='"+ url +"' style='width:100%;height:100%;'></iframe>";
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