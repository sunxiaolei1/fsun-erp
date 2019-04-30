<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="x-ua-compatible" content="ie=7"/>
<meta name="Keywords" content="" />
<meta name="Description" content="" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/user_login.css'/>" />
<title>${applicationScope.titleName}</title>

</head>

<body onload="checkFrame()">

<div class="wrapper">
     <div class="logo"></div> 
     <div class="content">
	      <div class="login">
		       <form action="<c:url value="j_spring_security_check"/>" method="post">
			         <div><input type="text" class="user1" name="j_username"  value="" onMouseOver="this.className='user2'" onMouseOut="this.className='user1'" />
			         </div>
			         <div><input type="password" name="j_password" value="" class="password1" onMouseOver="this.className='password2'" onMouseOut="this.className='password1'"/></div>
					 <div><img class="yzm-img" title="点击刷新验证码" 
											src="<c:url value="/ImageServlet?time=new Date().getTime()"/>" onclick="this.src = this.src + '?'"/><input type="text" name="j_checkcode" class="yzm1" onMouseOver="this.className='yzm2'" onMouseOut="this.className='yzm1'" size="5"/>
					 </div>
					 
					 <div><input name="提交" type="submit" class="btn" value="登录 Login" onfocus="this.blur()"/>
					 </div>
			   </form>
		  </div>	 
	 </div>
	 <div class="footer">Copyright(C) &nbsp 2013-2014 &nbsp  ${applicationScope.systemName} </div>
</div>

<script type="text/javascript">
	
	<c:if test="${param.error=='true'}">
		<c:if test="${param.checkCode=='error'}">
			alert("验证码错误！");
		</c:if>
		<c:if test="${param.checkCode!='error'}">
			alert("<c:out value='${sessionScope.SPRING_SECURITY_LAST_EXCEPTION.message}'/>");
		</c:if>
	</c:if>
	
	function checkFrame(){
		
		if(self.frameElement && self.frameElement.tagName=="IFRAME"){
			this.parent.document.location.href = this.document.location.href;
		}
	}
	</script>
</body>
</html>
