<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="printTable" style="display:none;" >
	<TABLE border=1 cellSpacing=0 cellPadding=0 width="100%" style="border-collapse:collapse" bordercolor="#333333">
	<thead>
	  <TR>
	    <TD width="5%">
	      <DIV align=center><b>序号</b></DIV></TD>
	    <TD width="10%">
	      <DIV align=center><b>产品编号</b></DIV></TD>
	    <TD width="20%">
	      <DIV align=center><b>产品名称</b></DIV></TD>	
	    <TD width="11%">
	      <DIV align=center><b>款号</b></DIV></TD>	    
	    <TD width="8%">
	      <DIV align=center><b>单位</b></DIV></TD>		    
		<TD width="10%">
	      <DIV align=center><b>数量</b></DIV></TD>
	    <TD width="9%">
	      <DIV align=center><b>单价(元)</b></DIV></TD>
	    <TD width="11%">
	      <DIV align=center><b>金额(元)</b></DIV></TD>
	    <TD width="16%">
	      <DIV align=center><b>备注</b></DIV></TD>
	  </TR>
	</thead>      
	  <TBODY id="tableData">      
		  
	  </TBODY>
	  <tfoot>
		  <tr>
		    <TD colspan="2" tdata="pageCount" format="#" align="left"><p align="center"><b>总页数:##页</b></TD>		   
			<TD colspan="4" tdata="pageNO" format="#" align="left"><p align="center"><b>当前页:第#页</b></p></TD>	
			<TD colspan="3" tdata="pageCount" format="#" align="left"><b>总金额:</b></TD>
		 </tr>
	  </tfoot>
	</TABLE>
</div>

<div id="tableHead" style="display:none;" >		 
	<table id="head1" border="0" cellSpacing=0 cellPadding=0 width="100%" height="46px;">	  			  
  	 	
  	 	</table>	
</div>

<div id="tableFoot" style="display:none;" >
	<DIV style="LINE-HEIGHT: 20px;"  align=left>
 		<font >签字:<span style="border: 0px; border-bottom: 1px solid black;"></span></font>
 		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 		<font >以此凭证作为结账依据，若遗失本厂概不负责</font>
 	</DIV>		
 	<DIV style="LINE-HEIGHT: 20px" align=right>
 		<font>制作：雨田工作室</font>
 	</DIV>
 	<DIV style="LINE-HEIGHT: 20px" align=right>
 		<font>电话：18868384668</font>
 	</DIV>
</div>
	
<script type="text/javascript">

/************************************************************** 制作产品外协的打印单   *****************************************************************/

//初始化打印表单的表头数据
function loadTableHead(orderId,process,outsourcier){
	$("#head1").empty();
	$.ajax({
    	url:'<c:url value="/bus/order/load"/>',
    	dataType: "json",
    	data:{id:orderId},
    	async:false,
    	success:function(rowData){	
    		CreateTableHead(rowData.rows,"head1",process,outsourcier);  
    	}
    });			  	
}


