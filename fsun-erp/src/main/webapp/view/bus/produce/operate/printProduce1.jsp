<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="produceHead" style="display:none;">		 
	<table id="produceOrderTable" border="1" cellSpacing=0 cellPadding=0 width="100%" height="auto">	  			  
  	 	
  	 </table>
</div>

<div id="produceBaseInfo" style="display:none;margin:0 auto">
	
</div>

<div id="produceAfterProcess" style="display:none;">
	<table id="productAfterProcessTable" border="1" cellSpacing=0 cellPadding=0 width="100%" height="auto">	  			  
  	 	
  	 </table>
</div>

<div id="produceContext" style="display:none;" >		 
		<table id="productContextTable" border="1" cellSpacing=0 cellPadding=0 width="100%" height="auto">	  			  
  	 	
  	 	</table>	 	
</div>

<script type="text/javascript">

/***************************************** 制作生产单的操作  ***************************************************/
	$(function(){
		
	})

	//制作生产单
	function makeProduce(){
		var orders = $('#list-table').datagrid('getChecked');
		if(orders.length>0){
			var ids = new Array();       	 
			for(var i=0;i<orders.length;i++){
				var order = orders[i];
				ids.push(order.id);   				
			}
			$.ajax({
	        	url:'<c:url value="/bus/produce/getProduceInfo"/>',
	        	dataType: "json",
	        	data:{ids:ids.length!=0?ids.join(','):''},
	        	async:false,
	        	success:function(rowData){	
 					var produces = rowData.rows;
 					produceView(produces);
	        	}
	        });	
		}else{
			$.messager.alert('提示','请选择订单','info');
			return;
		}
	}

	function produceView(produces){
        if(produces.length>0){
        	var LODOP=getLodop();  
    		LODOP.PRINT_INIT("生产单打印");
    		LODOP.SET_PRINT_PAGESIZE(1,"220mm","307mm","A4");
    		var	index = 0;	   			
			for(var i=0;i<produces.length;i++){				
				index = createMorePage(LODOP,produces[i],index);			
			}
			initProducePagePublicInfo(LODOP);
					    
			var prints = LODOP.PREVIEW();
			if(prints>0){
				var ids = new Array();       	 
				for(var i=0;i<produces.length;i++){
					var order = produces[i].orderInfo;
					ids.push(order.id);   				
				}
				$.ajax({
		        	url:'<c:url value="/bus/produce/changeProducePrintStatus"/>',
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

	function initProducePagePublicInfo(LODOP){

		var now = new Date();
		var createTime = now.getFullYear()+"-"+((now.getMonth()+1)<10?"0":"")+(now.getMonth()+1)+"-"+(now.getDate()<10?"0":"")+now.getDate();
		LODOP.ADD_PRINT_HTM(14,"5%","50%",14,"打印时间："+createTime);
   	    LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
		LODOP.SET_PRINT_STYLEA(0,"Horient",0);
   	 	
		//LODOP.ADD_PRINT_HTM(14,"80%","50%",14,"<font color='#0000ff' format='ChineseNum'><span tdata='pageNO'>第##页</span>/<span tdata='pageCount'>共##页</span></font>");
		LODOP.ADD_PRINT_HTM(14,"80%","50%",14,"<font color='#0000ff'><span tdata='pageNO'>第##页</span>/<span tdata='pageCount'>共##页</span></font>");
		LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
		LODOP.SET_PRINT_STYLEA(0,"Horient",1);

		LODOP.SET_PRINT_STYLE("FontSize",18);
		LODOP.SET_PRINT_STYLE("Bold",1);
		LODOP.ADD_PRINT_TEXT(40,"87mm",210,39,"${applicationScope.companyLtd}生产单");
		LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
		LODOP.SET_PRINT_STYLEA(0,"Horient",1);

		
		LODOP.ADD_PRINT_TEXT(1085,96,"76.25%",20,"*制作：雨田工作室   *电话：18868384668");
		LODOP.SET_PRINT_STYLEA(0,"FontSize",11);
		//LODOP.SET_PRINT_STYLEA(0,"FontColor","#0000ff");
		LODOP.SET_PRINT_STYLEA(0,"Alignment",2);
		LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
		LODOP.SET_PRINT_STYLEA(0,"Horient",3);
	}

	/*
	   produce 生产单对象
	   index 每一页的索引
	*/
	function createMorePage(LODOP,produce,index){
		var orderProductDtoList = produce.orderProductDtoList;
		for(var i=0;i<orderProductDtoList.length;i++){		
			createOnePage(LODOP,orderProductDtoList[i],produce.orderInfo,index);	
			index = index+4;	
		}
		return index;
	}

	function createOnePage(LODOP,orderProductDto,orderInfo,currRow){

		if($("#produceOrderTable")){
			$("#produceOrderTable").empty();
		} 

		if($("#produceBaseInfo")){
			$("#produceBaseInfo").empty();
		}	

		if($("#productAfterProcessTable")){
			$("#productAfterProcessTable").empty();
		} 

		if($("#productContextTable")){
			$("#productContextTable").empty();
		}

		if(currRow!=0){
			LODOP.NewPageA();	
		}	

		var afterProcessHeight = orderProductDto.afterProcess.length*20 + 40;
		createProductDetial("productContextTable",orderProductDto.orderDetailList);		 		 		
   		LODOP.ADD_PRINT_TABLE(620+afterProcessHeight,"3%","95%",440-afterProcessHeight,document.getElementById("produceContext").innerHTML);
   		LODOP.SET_PRINT_STYLEA(0,"Vorient",3);
   		
		createProduceTableHead(orderInfo,"produceOrderTable"); 
   		LODOP.ADD_PRINT_HTM(86,"3%","95%",60,document.getElementById("produceHead").innerHTML);
   		LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
   		LODOP.SET_PRINT_STYLEA(0,"LinkedItem",1+currRow); 	

   		createProduceBaseInfo(orderProductDto,"produceBaseInfo"); 
   		LODOP.ADD_PRINT_HTM(156,"3%","95%",454,document.getElementById("produceBaseInfo").innerHTML);
   		LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
   		LODOP.SET_PRINT_STYLEA(0,"LinkedItem",1+currRow); 	 	
   			
		createProductAfterProcess("productAfterProcessTable",orderProductDto.afterProcess);
   		LODOP.ADD_PRINT_TABLE(621,"3%","95%",afterProcessHeight+100,document.getElementById("produceAfterProcess").innerHTML);
   		//LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
   		LODOP.SET_PRINT_STYLEA(0,"Vorient",3);
   		//LODOP.SET_PRINT_STYLEA(0,"LinkedItem",1+currRow);

	};	
	
    /************************************  创建生产单的主体内容  ********************************/
	function createProductDetial(detailDiv,orderDetailList){
		var table = $("#"+detailDiv);
        if(orderDetailList.length>0){
        	var tableHead = $("<thead></thead>"); 	
        	tableHead.appendTo(table);
        	var tableHeadTr = $("<tr></tr>"); 	
    		tableHeadTr.appendTo(tableHead);	
    		var tableTds =  $("<td style='width:50px;' >序号</td>"+  
    	    				  "<td style='width:90px;' >产品款号</td>"+   	    				  
    	    				  "<td style='width:90px;' >应产数量</td>"+
    	    				  "<td style='width:90px;' >实产数量</td>"+
    	    				  "<td style='width:50px;' >单位</td>"+
    	    				  "<td style='width:90px;' >大张数量 </td>"+
    	    				  "<td style='width:90px;' >印次 </td>"+
    	    				  "<td style='width:80px;' >备注</td>"); 
    			tableTds.appendTo(tableHeadTr);

   			var tableBody = $("<tbody></tbody>"); 	
   			tableBody.appendTo(table);
    	    for(var g = 0;g<orderDetailList.length;g++){
   		    	 var orderDetailDto = orderDetailList[g];
   	    		 var tableContentTr = $("<tr>"+
   	    									"<td>"+(g+1)+"</td>"+
   											"<td>"+(orderDetailDto.style!=null?formatStr(orderDetailDto.style):'')+"</td>"+
   											"<td>"+orderDetailDto.number+"</td>"+
   											"<td></td>"+		
   											"<td>"+orderDetailDto.unit+"</td>"+
   											"<td>"+orderDetailDto.papers+"</td>"+
   											"<td>"+orderDetailDto.prints+"</td>"+
   											"<td>"+(orderDetailDto.description!=null?formatStr(orderDetailDto.description):'')+"</td>"+											
   										"</tr>");
   	    		 tableContentTr.appendTo(tableBody);
   		    }
        }

	}

	function createProductAfterProcess(detailDiv,afterProcessList){
		var table = $("#"+detailDiv);
		if(afterProcessList.length>0){
			var tableHead = $("<thead></thead>"); 	
        	tableHead.appendTo(table);
        	var tableHeadTr = $("<tr></tr>"); 	
    		tableHeadTr.appendTo(tableHead);	
    		var tableTds = $("<td style='width:90px;' >后道工序</td>"+
    	    				  "<td style='width:50px;' >外协</td>"+
    	    				  "<td style='width:90px;' >应产数量</td>"+
    	    				  "<td style='width:120px;' >工艺要求</td>"+
    	    				  "<td style='width:80px;' >备注</td>"); 
    			tableTds.appendTo(tableHeadTr);

   			var tableBody = $("<tbody></tbody>"); 	
      		tableBody.appendTo(table);
    	    for(var g = 0;g<afterProcessList.length;g++){
   		    	 var afterProcessDto = afterProcessList[g];
   	    		 var tableContentTr = $("<tr>"+
   											"<td>"+afterProcessDto.name+"</td>"+
   											"<td>"+afterProcessDto.isOutsourc+"</td>"+
   											"<td></td>"+		
   											"<td>"+(afterProcessDto.demand!=null?formatStr(afterProcessDto.demand):'')+"</td>"+
   											"<td>"+(afterProcessDto.description!=null?formatStr(afterProcessDto.description):'')+"</td>"+
   										"</tr>");
   	    		 tableContentTr.appendTo(tableBody);
   		    }
	    	
        }
	}
	
	/*****************************************     创建生产单的表头，内容只有订单基本信息         *******************************/
	function createProduceTableHead(order,div){
		var table = $("#"+div);
		if(order){
			 //var table = $("<table width='100%' border='1' cellpadding='0' cellspacing='0'></table>");
    	     //table.appendTo(div);
    	     
			 var tr=$("<tr></tr>");
		     tr.appendTo(table);
		     var td = $("<td>订单编号：<span>"+ order.code +"</span></td>");			 
			 td.appendTo(tr);	
			 td = $("<td>订单类型：<span>"+ order.orderType +"</span></td>");			 
			 td.appendTo(tr);
			 td = $("<td>下单时间：<span>"+ (order.merchandTime!=null?order.merchandTime.substr(0,10):'') +"</span></td>");			 
			 td.appendTo(tr);	

			 tr=$("<tr></tr>");
		     tr.appendTo(table);
		     td = $("<td>订单状态：<span>"+ order.status +"</span></td>");			 
			 td.appendTo(tr);	
			 td = $("<td>制单人：<span>"+ order.createManName +"</span></td>");			 
			 td.appendTo(tr);
			 td = $("<td>制单时间：<span>"+ (order.createTime!=null?order.createTime.substr(0,10):'') +"</span></td>");			 
			 td.appendTo(tr);
			 
			 tr=$("<tr></tr>");
		     tr.appendTo(table);     	
			 td = $("<td  colspan='2'>备注：<span>"+ (order.description!=null?order.description:"") +"</span></td>");	 
			 td.appendTo(tr);
			 td = $("<td>交货时间：<span>"+ (order.receiveTime!=null?order.receiveTime:"") +"</span></td>");			 
			 td.appendTo(tr);
		 }	     
	}

	/** 创建产品基本信息   **/
	function createProduceBaseInfo(orderProductDto,productDiv){
		var productInfo = orderProductDto.productInfo;
		var div = $("<div style='border:1px #ccc solid;margin-top:10px; padding:5px;font-size:12px;line-height:21px;width: 738px;'></div>");		
		div.appendTo($("#"+productDiv));
		var childDiv = $("<div></div>");	
			childDiv.appendTo(div);
			var ul = $("<ul style='list-style:none;font-size:12px;line-height:24px;margin:0;padding:0;font-family:Arial, Helvetica, sans-serif,'宋体';list-style:none;font-size:12px;line-height:24px;'></ul>");
				ul.appendTo(childDiv);
				var url = '';
				if(productInfo.icon){
					url = "<c:url value='/uploads/product/"+ productInfo.icon +"'/>";
				}else{
					ur1 = "<c:url value='/images/no_icon.png'/>";
				}
				var li1 = $("<li style='width:445px;float:left;'><img src='"+ url +"' width='444' height='330'/></li>");
				li1.appendTo(ul);

				var li4 = $("<li style='width:160px;white-space:nowrap;padding-left:10px;float:left;'>"+
						   "<h1 style='font-size:18px;font-weight:bold;padding:0;margin:0;height:28px;line-height:28px;color:#06c;'>"+productInfo.name+"</h1>"+
						   "<span>材&nbsp;&nbsp;质&nbsp;&nbsp;名&nbsp;&nbsp;称:&nbsp;&nbsp;</span>"+(productInfo.material!=null?productInfo.material:'')+"<br />"+			   			               
						   "<span>规&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格:&nbsp;&nbsp;</span>"+(productInfo.spec!=null?productInfo.spec:'')+"<br />"+
			               "<span>开&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数(开):&nbsp;&nbsp;</span>"+(productInfo.openNum!=null?productInfo.openNum:'')+"<br />"+			               
			               "<span>开&nbsp;&nbsp;料&nbsp;&nbsp;尺&nbsp;&nbsp;寸:&nbsp;&nbsp;</span>"+(productInfo.openSize!=null?productInfo.openSize:'')+"<br />"+							

			               "<span>生&nbsp;&nbsp;产&nbsp;&nbsp;机&nbsp;&nbsp;型:&nbsp;&nbsp;</span>"+(productInfo.model!=null?productInfo.model:'')+"<br />"+
			               "<span>工&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;序:&nbsp;&nbsp;</span>"+(productInfo.process!=null?productInfo.process:'')+"<br />"+	
			               "<span>是&nbsp;&nbsp;否&nbsp;&nbsp;外&nbsp;&nbsp;协:&nbsp;&nbsp;</span>"+(productInfo.outsourc?'是':'否')+"<br />"+
			               "<span>拼&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;版:&nbsp;&nbsp;</span>"+(productInfo.layout!=null?productInfo.layout:'')+"<br />"+
			               "<span>拼&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数:&nbsp;&nbsp;</span>"+(productInfo.impos!=null?productInfo.impos:'')+"<br />"+
			               "<span>色&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数(色):&nbsp;&nbsp;</span>"+(productInfo.colors!=null?productInfo.colors:'')+"<br />"+
						   "</li>");
				li4.appendTo(ul); 
				
				var li2 = $("<li style='width:110px;padding-left:10px;float:left;'>"+
							
							"<span>产&nbsp;&nbsp;品&nbsp;&nbsp;编&nbsp;&nbsp;号:&nbsp;&nbsp;</span>"+productInfo.code+"<br />"+
							"<span>菲&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;林:&nbsp;&nbsp;</span>"+(productInfo.film?'是':'否')+"<br />"+
							"<span>透&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;明&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;纸:&nbsp;&nbsp;</span>"+(productInfo.scotch?'是':'否')+"<br />"+
							
			                						  +"</li>"); 
				li2.appendTo(ul);

				 
	
			var clear =$("<div style='clear:both;'></div>"); 		
			clear.appendTo(childDiv);
	    $("<div style='clear:both;'></div>").appendTo(div);
	    $("<div style='clear:both;'></div>").appendTo(div);
	    $("<div style='border-top:1px #ccc dotted;border-bottom:1px #ccc dotted;padding:5px 0;margin:10px 0;'><span>开料方法： </span>"+(productInfo.openMethod!=null?productInfo.openMethod:'')+"</div>").appendTo(div);
	    $("<div style='border-top:1px #ccc dotted;border-bottom:1px #ccc dotted;padding:10px 0;margin:10px 0;'><span>注意事项： </span>"+(productInfo.description!=null?productInfo.description:'')+"</div>").appendTo(div);

	    $("<div style='clear:both;'></div>").appendTo(div);	    
        
	}

</script>