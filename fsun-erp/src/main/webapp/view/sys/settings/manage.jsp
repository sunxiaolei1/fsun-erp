<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<%@include file="/view/role_resource.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
</head>
<body>

    <table id="pg" class="easyui-propertygrid" style="width:400px" fit="true"
            data-options="url:'<%=request.getContextPath()%>/sys/settings/list.do',showGroup:true,scrollbarSize:1,columns: mycolumns">
    </table>  
    <script type="text/javascript">  
    
    	var mycolumns = [[  
			{field:'id',title:'id',width:100,hidden:true},
			{field:'code',title:'code',width:100,hidden:true},
        	{field:'name',title:'名称',width:100},  
        	{field:'value',title:'值',width:200}  
        ]];  
    	
    	 $('#pg').propertygrid(
    		{
    			onAfterEdit:function(rowIndex, rowData, changes){
    				save(rowData);
    				$('#pg').propertygrid('acceptChanges');
    			}
    		}	 
    	 );
    	 
    	 function save(rowData){
    		 $.post('<%=request.getContextPath()%>/sys/settings/save.do', {'id':rowData.id,'value':rowData.value});
    	 }
    
    
        function saveAll(){  
            var s = '';  
            var rows = $('#pg').propertygrid('getChanges');  
            for(var i=0; i<rows.length; i++){
                save(rows[i]);
            }  
            $('#pg').propertygrid('acceptChanges');
        } 
     
    </script>  
	
</body>
</html>
