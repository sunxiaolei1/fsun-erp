
var madePackageDtos = [];
var madeProcessDtos = new Array();
var madeDetailDtos = new Array();

/**
 * 初始化页面窗口
 */
function initWins(){
	$('#openAddMadeDetailWin').window({
		 onBeforeClose:function(){ 
		      $("#openAddMadeDetailWin").find('iframe').removeAttr("src");		
    	 }
	});

	$('#openAddMadeDetailWin').show();
	$('#openMadeDetailsWin').show();
}

/**
 * 添加订单号
 * @param orderCodes
 * @param code
 */
function addOrderCodes(orderCodes,code){
	if(code!=null){
		var exist = false;
		for(var i=0; i<orderCodes.length; i++){
			if(orderCodes[i]==code){					
				exist = true;
				break;
			}
		}
		if(!exist){
			orderCodes.push(code);
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
	var orderDetailIds = new Array();
	$.each(rows,function(){
		if(detailUsed(this)){
			errorMessage = "产品"+ this.productName +"已在生产明细中使用,不能删除";
			if(this.style!=null && this.style!=""){
				errorMessage = "产品"+ this.productName +"("+ this.style +")已在生产明细中使用,不能删除";
			}
			return;
		}
		orderDetailIds.push(this.orderDetailId);
	});
	if(errorMessage!=null){
		$.messager.alert('提示',errorMessage,'info');
		return ;
	}
	
	delMadePackages(orderDetailIds);
	//grid.datagrid("acceptChanges");
	grid.datagrid("clearSelections");
	grid.datagrid("loadData",madePackageDtos);	
}



/**
 * 通过包装明细获取产品对应的工艺名称
 * @param rows
 * @param orderCodes
 * @returns
 */
function getDetailName(rows, orderCodes){
	if(rows!=null && rows.length>0){
		var detailName = '';
		var productCode = null;
		for(var i=0;i<rows.length;i++){
			var row = rows[i];
			//添加不重复的订单id
			if(orderCodes.indexOf(row.orderCode)==-1){
				orderCodes.push(row.orderCode);
			}
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
 * 通过工艺编号获取工艺明细
 * @param processCode
 */
function getProcessDetail(processCode){
	var madeProcessDtos0 = new Array();
	$.each(madeProcessDtos,function(){
		if(this.processCode==processCode){
			madeProcessDtos0.push(this);
		}
	});
	return madeProcessDtos0;
}


/**
 * 添加工艺明细
 * @param madeDetailDto
 * @param madeProcessDtos1
 */
function addProcessDetails(madeDetailDto,madeProcessDtos1){
	if(madeDetailDto!=null &&  JSON.stringify(madeDetailDto)!="{}"){
		madeDetailDtos.push(madeDetailDto);
		
		if(madeProcessDtos1!=null && madeProcessDtos1.length>0){
			for(var i=0;i<madeProcessDtos1.length;i++){
				madeProcessDtos.push(madeProcessDtos1[i]);
			}	
		}
		
		$('#packageTable').datagrid("clearSelections");
		$("#madeDetailTable").datagrid("loadData",madeDetailDtos);
	}	
	
}

/**
 * 通过工序编号删除对应的工序
 * @param processCode
 */
function delProcessDetails(processCode){
	
	//删除制作、印刷工艺明细
	for(var i=0; i<madeDetailDtos.length; i++){
		if(madeDetailDtos[i].processCode == processCode){
			madeDetailDtos.splice(i,1);
			break;
		}
	}
	
	//删除后道工序明细
	var length = madeProcessDtos.length;
	if(length>0){
		for(var i=length-1; i>=0; i--){
			if(madeProcessDtos[i].processCode == processCode){
				madeProcessDtos.splice(i,1);
			}
		}
	}
	
}

/**
 * 删除工艺明细-单选模式
 * @param grid
 */
function delMadeDetail(grid){
    
	var row = grid.datagrid('getSelected'); 
	if(row!='' && row!=null){
		delProcessDetails(row.processCode);
		grid.datagrid("loadData",madeDetailDtos);	      		
	}   		
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


/**
 * 添加打包明细
 * @param madeDetailDto
 * @param madeProcessDtos1
 */
function addMadePackages(rows){	
	
	var oldOrderDetailIds = new Array();
	var oldOrderCodes = new Array();
	var newMadePackageDtos = new Array();
	$.each(madePackageDtos,function(){
		var orderCode = this.orderCode;
		var repeat = false;
		for(var i=0; i<rows.length; i++){
			if(rows[i].id == this.orderDetailId){
				repeat = true;
				break;
			} 
		}
		if(!repeat){
			newMadePackageDtos.push(this);
			oldOrderDetailIds.push(this.orderDetailId);
	   		if(oldOrderCodes.indexOf(orderCode)<0){
	   			oldOrderCodes.push(orderCode);
	   		}
		}
			
	});
	
	madePackageDtos = newMadePackageDtos;
	
	for(var i=0;i<rows.length;i++){
		if(oldOrderDetailIds.indexOf(rows[i].id)<0){
			var row = rows[i];
			
			oldOrderDetailIds.push(row.id);
			if(oldOrderCodes.indexOf(row.orderCode)<0){
				oldOrderCodes.push(row.orderCode);
	   		}
				
   			row.orderDetailId = row.id;
   			row.realNumber = 0;
   			row.expectNumber = row.number;
   			row.orderNumber = row.number;
   			delete row.allPrice;
   			delete row.endDate;
   			delete row.groupBy;	
   			delete row.onePrice;
   			delete row.order;
   			delete row.page;
   			delete row.pagination;
   			delete row.papers;
   			delete row.prints;
   			delete row.rows;
   			delete row.sort;
   			delete row.startDate;
   			delete row.spec;
   			delete row.number;
   			delete row.enabled;
   			//delete row.orderId;
   			delete row.id;	
   			madePackageDtos.push(row);
		}
	}	
	
	var $form = $("#orderfm"); 
	$('#orderCode', $form).val(oldOrderCodes);
	$("#packageTable").datagrid("loadData",madePackageDtos);		
}

/**
 * 通过订单明细id删除打包明细
 * @param orderDetailIds
 */
function delMadePackages(orderDetailIds){
	
	//删除后道工序明细
	var length = madePackageDtos.length;
	if(length>0){
		for(var i=length-1; i>=0; i--){
			if(orderDetailIds.indexOf(madePackageDtos[i].orderDetailId)>=0){
				madePackageDtos.splice(i,1);
			}
		}
	}	
	
	var oldOrderCodes = new Array();
	$.each(madePackageDtos,function(){
   		if(oldOrderCodes.indexOf(this.orderCode)<0){
   			oldOrderCodes.push(this.orderCode);
   		}	
	});
	var $form = $("#orderfm"); 
	$('#orderCode', $form).val(oldOrderCodes);
}