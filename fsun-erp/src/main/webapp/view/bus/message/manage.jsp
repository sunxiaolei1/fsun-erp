<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/view/resource.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<style type="text/css">
.textField{text-align:right;}
.table-new{font-size:12px;}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>消息管理</title>
<link rel="stylesheet" href="<c:url value='/css/main.css'/>" />
</head>
<body class="easyui-layout">
<!-- Search panel start -->
	<div id="searchbar" class="ui-search-panel" region="center" style="height:65px;;padding:5px 5px;"
		title="授权"
		data-options="striped: true,collapsible:false,iconCls:'icon-search',border:false">
			<div  style="position:relative;top:150px;">	
				<div>
					<center style="padding-top:10px">						
				    	<label class="bigTextTitle">请输入消息报告</label>							    	
				    </center>
				</div>	
				<div>
					<center style="padding-top:10px">								
				    	<input type="text" value="" id="message" name="message" class="bigText" />				    	
				    </center>
				</div>
				<div>
					<center style="padding-top:10px">	
				    	<input type="button" class="search-btn" value="发送" onMouseOver="this.className='on-search-btn'" onMouseOut="this.className='search-btn'" onfocus="this.blur()" onclick="javascript:register()"/>					    					
				    	<input type="button" class="reset-btn" value="清空" onMouseOver="this.className='on-reset-btn'" onMouseOut="this.className='reset-btn'" onfocus="this.blur()" onclick="javascript:reset()" />
				    </center>
				</div>
			</div>		
	</div>
	<!--  Search panel end -->
	<!-- DataList  -->
	<div id="win" class="easyui-window" title="注册信息" closed="true" align="center" style="width:600px;height:400px;top:100px;" buttons="#dlg-buttons" modal="true">  
    	 <form id="fm2" method="post"> 
    	 <table border="0"  class="table-new"  cellpadding="5"   cellspacing="5">
    	 	<tr>
    	 		<td class="textField">
    	 		   <input type="text" value="授权成功！" id="returnValue" />
    	 		</td>
    	 		<!--<td>
    	 		 <input class="easyui-validatebox" type="text" name="username" data-options="required:true"/> 
    	 		</td>
    	 	--></tr>
    	 </table>
    	 </form>  
	</div>  
    <div id="toolbar">
       <div id="buttonbar">
      </div>  
    </div>
    <script type="text/javascript">      
        function register(){       
     	    var message = $('#message').val();
			if(message.length > 0){
	   			$.ajax({
	   	        	url:'<c:url value="/bus/message/send"/>',
	   	        	dataType: "json",
	   	        	data:{"message":message},
	   	        	success:function(result){
	   	        		if (result.success){ 
	   	        			$.messager.alert('提示','发送成功!','info');
	   	        			document.getElementById("message").value="";
						} else {  							
							$.messager.show({ title: 'Error', msg : "发送失败" }); 							
						}    	        			
	   	        	}
	   	        }) 
	   		}else{
	   			$.messager.alert('提示','请输入消息报告!','info');
	   		} 
        }
        
        function reset() {
       	   document.getElementById("message").value="";
       }
        
        
    </script>   
	
</body>
</html>