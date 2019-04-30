/**
 * 删除图片
 * @return
 */
function closeImage(noIconPath,formId){
    //document.getElementById("pre").innerHTML = "<img src='"+ noIconPath +"'/>";
    var file = $('#pre',"#"+formId).find('img').attr("src",noIconPath);
    var file = $('input[name=ficon]',"#"+formId);
    file.after(file.clone().val(''));
    file.remove();
}


/**
 * 判别可编辑的grid中的可编辑行是否通过验证
 */
function gridIsValidate(id){
	//获取可编辑行
	var editIndex = $('#'+id).edatagrid('options').editIndex;
	//可编辑行存在
	if("undefined" != typeof editIndex){
		if ($('#'+id).datagrid('validateRow', editIndex)){  		
			$('#'+id).edatagrid('acceptChanges'); 	
			return true;
        }else{       	
        	return false;
        }
	}else{
		return true;
    }
}

//添加numberbox的级联计算
function setEditing(detailGird,rowIndex,fromText1,fromText2,toText){       
    var priceEditor = $(getEditCell(detailGird,rowIndex,fromText1).target);   
    var amountEditor = $(getEditCell(detailGird,rowIndex,fromText2).target); 
    var costEditor = $(getEditCell(detailGird,rowIndex,toText).target);
    
    priceEditor.numberbox({  
	     onChange : function(n,o){
   	    calculate();
	     }
	 });	    
    amountEditor.numberbox({  
	     onChange : function(n,o){
   	    calculate();
	     }
	 });   
    function calculate(){   
        var cost = priceEditor.numberbox("getValue") * amountEditor.numberbox("getValue");   
        costEditor.numberbox('setValue',cost);   
    } 
} 


//focusblur自定义输入域的焦点的变化的事件
jQuery.focusblur = function(index,grid,field,otherField,setField) {
	 var ed = $('#'+grid).datagrid('getEditor', {  
       index : index,  
       field : field  
   }); 
	 var focusblurid = '';
	 var defval ='';			 
   if(ed!=null){
  	focusblurid = $(ed.target);
	 	defval = focusblurid.numberbox('getValue');
	 	focusblurid.focus(function(){
	 		var thisval = $(this).val();
	 		if(thisval==defval){
                $(this).val("");
            }
        });
	     focusblurid.blur(function(){
	 		var thisval = $(this).val();
	 		if(thisval==""){
                $(this).val(defval);
                var edSet = $('#'+grid).datagrid('getEditor', {  
                   index : index,  
                   field : setField  
               });
               $(edSet.target).numberbox('setValue',"");	               	                 
            }else{	            	            
               var edOther = $('#'+grid).datagrid('getEditor', {  
                   index : index,  
                   field : otherField  
               });
               var otherValue = $(edOther.target).numberbox('getValue');
               if(otherValue!=''){
              	 var edSet = $('#'+grid).datagrid('getEditor', {  
                       index : index,  
                       field : setField  
                   });
                   $(edSet.target).numberbox('setValue',Math.round(thisval*otherValue*10)/10);
               }
               
	         }
        });	
   }
   		         
};
