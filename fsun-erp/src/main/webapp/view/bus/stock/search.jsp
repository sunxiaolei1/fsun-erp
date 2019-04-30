<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<title>高级搜索</title>
<link rel="stylesheet" href="<c:url value='/css/image_search.css'/>" />
<link rel="stylesheet" href="<c:url value='/js/lightbox-2.7.1/css/lightbox.css'/>" />
<script type="text/javascript"  src="<c:url value='/js/jquery-easyui/jquery-1.8.0.min.js'/>"></script>
<script type="text/javascript"  src="<c:url value='/js/lightbox-2.7.1/js/lightbox.js'/>"></script>
<!--<script type="text/javascript"  src="<c:url value='/js/commons/photo_water.js'/>"></script>-->
<script type="text/javascript" >
var isOk=false;

$(function(){

	if(${fn:length(stockBases)}>0){
		$('.float_action_div').show();
	}else{
		$('.float_action_div').hide();
	}

	$('.up-btn').click(function(){
		$('html,body').animate({ scrollTop: 0 }, 500);
	})
	
	$('.down-btn').click(function(){
		//$('html,body').scrollTop( $('.content')[0].scrollHeight );
		//$('html,body').animate({ scrollTop: $('.wait_photo')[0].scrollHeight }, 500);
		$('html,body').animate({scrollTop:$('.wait_photo li').last().offset().top}, 500);
	})
	
	getPhotoIndex();
	imgHover();
	var li=$(".wait_photo").find('li');
	li.slideToggle(1200);
});

$(window).resize(function(){
	getPhotoIndex();
});

var index_photo=1;

$(window).scroll(function(){ 
						  
	/*if($(document).height() - $(this).scrollTop() - $(this).height()<19){
		var allSize_s=$("#allSize_s").val();
		if(index_photo<5 && allSize_s >15 ){
			$("#laode_photo").show();
			showFoot();
		}
	}*/
	
	if($(document).height() - $(this).scrollTop() - $(this).height()<20 ){
		loadimg();
	}
	
}); 

function getPhotoIndex(){
	
	var li=$(".wait_photo").find('li');
	
	for(var i=0;i<li.length;i++){
		if(i%30 == 0 || i%30 == 6 || i%30 == 12 || i%30 == 15 || i%30 == 21 || i%30 == 27){
			li.eq(i).addClass("page_photo");
			li.eq(i).find("img").addClass("phototop");
			var src=li.eq(i).find("img").attr("src").replace(/m10/,"m0");
			li.eq(i).find("img").eq(0).attr("src",src);
		}else if(i%30 == 9 || i%30 == 13 || i%30 == 24 || i%30 == 28 ){
			var img_top=li.eq(i).find("img").height();
			if(screen.width <=1024){
				img_top=img_top+5;
			}
			li.eq(i).css("margin-top","-"+img_top+"px");
		}else if( i%30 == 14 || i%30 == 29){
			var img_left=li.eq(i).find("img").width()+10;
			var img_top=li.eq(i).find("img").height();
			if(screen.width <=1024){
				img_top=img_top+4;
			}
			li.eq(i).css({"margin-left": img_left+"px","margin-top":"-"+img_top+"px"});
		}else if(i%30 == 12 || i%30 == 27){
			li.eq(i).css("height","454px");
		}
	}
	
	if((screen.width  >=  1024)){
		$(".wait_photo p a").each(function(){ 
			maxwidth=25;
			if(getLenght($(this).text())>maxwidth){ 
				$(".explain_open").css("display","block");
				$(this).text($(this).text().substring(0,maxwidth)); 
				$(this).html($(this).html()+'……');
			}
		}); 
	}else{
		$(".wait_photo p a").each(function(){ 
			maxwidth=22; if(getLenght($(this).text())>maxwidth){ 
				$(".explain_open").css("display","block");
				$(this).text($(this).text().substring(0,maxwidth)); 
				$(this).html($(this).html()+'……');
			}
		}); 
	}
	
}

