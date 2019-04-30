<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--简介-->
<div style="border:1px #ccc solid;padding:15px;font-size:12px;line-height:21px;width: 738px;">
    <div>
	     <ul style="list-style:none;font-size:12px;line-height:24px;margin:0;padding:0;font-family:Arial, Helvetica, sans-serif,'宋体';">
		    <li style="width:185px;float:left;">		    
		    <c:choose>
		    	<c:when test="${product.icon != null && product.icon!=''}">
		    		<img src='<c:url value="/uploads/product/${product.icon}"/>' onclick="downloadPicture('/uploads/product/${product.icon}','${product.name}')" width="180" height="170"/>
		    	</c:when>
		    	<c:otherwise>
		    		 <img src="<c:url value='/images/no_icon.png'/>" width="180" height="170"/>
		    	</c:otherwise>
		    </c:choose>
		    </li>
		    <li style="width:165px;padding-left:15px;float:left;">
			   <h1 style="font-size:18px;font-weight:bold;padding:0;margin:0;height:28px;line-height:28px;color:#06c;">${product.name}</h1>
			   <span>产&nbsp;&nbsp;品&nbsp;&nbsp;编&nbsp;&nbsp;号:&nbsp;&nbsp;</span>${product.code}<br />
			   <span>菲&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;林:&nbsp;&nbsp;</span>${product.isFilm}<br />
               <span>透&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;明&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;纸:&nbsp;&nbsp;</span>${product.isScotch}<br />  
               <div class="noPrint">  
                	<br />            
               		<a href="#" class="easyui-linkbutton" style="font-size: 18px" iconCls="icon-edit" plain="true" onclick="openPrintView(${rowIndex});">
	               		<span style="color:#CC3399;">打印预览</span>
	                </a>	
               </div>       
            </li>            
			<li style="width:165px;white-space:nowrap;padding-left:15px;float:left;">			   
               <span>材&nbsp;&nbsp;质&nbsp;&nbsp;名&nbsp;&nbsp;称:&nbsp;&nbsp;</span>${product.material}<br />
               <span>规&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格:&nbsp;&nbsp;</span>${product.spec}<br />
               <span>开&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数(开):&nbsp;&nbsp;</span>${product.openNum}<br />            
               <span>开&nbsp;&nbsp;料&nbsp;&nbsp;尺&nbsp;&nbsp;寸:&nbsp;&nbsp;</span>${product.openSize}<br />	
   			</li>	
			<li style="width:168px;white-space:nowrap;padding-left:15px;float:left;">			   
               <span>生&nbsp;&nbsp;产&nbsp;&nbsp;机&nbsp;&nbsp;型:&nbsp;&nbsp;</span>${product.model}<br />               
               <span>工&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;序:&nbsp;&nbsp;</span>${product.process}<br />	
			   <span>是&nbsp;&nbsp;否&nbsp;&nbsp;外&nbsp;&nbsp;协:&nbsp;&nbsp;</span>${product.isOutsourc}<br />
			   <span>拼&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;版:&nbsp;&nbsp;</span>${product.layout}<br />
			   <span>拼&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数:&nbsp;&nbsp;</span>${product.impos}<br />
               <span>色&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数(色):&nbsp;&nbsp;</span>${product.colors}<br />
			</li>		 
		 </ul>
    	 <div style="clear:both;"></div>		 
	</div>
	<div style="clear:both;"></div>
	<div style ="border-top:1px #ccc dotted;border-bottom:1px #ccc dotted;padding:10px 0;margin:10px 0;"><span>产品款号： </span><input id ='product_style' value="${product.style}"  style="width: 650px;text-align:left; border-left:0px;border-top:0px;border-right:0px;border-bottom:1px;"/></div>
	<div style ="border-top:1px #ccc dotted;border-bottom:1px #ccc dotted;padding:10px 0;margin:10px 0;"><span>开料方法： </span>${product.openMethod}</div>
	<div style="border-top:1px #ccc dotted;border-bottom:1px #ccc dotted;padding:15px 0;margin:10px 0;"><span>注意事项： </span>${product.description}</div>
		
	<div style="clear:both;"></div>
	<table width="100%" style="font-size:medium;" border="1" cellpadding="0" cellspacing="0">
		<tr>
			<td style="width:90px;" >后道工序</td>	
			<td style="width:50px;" >外协</td>			
			<td style="width:150px;" >工艺要求</td>			
			<td style="width:150px;" >备注</td>		
		</tr>
		<c:forEach var="afterProcessDto" items="${afterProcessList.afterProcessDtoList}"
			begin="0" end="${afterProcessList.size}" step="1">
			<tr>
				<td>${afterProcessDto.name}</td>
				<td>${afterProcessDto.isOutsourc}</td>		
				<td>${afterProcessDto.demand}</td>
				<td>${afterProcessDto.description}</td>
			</tr>
		</c:forEach>		
	</table>
	<div style="clear:both;"></div>
	<br>
	<h2 align="center" style="font-size: 17;padding-bottom:1px">产品交易记录</h2>
