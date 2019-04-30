<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="tableHead" style="display:none;" >		 
	<table id="head1" border="0" cellSpacing=0 cellPadding=0 width="100%" height="46px;">	  			  
  	 	
  	 	</table>	
</div>

<div id="printTableDeliver" style="display:none;" >
	<TABLE border=1 cellSpacing=0 cellPadding=0 width="100%" style="border-collapse:collapse" bordercolor="#333333">
	<thead>
	  <TR>
	    <TD width="4%">
	      <DIV align=center><b></b></DIV></TD>
	    <TD width="10%">
	      <DIV align=center><b>产品编号</b></DIV></TD>
	    <TD width="16%">
	      <DIV align=center><b>产品名称</b></DIV></TD>
	    <TD width="10%">
	      <DIV align=center><b>款号</b></DIV></TD>
	    <TD width="10%">
	      <DIV align=center><b>数量</b></DIV></TD>		    
	    <TD width="5%">
	      <DIV align=center><b>单位</b></DIV></TD>
	    <TD width="9%">
	      <DIV align=center><b>单价(元)</b></DIV></TD>
	    <TD width="10%">
	      <DIV align=center><b>金额(元)</b></DIV></TD>   
	    <TD width="15%">
	      <DIV align=center><b>备注</b></DIV></TD>
	  </TR>	
	</thead>      
	  <TBODY id="tableDeliverData">      
		  
	  </TBODY>
	  <tfoot>
		  <tr>
		    <TD colspan="7" tdata="allSum" format="UpperMoney" align="left" tindex="8"><font>金额合计(大写)：###</font></TD> 
		    <TD colspan="2" tdata="allSum" format="#,##0.0" align="left" tindex="8"><font>小写金额 ￥###元</font></TD> 			   				  
		 </tr>
	  </tfoot>
	</TABLE>
</div>
	
<script type="text/javascript">

/***************************************** 制作送货单的操作 *******************************************/

function makeDeliver(productIds){
	var orders = $('#list-table').datagrid('getChecked');
	if(orders.length>0){
		var ids = new Array();       	 
		for(var i=0;i<orders.length;i++){
			var order = orders[i];
			ids.push(order.id);   				
		}
		$.ajax({
        	url:'<c:url value="/bus/produce/getDeliverInfo"/>',
        	dataType: "json",
        	data:{ids:ids.length!=0?ids.join(','):'', productIds:productIds},
        	async:false,
        	success:function(rowData){	
					var produces = rowData.rows;
					deliverView(produces);
        	}
        });	
	}else{
		$.messager.alert('提示','请选择订单','info');
		return;
	}
}

function deliverView(produces){
	if(produces.length>0){
    	var LODOP=getLodop();  
		LODOP.PRINT_INIT("送货单打印");
		LODOP.SET_PRINT_PAGESIZE(1,"203mm","141mm","");		   			
		for(var i=0;i<produces.length;i++){
			createOneDeliverPage(LODOP,produces[i],i*3);
		}

		initDeliverPagePublicInfo(LODOP);
		
		
		var prints = LODOP.PREVIEW();
		if(prints>0){
			var ids = new Array();       	 
			for(var i=0;i<produces.length;i++){
				var order = produces[i].orderInfo;
				ids.push(order.id);   				
			}
			$.ajax({
	        	url:'<c:url value="/bus/produce/changePrintStatus"/>',
	        	dataType: "json",
	        	data:{id:ids.length!=0?ids.join(','):''},
	        	async:false,
	        	success:function(rowData){	
	        		$('#list-table').edatagrid('clearSelections');
                	$('#list-table').edatagrid('reload'); 
	        	}
	        });	
		}
		
    }
}

