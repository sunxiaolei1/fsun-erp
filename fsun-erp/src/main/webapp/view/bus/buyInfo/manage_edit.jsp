<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="easyui-layout" fit="false" style="height:260;" id='bt_buyInfo_layout' >
    <%@include file="operate/toolbar.jsp"%>
	<div region="center" border="false" >
		<table id="list-table-${currIndex}" 
			pagination="false" idField="id" fit="true" rownumbers="true" nowrap="false" 
			fitColumns="true" singleSelect="false" ctrlSelect="false" >
			
		</table>
	</div>
</div>	

<%@include file="operate/operate_buyInfo.jsp"%>    

<%@include file="operate/createFactory.jsp"%> 

<script>

    var detailGird = '';

	$(function() {
				
		detailGird = $('#list-table-${currIndex}');
		
		$("#list-operate-toolbar-${currIndex}").show();
		
		detailGird.datagrid({
			url:'<c:url value="/bus/buyInfo/list?purchaseId=${purchaseId}"/>',
			loadMsg:'加载中，请稍等。。。',
			columns:[[
				{field:'id',checkbox:true},           							
				{field:'materielName',title: '物料名称',width:"160"},
				{field:'spec',title: '规格型号',width:"80"},
				{field:'factoryName',title: '供货厂家',width:"150"},
				{field:'inStatus',title: '验收状况',width:"70",formatter:function(value,row,index){  								   
						if(!row.enabled){
							return "<font color='yellow' >"+ value +"</font>";
						}
					    return "<font>"+ value +"</font>";								    
						  
            		}  
        		},
				{field:'number',title: '数量',width:"80"},
				{field:'unit',title: '单位',width:"50"},
				{field:'onePrice',title: '单价(元)',width:"80"},
				{field:'allPrice',title: '总价(元)',width:"80"},	
				{field:'createTime',title: '创建时间',width:"120",hidden:true},						
				{field:'description',title: '备注',width:"80"}
           	]],	
            rowStyler: function(index,row){
				//已验收通过，背景色置灰  
                if(row && row.enabled==false){ 		                
                    return 'background-color:#FA8072;';  
                }  
		   	}        
		});
	});	
  	 
</script>
