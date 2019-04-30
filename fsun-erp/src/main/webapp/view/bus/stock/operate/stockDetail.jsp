<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">

/*****************************************    库存明细的增删查改      ********************************/
 var stockDetailList = [];


//判别可编辑的grid中的可编辑行是否通过验证
function gridIsValidate(id){
 	//获取可编辑行
 	var editIndex = $('#'+id).edatagrid('options').editIndex;
 	//可编辑行存在
 	if("undefined" != typeof editIndex){
 		if ($('#'+id).datagrid('validateRow', editIndex)){
     		if(id=='stockDetail-table'){
     			$('#'+id).edatagrid('acceptChanges');
         	}  			
				return true;
         }else{
         	$.messager.alert('提示','库存明细列表信息添加不全!','info');
         	return false;
         }
 	}else{
 		return true;
     }
 }
 
function detailAdd(){
	var grid = $('#stockDetail-table');
	grid.datagrid('clearSelections');
	grid.edatagrid('addRow');	
	var row = grid.edatagrid('getSelected');
	if (row){
		var rowIndex = grid.edatagrid('getRowIndex', row); 
		var edSet = grid.edatagrid('getEditor', {  
            index : rowIndex,  
            field : 'unit' 
        });
		$(edSet.target).combobox('setValue',unitValue[0].id);      
    }
	
}

function delDetail(){
	var grid = $('#stockDetail-table');
	var row = grid.datagrid('getSelected'); 
	if(row!='' && row!=null){
		var index  = grid.datagrid('getRowIndex',row); 
    	
        //获取可编辑行
    	var editIndex = grid.edatagrid('options').editIndex;
    	//可编辑行不存在
    	if(typeof(editIndex) == 'undefined' || editIndex==-1){
    		var list = [];
            for(var i=0;i<stockDetailList.length;i++){
    			if(index!=i){
    				list.push(stockDetailList[i]);
    			}
            }	
            stockDetailList = list;
            grid.datagrid("loadData",stockDetailList);
    		      	
    	}else{
        	//可编辑行是删除行
        	if(index==editIndex){
        		grid.datagrid('cancelEdit', editIndex);
        		grid.datagrid('clearSelections'); 
        	}		     				
    	}
	}
	
}

function cancelDetailRow(){

	var grid = $('#stockDetail-table');
	 //获取可编辑行
	var editIndex = grid.edatagrid('options').editIndex;
	//可编辑行存在
	if("undefined" != typeof editIndex){
		if(editIndex==(stockDetailList.length-1)){
			grid.datagrid('cancelEdit',editIndex);
    	}else{
    		grid.datagrid("loadData",stockDetailList);  
        }
    }
	
}

</script>