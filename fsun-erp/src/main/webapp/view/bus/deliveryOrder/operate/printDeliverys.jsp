<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="tableHead" style="display:none;" >		 
	<table id="head1" border="0" cellSpacing=0 cellPadding=0 width="100%" height="46px;">	  			  
  	 	
  	 	</table>	
</div>

<div id="printTableDeliver" style="display:none;" >
	<TABLE border=1 cellSpacing=0 cellPadding=0 width="100%" style="font-size:16px; border-collapse:collapse" bordercolor="#333333">
	<thead>
	  <TR>
	    <TD width="3%">
	      <DIV align=center><b></b></DIV></TD>
	    <TD width="6%">
	      <DIV align=center><b>编号</b></DIV></TD>
	    <TD width="16%">
	      <DIV align=center><b>产品名称</b></DIV></TD>
	    <TD width="16%">
	      <DIV align=center><b>款号</b></DIV></TD>
	    <TD width="6%">
	      <DIV align=center><b>数量</b></DIV></TD>		    
	    <TD width="5%">
	      <DIV align=center><b>单位</b></DIV></TD>
	    <TD width="5%">
	      <DIV align=center><b>单价</b></DIV></TD>
	    <TD width="5%">
	      <DIV align=center><b>金额</b></DIV></TD>   
	    <TD width="25%">
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

function printDeliverys(){
	
	var rows = detailGird.datagrid("getSelections");
   	if(rows!=null && rows.length==1){
   		$.ajax({
   	       	url:'<c:url value="/bus/deliveryOrder/getDeliveryPrints" />',
   	       	dataType: "json",
   	       	data: {deliveryCode:rows[0].deliveryCode},
   	       	success:function(rowData){
   	       		if(rowData.success){
   	    			var deliveryPrintsDto = rowData.rows;	
   	    			madeOrderView(deliveryPrintsDto); 	       			
   	       		}
   		
   	       	}
   	    });
   	}else{
   		$.messager.alert('提示',"请选择一个送货单!",'info');
   	}
}

function madeOrderView(deliveryPrintsDto){
	if(deliveryPrintsDto){
    	var LODOP=getLodop();  
		//LODOP.PRINT_INIT("送货单打印");
		LODOP.SET_PRINT_PAGESIZE(1,"203mm","141mm","");		   			
		
		createOneDeliverPage(LODOP,deliveryPrintsDto,0);
		

		initDeliverPagePublicInfo(LODOP);
		
		if (LODOP.CVERSION) {  //用CVERSION属性判断是否云打印
	        LODOP.On_Return=function(TaskID,Value){
               if (Value!=0) {
            	  var deliveryHeaderDto = deliveryPrintsDto.deliveryHeaderDto;
      			  $.ajax({
      	        	 url:'<c:url value="/bus/deliveryOrder/signPrint"/>',
      	        	 dataType: "json",
      	        	 data:{deliveryCode:deliveryHeaderDto.deliveryCode},
      	        	 async:false,
      	        	 success:function(rowData){	
      	        		flushDataGrid();
      	        	 }
      	          });	
               }
	        };
	        LODOP.PREVIEWA();
	        return;
		};
		
		var prints = LODOP.PREVIEW();
		if(prints>0){
			var deliveryHeaderDto = deliveryPrintsDto.deliveryHeaderDto;
			$.ajax({
	        	url:'<c:url value="/bus/deliveryOrder/signPrint"/>',
	        	dataType: "json",
	        	data:{deliveryCode:deliveryHeaderDto.deliveryCode},
	        	async:false,
	        	success:function(rowData){	
	        		flushDataGrid();
	        	}
	        });	
		}
		
    }
}

function initDeliverPagePublicInfo(LODOP){
	
	LODOP.ADD_PRINT_HTM("40mm","96%","5%","100%","<table border=\"0\"><tr style=\"font-size:11\" ><td><p>①<br>白<br>存<br>根</p><p>②<br>红<br>客<br>户</p><p>③<br>黄<br>回<br>单</p></td>\n</tr></table>\n\n");
	LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
	
	var now = new Date();
 	LODOP.ADD_PRINT_HTM(14,"3%","50%",14,"打印时间："+now.getFullYear()+"-"+((now.getMonth()+1)<10?"0":"")+(now.getMonth()+1)+"-"+(now.getDate()<10?"0":"")+now.getDate());
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
	LODOP.ADD_PRINT_TEXT(59,"34%","90%",15,"TEL:${applicationScope.companyTel}    FAX:${applicationScope.companyFax}");
	LODOP.SET_PRINT_STYLEA(0,"ItemType",1);

	LODOP.SET_PRINT_STYLE("FontSize",15);
	LODOP.SET_PRINT_STYLE("Bold",1);
	LODOP.ADD_PRINT_TEXT(85,"40%","90%",19,"送   货   单");
	LODOP.SET_PRINT_STYLEA(0,"ItemType",1);

	LODOP.SET_PRINT_STYLE("FontSize",9);
	LODOP.SET_PRINT_STYLE("Bold",0);
	LODOP.ADD_PRINT_TEXT(424,"3%","90%",9,"注：以上货品请核对数量，如有质量问题，请在收货后3天内通知本公司，逾期恕不负责。");
	LODOP.SET_PRINT_STYLEA(0,"ItemType",1);

	LODOP.SET_PRINT_STYLE("FontSize",12);
	LODOP.SET_PRINT_STYLE("Bold",0);
	LODOP.ADD_PRINT_TEXT(446,"3%","90%",9,"送货单位及经手人(盖章)：");
	LODOP.SET_PRINT_STYLEA(0,"ItemType",1);

	LODOP.SET_PRINT_STYLE("FontSize",12);
	LODOP.SET_PRINT_STYLE("Bold",0);
	LODOP.ADD_PRINT_TEXT(446,"50%","90%",9,"收货单位及经手人(盖章)：");
	LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
	
}

