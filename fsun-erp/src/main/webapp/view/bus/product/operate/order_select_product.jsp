<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>


<script type="text/javascript" src="<c:url value='/js/jquery-easyui/jquery.edatagrid.js'/>"></script>
<script type="text/javascript"  src="<c:url value='/view/bus/order/operate/edit_product_common.js'/>"></script>
<link rel="stylesheet" href="<c:url value='/css/main.css'/>" />

<script type="text/javascript">

var attManage = function(value,row,index){
	return '<sec:authorize  ifAllGranted="ORDER_PRODUCT_DELETE"><button type="button" onclick="delProduct(\''+index+'\');">删除</button></sec:authorize>';				
}

/**********************************************        订单明细操作开始         ************************************************/

var orderDetailData = [];

var iconChange = function(value,row,index){
	
	if(row.icon==null||row.icon==""){
		return '<img class="item-img" onerror="this.style.display='+"'none'"+'"/>';
	}
	var imageFile = '<c:url value="/uploads/product"/>'+ row.icon;
	return '<img class="item-img" src="'+imageFile+'" style="height:29px;with:40px;" onerror="this.style.display='+"'none'"+'"/>';
	//var img = document.getElementById('imgid')[0].src;
}

function productAdd(){
	
	if (!gridIsValidate("orderDetail")){			
		return ;
	}	 
	currDetailGrid.edatagrid("acceptChanges");
	if(orderDetailData.length==0){
		$.messager.alert('提示',"无产品可提交!",'info');
		return;
	}
	addPackagDetail(orderDetailData);
	closeExistProductAddDialog();
}

//单选模式
function delProduct(index){
	//获取可编辑行
	var editIndex = currDetailGrid.edatagrid('options').editIndex;
	//可编辑行不存在
	if("undefined" == typeof editIndex){
		//删除行是最后一行
		if(index==(orderDetailData.length-1)){
			currDetailGrid.datagrid('beginEdit',index);
			currDetailGrid.datagrid('cancelEdit',index);       		
	    }else{           	
	    	var list = [];
	        for(var i=0;i<orderDetailData.length;i++){
				if(index!=i){
					list.push(orderDetailData[i]);
				}
	        }	
	        orderDetailData = list;
	        currDetailGrid.datagrid("loadData",orderDetailData);           	
	    }
	//存在可编辑行
	}else{
		//可编辑行是删除行
		if(index==editIndex){
			currDetailGrid.datagrid('cancelEdit', editIndex);
			currDetailGrid.datagrid('clearSelections'); 
	    }else{
	    	//可编辑行不是删除行
	    	currDetailGrid.datagrid('endEdit', editIndex);
			var list = [];
	        for(var i=0;i<orderDetailData.length;i++){
				if(index!=i){
					list.push(orderDetailData[i]);
				}
	        }	
	        orderDetailData = list;
	        currDetailGrid.datagrid("loadData",orderDetailData);   
	    }   		     				
	}
  	
	
}

/**********************************************        订单明细操作完成         ************************************************/

var currDetailGrid = null;

$(function(){
	

	currDetailGrid = $('#orderDetail');	
	
	currDetailGrid.edatagrid({
		loadMsg:'加载中，请稍等。。。',	
	}).datagrid("loadData",orderDetailData);
	
	$("#productCodeComb").combogrid({
		  panelWidth: 500,
	      panelHeight: 320,
	      idField: 'code',
	      textField: 'name',
	      url: '<c:url value="/bus/product/search"/>',
	      queryParams: {enabled: true},
	      multiple: false,
	      fitColumns: true,
	      striped: true,
	      editable: true,
	      pagination: true,
	      rownumbers: true,
	      collapsible: false,
	      pageNumber : parseInt('${pageNumber}')||1,
	      pageSize : parseInt('${pageSize}')||10,
	      method: 'post',
	      mode:'remote',
	      columns: [[
	        {field: "id", hidden:true, checkbox: true},
	        {field: "code", title: "产品编号", width: 60,align:'center'},
	        {field: "name", title: "产品名称", width: 140},
	        {field: "style", title: "款号", width: 120},
	        {field: "icon", title: "图片", width: 50, formatter: iconChange} 
	      ]],
	      loadMsg: "数据加载中请稍后……",
	      emptyMsg: "没有符合条件的记录",
	      onSelect:function(rowIndex, rowData){			
	    	  currDetailGrid.edatagrid("acceptChanges");
	    	  var style = rowData.style;
	    	  var productCode = rowData.code;
	    	  var productName = rowData.name;	
	    	  if(style!=null && style.length>0){
	    		  var styleArr = style.split(",");    		  
	    		  $.each(styleArr,function(){		    				
	        			var style = this;        			
	        			if(!packageDetailHasExisted(productCode,productName,style)){
	        				var obj = {
                				"productCode":productCode,
                				"productName":productName,
                				"style":style,
                				"number":0,
                				"unit":'只',
                				"onePrice":0.0      				
                			};
	        				orderDetailData.push(obj);
	        			}
	        			
	    			});	
	    	  }else{	    		  
	    		  if(!packageDetailHasExisted(productCode,productName,null)){
	    			  var obj = {
  	       				"productCode":productCode,
  	       				"productName":productName,
  	       				"style":'',
  	       				"number":0,
  	       				"unit":'只',
  	       				"onePrice":0.0      				
  	       			  };
      				 orderDetailData.push(obj);
      			  }
	    	  }
	    	  currDetailGrid.datagrid("loadData",orderDetailData);
		  }
	});	
	 
     $("#toolbar").show();
     
});


//清空查询BasCodes条件
function resetSearch() {  
    $('#productCodeComb').combogrid('clear');     
}

</script>

					
<table id="orderDetail"  toolbar="#toolbar" nowrap="false" pagination="false" 
	idField="id" fit="true" rownumbers="true" fitColumns="true" singleSelect="true" >
	<thead>
		<tr>
			<th field="id" hidden="true" chechbox="true"></th>	
			<th field="productCode" width="40">产品编号</th>	
			<th field="productName" width="120" >产品名称</th>						
			<th field="style" width="90"  editor="{type:'validatebox',options:{validType:'style[20]'}}">款号</th>
			<th field="number" width="65" editor="{type:'numberbox',options:{required:true}}">数量</th>
			<th field="unit" width="40" editor="{type:'combobox',options:{editable:false,required:true,data:unitValue,valueField:'id',textField:'text',panelHeight:'auto'}}">单位</th>
			<th field="onePrice" width="45" editor="{type:'numberbox', options:{required:false,min:'0',max:5000,precision:'2'}}">单价(元)</th>							
			<th field="name" width="40" formatter="attManage" type='linkbutton'>操作</th>							
		</tr>
	</thead>	
</table>
			
<div id="toolbar" style="padding:2px;display:none;">
	<span style="float:right;margin-top:2px;">		 	
		<label>产品检索:&nbsp;</label>
		<input id="productCodeComb" class="easyui-combogrid" style="width:240px" />
		<input type="button" id="resetBtn" class="reset-btn" value="清空" onMouseOver="this.className='on-reset-btn'" onMouseOut="this.className='reset-btn'" onfocus="this.blur()" onclick="javascript:resetSearch()" />		           		 
    </span>
	<sec:authorize  ifAllGranted="ORDER_PRODUCT_CANCEL">
			 <a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-undo" plain="true" onclick="closeExistProductAddDialog()">取消</a>
	</sec:authorize>
	<sec:authorize  ifAllGranted="ORDER_PRODUCT_ADD">
			 <a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-add" plain="true"	onclick="productAdd()">提交</a> 
	</sec:authorize>
	
</div>