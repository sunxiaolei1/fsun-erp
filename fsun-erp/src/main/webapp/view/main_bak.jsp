<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>闪龙科技-VDI云管理平台</title>

<%@include file="/view/resource.jsp"%>
<script type="text/javascript"
	src="<c:url value='js/ajax-pushlet-client.js'/>"></script>
<link rel="stylesheet" href="<c:url value='/css/main.css'/>" />


<style type="text/css">
#winpop { width:200px; height:100px; position:absolute;z-index:9900100999999;right:5px; bottom:5px; border:1px solid #999999; margin:0; padding:1px; overflow:hidden; display:none; background:url(http://www.niutw.com/images/bg.png) #FFFFFF}
#winpop .title { width:100%; height:20px; line-height:20px; background:#FFCC00; font-weight:bold; text-align:center; font-size:12px;}
#winpop .con {word-wrap: break-word; width:100%; height:80px;overflow-y:auto; line-height:20px; font-weight:bold; font-size:12px; color:#FF0000; text-decoration:underline; text-align:center}
#silu { font-size:13px; color:#999999; position:absolute; right:0; text-align:right; text-decoration:underline; line-height:22px;}
.close { position:absolute; right:4px; top:-1px; color:#FFFFFF; cursor:pointer}
</style>
<script type="text/javascript">
function tips_pop(){
	var MsgPop=document.getElementById("winpop");//获取窗口这个对象,即ID为winpop的对象
	var popH=parseInt(MsgPop.style.height);//用parseInt将对象的高度转化为数字,以方便下面比较
	if (popH==0){         //如果窗口的高度是0
		MsgPop.style.display="block";//那么将隐藏的窗口显示出来
		show=setInterval("changeH('up')",2);//开始以每0.002秒调用函数changeH("up"),即每0.002秒向上移动一次
	}
	else{         //否则
		var MsgPop=document.getElementById("winpop");
		MsgPop.style.height=0;//那么窗口的高度减少4个象素 
		MsgPop.style.display="none";  //因为窗口有边框,所以还是可以看见1~2象素没缩进去,这时候就把DIV隐藏掉
	}
}
function changeH(str) {
	var MsgPop=document.getElementById("winpop");
	var popH=parseInt(MsgPop.style.height);
	if(str=="up"){     //如果这个参数是UP
		if (popH<=100){    //如果转化为数值的高度小于等于100
			MsgPop.style.height=(popH+4).toString()+"px";//高度增加4个象素
		}
		else{
			clearInterval(show);//否则就取消这个函数调用,意思就是如果高度超过100象度了,就不再增长了
		}
	}
}

</script>


<script type="text/javascript">
$(document).ready(function () {
	
	var node;
    $.post('<c:url value='/sys/menu/listMyTree'/>',
	   function(data){
    	node=data[0].children;
    	var ul = document.getElementById("myul");
    	var one = data[0].children;
    	for (var i=0;i<one.length;i++)
    	{
    		var obj = one[i];
    		var one_li = document.createElement("li");
    		one_li.className="caidan";
    		var ficon = obj.icon;
			var fimageFile =  ficon ;
			var imgStr = '';
			if(fimageFile){
				imgStr = '<img class="item-img" src="'+fimageFile+'"/>';
			}
			var parentUrl = obj['attributes'].url;
    		var html1 = '<ul><li class="button"><div class="l-img">'+imgStr+'</div><a href="javascript:void(0)" class="green" hidefocus="true">'+obj.text+'</a></li>';
			if(parentUrl){
				html1 = '<ul><li class="copybutton"><div class="l-img">'+imgStr+'</div><a class="unit" target="content-frame" hidefocus="true" href="'+parentUrl+'">'+obj.text+'</a></li>';
			}
			
    		
    		var children = one[i].children;
    		if(children && children.length>0){
    			var header = '<li class="dropdown" style="display: none;"><ul>';
    			for (var j=0;j<children.length;j++)
    	    	{
    				var o = children[j];
    				var url = o.attributes['url'];
    				var icon = o.icon;
					var imgStr = '';
    				if(icon){
    					imgStr = '<img class="item-img" src="'+icon+'"/>';
    				}
    				var html2='<li><div class="l-img">'+imgStr+'</div><a class="unit" target="content-frame" hidefocus="true" href="'+url+'">'+o.text+'</a></li>';
    				header=header+html2;
    	    	}
    			html1 = html1+header+"</ul></li></ul>";
    		}
    		
    		one_li.innerHTML=html1;
    		ul.appendChild(one_li);
    	}
	   }, "json");
	    
    	function removeCss(){
    		$('li.button').each(function(){
	    		$(this).removeClass("onbutton");
	    	})
	    	$('li.copybutton').each(function(){
	    		$(this).removeClass("onbutton");
	    	})
    	}
    
	    $('li.button').live('click', function(e) {
	    	removeCss();
	    	$(this).addClass("onbutton");
	    	var dropDown = $(this).next();
	        $('.dropdown').not(dropDown).slideUp('slow');
	        dropDown.slideToggle('slow');
	        e.preventDefault();
	    });
	    
	    $('li.copybutton').live('click', function(e) {
	    	removeCss();
	    	$(this).addClass("onbutton");
	    	$('.dropdown').slideUp('slow');
	    });
	    
	    $('.unit').live('click', function(e) {
	    	var unitText = $(this).text();
	    	var data = node;
	    	for (var i=0;i<data.length;i++){
	    		if(unitText == data[i].text){
					var bread = '<img src="images/home-ico.png" /><a href="/vdi/view/main.jsp" onclick="recover();" target="content-frame" hidefocus="true">首页</a> <span class="st">&gt;</span>&nbsp;' 
    					+ '<span>'+data[i].text+'</span>';
					document.getElementById("bread-div").innerHTML = bread;
					return;
					
				}
	    		var children = data[i].children;
	    		if(children && children.length>0){
	    			for (var j=0;j<children.length;j++)
	    	    	{
	    				var o = children[j];
	    				if(unitText == o.text){
	    					var parentBread = getParentBread(data[i]);
	    					var bread = '<img src="images/home-ico.png" /><a href="/view/main.jsp" onclick="recover();" target="content-frame" hidefocus="true">首页</a> <span class="st">&gt;</span>&nbsp;' 
		    					+ parentBread +'<span>'+o.text+'</span>';
	    					document.getElementById("bread-div").innerHTML = bread;
	    				}
	    	    	}
	    		}
	    	}
	    });
});

//定时刷新
PL._init();
PL.joinListen('/source/event');  //事件标识 在数据源中引用
function onData(event) {
	var MsgPop=document.getElementById("winpop");//获取窗口这个对象,即ID为winpop的对象
	var popH=parseInt(MsgPop.style.height);//用parseInt将对象的高度转化为数字,以方便下面比较
	var isDisplay=MsgPop.style.display;//用parseInt将对象的高度转化为数字,以方便下面比较
	if (isDisplay == 'none'){         //如果窗口的高度是0
		show=setInterval("changeH('up')",2);//开始以每0.002秒调用函数changeH("up"),即每0.002秒向上移动一次
		MsgPop.style.display="block";//那么将隐藏的窗口显示出来
	}
	var con = document.getElementById("con");//获取窗口这个对象,即ID为winpop的对象
	var msg = '<p>' + event.get("msg") + '</p>';
	var insertText = con.innerHTML + msg;
	con.innerHTML = insertText;
	/* var length = document.getElementById('con').getElementsByTagName("p").length;
	if(length>10){
		
	} */
} 
</script>
</head>
<body class="easyui-layout" style="overflow-y: hidden" scroll="no">
	<noscript>
		<div
			style="position: absolute; z-index: 100000; height: 2046px; top: 0px; left: 0px; width: 100%; background: white; text-align: center;">
			<img src="images/noscript.gif" alt='抱歉，请开启脚本支持！' />
		</div>
	</noscript>
	<div class="ui-header"
		data-options="region:'north',split:false,border:false"
		style="overflow: hidden;">
		<h1></h1>
		<div class="ui-login">
			<div class="ui-login-info">
				欢迎 [<span class="orange"><sec:authentication property="principal.displayName"/></span>]登录系统
				&nbsp;&nbsp; <a href="javascript:void(0)" onclick="changePassword()" hidefocus="true">修改密码</a>
				| <a href="<c:url value="/j_spring_security_logout"/>" id="loginOut" hidefocus="true">退出</a>
			</div>
		</div>
	</div>
	<div id="winpop" style="height:0px;display:none;">
			<div class="title">您有新的消息<span class="close" onclick="tips_pop()">X</span></div>
			<div id="con" class="con">
			</div>
		</div>
	<div region="south" split="false" style="overflow:hidden">
		<div class="footer">
		Copyright(C)  2012-2013  浙江闪龙科技有限公司
		</div>
	</div>
	<div region="west" hide="true" split="fasle" title="导航菜单"
		style="width: 180px;" id="west">
		<div id="nav" class="easyui-accordion" fit="true" border="false" style="overflow-y:auto;">
			<ul class="" id="myul"></ul>
			<!--  
			<div title="系统设置" data-options="iconCls:'icon-sys',selected:true"
				style="overflow: auto; padding: 10px;">
				<ul id="menu-tree"></ul>
			</div>
			<div title="个人设置" data-options="iconCls:'icon-sys'"
				style="padding: 10px;">
		        <ul class="" id="myul2">
		            <li class="caidan">
		                <ul>
		                    <li class="button"><a id="good" class="green" href="#">菜单一<span></span></a></li>
		                    <li class="dropdown">
		                        <ul>
		                            <li><a href="#">链接一</a></li>
		                            <li><a href="#">链接二</a></li>
		                            <li><a href="#">链接三</a></li>
		                            <li><a href="#">链接四</a></li>
		                        </ul>
		                    </li>
		                </ul>
		            </li>
		            <li class="caidan">
		                <ul>
		                    <li class="button"><a class="orange" href="#">菜单二<span></span></a></li>
		                    <li class="dropdown">
		                        <ul>
		                            <li><a href="#">链接一</a></li>
		                            <li><a href="#">链接二</a></li>
		                            <li><a href="#">链接三</a></li>
		                        </ul>
		                    </li>
		                </ul>
		            </li>
		            <li class="caidan">
		                <ul>
		                    <li class="button"><a class="blue" href="#">菜单三<span></span></a></li>
		                    <li class="dropdown">
		                        <ul>
		                            <li><a href="#">链接一</a></li>
		                            <li><a href="#">链接二</a></li>
		                            <li><a href="#">链接三</a></li>
		                            <li><a href="#">链接四</a></li>
		                        </ul>
		                    </li>
		                </ul>
		            </li>
			     </ul>
			</div>-->
			
		</div>
	</div>
	<div data-options="region:'center',border:false" class="inner-content">
		<div class="easyui-layout" data-options="fit:true,border:false">
			<div id="bread-div" class="bread" data-options="region:'north',border:false">
				<img src="images/home-ico.png" /><a href="/vdi/view/bus/overview/manage.jsp"
					target="content-frame">首页</a>
			</div>
			<div class="main-bg" data-options="region:'center',border:false">
				<iframe id="content-frame" name="content-frame" width="100%"
					height="100%" src="view/bus/overview/manage.jsp" frameborder="no"> </iframe>
			</div>
		</div>
	</div>
	
	<div id="openRoleDiv" class="easyui-window" title="修改密码" closed="true"style="width:330px;height:230px;top:100px;">
		<form id="fm" method="post">
			<table id="password-table"align="center" border="0"   cellpadding="5"   cellspacing="5">
				<tr >
		            <td>&nbsp;&nbsp;旧密码：</td>
		            <td><input type="password"name="password"id="password"  required="true" class="easyui-validatebox"/></td>
		        </tr> 
	            <tr >
	            	<td>&nbsp;&nbsp;新密码：</td>
	            	<td><input type="password" name="newPassword" id="password1" required="true" class="easyui-validatebox"/></td>
	            </tr>
	            <tr >
	            	<td>确认密码：</td>
	            	<td><input type="password" name="repassword" id="repassword1" disable=true required="true" class="easyui-validatebox"  validType="equalTo['#password1']" invalidMessage="两次输入密码不匹配"/></td>
	            </tr>
    		</table>
    		<div style="padding:20px;text-align:center;">  
                <a  class="easyui-linkbutton" icon="icon-ok" onclick="editPassword()" hidefocus="true">保存</a>  
                <a  class="easyui-linkbutton" icon="icon-cancel"onclick="closeWin()" hidefocus="true">取消</a>  
         	</div> 
		</form>
	</div>
	
	<script type="text/javascript">
	
		function recover(){
			var bread = '<img src="images/home-ico.png" /><a href="/vdi/view/main.jsp" target="content-frame">首页</a>';
			document.getElementById("bread-div").innerHTML = bread;
		}
	
		function getParentBread(node){
			var result = '';
			if(node){
				if(node.attributes.url){
					result = '<a href="'+node.attributes.url+'">'+node.text+'</a> <span class="st">&gt;</span>&nbsp;'+result;
				}else{
					result = node.text+' <span class="st">&gt;</span>&nbsp;'+result;
				}
			}
			return result;
		}
		
		  $.extend($.fn.validatebox.defaults.rules, {   
		        /*必须和某个字段相等*/
		        equalTo: { 
		            validator:function(value,param){ 
		                return $(param[0]).val() == value; 
		            }, 
		            message:'字段不匹配'
		        } 
		                
		    });
	
		  
		  function changePassword(){
	    		$('#openRoleDiv').window('open');
	    }
	
	   
	 function editPassword(){
	     	var password = $('#password').val();
	    	var newPassword = $('#password1').val();
	    	var newPassword1 = $('#repassword1').val();
	     	$.ajax({
                url: '<c:url value="/sys/user/changePwd"/>',
                data: {password:password,newPassword:newPassword} ,
                success: function(result) {
                	$('#openRoleDiv').window('close');
                	$.messager.alert('提示','修改密码成功!','info');
                	$('#fm').form('clear');
                    }
            }); 
	    	/* $('#fm').form('submit',{  
                url: '<c:url value="/sys/user/changePwd"/>',  
                success: function(result){
                	closeWin();
                	$.messager.alert('提示','修改密码成功!','info');
                	//$('#fm').form('clear');
                }
            }); */
            
	    }
	 
	 
	 
	 function closeWin(){
	    	$('#openRoleDiv').window('close');
	    	$('#fm').form('clear');
	    }
		
	</script>	
</body>
</html>
