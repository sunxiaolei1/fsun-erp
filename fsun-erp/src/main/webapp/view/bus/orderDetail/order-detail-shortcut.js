
var madePackageDtos = [];
var madeDetailDtos = new Array();
var maxLineNo = 1;

/*****************************     打包明细方法          ********************************/


/**
 * 判别产品是否已存在于打包明细中(名称一致)
 * @param productCode
 * @param productName
 * @param detailName
 * @returns {Boolean}
 */
function packageDetailHasExisted(productCode, productName , detailName){
	var hasExisted = false;
	var style = productName;
	if(detailName!=null && detailName!=''){
		 style = style + "("+ detailName +")";
	}	
	$.each(madePackageDtos,function(){
		var allName = this.productName;
		if(this.style!=null && this.style!=''){
			allName = allName + "("+ this.style +")";
		}			
		if(this.productCode == productCode && allName == style){		
			hasExisted = true;			
			return ;
		}
	});
	return hasExisted;
}

/**
 * 添加打包明细
 * @param madeDetailDto
 */
function addMadePackages(rows, grid){	
		
	var names = new Array();
	for(var i=0;i<rows.length;i++){	
		var row = rows[i];
		//包含名称和款号
		var detailName = (row.productName+"&"+row.style);
		if(!names.contains(detailName)){
			row.realNumber = 0;
			row.expectNumber = row.number;
			row.orderNumber = row.number;
			row.lineNo = maxLineNo++;
			delete row.allPrice;
			names.push(detailName);
			madePackageDtos.push(row);
		}else{
			var productCode = row.productCode;
			$.each(madePackageDtos,function(){
				if(this.productCode == productCode && (this.productName+"&"+this.style)==detailName){
					this.expectNumber = parseInt(this.expectNumber) + parseInt(row.number);
					this.orderNumber = parseInt(this.orderNumber) + parseInt(row.number);
				}
			});
		}				
	}	
	grid.datagrid("loadData",madePackageDtos);		
}

/**
 * 通过订单明细id删除打包明细
 * @param lineNos
 */
function delMadePackages(lineNos){
	var length = madePackageDtos.length;
	if(length>0){
		for(var i=length-1; i>=0; i--){
			if(lineNos.indexOf(madePackageDtos[i].lineNo)>=0){
				madePackageDtos.splice(i,1);
			}
		}
	}	
}


function saveEdits(grid){
	
   	//获取可编辑行
   	var editIndex = grid.edatagrid('options').editIndex;
   	//可编辑行存在
   	if("undefined" != typeof editIndex){
   		if(editIndex==(madePackageDtos.length-1)){
   			grid.datagrid('endEdit',editIndex);
       	}else{
       		grid.datagrid("acceptChanges");
        }
    }
}

function cancelEdits(grid){
	
   	//获取可编辑行
   	var editIndex = grid.edatagrid('options').editIndex;
   	//可编辑行存在
   	if("undefined" != typeof editIndex){
   		if(editIndex==(madePackageDtos.length-1)){
   			grid.datagrid('cancelEdit',editIndex);
       	}else{
       		grid.datagrid("loadData",madePackageDtos);
        }
    }
}

function delEdits(grid){
	var rows = grid.datagrid('getSelections');
	if(rows.length==0){
		return;
	}
	var errorMessage = null;
	var lineNos = new Array();
	$.each(rows,function(){
		if(detailUsed(this)){
			errorMessage = "产品"+ this.productName +"已在生产明细中使用,不能删除";
			if(this.style!=null && this.style!=""){
				errorMessage = "产品"+ this.productName +"("+ this.style +")已在生产明细中使用,不能删除";
			}
			return;
		}
		lineNos.push(this.lineNo);
	});
	if(errorMessage!=null){
		$.messager.alert('提示',errorMessage,'info');
		return ;
	}
	
	delMadePackages(lineNos);
	//grid.datagrid("acceptChanges");
	grid.datagrid("clearSelections");
	grid.datagrid("loadData",madePackageDtos);	
}

