<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="printTableHeaderProxy" style="display:none;" >
	<TABLE id="proxyDetail" border=0 cellSpacing=0 cellPadding=4 width="100%"  >
	
	</TABLE>
</div>

<div id="printTableContextProxy" style="display:none;" >
	<TABLE border=1 cellSpacing=0 cellPadding=1 width="100%" style="font-size:16px; border-collapse:collapse" bordercolor="#333333">
	<thead>
	  <TR>
	    <TD width="3%">
	      <DIV align=center><b></b></DIV></TD>
	    <TD width="14%">
	      <DIV align=center><b>生产机型</b></DIV></TD>
	    <TD width="11%">
	      <DIV align=center><b>工序</b></DIV></TD>
	    <TD width="7%">
	      <DIV align=center><b>PS版</b></DIV></TD>
	    <TD width="10%">
	      <DIV align=center><b>印刷方式</b></DIV></TD>
	    <TD width="15%">
	      <DIV align=center><b>色数</b></DIV></TD>		    
	    <TD width="10%">
	      <DIV align=center><b>印刷数量</b></DIV></TD>
	    <TD width="6%">
	      <DIV align=center><b>印损</b></DIV></TD>	       
	    <TD width="24%">
	      <DIV align=center><b>备注</b></DIV></TD>
	  </TR>	
	</thead>      
	  <TBODY id="tableProxyData">      
		
	  </TBODY>
	  <tfoot>
		  <tr>
		    <TD colspan="6" align="left" >大写金额: <font id="ft-DX"></font></TD> 
		    <TD colspan="3" align="left" >小写金额 ￥: <font id="ft-XX"></font>元
		    	/<input id="ft-paid" type="checkbox" />(付清打勾)
		    </TD> 			   				  
		 </tr>
	  </tfoot>
	</TABLE>
</div>
	
<script type="text/javascript">