function initDeliverPagePublicInfo(LODOP){
	
	LODOP.ADD_PRINT_HTM("40mm","94%","5%","100%","<table border=\"0\"><tr style=\"font-size:11\" ><td><p>①<br>白<br>存<br>根</p><p>②<br>红<br>客<br>户</p><p>③<br>黄<br>回<br>单</p></td>\n</tr></table>\n\n");
	LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
	
	var now = new Date();
 	LODOP.ADD_PRINT_HTM(14,"5%","50%",14,"打印时间："+now.getFullYear()+"-"+((now.getMonth()+1)<10?"0":"")+(now.getMonth()+1)+"-"+(now.getDate()<10?"0":"")+now.getDate());
	LODOP.SET_PRINT_STYLEA(0,"ItemType",1);

	LODOP.ADD_PRINT_HTM(14,"80%","50%",14,"<font color='#0000ff'><span tdata='pageNO'>第##页</span>/<span tdata='pageCount'>共##页</span></font>");
	LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
	LODOP.SET_PRINT_STYLEA(0,"Horient",1);

	LODOP.SET_PRINT_STYLE("FontSize",18);
	LODOP.SET_PRINT_STYLE("Bold",1);
	LODOP.ADD_PRINT_TEXT(20,"35%","90%",20,'${applicationScope.companyName}');
	LODOP.SET_PRINT_STYLEA(0,"ItemType",1);

	LODOP.SET_PRINT_STYLE("FontSize",10);
	LODOP.SET_PRINT_STYLE("Bold",0);
	LODOP.ADD_PRINT_TEXT(59,"34%","90%",15,"TEL:${applicationScope.companyTel} FAX:${applicationScope.companyFax}");
	LODOP.SET_PRINT_STYLEA(0,"ItemType",1);

	LODOP.SET_PRINT_STYLE("FontSize",15);
	LODOP.SET_PRINT_STYLE("Bold",1);
	LODOP.ADD_PRINT_TEXT(85,"40%","90%",19,"送   货   单");
	LODOP.SET_PRINT_STYLEA(0,"ItemType",1);

	LODOP.SET_PRINT_STYLE("FontSize",9);
	LODOP.SET_PRINT_STYLE("Bold",0);
	LODOP.ADD_PRINT_TEXT(424,"5%","90%",9,"注：以上货品请核对数量，如有质量问题，请在收货后3天内通知本公司，逾期恕不负责。");
	LODOP.SET_PRINT_STYLEA(0,"ItemType",1);

	LODOP.SET_PRINT_STYLE("FontSize",12);
	LODOP.SET_PRINT_STYLE("Bold",0);
	LODOP.ADD_PRINT_TEXT(446,"5%","90%",9,"送货单位及经手人(盖章)：");
	LODOP.SET_PRINT_STYLEA(0,"ItemType",1);

	LODOP.SET_PRINT_STYLE("FontSize",12);
	LODOP.SET_PRINT_STYLE("Bold",0);
	LODOP.ADD_PRINT_TEXT(446,"50%","90%",9,"收货单位及经手人(盖章)：");
	LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
	
}

function createOneDeliverPage(LODOP,produce,currRow){

	if($("#head1")){
		$("#head1").empty();
	} 
	
	if($("#tableDeliverData")){
		$("#tableDeliverData").empty();
	} 

	if(currRow!=0){
		LODOP.NewPageA();	
	}
	
	CreateTableDeliverContext(produce.orderProductDtoList,9,"tableDeliverData");
	LODOP.SET_PRINT_STYLEA(0,"Vorient",3);
    var strStyle='<style type="text/css"> table,td,th {border-width: 1px;border-style: solid;border-collapse: collapse}</style>';
	LODOP.ADD_PRINT_TABLE(198,"5%","88%",180,strStyle+document.getElementById("printTableDeliver").innerHTML);

	LODOP.SET_PRINT_STYLE("FontSize",13);
	LODOP.SET_PRINT_STYLE("Bold",1);
	LODOP.ADD_PRINT_TEXT(85,"70%","90%",19,"NO:"+produce.orderInfo.code);
	LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
	LODOP.SET_PRINT_STYLEA(0,"LinkedItem",1+currRow);

	createTableDeliverHead("head1",produce); 
	LODOP.ADD_PRINT_HTM(116,"5%","88%",70,document.getElementById("tableHead").innerHTML);
	LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
	LODOP.SET_PRINT_STYLEA(0,"LinkedItem",1+currRow);
	
};	

