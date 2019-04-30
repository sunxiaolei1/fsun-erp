<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

		
<div id="madeContentDiv" style="display:none;margin:0 auto" >
	<table id="madeContentTable" cellSpacing=0 cellPadding=0 width="100%" height="auto" >
	    <tr>
	    	<td>
				<table id="madeHeaderTable" style='border-right:1px solid #ccc;border-bottom:1px solid #ccc'
					 cellSpacing=0 cellPadding=0 width="100%" height="auto"></table>
	    	</td>
	    </tr>
		<tr>
	    	<td>
	    		<div id="productInfoDiv"></div>
	    	</td>
	    </tr>	
		<tr>
	    	<td>
	    		<div id="madeProcessDetailDiv"></div>
	    	</td>
	    </tr>
	    <tr>
	    	<td>	 
				<table id="madePackageTable" style='border-right:1px solid #ccc;border-bottom:1px solid #ccc' 
					cellSpacing=0 cellPadding=0 width="100%" height="auto"></table>	 		
	    	</td>
	    </tr>
	</table>
</div>

<script type="text/javascript">	

var css_border = "style='border-left:1px solid #ccc;border-top:1px solid #ccc;'";
var css_content_process_border = "style='border-left:1px solid #ccc;border-top:1px solid #ccc;color:#FF6699;'";
var css_content_afterProcess_border = "style='border-left:1px solid #ccc;border-top:1px solid #ccc;color:#259ff2;'";
var css_table_border = "style='border-right:1px solid #ccc;border-bottom:1px solid #ccc;margin:2px;'";

/**
 * 打印生产单(用于快捷下单中的打印操作)
 */
function printMadeOrder(madeCode, succToUrl){
	
   	$.ajax({
     	url:'<c:url value="/bus/madeOrder/getMadePrints" />',
     	dataType: "json",
     	data: {madeCode:madeCode},
     	success:function(rowData){
     		if(rowData.success){
  				var madePrintsDto =  rowData.rows;	
  				if(madePrintsDto!=null){
  			    	var LODOP = getLodop();  
  					LODOP.PRINT_INIT("生产单打印");
  					LODOP.SET_PRINT_PAGESIZE(1,"220mm","307mm","A4");  						
  					
  					//根据产品创建生产单页
  					createMorePage(LODOP,madePrintsDto,0);			
  					//初始化公共区域内容
  					initPagePublicInfo(LODOP);
  							
  					if (LODOP.CVERSION) {  //用CVERSION属性判断是否云打印
  				        LODOP.On_Return=function(TaskID,Value){
  			               if (Value!=0) {
  			            	   var headerData = madePrintsDto.madeHeaderDto;
  			       			   $.ajax({
  				       	        	url:'<c:url value="/bus/madeOrder/signPrint"/>',
  				       	        	dataType: "json",
  				       	        	data:{madeCode:headerData.madeCode},
  				       	        	async:false,
  				       	        	success:function(rowData){
  				       	        	    MessageBox.closeLoading();
  				       	        		window.location.href = succToUrl;
  				       	        	}
  				       	       });	
  			               }else{
  			            	 	MessageBox.closeLoading();
  			            	 	window.location.href = succToUrl;
  			               }
  				        };
  				        LODOP.PREVIEWA();
  					}else{
  						var prints = LODOP.PREVIEW();
  	  					if(prints>0){
  	  						var headerData = madePrintsDto.madeHeaderDto;
  	  						$.ajax({
  	  				        	url:'<c:url value="/bus/madeOrder/signPrint"/>',
  	  				        	dataType: "json",
  	  				        	data:{madeCode:headerData.madeCode},
  	  				        	async:false,
  	  				        	success:function(rowData){
  	  				        	    MessageBox.closeLoading();
  	  				        		window.location.href = succToUrl;
  	  				        	}
  	  				        });	
  	  					}else{
  	  						MessageBox.closeLoading();
  	  						window.location.href = succToUrl;
  	  					}
  					}	
  			    }else{
  			    	MessageBox.closeLoading();
  			    	$.messager.alert('提示',"单据无法获取!",'info');
  			    } 	       			
     		}else{
     			MessageBox.closeLoading();
     			$.messager.alert('提示',"单据打印失败!",'info');
     		}
     	}
    });
   	
}

