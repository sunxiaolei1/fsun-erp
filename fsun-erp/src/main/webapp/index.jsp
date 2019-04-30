<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/view/resource.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>实时滚动播报</title>
	<script type="text/javascript">
		window.onload=function clockon(){
		    var now = new Date();
		    var year = now.getYear()+1900;
		    var month = now.getMonth();
		    var date = now.getDate();
		    var day = now.getDay();
		    var hour = now.getHours();
		    var minu = now.getMinutes();
		    var sec = now.getSeconds();
		    var week;
		    month = month+1;
		    if(month<10)month="0"+month;
		    if(date<10)date="0"+date;
		    if(hour<10)hour="0"+hour;
		    if(minu<10)minu="0"+minu;
		    if(sec<10)sec="0"+sec;
		    var arr_week = new Array("星期日","星期一","星期二","星期三","星期四","星期五","星期六");
		    week = arr_week[day];
		    var time = "";
		    time = year+"年"+month+"月"+date+"日"+week+""+hour+";"+minu+";"+sec;
		    if($(".word_Green"))
		    {
		    	var myClass = $(".word_Green");//bgclock.innerHTML="["+time+"]";
		    	for(var i=0;i<myClass.length;i++){
		    		var first = myClass[i];
			    	first.value = "i="+ (i+1) +";"+time;
			    }  	
		    }
		    setTimeout(clockon,200);	            
		};
	</script>
</head>
<body>
	<div id="wrap2" class="wrap">
		<div id="bgclock" style="width:1000px;height:30px;">   
		   	<input type="text" class="word_Green"  readonly="readonly" style="width:250px;color:#E8A02B;background-color:olive;border:1px solid;"></input>
		</div>
		<div id="bgclock1" style="width:1000px;height:30px;">
			<input type="button" class="word_Green"  disabled="disabled" readonly="readonly" style="width:250px;color:#E8A02B;background-color:red;border:1px solid;"></input>
		</div>
		<div id="bgclock2" style="width:1000px;height:30px;">
			<input type="button" class="word_Green"  readonly="readonly" style="width:250px;color:#E8A02B;background-color:olive;"></input>
		</div>
		<div id="bgclock3" style="width:1000px;height:30px;">
			<input type="button" class="word_Green"  readonly="readonly" style="width:250px;color:#E8A02B;background-color:red;"></input>
		</div>
		<div id="bgclock4" style="width:1000px;height:30px;">
			<input type="button" class="word_Green"  readonly="readonly" style="width:250px;color:#E8A02B;background-color:red;"></input>
		</div>
		<div id="bgclock5" style="width:1000px;height:30px;">
			<input type="button" class="word_Green"  readonly="readonly" style="width:250px;color:#E8A02B;background-color:red;"></input>
		</div>
		<div id="bgclock6" style="width:1000px;height:30px;">
			<input type="button" class="word_Green"  readonly="readonly" style="width:250px;color:#E8A02B;background-color:olive;"></input>
		</div>
		<div id="bgclock7" style="width:1000px;height:30px;">
			<input type="button" class="word_Green"  readonly="readonly" style="width:250px;color:#E8A02B;background-color:olive;"></input>
		</div>
		<div id="bgclock8" style="width:1000px;height:30px;">
			<input type="button" class="word_Green"  readonly="readonly" style="width:250px;color:#E8A02B;background-color:olive;"></input>
		</div>
		<div id="bgclock9" style="width:1000px;height:30px;">
			<input type="button" class="word_Green"  readonly="readonly" style="width:250px;color:#E8A02B;background-color:red;"></input>
		</div>
		<div id="bgclock10" style="width:1000px;height:30px;">
			<input type="button" class="word_Green"  readonly="readonly" style="width:250px;color:#E8A02B;background-color:olive;"></input>
		</div>
	</div>
	<script type="text/javascript">
    $(function() {
        var count = 6;
        $('#wrap2').marquee({
            auto: true,
            interval: 0,	
            speed: 6000,
            showNum: count,
            stepLen: count,
            type: 'vertical'
        });
    })
</script>
	
</body>
</html>