<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>

<!-- 厂家编辑窗口 -->		
<form id="factoryfm" method="post" name="factoryfm" >  	
   	 <table border="0"  class="table-new"  cellpadding="5"   cellspacing="5"> 	
   	 	<tr>
   	 		<td class="textField"><span style="color:red">*</span>厂商名称：</td>
   	 		<td>
   	 		<input class="easyui-validatebox" name="name"  data-options="required:true,validType:'uniqueValue'" /> 
   	 		</td>
   	 		<td class="textField" >厂商类型：</td>
   	 		<td ><input type="text" name="type" value="加工类" readOnly /></td>
   	 	</tr>
   	 	<tr>	
   	 		<td class="textField" >工&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;艺：</td>
    	 	<td><input type="text" name="technology" /></td>
   	 		<td class="textField">联&nbsp;&nbsp;系&nbsp;&nbsp;人：</td>
   	 		<td><input type="text" name="legalPerson" /></td>
   	 	</tr>
   	 	<tr>
   	 		<td class="textField">电话号码：</td>
   	 		<td><input class="easyui-validatebox" name="telephone" data-options="validType:'phone'" /></td>
   	 		<td class="textField">手机号码：</td>
   	 		<td><input class="easyui-validatebox" name="mobileTelephone" data-options="validType:'mobile'" /></td>
   	 	</tr>
   	 	<tr>
	   	 	<td class="textField">地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址：</td>
   	 		<td><textarea name="address" rows="2" cols="15" style="width:176px;"></textarea></td>
   	 		<td class="textField">描&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;述：</td>
   	 		<td><textarea name="description" rows="2" cols="15" style="width:176px;" ></textarea></td>
   	 	</tr>
   	 </table>
</form>
<div style="padding:20px;text-align:center;">  
    <a href="#" class="easyui-linkbutton" icon="icon-ok" onclick="saveFactory()">保存</a>  
    <a href="#" class="easyui-linkbutton" icon="icon-cancel" onclick="closeFactoryAddDialog()">取消</a>  
</div>  

<script>

	var $factoryfm = $("#factoryfm");
	
	$.extend($.fn.validatebox.defaults.rules, { 
		uniqueValue : {
			validator : function(value) {				
			    var success = false;	
				$.ajax({
		            type: "post",
		            dataType: "json",
		            async:false,
		            url: '<c:url value="/bus/factoryInfo/uniqueName"/>',
		            data: { 'name':value },
		            success: function(result) {
		            	success = result.success;
		            }
		        });
		        return success;
				
			},
			message : '该名称已经存在,请换一个！'
		}          
	});


	$(function() {
		
		$.getJSON('<c:url value="/sys/dictionary/getGroupList?key=PRODUCT_PROCESS"/>', function(json){
			$('input[name=technology]', $factoryfm).combobox({
		   		required: true,
		   		editable:false,
		   		multiple: true,
			 	valueField: 'key',
			  	textField: 'value',
			  	data: json,
			  	width: '176px',
			    panelHeight: '60px'
			}).combobox("setValue",json[0].key);
			
		});	 
	});
		
	
	function saveFactory(){
		
		$.messager.progress({title : '请等待',msg : '保存中...',text : '',interval : 700});
		$factoryfm.form('submit', {
			url : '<c:url value="/bus/factoryInfo/save"/>',
			dataType : "json",
			async : false,
			onSubmit : function() {
				var isValid = $(this).form('validate');
				if (!isValid) {
					$.messager.progress('close');
				}
				return isValid;
			},
			success : function(result) {
				$.messager.progress('close');
				var result = eval('(' + result + ')'); // change the JSON string to javascript object   
				if (result.success) {
					$.messager.alert('提示', '保存成功!', 'info');
					closeFactoryAddDialog();
				} else {
					$.messager.alert('提示', '保存失败!', 'info');
				}

			}
		});

	}
</script>