/******************************************    创建送货单的表头信息     ************************************/
function createTableDeliverHead(div,produce){
	 var customer = produce.customer;
	 var order = produce.orderInfo;
	 var tbody = $("#"+div);		 
     var tr=$("<tr></tr>");
     tr.appendTo(tbody);
     var td = $("<td>客户名称：<span>"+ (customer.name!=null?customer.name:"") +"</span></td>");			 
	 td.appendTo(tr);	
	 td = $("<td>订单类型：<span>"+ (order.orderType!=null?order.orderType:"") +"</span></td>");			 
	 td.appendTo(tr);
	 td = $("<td>制单人：<span>"+ (order.createManName!=null?order.createManName:"") +"</span></td>");			 
	 td.appendTo(tr);	

	 tr=$("<tr></tr>");
     tr.appendTo(tbody);
     td = $("<td>客户地址：<span>"+ (customer.address!=null?customer.address:"") +"</span></td>");			 
	 td.appendTo(tr);	
	 td = $("<td>客户电话：<span>"+ (customer.tel!=null?customer.tel:"") +"</span></td>");			 
	 td.appendTo(tr);
	 td = $("<td>联系人：<span>"+ (customer.contacts!=null?customer.contacts:"") +"</span></td>");			 
	 td.appendTo(tr);


	 tr=$("<tr></tr>");
     tr.appendTo(tbody);
     td = $("<td>送货日期：<span>"+ (order.receiveTime!=null?order.receiveTime:"") +"</span></td>");			 
	 td.appendTo(tr);
     td = $("<td>快件单号：<span>"+ (order.express!=null?order.express:"") +"</span></td>");			 
	 td.appendTo(tr);	
	 td = $("<td>合同号：<span>"+ (order.contract!=null?order.contract:"") +"</span></td>");			 
	 td.appendTo(tr);	 
	
	 	 
	 tr=$("<tr></tr>");
     tr.appendTo(tbody);    
     td = $("<td colspan='3'>备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：<span>"+ (order.description!=null?order.description:'') +"</span></td>");	    		  
	 td.appendTo(tr);	
	 
}

/************************************  创建送货单的主体内容  ********************************/
function CreateTableDeliverContext(list,cellCount,div)
{ 
     var tbody = $("#"+div);
	 for(var i=0;i<list.length;i++)
	 {
	    var tr=$("<tr></tr>");
		tr.appendTo(tbody);
		var obj= list[i].orderDetail;
		var j=1;
		var td;		
		while(j<=cellCount){		
			switch (j) {
			  case 1: td = $("<td>"+ (i+1) +"</td>");
			    break;
			  case 2: td = $("<td>"+ obj.productCode +"</td>");
			    break;
			  case 3: td = $("<td>"+ (obj.productName!=null?formatStr(obj.productName):'') +"</td>");
			    break;
			  case 4: td = $("<td>"+ (obj.style!=null?formatStr(obj.style):'') +"</td>");
			    break;
			  case 5: td = $("<td>"+ obj.number +"</td>");
			    break;
			  case 6: td = $("<td align='center'>"+ obj.unit +"</td>");
			  	break;
			  case 7: td = $("<td>"+ (obj.onePrice!=null?obj.onePrice:'') +"</td>");				  
			    break;				    
			  case 8: td = $("<td>"+ (obj.allPrice!=null?obj.allPrice:'') +"</td>");				  				  
			    break;
			  case 9: td = $("<td>"+ (obj.description!=null?formatStr(obj.description):'') +"</td>");				  				  
			    break;
			  default: break;
			}
			td.appendTo(tr);
			j++;
		}
	 }
}

</script>