function imgHover(){
	
	$('.wait_photo li img').hover(function(){
		var $this = $(this);
		$this.stop().animate({'opacity':'0.8','top':'0px','left':'0px'});
	},function(){
		var $this = $(this);
		$this.stop().animate({'opacity':'1.0','top':'-66.5px','left':'-150px'});
	});
	
}

var number=0;
var show = true;
function loadimg(){	
	if(!isOk && ${fn:length(stockBases)}==10 && show){
		isOk=true;
		jQuery.getJSON('<c:url value="/bus/stock/getStockBases-'+(index_photo+1)+'-10"/>', null, function(result) {
         	if(result.success){
         		var stocks = result.rows;
         		if(stocks.length==10){
         			show = true;
             	}else{
             		show = false;
                }
         		for(var i=0;i<stocks.length;i++){
             		if(stocks[i].image!=null && stocks[i].image!=''){
             			var text=" <li class='photo_li"+index_photo+"'><a href='<c:url value='/bus/stock/returnManage-"+ stocks[i].id +"'/>' ><img src='<c:url value='/uploads/product/"+ stocks[i].image +"'/>' /></a> <p> " +
    			 		" <span> <a data-lightbox='group' href='<c:url value='/uploads/product/"+ stocks[i].image +"'/>' ><img src='<c:url value='/images/image_search/icons/store-search.png'/>' style='width: 24px; height: 24px;'>" +
    			 		"</a>  <a href='javascript:void(0)' title='产品："+ stocks[i].name +"【货号："+ (stocks[i].artNum!=null?stocks[i].artNum:'无') +"；所属客户："+ (stocks[i].customerName!=null?stocks[i].customerName:'无') +"】'>"+ 
    			 			stocks[i].name+"-["+ (stocks[i].artNum!=null?stocks[i].artNum:'') +"]/"+ (stocks[i].customerName!=null?stocks[i].customerName:'') +
    			 		"</a><br /> </span> </p> </li>";
		    			$(".wait_photo li").last().after(text);
		    			getPhotoIndex();
                 	}     			
        		}
         		$(".wait_photo .photo_li"+index_photo).slideToggle(1500);
        		index_photo++;
        		imgHover();
        		
        		setTimeout("iSPhoto()",1000);
            }
         });
	}
}

function iSPhoto(){
	isOk=false
}

function getLenght(str){
	entryVal=str;
	entryLen=entryVal.length;
	var cnArr=[];
	for(var i=0;i<entryVal.length;i++){
		if(entryVal.charCodeAt(i)>255){//遍历判断字符串中每个字符的Unicode码,大于255则为中文
			cnArr.push(entryVal[i]);//讲符合条件的值插入到中文字符数组中
		}
	}
	entryLen+=cnArr.length;
	return entryLen;
}
</script>
</head>
<body>

<div class="float_tool_div">
	<a href='<c:url value="/bus/stock/manage"/>' >返回列表</a>
</div>

<div class="float_action_div" style="display:none">
	<a class="up-btn"></a>
	<a class="down-btn"></a>
</div>
<div class="head-title">
	<span>高级搜索</span>
</div>
<div class="wait_photo">
	<ul>
		<c:forEach items="${stockBases}" var="stockBase">
			<c:if test="${not empty stockBase.image }">
				<li>
				<a href='<c:url value="/bus/stock/returnManage-${stockBase.id}"/>'><img src="<c:url value='/uploads/product/${stockBase.image }'/>" /></a>
				<p>
					<span>
						<a data-lightbox="group" href="<c:url value='/uploads/product/${stockBase.image }'/>" ><img alt="" src="<c:url value='/images/image_search/icons/store-search.png'/>" style="width:24px;height:24px;" /></a>
						<a href="javascript:void(0)" title="产品：${stockBase.name }【货号：${not empty stockBase.artNum?stockBase.artNum:'无'}；所属客户：${not empty stockBase.customerName?stockBase.customerName:'无'}】">
							${stockBase.name }-[${stockBase.artNum}]/${stockBase.customerName}
						</a>
					</span>
				</p>
			</li>
			</c:if>
		</c:forEach>		
	</ul>
</div>	
</body>
</html>