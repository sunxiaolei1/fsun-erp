<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/view/base_resource.jsp" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>总览</title>
   	<link type="text/css" rel="stylesheet" media="all" href="<c:url value='/css/screenInfo.css'/>" />
    <script type="text/javascript" src="<c:url value='/js/showTime.js'/>"></script>
    <style type="text/css">
      tr.defindTr {
        height:29px;
        border-top:2px #a1afbb solid;
        line-height:28x;
        text-align:center;
        font-size:13px;
      }      
	  .textField1{text-align:right;font-weight:800;color:black;}
	 	  
    </style>
    <script type="text/javascript">

    function mover(src,clrOver){
    	src.bgColor = clrOver;
    }
    function mout(src,clrout)  {
    	src.bgColor = clrout;
    }
    </script>
</head>
<body style="overflow-y:hidden;">
<div class="easyui-layout" fit="true">

    <div region="north" style="text-align:center; line-height:29px;height:70px;padding:2px 2px;background: url('../../images/overview.png') repeat-x scroll center center rgba(0, 0, 0, 0);" data-options="striped: true,collapsible:false,border:true">  	
		<input type="text" id ="showTime" readonly="readonly" style="border:0px solid;color:#FF0000;width:100%;text-align:center;margin-top:2px; font-size:25px;background-color:transparent;"></input>  		
		<p style="font-family:serif;font-style:italic ;width:80%;text-align:right;margin-bottom:2px; font-size:15px;background-color:transparent;">态度决定一切   细节决定成败</p>
	</div>
	<div region="center" data-options="striped: true,collapsible:false,border:false" style="margin-top:-2px;width:630px;height:480px;">
		<div class="easyui-layout" fit="true">			
			<%@include file="operate/orderDetail.jsp"%>
			<div id="orderInfo" region="west" title="已下单的订单滚动列表" data-options="striped: true,collapsible:false,border:false" style="width:556px;height:440px;">
				<div id="noData" style="display:none;width:100%;height:100%;">
					<div style="font-size:35px;text-align:center;padding-top:200px;">没有已下单的订单</div>
				</div>
				<div id="fullscreenbox" style="background-color:#dddfe8;width:556px;height:100%;">				
					<table id="tableHeader" align="center" border="0" cellpadding="0" cellspacing="0" width="100%" style="margin-top:-2px;">  
					  <tbody>
						  <tr style="height:29px;line-height:29x; text-align:center;color:#FF0000;font-size:13px;">  
						      <td style="width:10%;border-top:2px #a1afbb solid;">序号</td>    
						      <td style="width:25%;border-top:2px #a1afbb solid;">订单编号</td>  
						      <td style="width:25%;border-top:2px #a1afbb solid;">交货时间</td>  
						      <td style="width:40%;border-top:2px #a1afbb solid;">客户名称</td>   
						  </tr>  
					  </tbody>
					</table>  
					<table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" style="margin-top:-2px;">  
					    <tbody>
					    <tr style="height:29px;line-height:29x; text-align:center;">  
					      <td>  
							<div id="demohq">  
					   		    <div id="demohq1" align="center">  
									
								</div>  
						    	<div id="demohq2" align="center">  
									
								</div>  
							</div>  
						</td>  
					   </tr>  
					   </tbody>
					</table> 
				</div> 
		
			</div>
			
		</div>
	</div>
	
</div>