//制作打印生产单
function printMades(){
	var rows = detailGird.datagrid("getSelections");
   	if(rows!=null && rows.length==1){
   		$.ajax({
   	       	url:'<c:url value="/bus/madeOrder/getMadePrints" />',
   	       	dataType: "json",
   	       	data: {madeCode:rows[0].madeCode},
   	       	success:function(rowData){
   	       		if(rowData.success){
   	    			var madePrintsDto =  rowData.rows;	
   	    			madeOrderView(madePrintsDto); 	       			
   	       		}
   		
   	       	}
   	    });
   	}else{
   		$.messager.alert('提示',"请选择一个生产单!",'info');
   	}
}

/**
 * 展示生产单
 */
function madeOrderView(madePrintsDto){
    if(madePrintsDto!=null){
    	var LODOP = getLodop();  
		LODOP.PRINT_INIT("生产单打印");
		LODOP.SET_PRINT_PAGESIZE(1,"220mm","307mm","A4");  						
		
		//根据产品创建生产单页
		createMorePage(LODOP,madePrintsDto,0);			
		//初始化公共区域内容
		initPagePublicInfo(LODOP);
				
		if (LODOP.CVERSION) {  //用CVERSION属性判断是否云打印
	        LODOP.On_Return=function(TaskID,Value){
               if (Value!=0) {
            	   var headerData = madePrintsDto.madeHeaderDto;
       			   $.ajax({
	       	        	url:'<c:url value="/bus/madeOrder/signPrint"/>',
	       	        	dataType: "json",
	       	        	data:{madeCode:headerData.madeCode},
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
			var headerData = madePrintsDto.madeHeaderDto;
			$.ajax({
	        	url:'<c:url value="/bus/madeOrder/signPrint"/>',
	        	dataType: "json",
	        	data:{madeCode:headerData.madeCode},
	        	async:false,
	        	success:function(rowData){	
	        		flushDataGrid();
	        	}
	        });	
		}
		
    }
}



/*
   madePrintsDto 生产单对象
   index 每一页的索引
*/
function createMorePage(LODOP,madePrintsDto,index){
	$.each(madePrintsDto.madePrintDetailDtos,function(){
		createOnePage(LODOP,this,madePrintsDto.madeHeaderDto,index);	
		index++;
	});
	return index;
}

function createOnePage(LODOP,madePrintDetailDto,madeHeaderDto,currRow){

	if($("#madePackageTable")){
		$("#madePackageTable").empty();
	}
	
	if($("#madeHeaderTable")){
		$("#madeHeaderTable").empty();
	} 

	if($("#productInfoDiv")){
		$("#productInfoDiv").empty();
	}	

	if($("#madeProcessDetailDiv")){
		$("#madeProcessDetailDiv").empty();
	} 


	if(currRow!=0){
		LODOP.NewPageA();	
	}	

	var processDetailHeight = madePrintDetailDto.madeProcessDetailLength*35 + 40;
	createMadeHeaderTable(madeHeaderDto,"madeHeaderTable"); 
	createProductInfo(madePrintDetailDto.productInfo,"productInfoDiv"); 
	createPackageTable("madePackageTable",madePrintDetailDto.madePackageDtos);		 		 		
	createProcessDetail("madeProcessDetailDiv",madePrintDetailDto.madeProcessDetailDtos);	
	LODOP.ADD_PRINT_HTM(86,"3%","95%","90%",document.getElementById("madeContentDiv").innerHTML);
	LODOP.SET_PRINT_STYLEA(0,"Vorient",3);
 
};

/**
 * 初始化公共区域内容
 */
function initPagePublicInfo(LODOP){

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

	
	///LODOP.ADD_PRINT_TEXT(1085,96,"76.25%",20,"*制作：雨田工作室   *电话：18868384668");
	///LODOP.SET_PRINT_STYLEA(0,"FontSize",11);
	//LODOP.SET_PRINT_STYLEA(0,"FontColor","#0000ff");
	///LODOP.SET_PRINT_STYLEA(0,"Alignment",2);
	///LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
	///LODOP.SET_PRINT_STYLEA(0,"Horient",3);
}

/************************************  创建生产单的主体内容  ********************************/
function createPackageTable(detailDiv,madePackageDtos){
	
	var table = $("#"+detailDiv);
    if(madePackageDtos.length>0){
    	var tableHead = $("<thead></thead>"); 	
    	tableHead.appendTo(table);
    	var tableHeadTr = $("<tr></tr>"); 	
		tableHeadTr.appendTo(tableHead);	
		var tableTds =  $("<td width='40px' "+ css_border +" >序号</td>"+  
	    				  "<td width='90px' "+ css_border +" >产品款号</td>"+   	    				  
	    				  "<td width='70px' "+ css_border +" >订单数量</td>"+
	    				  "<td width='40px' "+ css_border +" >拼版</td>"+
	    				  "<td width='70px' "+ css_border +" >包装数量</td>"+
	    				  "<td width='40px' "+ css_border +" >单位</td>"+
	    				  "<td width='80px' "+ css_border +" >签字 </td>"+
	    				  "<td width='100px' "+ css_border +" >备注</td>"); 
			tableTds.appendTo(tableHeadTr);

			var tableBody = $("<tbody></tbody>"); 	
			tableBody.appendTo(table);
	    for(var g = 0;g<madePackageDtos.length;g++){
		    	 var madePackageDto = madePackageDtos[g];
	    		 var tableContentTr = $("<tr>"+
	    									"<td "+ css_border +">"+(g+1)+"</td>"+
											"<td "+ css_border +">"+(madePackageDto.style!=null?formatStr(madePackageDto.style):'')+"</td>"+
											"<td "+ css_border +">"+ madePackageDto.orderNumber +"</td>"+
											"<td "+ css_border +"></td>"+
											"<td "+ css_border +"></td>"+
											"<td "+ css_border +">"+ madePackageDto.unit +"</td>"+
											"<td height=25px "+ css_border +"></td>"+		
											"<td "+ css_border +">"+(madePackageDto.description!=null?formatStr(madePackageDto.description):'')+"</td>"+														
										"</tr>");
	    		 tableContentTr.appendTo(tableBody);
		    }
    }

}

/**
 * 创建生产工艺明细
 */
function createProcessDetail(detailDiv,madeProcessDetailDtos){
	var processDetailDiv = $("#"+detailDiv);
	if(madeProcessDetailDtos.length>0){
		
		$.each(madeProcessDetailDtos, function(){
			
			var oneProcessDiv = $("<div width='100%' height='100%' style='margin-top:10px;margin-bottom:10px;'></div>");
			oneProcessDiv.appendTo(processDetailDiv);
			//创建制作、印刷工艺
			createMadeDetail(oneProcessDiv,this.madeDetailDto);
			
			//创建后道工序明细
			crateMadeProcess(oneProcessDiv, this.madeProcessDtos);
		});
	}
	
}

/**
 * 创建制作、印刷工艺
 */
function createMadeDetail(oneProcessDiv,madeDetailDto){
	if(madeDetailDto){
		var table = $("<table "+ css_table_border +" cellSpacing=0 cellPadding=0 width='99%' height='auto'></table>");
		table.appendTo(oneProcessDiv);
		
		var tableHead = $("<thead></thead>"); 	
		tableHead.appendTo(table);
		var tableHeadTr = $("<tr></tr>"); 	
		tableHeadTr.appendTo(tableHead);	
		var tableTds = $( "<td width='120px' "+ css_border +" >产品名称</td>"+
	    				  "<td width='120px' "+ css_border +" >材质名称 </td>"+  
	    				  "<td width='50px' "+ css_border +" >规格</td>"+
	    				  "<td width='50px' "+ css_border +" >开数</td>"+
	    				  "<td width='70px' "+ css_border +" >开料尺寸</td>"+
	    				  "<td width='70px' "+ css_border +" >大张数量</td>"+
	    				  "<td width='70px' "+ css_border +" >印张总数</td>"); 
			tableTds.appendTo(tableHeadTr);

		var tableBody = $("<tbody></tbody>"); 	
		tableBody.appendTo(table);
		var tableContentTr = $("<tr>"+
									"<td "+ css_content_process_border +">"+ (madeDetailDto.style!=null?formatStr(madeDetailDto.style):'') +"</td>"+
									"<td "+ css_content_process_border +">"+ (madeDetailDto.material!=null?formatStr(madeDetailDto.material):'') +"</td>"+	
									"<td "+ css_content_process_border +">"+ (madeDetailDto.spec!=null?formatStr(madeDetailDto.spec):'')+"</td>"+
									"<td "+ css_content_process_border +">"+ (madeDetailDto.openNum!=null?madeDetailDto.openNum:'')+"</td>"+
									"<td "+ css_content_process_border +">"+ (madeDetailDto.openSize!=null?formatStr(madeDetailDto.openSize):'')+"</td>"+
									"<td "+ css_content_process_border +">"+ (madeDetailDto.papers!=null?madeDetailDto.papers:'')+"</td>"+
									"<td "+ css_content_process_border +">"+ (madeDetailDto.prints!=null?madeDetailDto.prints:'')+"</td>"+
								"</tr>");
		tableContentTr.appendTo(tableBody);
		
		
		var table = $("<table "+ css_table_border +" cellSpacing=0 cellPadding=0 width='99%' height='auto'></table>");
		table.appendTo(oneProcessDiv);
		
		var tableHead = $("<thead></thead>"); 	
		tableHead.appendTo(table);
		var tableHeadTr = $("<tr></tr>"); 	
		tableHeadTr.appendTo(tableHead);	
		var tableTds = $( "<td width='80px' "+ css_border +" >生产机型</td>"+
	    				  "<td width='40px' "+ css_border +" >工序 </td>"+  
	    				  "<td width='70px' "+ css_border +" >印刷方式</td>"+
	    				  "<td width='40px' "+ css_border +" >色数</td>"+
	    				  "<td width='40px' "+ css_border +" >拼数</td>"+
	    				  "<td width='70px' "+ css_border +" >印刷数量</td>"+
	    				  "<td width='70px' "+ css_border +" >印张净数</td>"+
	    				  "<td width='40px' "+ css_border +" >印损</td>"+
	    				  "<td width='100px' "+ css_border +" >备注</td>"); 
			tableTds.appendTo(tableHeadTr);

		var tableBody = $("<tbody></tbody>"); 	
		tableBody.appendTo(table);
		var tableContentTr = $("<tr>"+
									"<td "+ css_content_process_border +">"+ (madeDetailDto.model!=null?formatStr(madeDetailDto.model):'') +"</td>"+
									"<td "+ css_content_process_border +">"+ (madeDetailDto.process!=null?madeDetailDto.process:'') +"</td>"+	
									"<td "+ css_content_process_border +">"+ (madeDetailDto.layout!=null?madeDetailDto.layout:'')+"</td>"+
									"<td "+ css_content_process_border +">"+ (madeDetailDto.colors!=null?madeDetailDto.colors:'')+"</td>"+
									"<td "+ css_content_process_border +">"+ (madeDetailDto.impos!=null?madeDetailDto.impos:'')+"</td>"+
									"<td "+ css_content_process_border +">"+ (madeDetailDto.expects!=null?madeDetailDto.expects:'')+"</td>"+
									"<td "+ css_content_process_border +">"+ (madeDetailDto.actuals!=null?madeDetailDto.actuals:'')+"</td>"+
									"<td "+ css_content_process_border +">"+ (madeDetailDto.loss!=null?madeDetailDto.loss:'')+"</td>"+
									"<td "+ css_content_process_border +">"+ (madeDetailDto.description!=null?formatStr(madeDetailDto.description):'')+"</td>"+
								"</tr>");
		tableContentTr.appendTo(tableBody);
	   
	}
}

/**
 * 创建后道工序明细
 */
function crateMadeProcess(oneProcessDiv, madeProcessDtos){
	if(madeProcessDtos.length>0){
		var table = $("<table "+ css_table_border +" cellSpacing=0 cellPadding=0 width='99%' height='auto'></table>");
		table.appendTo(oneProcessDiv);
		
		var tableHead = $("<thead></thead>"); 	
		tableHead.appendTo(table);
		var tableHeadTr = $("<tr></tr>"); 	
		tableHeadTr.appendTo(tableHead);	
		var tableTds = $(" <td width='70px' "+ css_border +" >后道工序</td>"+
	    				  "<td width='50px' "+ css_border +" >外协方</td>"+  
	    				  "<td width='120px' "+ css_border +" >工艺要求</td>"+
	    				  "<td width='70px' "+ css_border +" >应产数量</td>"+
	    				  "<td width='70px' "+ css_border +" >实际数量</td>"+
	    				  "<td width='100px' "+ css_border +" >签字</td>"); 
			tableTds.appendTo(tableHeadTr);

		var tableBody = $("<tbody></tbody>"); 	
			tableBody.appendTo(table);
	    for(var g = 0;g<madeProcessDtos.length;g++){
	    	 var madeProcessDto = madeProcessDtos[g];
			 var tableContentTr = $("<tr>"+
										"<td "+ css_content_afterProcess_border +">"+ madeProcessDto.name +"</td>"+
										"<td "+ css_content_afterProcess_border +">"+ (madeProcessDto.outsourcer!=null?madeProcessDto.outsourcer:'') +"</td>"+	
										"<td "+ css_content_afterProcess_border +">"+ (madeProcessDto.demand!=null?formatStr(madeProcessDto.demand):'')+"</td>"+
										"<td "+ css_content_afterProcess_border +">"+ (madeProcessDto.number!=null?madeProcessDto.number:'') +"</td>"+	
										"<td "+ css_content_afterProcess_border +"></td>"+	
										"<td height='25px' "+ css_content_afterProcess_border +"></td>"+
									"</tr>");
			 tableContentTr.appendTo(tableBody);
	    }
	}
	
}

/*****************************************     创建生产单的表头，内容只有订单基本信息         *******************************/
function createMadeHeaderTable(madeHeaderDto,div){
	var table = $("#"+div);
	if(madeHeaderDto){
		 //var table = $("<table width='100%' border='1' cellpadding='0' cellspacing='0'></table>");
	     //table.appendTo(div);
	     
		 var tr=$("<tr></tr>");
	     tr.appendTo(table);
	     var td = $("<td "+ css_border +">生产单号：<span>"+ madeHeaderDto.madeCode +"</span></td>");			 
		 td.appendTo(tr);	
		 td = $("<td "+ css_border +">订单类型：<span>"+ madeHeaderDto.madeTypeName +"</span></td>");			 
		 td.appendTo(tr);
		 td = $("<td "+ css_border +">单据状态：<span>"+ madeHeaderDto.madeStatus +"</span></td>");			 
		 td.appendTo(tr);	

		 tr=$("<tr></tr>");
	     tr.appendTo(table);
	     td = $("<td "+ css_border +">订单编号：<span>"+ (madeHeaderDto.orderCode!=null?madeHeaderDto.orderCode:'') +"</span></td>");			 
		 td.appendTo(tr);
		 td = $("<td "+ css_border +">制单人：<span>"+ madeHeaderDto.createManName +"</span></td>");			 
		 td.appendTo(tr);
		 td = $("<td "+ css_border +">制单时间：<span>"+ (madeHeaderDto.createTime!=null?madeHeaderDto.createTime.substr(0,10):'') +"</span></td>");			 
		 td.appendTo(tr);
		
	 }	     
}

/** 创建产品基本信息   **/
function createProductInfo(productInfo,productDiv){
	var div = $("<div style='border:0px #ccc solid;margin-top:10px; padding:5px;font-size:12px;line-height:21px;width: 737px;'></div>");		
	div.appendTo($("#"+productDiv));
		var ul = $("<ul style='list-style:none;font-size:12px;line-height:24px;margin:0;padding:0;font-family:Arial, Helvetica, sans-serif,'宋体';'></ul>");
			ul.appendTo(div);
			var url = '';
			if(productInfo.icon){
				url = "<c:url value='/uploads/product/"+ productInfo.icon +"'/>";
			}else{
				ur1 = "<c:url value='/images/no_icon.png'/>";
			}
			var li1 = $("<li style='width:540px;float:left;'><img src='"+ url +"' width='540' height='380'/></li>");
			li1.appendTo(ul);

			var li4 = $("<li style='width:180px;white-space:nowrap;padding-left:10px;float:left;'>"+
					   "<h1 style='font-size:18px;font-weight:bold;padding:0;margin:0;height:28px;line-height:28px;color:#06c;'>"+(productInfo.name.getLength()>18?productInfo.name.getSub(15):productInfo.name)+"</h1>"+
					   "<span>产&nbsp;&nbsp;品&nbsp;&nbsp;编&nbsp;&nbsp;号:&nbsp;&nbsp;</span>"+productInfo.code+"<br />"+
					   "<span>材&nbsp;&nbsp;质&nbsp;&nbsp;名&nbsp;&nbsp;称:&nbsp;&nbsp;</span>"+(productInfo.material!=null?(productInfo.material.getLength()>20?productInfo.material.getSub(18):productInfo.material):'')+"<br />"+			   			               
					   "<span>规&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格:&nbsp;&nbsp;</span>"+(productInfo.spec!=null?productInfo.spec:'')+"<br />"+
		               "<span>开&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数(开):&nbsp;&nbsp;</span>"+(productInfo.openNum!=null?productInfo.openNum:'')+"<br />"+			               
		               "<span>开&nbsp;&nbsp;料&nbsp;&nbsp;尺&nbsp;&nbsp;寸:&nbsp;&nbsp;</span>"+(productInfo.openSize!=null?productInfo.openSize:'')+"<br />"+							

		               "<span>生&nbsp;&nbsp;产&nbsp;&nbsp;机&nbsp;&nbsp;型:&nbsp;&nbsp;</span>"+(productInfo.model!=null?productInfo.model:'')+"<br />"+
		               "<span>工&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;序:&nbsp;&nbsp;</span>"+(productInfo.film?'菲林':(productInfo.process!=null?productInfo.process:''))+"<br />"+	
		               "<span>是&nbsp;&nbsp;否&nbsp;&nbsp;外&nbsp;&nbsp;协:&nbsp;&nbsp;</span>"+(productInfo.outsourc?'是':'否')+"<br />"+	               
		               "<span>印&nbsp;&nbsp;刷&nbsp;&nbsp;方&nbsp;&nbsp;式:&nbsp;&nbsp;</span>"+(productInfo.layout!=null?productInfo.layout:'')+"<br />"+
		               "<span>拼&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数:&nbsp;&nbsp;</span>"+(productInfo.impos!=null?productInfo.impos:'')+"<br />"+
		               "<span>色&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数(色):&nbsp;&nbsp;</span>"+(productInfo.colors!=null?productInfo.colors:'')+"<br />"+

		               "</li>");
			li4.appendTo(ul); 
			 
		//var clear =$("<div style='clear:both;'></div>"); 	
		//clear.appendTo(childDiv);
    	//$("<div style='border-top:1px #ccc dotted;border-bottom:1px #ccc dotted;padding:5px 0;margin:5px 0;'><span>注意事项： </span>"+(productInfo.description!=null?productInfo.description:'')+"</div>").appendTo(div);    
    
}

</script>