/***************************************** 制作送货单的操作 *******************************************/


	function printProxys() {

		var rows = detailGird.datagrid("getSelections");
		if (rows != null && rows.length == 1) {
			$.ajax({
				url : '<c:url value="/bus/proxyOrder/getProxyPrints" />',
				dataType : "json",
				data : {
					proxyCode : rows[0].proxyCode
				},
				success : function(rowData) {
					if (rowData.success) {
						proxyOrderView(rowData.rows);
					}
				}
			});
		} else {
			$.messager.alert('提示', "请选择一个加工单!", 'info');
		}
	}

	function proxyOrderView(proxyOrderDto) {
		if (proxyOrderDto) {
			var LODOP = getLodop();
			//LODOP.PRINT_INIT("送货单打印");
			LODOP.SET_PRINT_PAGESIZE(1, "203mm", "141mm", "");

			createOneProxyPage(LODOP, proxyOrderDto, 0);

			initProxyPagePublicInfo(LODOP, proxyOrderDto.proxyOrderHeader);

			if (LODOP.CVERSION) { //用CVERSION属性判断是否云打印
				LODOP.On_Return = function(TaskID, Value) {
					if (Value != 0) {
						var proxyOrderHeader = proxyOrderDto.proxyOrderHeader;
						$.ajax({
							url : '<c:url value="/bus/proxyOrder/signPrint"/>',
							dataType : "json",
							data : {
								proxyCode : proxyOrderHeader.proxyCode
							},
							async : false,
							success : function(rowData) {
								flushDataGrid();
							}
						});
					}
				};
				LODOP.PREVIEWA();
				return;
			}
			

			var prints = LODOP.PREVIEW();
			if (prints > 0) {
				var proxyOrderHeader = proxyOrderDto.proxyOrderHeader;
				$.ajax({
					url : '<c:url value="/bus/proxyOrder/signPrint"/>',
					dataType : "json",
					data : {
						proxyCode : proxyOrderHeader.proxyCode
					},
					async : false,
					success : function(rowData) {
						flushDataGrid();
					}
				});
			}

		}
	}

	function initProxyPagePublicInfo(LODOP, header) {

		var now = new Date();

		LODOP.SET_PRINT_STYLE("FontSize", 18);
		LODOP.SET_PRINT_STYLE("Bold", 1);
		LODOP.ADD_PRINT_TEXT(34, "3%", "65%", 20,
				'${applicationScope.companyName}印刷工艺单(代合同)');
		LODOP.SET_PRINT_STYLEA(0, "ItemType", 1);

		LODOP.ADD_PRINT_HTM(68, "3%", "50%", 14, "打印时间：" + now.getFullYear()
				+ "-" + ((now.getMonth() + 1) < 10 ? "0" : "")
				+ (now.getMonth() + 1) + "-" + (now.getDate() < 10 ? "0" : "")
				+ now.getDate());
		LODOP.SET_PRINT_STYLEA(0, "ItemType", 1);

		LODOP.SET_PRINT_STYLE("FontSize", 12);
		LODOP.SET_PRINT_STYLE("Bold", 0);
		LODOP.ADD_PRINT_TEXT(435, "3%", "90%", 9, "以上各项内容已阅无误,客户签字确认：");
		LODOP.SET_PRINT_STYLEA(0, "ItemType", 1);

		LODOP.SET_PRINT_STYLE("FontSize", 12);
		LODOP.SET_PRINT_STYLE("Bold", 0);
		LODOP.ADD_PRINT_TEXT(435, "60%", "90%", 9, "制单人签字："
				+ header.createManName);
		LODOP.SET_PRINT_STYLEA(0, "ItemType", 1);

		LODOP.SET_PRINT_STYLE("FontSize", 12);
		LODOP.SET_PRINT_STYLE("Bold", 0);
		LODOP.ADD_PRINT_TEXT(456, "3%", "90%", 9, "本加工单三联,白：存根, 红：客户, 黄：印刷机 ");
		LODOP.SET_PRINT_STYLEA(0, "ItemType", 1);
	}

	function createOneProxyPage(LODOP, proxyOrderDto, currRow) {

		if ($("#proxyDetail")) {
			$("#proxyDetail").empty();
		}

		if ($("#tableProxyData")) {
			$("#tableProxyData").empty();
		}

		if (currRow != 0) {
			LODOP.NewPageA();
		}
		
		var orderPrice = (proxyOrderDto.proxyOrderHeader.orderPrice!=null?proxyOrderDto.proxyOrderHeader.orderPrice : '0.00');		
		$("#ft-DX").text(upDigit(orderPrice));		
		$("#ft-XX").text(orderPrice);
		var paid = proxyOrderDto.proxyOrderHeader.paid;
		if(paid!=null && paid){
			$("#ft-paid").attr("checked",true);
		}else{
			$("#ft-paid").removeAttr('checked');;
		}

		CreateTableProxyContext(proxyOrderDto.proxyPrintDetails, 9,
				"tableProxyData");
		LODOP.SET_PRINT_STYLEA(0, "Vorient", 3);
		var strStyle = '<style type="text/css"> table,td,th {border-width: 1px;border-style: solid;border-collapse: collapse}</style>';
		LODOP.ADD_PRINT_TABLE(270, "3%", "94%", 160, strStyle
				+ document.getElementById("printTableContextProxy").innerHTML);

		LODOP.SET_PRINT_STYLE("FontSize", 13);
		LODOP.SET_PRINT_STYLE("Bold", 1);
		LODOP.ADD_PRINT_TEXT(36, "67%", "30%", 19, "单号: "
				+ proxyOrderDto.proxyOrderHeader.proxyCode);
		LODOP.SET_PRINT_STYLEA(0, "ItemType", 1);
		LODOP.SET_PRINT_STYLEA(0, "LinkedItem", 1 + currRow);

		var createTime = proxyOrderDto.proxyOrderHeader.createTime;
		LODOP.SET_PRINT_STYLE("FontSize", 13);
		LODOP.SET_PRINT_STYLE("Bold", 1);
		LODOP.ADD_PRINT_TEXT(66, "67%", "30%", 19, "日期:   "
				+ createTime.substring(0, 10))
				+ "";
		LODOP.SET_PRINT_STYLEA(0, "ItemType", 1);
		LODOP.SET_PRINT_STYLEA(0, "LinkedItem", 1 + currRow);

		CreateTableProxyHeader(proxyOrderDto.proxyOrderHeader,
				proxyOrderDto.proxyOrderDetail, "proxyDetail");
		var strStyle = '<style type="text/css"> input,span {border:none;border-bottom:black solid 1px;} input {font-family:Arial, Helvetica, sans-serif,"Microsoft YaHei";font-size:16px;}</style>';
		LODOP.ADD_PRINT_HTM(116, "3%", "94%", 150, strStyle
				+ document.getElementById("printTableHeaderProxy").innerHTML);
		LODOP.SET_PRINT_STYLEA(0, "ItemType", 1);
		LODOP.SET_PRINT_STYLEA(0, "LinkedItem", 1 + currRow);

	};

	/************************************  创建加工单的头部内容  ********************************/

	function CreateTableProxyHeader(header, detail, div) {
		var tbody = $("#" + div);
		var tr = $("<tr></tr>");
		tr.appendTo(tbody);
		var td = $("<td colspan='2' >客户名称：<input style='width:240px;' value="
				+ (header.customerName != null ? header.customerName : "")
				+ " /></td>");
		td.appendTo(tr);
		td = $("<td>联系人：<span>"
				+ ((header.contract != null && header.contract.length > 0) ? header.contract
						: "") + "</span></td>");
		td.appendTo(tr);
		td = $("<td>联系方式：<span>"
				+ ((header.telephone != null && header.telephone.length > 0) ? header.telephone
						: "") + "</span></td>");
		td.appendTo(tr);

		tr = $("<tr></tr>");
		tr.appendTo(tbody);
		td = $("<td colspan='2' >产品名称：<input style='width:240px;' value="
				+ (detail.productName != null ? detail.productName : "暂无")
				+ " /></td>");
		td.appendTo(tr);
		td = $("<td>打样：<input type='checkbox' "
				+ ((detail.looked != null && detail.looked) ? "checked" : "")
				+ " />&nbsp;看样：<input type='checkbox' "
				+ ((detail.viewed != null && detail.viewed) ? "checked" : "")
				+ " /></td>");
		td.appendTo(tr);
		td = $("<td>交货日期：<span>"
				+ (header.receiveTime != null ? header.receiveTime : "")
				+ "</span></td>");
		td.appendTo(tr);

		tr = $("<tr></tr>");
		tr.appendTo(tbody);
		td = $("<td>材质名称：<span>"
				+ ((detail.material != null && detail.material.length > 0) ? detail.material
						: "暂无") + "</span></td>");
		td.appendTo(tr);
		td = $("<td>开料尺寸：<span>"
				+ ((detail.openSize != null && detail.openSize.length > 0) ? detail.openSize
						: "暂无") + "</span></td>");
		td.appendTo(tr);
		td = $("<td>规&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格：<span>"
				+ (detail.spec != null ? detail.spec : "") + "</span></td>");
		td.appendTo(tr);
		td = $("<td>上光：<input type='checkbox' "
				+ ((detail.polished != null && detail.polished) ? "checked"
						: "") + " />&nbsp;贴膜：<input type='checkbox' "
				+ ((detail.filmed != null && detail.filmed) ? "checked" : "")
				+ " /></td>");
		td.appendTo(tr);

		tr = $("<tr></tr>");
		tr.appendTo(tbody);
		td = $("<td>版子总数：<span>"
				+ (header.totalVersions != null ? header.totalVersions : "0")
				+ "</span></td>");
		td.appendTo(tr);
		td = $("<td>开&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数：<span>"
				+ (detail.openNum != null ? detail.openNum : "0")
				+ "</span></td>");
		td.appendTo(tr);
		td = $("<td>大张数量：<span>"
				+ (detail.papers != null ? detail.papers : "0")
				+ "</span></td>");
		td.appendTo(tr);
		td = $("<td>印张总数：<span>"
				+ (detail.prints != null ? detail.prints : "0")
				+ "</span></td>");
		td.appendTo(tr);

		tr = $("<tr></tr>");
		tr.appendTo(tbody);
		td = $("<td colspan='4' >注意事项：<input style='width:600px;' value="
				+ ((detail.descr != null && detail.descr.length > 0) ? detail.descr
						: '暂无') + " /></td>");
		td.appendTo(tr);

	}

	/************************************  创建加工单的主体内容  ********************************/

	function CreateTableProxyContext(list, columns, div) {

		var tbody = $("#" + div);
		for (var i = 0; i < list.length; i++) {
			var tr = $("<tr></tr>");
			tr.appendTo(tbody);
			var obj = list[i];
			var j = 1;
			var td;
			while (j <= columns) {
				switch (j) {
				case 1:
					td = $("<td align='center'>" + (i + 1) + "</td>");
					break;
				case 2:
					td = $("<td align='center'>"
							+ (obj.model != null ? formatStr(obj.model) : '')
							+ "</td>");
					break;
				case 3:
					td = $("<td align='center'>"
							+ (obj.process != null ? formatStr(obj.process)
									: '') + "</td>");
					break;
				case 4:
					td = $("<td align='center'>"
							+ (obj.psNumber != null ? obj.psNumber + '(张)' : '')
							+ "</td>");
					break;
				case 5:
					td = $("<td align='center'>"
							+ (obj.layout != null ? formatStr(obj.layout) : '')
							+ "</td>");
					break;
				case 6:
					td = $("<td align='center'>"
							+ (obj.colorsName != null ? formatStr(obj.colorsName)
									: '') + "</td>");
					break;
				case 7:
					td = $("<td align='center'>"
							+ (obj.number != null ? obj.number : '') + "</td>");
					break;
				case 8:
					td = $("<td align='center'>"
							+ (obj.loss != null ? obj.loss : '') + "</td>");
					break;
				case 9:
					td = $("<td align='center' >"
							+ (obj.descr != null ? formatStr(obj.descr) : '')
							+ "</td>");
					break;
				default:
					break;
				}
				td.appendTo(tr);
				j++;
			}
		}
	}
</script>