function createOneDeliverPage(LODOP,deliveryPrintsDto,currRow){

	if($("#head1")){
		$("#head1").empty();
	} 
	
	if($("#tableDeliverData")){
		$("#tableDeliverData").empty();
	} 

	if(currRow!=0){
		LODOP.NewPageA();	
	}
	
	CreateTableDeliverContext(deliveryPrintsDto.deliveryDetailDtos,9,"tableDeliverData");
	LODOP.SET_PRINT_STYLEA(0,"Vorient",3);
    var strStyle='<style type="text/css"> table,td,th {border-width: 1px;border-style: solid;border-collapse: collapse}</style>';
	LODOP.ADD_PRINT_TABLE(175,"3%","92%",210,strStyle+document.getElementById("printTableDeliver").innerHTML);

	LODOP.SET_PRINT_STYLE("FontSize",13);
	LODOP.SET_PRINT_STYLE("Bold",1);
	LODOP.ADD_PRINT_TEXT(85,"65%","90%",19,"NO:"+deliveryPrintsDto.deliveryHeaderDto.deliveryCode);
	LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
	LODOP.SET_PRINT_STYLEA(0,"LinkedItem",1+currRow);

	createTableDeliverHead("head1",deliveryPrintsDto.deliveryHeaderDto); 
	LODOP.ADD_PRINT_HTM(116,"3%","90%",55,document.getElementById("tableHead").innerHTML);
	LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
	LODOP.SET_PRINT_STYLEA(0,"LinkedItem",1+currRow);
	
};	

/******************************************    创建送货单的表头信息     ************************************/
function createTableDeliverHead(div,header){
	 var tbody = $("#"+div);		 
     var tr=$("<tr></tr>");
     tr.appendTo(tbody);
     var td = $("<td>客户名称：<span>"+ (header.customerName!=null?header.customerName:"") +"</span></td>");			 
	 td.appendTo(tr);	
	 td = $("<td>单据类型：<span>"+ (header.deliverTypeName!=null?header.deliverTypeName:"") +"</span></td>");			 
	 td.appendTo(tr);
	 td = $("<td>制单人：<span>"+ (header.createManName!=null?header.createManName:"") +"</span></td>");			 
	 td.appendTo(tr);	

	 tr=$("<tr></tr>");
     tr.appendTo(tbody);
     td = $("<td>客户地址：<span>"+ (header.address!=null?header.address:"") +"</span></td>");			 
	 td.appendTo(tr);	
	 td = $("<td>联系方式：<span>"+ (header.tel!=null?header.tel:"") +"</span></td>");			 
	 td.appendTo(tr);
	 td = $("<td>联系人：<span>"+ (header.contacts!=null?header.contacts:"") +"</span></td>");			 
	 td.appendTo(tr);


	 tr=$("<tr></tr>");
     tr.appendTo(tbody);
     td = $("<td>送货日期：<span>"+ (header.deliveryDate!=null?header.deliveryDate:"") +"</span></td>");			 
	 td.appendTo(tr);
     td = $("<td>快件单号：<span>"+ (header.express!=null?header.express:"") +"</span></td>");			 
	 td.appendTo(tr);	
	 td = $("<td>合同号：<span>"+ (header.contract!=null?header.contract:"") +"</span></td>");			 
	 td.appendTo(tr);	 
	
	 	 
	/*  tr=$("<tr></tr>");
     tr.appendTo(tbody);    
     td = $("<td colspan='3'>备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：<span>"+ (header.description!=null?header.description:'') +"</span></td>");	    		  
	 td.appendTo(tr);	 */
	 
}

/************************************  创建送货单的主体内容  ********************************/
function CreateTableDeliverContext(list,cellCount,div)
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
			  case 1: td = $("<td align='center'>"+ (i+1) +"</td>");
			    break;
			  case 2: td = $("<td align='center'>"+ obj.productCode +"</td>");
			    break;
			  case 3: td = $("<td align='center'>"+ (obj.productName!=null?formatStr((obj.productName.getLength()>16?obj.productName.getSub(13):obj.productName)):'') +"</td>");
			    break;
			  case 4: td = $("<td align='center'>"+ (obj.style!=null?formatStr(obj.style):'') +"</td>");
			    break;
			  case 5: td = $("<td align='center'>"+ obj.number +"</td>");
			    break;
			  case 6: td = $("<td align='center'>"+ obj.unit +"</td>");
			  	break;
			  case 7: td = $("<td align='center'>"+ (obj.onePrice!=null?obj.onePrice:'') +"</td>");				  
			    break;				    
			  case 8: td = $("<td align='center'>"+ (obj.allPrice!=null?obj.allPrice:'') +"</td>");				  				  
			    break;
			  case 9: td = $("<td align='center' >"+ (obj.description!=null?formatStr(obj.description):'') +"</td>");				  				  
			    break;
			  default: break;
			}
			td.appendTo(tr);
			j++;
		}
	 }
}

</script>