function outsourcing(){
	var process = $("#process").combobox("getValue");
	if(process==''){
		$.messager.alert('提示','请选择工艺流程','info');
		return;
	}
	var outsourcier = $("#outsourcier").combobox("getValue");
	if(outsourcier==''){
		$.messager.alert('提示','请选择外协方','info');
		return;
	}
	
	var products = $('#productDetailsList').datagrid('getChecked');   	  
	//var product = $('#productDetailsList').datagrid('getSelections');
	if(products.length>0){
		 			
		if($("#tableData")){
			$("#tableData").empty();
		} 

		//表格的拼装
		CreateTableContext(products,9,"tableData");
   		var LODOP=getLodop();  
   		LODOP.PRINT_INIT("外协单打印");
   		LODOP.SET_PRINT_PAGESIZE(1,"210mm","297mm","A4");
   		
   		LODOP.SET_PRINT_STYLEA(0,"Vorient",3);
        var strStyle='<style type="text/css"> table,td,th {border-width: 1px;border-style: solid;border-collapse: collapse}</style>';
   		LODOP.ADD_PRINT_TABLE(138,"5%","90%",814,strStyle+document.getElementById("printTable").innerHTML);

   		var now = new Date();
   	 	LODOP.ADD_PRINT_HTM(14,"5%","50%",14,"打印时间："+now.getFullYear()+"-"+((now.getMonth()+1)<10?"0":"")+(now.getMonth()+1)+"-"+(now.getDate()<10?"0":"")+now.getDate());
		LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
		LODOP.SET_PRINT_STYLEA(0,"LinkedItem",1);
   		
   	    //表头的拼装
   		LODOP.SET_PRINT_STYLE("FontSize",16);
		LODOP.SET_PRINT_STYLE("Bold",1);
   		LODOP.ADD_PRINT_TEXT(30,"40%","90%",40,"${applicationScope.companyLtd}外协单");
   		LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
   		LODOP.SET_PRINT_STYLEA(0,"LinkedItem",1);
   		
   		loadTableHead(products[0].orderId,process,outsourcier); 
   		//var strStyle1='<style type="text/css">input{text-align:left; border-left:0px;border-top:0px;border-right:0px;border-bottom:1px;}.textField1{text-align:left;font-weight:800;padding:2px;}.table-new{font-size:12px;}</style>';		
   		LODOP.ADD_PRINT_HTM(66,"5%","90%",59,document.getElementById("tableHead").innerHTML);
   		LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
   		LODOP.SET_PRINT_STYLEA(0,"LinkedItem",1);

   	    //表尾的拼装
   	    LODOP.ADD_PRINT_HTM(984,"5%","90%",154,document.getElementById("tableFoot").innerHTML);
   		LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
   		LODOP.SET_PRINT_STYLEA(0,"LinkedItem",1);

   		LODOP.PREVIEW();
	     
	}else{
		$.messager.alert('提示','请选择相应的产品','info');
		return;
	}
}

/****************************************  创建外协单的表头信息 *******************************************/
function CreateTableHead(order,div,process,outsourcier)
{ 
	
     var tbody = $("#"+div);

     var tr=$("<tr></tr>");
     tr.appendTo(tbody);
     var td = $("<td>订单编号：<span>"+ order.code +"</span></td>");			 
	 td.appendTo(tr);	
	 td = $("<td>订单类型：<span>"+ order.orderType +"</span></td>");			 
	 td.appendTo(tr);
	 td = $("<td>制单人：<span>"+ order.createManName +"</span></td>");			 
	 td.appendTo(tr);	

	 tr=$("<tr></tr>");
     tr.appendTo(tbody);
     td = $("<td>工艺流程：<span>"+ process +"</span></td>");			 
	 td.appendTo(tr);	
	 td = $("<td></td>");			 
	 td.appendTo(tr);
	 td = $("<td>外协方：<span>"+ outsourcier +"</span></td>");			 
	 td.appendTo(tr);
	 
	 tr=$("<tr></tr>");
     tr.appendTo(tbody);    
     td = $("<td colspan='3'>备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：<span>"+ (order.description!=null?order.description:'') +"</span></td>");	    		  
	 td.appendTo(tr);	
	 	
	 
}

/************************************  创建外协单的主体内容  ********************************/
function CreateTableContext(list,cellCount,div)
{ 
     var tbody = $("#"+div);
	 for(var i=0;i<list.length;i++)
	 {
	    var tr=$("<tr></tr>");
		tr.appendTo(tbody);
		var obj= list[i];
		var j=1;
		var td;		
		while(j<=cellCount){		
			switch (j) {
			  case 1: td = $("<td>"+ (i+1) +"</td>");
			    break;
			  case 2: td = $("<td>"+ obj.productCode +"</td>");
			    break;
			  case 3: td = $("<td>"+ obj.productName +"</td>");
			    break;
			  case 4: td = $("<td>"+ (obj.style!=null?formatStr(obj.style):'') +"</td>");
			    break;
			  case 5: td = $("<td>张</td>");
			    break;
			  case 6: td = $("<td></td>");
			  	break;
			  case 7: td = $("<td></td>");
			  	break;
			  case 8: td = $("<td></td>");
			  	break;
			  case 9: td = 	td = $("<td>"+ (obj.description!=null?formatStr(obj.description):'') +"</td>");					  
			    break;				   
			  default: break;
			}
			td.appendTo(tr);
			j++;
		}
	 }
}
</script>
