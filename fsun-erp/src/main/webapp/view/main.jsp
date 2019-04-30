<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>${applicationScope.titleName}</title>

<%@include file="/view/resource.jsp"%>
<link rel="stylesheet" href="<c:url value='/css/main.css'/>" />
<!--<script type="text/javascript" src="<c:url value='/js/commons/DivWindow.js'/>"></script>  -->
<script type="text/javascript">

function openProfile(){

	//$('#openProfileDiv').html("<iframe fit=true width='100%' height='100%' frameborder=0 scrolling=auto src='<%=request.getContextPath()%>/bus/overview/toVideo'></iframe>");
	//$('#openProfileDiv').window('open');

	
 	 //var a = new DivWindow("videoWindow","公司简介",588,400,"<iframe fit=true width='100%' height='100%' frameborder=0 scrolling=auto src='<%=request.getContextPath()%>/bus/overview/toVideo'></iframe>");
    // a.setPopupTopBgColor("black","blue","white","white","black");
     //a.open();
 }


$(document).ready(function () {
	
	var node;
    /*child_button_obj用于保存导航菜单目录下的被选中的子目录下的对象*/
	var child_button_obj = null;
	function freshChildButtons(obj){
		if(obj!=null){
			obj[0].style.backgroundColor = "#D6D6D6";
       	}
	}

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
    		//var html1 = '<ul><li class="button"><div class="l-img">'+imgStr+'</div><a href="javascript:void(0)" class="green" hidefocus="true">'+obj.text+'</a></li>';
    		var html1 = '<ul><li class="button"><div class="l-img">'+imgStr+'</div><a href="javascript:void(0)" class="green" hidefocus="true"><font color="#000000">'+obj.text+'</font></a></li>';   		
			if(parentUrl){
				html1 = '<ul><li class="copybutton"><div class="l-img">'+imgStr+'</div><a class="unit" color="#000000" target="content-frame" hidefocus="true" href="'+parentUrl+'">'+obj.text+'</a></li>';
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
    				var html2='<li class="child_button" style="background-color:#D6D6D6"><div class="l-img">'+imgStr+'</div><a class="unit" target="content-frame" hidefocus="true" href="'+url+'">'+o.text+'</a></li>';
    				header=header+html2;
    	    	}
    			html1 = html1+header+"</ul></li>";
    		}
    		
    		one_li.innerHTML=html1+"</ul>";
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
		    var buttons = $(".button");
		    for(var i=0;i<buttons.length;i++){
				var button = buttons[i];
				button.childNodes[1].childNodes[0].color = "#000000";
			}
		   
			
	    	$(this)[0].childNodes[1].childNodes[0].color = "#FFFFFF";  	
	    	removeCss();
	    	$(this).addClass("onbutton");
	    	var dropDown = $(this).next();
	        $('.dropdown').not(dropDown).slideUp('slow');
	        dropDown.slideToggle('slow');
            if(child_button_obj!=null){
            	var ichilds = (dropDown[0].children)[0].children;
            	for(var i = 0;i<ichilds.length;i++){
            		var  ch = ichilds[i].children[1];
                   if(ichilds[i].children[1].text==child_button_obj.text()){
                      return;
                   }
                }
    	        freshChildButtons(child_button_obj); 			
            }
	        e.preventDefault();
	    });
	    
	    $('li.copybutton').live('click', function(e) {
	    	freshChildButtons(child_button_obj);
	    	var buttons = $(".button");
		    for(var i=0;i<buttons.length;i++){
				var button = buttons[i];
				button.childNodes[1].childNodes[0].color = "#000000";
			}	    		    	
	    	removeCss();
	    	$(this).addClass("onbutton");
	    	$('.dropdown').slideUp('slow');
	    });

	    
	    $('li.child_button').live('click', function(e) {
		    if(child_button_obj!=null){
		    	child_button_obj[0].style.backgroundColor = "#D6D6D6";	    	    	
		    }
		    child_button_obj = $(this);
	    	child_button_obj[0].style.backgroundColor = "#FFFFFF";	
	    });
	    
	    $('.unit').live('click', function(e) {
	    	var unitText = $(this).text();
	    	var data = node;
	    	for (var i=0;i<data.length;i++){
	    		if(unitText == data[i].text){
					var bread = '<img src="images/home-ico.png" /><a href="<c:url value="/bus/overview/manage"/>" onclick="recover();" target="content-frame" hidefocus="true">首页</a> <span class="st">&gt;</span>&nbsp;' 
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
	    					var bread = '<img src="images/home-ico.png" /><a href="<c:url value="/bus/overview/manage"/>" onclick="recover();" target="content-frame" hidefocus="true">首页</a> <span class="st">&gt;</span>&nbsp;' 
		    					+ parentBread +'<span>'+o.text+'</span>';
	    					document.getElementById("bread-div").innerHTML = bread;
	    				}
	    	    	}
	    		}
	    	}
	    });

});

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
					
					<!-- <a href="javascript:void(openProfile())" hidefocus="true">公司简介</a> -->
					欢迎 [<span class="orange"><sec:authentication property="principal.displayName"/></span>]登录系统
					&nbsp;&nbsp; <a href="javascript:void(0)" onclick="changePassword()" hidefocus="true">修改密码</a>
					| <a href="<c:url value="/j_spring_security_logout"/>" id="loginOut" hidefocus="true">退出</a>
				</div>
			</div>
		</div>
		<div region="south" split="false" style="overflow:hidden">
			<div class="footer">Copyright(C) &nbsp 2013-2014 &nbsp  ${applicationScope.systemName}  </div>
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
					<img src="images/home-ico.png" /><a target="content-frame">首页</a>
				</div>
				<div class="main-bg" data-options="region:'center',border:false">
					<iframe id="content-frame" name="content-frame" width="100%"
						height="100%" src="<c:url value="/bus/overview/manage"/>" frameborder="no"> </iframe>
				</div>
			</div>
		</div>
	
	
	
	
	
	<div id="openRoleDiv" class="easyui-window" title="修改密码" closed="true"style="display:none;width:330px;height:230px;top:100px;" modal="true">
		<form id="fm" method="post">
			<table id="password-table"align="center" border="0"   cellpadding="5"   cellspacing="5">
				<tr >
		            <td>&nbsp;&nbsp;<span style="color: red">*</span>旧密码：</td>
		            <td><input type="password"name="password"id="password"  required="true" class="easyui-validatebox"/></td>
		        </tr> 
	            <tr >
	            	<td>&nbsp;&nbsp;<span style="color: red">*</span>新密码：</td>
	            	<td><input type="password" name="newPassword" id="password1" required="true" class="easyui-validatebox"/></td>
	            </tr>
	            <tr >
	            	<td><span style="color: red">*</span>确认密码：</td>
	            	<td><input type="password" name="repassword" id="repassword1" disable=true required="true" class="easyui-validatebox"  validType="equalTo['#password1']" invalidMessage="两次输入密码不匹配"/></td>
	            </tr>
    		</table>
    		<div style="padding:20px;text-align:center;">  
                <a  class="easyui-linkbutton" icon="icon-ok" onclick="editPassword()" hidefocus="true">保存</a>  
                <a  class="easyui-linkbutton" icon="icon-cancel"onclick="closeWin()" hidefocus="true">取消</a>  
         	</div> 
		</form>
	</div>
	
	
	<div id="openProfileDiv" class="easyui-window" title="公司简介" closed="true"style="display:none;width:600px;height:430px;top:100px;" modal="true">

	</div>
	
	
	<script type="text/javascript">
	
		function recover(){
			var bread = '<img src="images/home-ico.png" /><a>首页</a>';
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
			    $('#fm')[0].reset();
	    		$('#openRoleDiv').window('open');
	    }
	
	   
	 function editPassword(){
	     	var password = $('#password').val();
	    	var newPassword = $('#password1').val();
	    	var newPassword1 = $('#repassword1').val();	 
	    	
	    	//验证   	
    		if (!$("#fm").form('validate')){
    			return;
    		}
	     	$.ajax({
                url: '<c:url value="/sys/user/changePwd"/>',
                data: {password:password,newPassword:newPassword},
                dataType:'json',
                success: function(result) {
                	$('#openRoleDiv').window('close');
                	if(result.success){
	                	$.messager.alert('提示','修改密码成功!','info');
                	}else{
                		$.messager.alert('提示','修改密码失败!','info');
                	}
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
	    }


		$(function(){
			$("#openRoleDiv").show();
			$("#openProfileDiv").show();		
		})
		
	</script>
	
</body>
</html>
