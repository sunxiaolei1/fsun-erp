var printProcessDtos = [];

/*********************    印刷工序方法     ***************************/

function printProcessAdd(grid){
	if(printProcessDtos.length>=5){
		MessageBox.error("数量不能超过5条!"); 
		return;
	}
	grid.datagrid('clearSelections');
	grid.edatagrid('addRow');
}

function cancelPrintProcessRow(grid){
	//获取可编辑行
	var editIndex = grid.edatagrid('options').editIndex;
	//可编辑行存在
	if("undefined" != typeof editIndex){
		grid.datagrid('cancelEdit',editIndex);	
    }
}

//单选模式
function delPrintProcess(grid){

	var row = grid.datagrid('getSelected'); 
	if(row!='' && row!=null){
		var index  = grid.datagrid('getRowIndex',row); 
    	
        //获取可编辑行
    	var editIndex = grid.edatagrid('options').editIndex;
    	//可编辑行不存在
    	if(typeof(editIndex) == 'undefined' || editIndex==-1){
    		grid.datagrid('deleteRow', index);
    	}else{
        	//可编辑行是删除行
        	if(index==editIndex){
        		grid.datagrid('cancelEdit', index);
        		grid.datagrid('clearSelections'); 
        	}		     				
    	}
	}
		
}