/****************************      生产明细方法            **********************************/

/**
 * 通过包装明细获取产品对应的工艺名称
 * @param rows
 * @returns
 */
function getDetailName(rows){
	
	var detailName = '';
	var productCode = null;
	if(rows!=null && rows.length>0){		
		for(var i=0;i<rows.length;i++){
			var row = rows[i];			
			if(productCode!=null){
				if(productCode!=row.productCode){
					$.messager.alert('提示',"选中项必须是相同产品(款号可以不同)!",'info');
					return null;
				}else{
					if(row.style!=null && row.style!=''){
						detailName = detailName +"/"+ row.style;
					}		
				}	
			}else{
				productCode = row.productCode;
				if(row.style!=null && row.style!=''){
					detailName = row.style;
				}	
			}
		}
		return detailName;
	}else{
		$.messager.alert('提示',"请选择至少一项!",'info');
		return null;
	}
}


/**
 * 同步生产明细数据
 */
function acceptChangesMadeDetails(madeDetailDto){
	
	if(madeDetailDto.productCode==null||madeDetailDto.productCode==''
		|| madeDetailDto.style==null || madeDetailDto.style==''){
		return ;
	}
	var isAdd = true;
	for(var i=0; i<madeDetailDtos.length; i++){
		var row = madeDetailDtos[i];			
		if(row.productCode == madeDetailDto.productCode && row.style == madeDetailDto.style){
			madeDetailDtos[i] = madeDetailDto;
			isAdd = false;
			break;
		}
	}
	if(isAdd){
		madeDetailDtos.push(madeDetailDto);
	}
}

/**
 * 获取当前明细对象
 * @param row 选中行
 * @returns
 */
function getMadeDetailDto(row){
	var madeDetailDto = null;
	$.each(madeDetailDtos,function(){
		if(this.productCode == row.productCode && this.style == row.style){
			madeDetailDto = this;
			return;
		}
	});
	return madeDetailDto;
}

/**
 * 判别产品是否已存在于生产明细中(名称一致)
 * @param productCode
 * @param productName
 * @param detailName
 * @returns {Boolean}
 */
function detailHasExisted(productCode, productName , detailName){
	var hasExisted = false;
	var style = productName;
	if(detailName!=null && detailName!=''){
		 style = style + "("+ detailName +")";
	}
	$.each(madeDetailDtos,function(){
		if(this.productCode == productCode && this.style == style){
			hasExisted = true;
			return ;
		}
	});
	return hasExisted;
}

/**
 * 判别产品是否已在生产明细中(只要在名称中包含)
 * @param madePackageDto
 * @returns {Boolean}
 */
function detailUsed(madePackageDto){
	var used = false;
	var style = madePackageDto.style; 
	var productName = madePackageDto.productName;
	var productCode = madePackageDto.productCode;
	if(style==null || style==''){
		$.each(madeDetailDtos,function(){
			if(this.productCode == productCode && this.style == productName){
				used = true;
				return ;
			}
		});
	}else{
		$.each(madeDetailDtos,function(){
			if(this.productCode == productCode && this.style.indexOf(productName)==0){
				var styles = this.style.substring(productName.length+1,this.style.length-1);
				var styleArr = styles.split("/");	
				if(styleArr.indexOf(style)>=0){
					used = true;
					return ;
				}	
			}
		});
	}
	return used;
}


/*********************    后道工序方法     ***************************/

function processAdd(grid){
	grid.datagrid('clearSelections');
	grid.edatagrid('addRow');
}

function cancelProcessRow(grid){
	//获取可编辑行
	var editIndex = grid.edatagrid('options').editIndex;
	//可编辑行存在
	if("undefined" != typeof editIndex){
		grid.datagrid('cancelEdit',editIndex);	
    }
}

//单选模式
function delProcess(grid){

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