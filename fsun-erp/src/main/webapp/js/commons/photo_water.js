var isOk=false;

$(function(){
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
			maxwidth=15;
			if(getLenght($(this).text())>maxwidth){ 
				$(".explain_open").css("display","block");
				$(this).text($(this).text().substring(0,maxwidth)); 
				$(this).html($(this).html()+'……');
			}
		}); 
	}else{
		$(".wait_photo p a").each(function(){ 
			maxwidth=12; if(getLenght($(this).text())>maxwidth){ 
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
function loadimg(){
	if(!isOk){
		isOk=true;
		for(var i=0;i<10;i++){
			var text=" <li class='photo_li"+index_photo+"'><a><img src="<c:url value='/images/1.gif'/>" /></a> <p> " +
			 		" <span> <a ><img src="<c:url value='/images/header-bg.jpg'/>" style='width: 24px; height: 24px;'>" +
			 		"</a>  <a >我的作品</a><br /> </span> </p> </li>";
			$(".wait_photo li").last().after(text);
			getPhotoIndex();
		}
		
		$(".wait_photo .photo_li"+index_photo).slideToggle(1500);
		index_photo++;
		imgHover();
		
		setTimeout("iSPhoto()",1000);
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