</div>

	<table width="100%" style="font-size:medium;" border="1" cellpadding="0" cellspacing="0">
		<tr>
			<td style="width:38px;">序号</td>
			<td style="width:90px;" >产品款号</td>	
			<td style="width:154px;" >客户名称</td>			
			<td style="width:75px;" >订单类型</td>			
			<td style="width:80px;">交货时间</td>
			<td style="width:80px;">订单编号</td>
			<td style="width:80px;">数量</td>
			<td style="width:38px;">单位</td>			
		</tr>
		<c:forEach var="transactionDto" items="${transactionList.transactionDtoList}" varStatus="status"
			begin="0" end="${transactionList.size}" step="1">
			<tr>
				<td><c:out value="${status.index+1}" /></td>
				<td>${transactionDto.style}</td>
				<td>${transactionDto.customerName}</td>
				<td>${transactionDto.orderType}</td>			
				<td>${transactionDto.receiveTime}</td>
				<td>${transactionDto.code}</td>
				<td>${transactionDto.number}</td>
				<td>${transactionDto.unit}</td>
			</tr>
		</c:forEach>		
	</table>
<script type="text/javascript">

	$(function() {
		//$("#product_style").val(formatStr('${product.style}',90));
		//$("#product_process").val(formatStr('${product.process}',17));
	});

	//逗号分隔的字符串长度格式化
	function formatStr(str,value){
		if(str.length>value){
			var list = str.split(",");
			var ss=0;
			for(var i=0;i<list.length;i++){
				if((ss+list[i].length)<value){
					ss = ss+list[i].length+1;
				}else{
					return str.substring(0, ss)+"...";							
				}
				
			}
		}
		return str;
	}

	function openPrintView(index){
		var LODOP=getLodop();  
		LODOP.SET_SHOW_MODE("NP_NO_RESULT",true);
		LODOP.PRINT_INIT("产品详情打印");
		LODOP.SET_PRINT_PAGESIZE(1,"220mm","307mm","A4");		
		CreateOneFormPage(LODOP,index);
		LODOP.PREVIEW();	
	};   
	function CreateOneFormPage(LODOP,index){
		LODOP.NewPage();	
		
		LODOP.SET_PRINT_STYLEA(0,"Vorient",3);
		//var str = '<link rel="stylesheet" href="<c:url value='/css/style.css'/>"  media="all" />';
		//str += '<style type="text/css">.noPrint {display:none;}</style>';
	    var str = '<style type="text/css">.noPrint {display:none;}</style>';
		LODOP.ADD_PRINT_HTM(88,'6mm',"90%",900,str+document.getElementById("detailForm-"+index).innerHTML);

		LODOP.ADD_PRINT_HTM(14,"80%","50%",14,"<font color='#0000ff'><span tdata='pageNO'>第##页</span>/<span tdata='pageCount'>共##页</span></font>");
		LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
		LODOP.SET_PRINT_STYLEA(0,"Horient",1);
		
		LODOP.SET_PRINT_STYLE("FontSize",18);
		LODOP.SET_PRINT_STYLE("Bold",1);
		LODOP.ADD_PRINT_TEXT(40,"36%",280,39,"${applicationScope.companyLtd}产品详情");
		LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
		LODOP.SET_PRINT_STYLEA(0,"LinkedItem",1);
		
		LODOP.SET_PRINT_STYLE("FontName","隶书");
		LODOP.SET_PRINT_STYLE("FontSize",12);
		LODOP.SET_PRINT_STYLE("Bold",1);	
		LODOP.ADD_PRINT_TEXT("275mm","150mm","50mm","10mm","制作: 雨田工作室   电话: 18868384668");
		LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
		LODOP.SET_PRINT_STYLEA(0,"LinkedItem",1);
		
	};	

	function downloadPicture(filePath,name){
		window.location.href = '<c:url value="/bus/product/downloadPicture?filePath='+ encodeURI(encodeURI(filePath))+'&name='+ encodeURI(encodeURI(name)) +'"/>';
	}  
	
</script>

