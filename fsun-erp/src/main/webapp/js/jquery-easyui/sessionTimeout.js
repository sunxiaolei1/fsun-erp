$(function(){
    $.ajaxSetup({
        contentType: "application/x-www-form-urlencoded;charset=utf-8",
        cache: false,
        complete: function(XHR, TS){
            var resText = XHR.responseText;
            var sessionstatus = XHR.getResponseHeader("sessionstatus");
            if (911 == XHR.status && "timeout" == sessionstatus){
            	alert("session Timeout!");
                window.location.replace("login.jsp");
            }else if ('403' == XHR.status) {
                window.location.replace("/fsun-erp/403.jsp");
            }
        }, error:function(XMLHttpRequest, textStatus, errorThrown){      	
        	if(XMLHttpRequest.status=='200'){
        		// alert("session Timeout!");
        		window.location.replace("/fsun-erp/view/main.jsp"); 
        	}				                	
         } 
    });
});