<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="tableHead" style="display:none;" >		 
	<table id="head1" border="0" cellSpacing=0 cellPadding=0 width="100%" height="46px;">	  			  
  	 	
  	 	</table>	
</div>

<div id="printTablePos" style="display:none;" >
	<TABLE border=1 cellSpacing=0 cellPadding=0 width="100%" style="border-collapse:collapse" bordercolor="#333333">
	<thead>
	  <TR>
	    <TD width="3%">
	      <DIV align=center><b></b></DIV></TD>
	    <TD width="13%">
	      <DIV align=center><b>物料</b></DIV></TD>
	    <TD width="12%">
	      <DIV align=center><b>规格型号</b></DIV></TD>
	    <TD width="12%">
	      <DIV align=center><b>供货厂家</b></DIV></TD>
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
	  <TBODY id="tablePosData">      
		  
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

function makePos(buyInfoIds){

	var orders = $('#list-table').datagrid('getChecked');
	if(orders.length>0){
		var ids = new Array();       	 
		for(var i=0;i<orders.length;i++){
			var order = orders[i];
			ids.push(order.id);   				
		}
		$.ajax({
        	url:'<c:url value="/bus/purchase/getPosInfo"/>',
        	dataType: "json",
        	data:{ids:ids.length!=0?ids.join(','):'', buyInfoIds:buyInfoIds},
        	async:false,
        	success:function(rowData){	
				posView(rowData);
        	}
        });	
	}else{
		$.messager.alert('提示','请选择采购单','info');
		return;
	}
}

function posView(posDtos){
	if(posDtos.length>0){
    	var LODOP=getLodop();  
		LODOP.PRINT_INIT("采购单打印");
		LODOP.SET_PRINT_PAGESIZE(1,"203mm","141mm","");		   			
		for(var i=0;i<posDtos.length;i++){
			createOnePosPage(LODOP,posDtos[i],i*3);
		}
		initPosPagePublicInfo(LODOP);
		LODOP.PREVIEW();		
    }
}

function initPosPagePublicInfo(LODOP){
	
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
	LODOP.ADD_PRINT_TEXT(85,"40%","90%",19,"采   购   单");
	LODOP.SET_PRINT_STYLEA(0,"ItemType",1);

	LODOP.SET_PRINT_STYLE("FontSize",9);
	LODOP.SET_PRINT_STYLE("Bold",0);
	LODOP.ADD_PRINT_TEXT(424,"5%","90%",9,"注：此三联单说明  ①白存根 ②红客户 ③黄回单");
	LODOP.SET_PRINT_STYLEA(0,"ItemType",1);

	LODOP.SET_PRINT_STYLE("FontSize",12);
	LODOP.SET_PRINT_STYLE("Bold",0);
	LODOP.ADD_PRINT_TEXT(446,"50%","90%",9,"收货单位及经手人(盖章)：");
	LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
	
}

function createOnePosPage(LODOP,posDto,currRow){

	if($("#head1")){
		$("#head1").empty();
	} 
	
	if($("#tablePosData")){
		$("#tablePosData").empty();
	} 

	if(currRow!=0){
		LODOP.NewPageA();	
	}
	
	CreateTablePosContext(posDto.buyInfoDtos,9,"tablePosData");
	LODOP.SET_PRINT_STYLEA(0,"Vorient",3);
    var strStyle='<style type="text/css"> table,td,th {border-width: 1px;border-style: solid;border-collapse: collapse}</style>';
	LODOP.ADD_PRINT_TABLE(178,"4%","93%",200,strStyle+document.getElementById("printTablePos").innerHTML);

	LODOP.SET_PRINT_STYLE("FontSize",13);
	LODOP.SET_PRINT_STYLE("Bold",1);
	LODOP.ADD_PRINT_TEXT(85,"70%","90%",19,"NO:"+posDto.purchaseDto.id);
	LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
	LODOP.SET_PRINT_STYLEA(0,"LinkedItem",1+currRow);

	createTablePosHead("head1",posDto); 
	LODOP.ADD_PRINT_HTM(116,"4%","93%",70,document.getElementById("tableHead").innerHTML);
	LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
	LODOP.SET_PRINT_STYLEA(0,"LinkedItem",1+currRow);
	
};	

/******************************************    创建送货单的表头信息     ************************************/
function createTablePosHead(div,posDto){
	 var purchaseDto = posDto.purchaseDto;
	 var tbody = $("#"+div);		 
     var tr=$("<tr></tr>");
     tr.appendTo(tbody);
     var td = $("<td>存放仓库：<span>"+ (purchaseDto.storeName!=null?purchaseDto.storeName:"") +"</span></td>");			 
	 td.appendTo(tr);	
	 td = $("<td>计划人：<span>"+ (purchaseDto.createManName!=null?purchaseDto.createManName:"") +"</span></td>");			 
	 td.appendTo(tr);
	 td = $("<td>计划时间：<span>"+ (purchaseDto.createTime!=null?purchaseDto.createTime:"") +"</span></td>");			 
	 td.appendTo(tr);	

	 tr=$("<tr></tr>");
     tr.appendTo(tbody);
	 td = $("<td>运费&nbsp;(元)：<span>"+ (purchaseDto.carriage!=null?purchaseDto.carriage:"") +"</span></td>");			 
	 td.appendTo(tr);
	 td = $("<td>收货人：<span>"+ (purchaseDto.consignee!=null?purchaseDto.consignee:"") +"</span></td>");			 
	 td.appendTo(tr);
	 td = $("<td>需求日期：<span>"+ (purchaseDto.expire!=null?purchaseDto.expire:"") +"</span></td>");			 
	 td.appendTo(tr);
	 	 
	 tr=$("<tr></tr>");
     tr.appendTo(tbody);    
     td = $("<td colspan='3'>采购说明：<span>"+ (purchaseDto.description!=null?purchaseDto.description:'') +"</span></td>");	    		  
	 td.appendTo(tr); 	
	 
}

/************************************  创建送货单的主体内容  ********************************/
function CreateTablePosContext(buyInfoDtos,cellCount,div)
{ 
     var tbody = $("#"+div);
	 for(var i=0;i<buyInfoDtos.length;i++)
	 {
	    var tr=$("<tr></tr>");
		tr.appendTo(tbody);
		var obj= buyInfoDtos[i];
		var j=1;
		var td;		
		while(j<=cellCount){		
			switch (j) {
			  case 1: td = $("<td>"+ (i+1) +"</td>");
			    break;
			  case 2: td = $("<td>"+ (obj.materielName!=null?formatStr(obj.materielName):'') +"</td>");
			    break;
			  case 3: td = $("<td>"+ (obj.spec!=null?formatStr(obj.spec):'') +"</td>");
			    break;
			  case 4: td = $("<td>"+ (obj.factoryName!=null?formatStr(obj.factoryName):'') +"</td>");
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