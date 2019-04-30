<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--简介-->
<div class="movie-info" style="width: 750px;">
    <div class="movie-info-top">
	     <ul class="movie-info-ul">
		    <li class="li1">		    
		    <c:choose>
		    	<c:when test="${product.icon != null && product.icon!=''}">
		    		<img src='<c:url value="/uploads/product/${product.icon}"/>' onclick="downloadPicture('/uploads/product/${product.icon}','${product.name}')" width="180" height="170"/>
		    	</c:when>
		    	<c:otherwise>
		    		 <img src="<c:url value='/images/no_icon.png'/>" width="180" height="170"/>
		    	</c:otherwise>
		    </c:choose>
		    </li>
		    <li class="li2">
			   <h1>${product.name}</h1>
			   <span>产&nbsp;&nbsp;品&nbsp;&nbsp;编&nbsp;&nbsp;号:&nbsp;&nbsp;</span>${product.code}<br />
			   <span>菲&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;林:&nbsp;&nbsp;</span>${product.isFilm}<br />
               <span>透&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;明&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;纸:&nbsp;&nbsp;</span>${product.isScotch}<br />  
           </li>            
		   <li class="li3">			   
               <span>材&nbsp;&nbsp;质&nbsp;&nbsp;名&nbsp;&nbsp;称:&nbsp;&nbsp;</span>${product.material}<br />
               <span>规&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格:&nbsp;&nbsp;</span>${product.spec}<br />
               <span>开&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数(开):&nbsp;&nbsp;</span>${product.openNum}<br />            
               <span>开&nbsp;&nbsp;料&nbsp;&nbsp;尺&nbsp;&nbsp;寸:&nbsp;&nbsp;</span>${product.openSize}<br />			
           </li>
           <li class="li4">			   
               <span>生&nbsp;&nbsp;产&nbsp;&nbsp;机&nbsp;&nbsp;型:&nbsp;&nbsp;</span>${product.model}<br />               
               <span>工&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;序:&nbsp;&nbsp;</span>${product.process}<br />	
			   <span>是&nbsp;&nbsp;否&nbsp;&nbsp;外&nbsp;&nbsp;协:&nbsp;&nbsp;</span>${product.isOutsourc}<br />
			   <span>拼&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;版:&nbsp;&nbsp;</span>${product.layout}<br />
			   <span>拼&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数:&nbsp;&nbsp;</span>${product.impos}<br />
               <span>色&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数(色):&nbsp;&nbsp;</span>${product.colors}<br />		
           </li>		 
		 </ul>
		 <div class="clear"></div>		 
	</div>
	<div class="clear"></div>
	<div class="jianjie" style ="padding:10px 0;"><span>产品款号： </span><input id ='product_style' style="width: 680px;text-align:left; border-left:0px;border-top:0px;border-right:0px;border-bottom:1px;"/></div>
	<div class="jianjie" style ="padding:10px 0;"><span>开料方法： </span>${product.openMethod}</div>
	<div class="jianjie"><span>注意事项： </span>${product.description}</div>
		
	<div class="clear"></div>
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
	<div class="clear"></div>
</div>

<script type="text/javascript">	

	$(function() {
		$("#product_style", $('#detailForm-${rowIndex}')).val(formatStr('${product.style}',80));
		$("#product_process",$('#detailForm-${rowIndex}')).val(formatStr('${product.process}',14));
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

	function downloadPicture(filePath,name){
		window.location.href = '<c:url value="/bus/product/downloadPicture?filePath='+ encodeURI(encodeURI(filePath))+'&name='+ encodeURI(encodeURI(name)) +'"/>';
	}  
	
</script>