<script> 

	var height = $("#orderInfo").height()-29;
	var width = $("#tableHeader").width();
	var dataNums = height/29;
	$("#demohq").attr('style','overflow:hidden;height:'+ height +'px;width:'+ width +'px;');

	function getOffDays(startDate, endDate) {    
        return ((endDate.getTime() - startDate.getTime()) / 3600000/24); //单位转换为天并返回    
    } 
	
	function CreateTable(list,cellCount,div,striped)
	{ 
	   var table=$("<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"margin-top:-2px;\"><tbody></tbody></table>");
	   table.appendTo($("#"+div));
		 for(var i=0;i<list.length;i++)
		 {
			var obj= list[i];
			var tr = '';
			if(list.length<=dataNums){			
				if(i%2==0){
					tr=$("<tr onclick='openOrderDiv(\""+ obj.id +"\")' bgcolor=\"#ececec\" onmouseover=\"mover(this,'#FFFFFF');\" onmouseout=\"mout(this,'#ececec');\" class='defindTr'></tr>");
				}else{
					tr=$("<tr onclick='openOrderDiv(\""+ obj.id +"\")' bgcolor=\"#dddfe8\" onmouseover=\"mover(this,'#FFFFFF');\" onmouseout=\"mout(this,'#dddfe8');\" class='defindTr'></tr>");
				}									
			}else{
				if(striped){					
					if(i%2==0){
						tr=$("<tr onclick='openOrderDiv(\""+ obj.id +"\")' bgcolor=\"#ececec\" onmouseover=\"mover(this,'#FFFFFF');\" onmouseout=\"mout(this,'#ececec');\" class='defindTr'></tr>");
					}else{
						tr=$("<tr onclick='openOrderDiv(\""+ obj.id +"\")' bgcolor=\"#dddfe8\" onmouseover=\"mover(this,'#FFFFFF');\" onmouseout=\"mout(this,'#dddfe8');\" class='defindTr'></tr>");
					}					
				}else{
					if(list.length%2!=0){
						if(i%2==0){
							tr=$("<tr onclick='openOrderDiv(\""+ obj.id +"\")' bgcolor=\"#dddfe8\" onmouseover=\"mover(this,'#FFFFFF');\" onmouseout=\"mout(this,'#dddfe8');\" class='defindTr' ></tr>");
						}else{
							tr=$("<tr onclick='openOrderDiv(\""+ obj.id +"\")' bgcolor=\"#ececec\" onmouseover=\"mover(this,'#FFFFFF');\" onmouseout=\"mout(this,'#ececec');\" class='defindTr'></tr>");
						}
					}else{
						if(i%2==0){
							tr=$("<tr onclick='openOrderDiv(\""+ obj.id +"\")' bgcolor=\"#ececec\" onmouseover=\"mover(this,'#FFFFFF');\" onmouseout=\"mout(this,'#ececec');\" class='defindTr'></tr>");
						}else{
							tr=$("<tr onclick='openOrderDiv(\""+ obj.id +"\")' bgcolor=\"#dddfe8\" onmouseover=\"mover(this,'#FFFFFF');\" onmouseout=\"mout(this,'#dddfe8');\" class='defindTr'></tr>");
						}
					}
					
				}
			} 
			 		    
			tr.appendTo(table);
			
			var j=1;
			var td;
			
			var color ="color:#00ff00;";
			var offDays = getOffDays(new Date(),new Date(obj.receiveTime.replace(/-/g,"/")));
            if(offDays<=0){
            	color = "color:#FF0000;";
            }else if(offDays<=3){
            	color = "color:#eeff33;";
			}
			
			while(j<=cellCount){		
				switch (j) {
				  case 1: td = $("<td style='font-family:Arial,Helvetica,sans-serif;width:10%;"+ color +"'>"+ (i+1) +"</td>");
				    break;
				  case 2: td = $("<td style='width:25%;"+ color +"'>"+ obj.code +"</td>");
				    break;
				  case 3: td = $("<td style='width:25%;"+ color +"'>"+ obj.receiveTime +"</td>");
				    break;
				  case 4: td = $("<td style='font-family:Arial,Helvetica,sans-serif;width:40%;"+ color +"'>"+ obj.customerName +"</td>");
				    break;
				  default: break;
				}
				td.appendTo(tr);
				j++;
			}
		 }
	}

	function getData(url){
		var screenInfos = "";
		$.ajax({
	        type: "get",
	        dataType: "json",
	        async:false,
	        url: url,
	        data: {},
	        success: function(returnData) {
	        	screenInfos = returnData.rows;	        	
	        }
	    });
	    return screenInfos;
	}
	/******************************************定时刷新列表**********************************************************/       
	var isRefresh = true;
	function update_list(){
		
		var url= '<c:url value="/bus/overview/getOrders"/>';
		var data = getData(url);
		if(data!="" ){
			if(isRefresh){
				$("#noData").hide();
				$("#fullscreenbox").show();
				if($("#demohq1")&& $("#demohq2")){
					$("#demohq1").empty();
					$("#demohq2").empty();
				}
				if(data.length <= dataNums){
					CreateTable(data,4,"demohq1",true);
				}else{
					CreateTable(data,4,"demohq1",true);
			    	CreateTable(data,4,"demohq2",false);
				}	
			}
			
		}else{
			$("#noData").show();
			$("#fullscreenbox").hide();
		}
		window.setTimeout(update_list, 10000);   //表示延时5秒执行page_list()函数
	}

	//启动定时刷新主机列表
    window.setTimeout(update_list, 1);

	var speedhq=60;  
	function Marqueehq(){  
	    if(demohq.scrollTop==demohq1.offsetHeight){  
	        demohq.scrollTop=0;  
	    }else{  
	        demohq.scrollTop++;  
	    }  
	}  
	var MyMarhq=setInterval(Marqueehq,speedhq);

	demohq.onmouseover=function() {
		clearInterval(MyMarhq);
		isRefresh = false;
	}  
		
	demohq.onmouseout=function() {
		MyMarhq=setInterval(Marqueehq,speedhq);
		isRefresh = true;
	}   
</script>
</body>
</html>