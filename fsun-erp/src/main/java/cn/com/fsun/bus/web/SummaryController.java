package cn.com.fsun.bus.web;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLDecoder;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.fsun.bus.dto.BuyDetailDto;
import cn.com.fsun.bus.dto.BuyInfoDto;
import cn.com.fsun.bus.dto.DeliverySummaryDto;
import cn.com.fsun.bus.dto.DetailSummary;
import cn.com.fsun.bus.dto.OrderDto;
import cn.com.fsun.bus.dto.ProductSalesDto;
import cn.com.fsun.bus.dto.ProxySummaryDto;
import cn.com.fsun.bus.service.DetailSummaryService;
import cn.com.fsun.bus.service.OrderService;
import cn.com.fsun.bus.service.SummaryService;
import cn.com.fsun.bus.service.itf.DeliveryDetailSummaryService;
import cn.com.fsun.bus.service.itf.ProxyDetailSummaryService;
import cn.com.fsun.common.result.JsonUtil;
import cn.com.fsun.common.utils.DateUtil;
import cn.com.fsun.common.utils.PageInfo;
import cn.com.fsun.common.web.BaseController;

@Controller
@RequestMapping("/bus/summary")
public class SummaryController extends BaseController{
	
	@Autowired
	private SummaryService summaryService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private DetailSummaryService detailSummaryService;

	@Autowired
	private DeliveryDetailSummaryService deliveryDetailSummaryService;
	
	
	@Autowired
	private ProxyDetailSummaryService proxyDetailSummaryService;
	
	/**
	 * 获取产品销量汇总表
	 * @return
	 */
	@RequestMapping(value = "/productSales", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap productSalesSummary(ProductSalesDto productSalesDto){
		List<ProductSalesDto> productSalesDtos = null;
		try {
			productSalesDtos = summaryService.productSales(productSalesDto);
		} catch (NumberFormatException e) {			
			e.printStackTrace();
			JsonUtil.getResult(false);
		} catch (ParseException e) {
			e.printStackTrace();
			JsonUtil.getResult(false);
		}
		return JsonUtil.getObject(Boolean.TRUE,productSalesDtos);
	}
	
	/**
	 * 获取订单汇总表
	 * @return
	 */
	@RequestMapping(value = "/order", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap orderSummary(OrderDto orderDto){
		PageInfo pageInfo = new PageInfo();
		boolean hasPage = false;
		if(null!=orderDto){
			if(null!=orderDto.getRows()&& null!=orderDto.getPage()){
				int firstRecord = (orderDto.getPage()-1)*orderDto.getRows();
				pageInfo.setFirstRecord(firstRecord);
				pageInfo.setPageSize(orderDto.getRows());
				hasPage = true;
			}
			if(StringUtils.isNotEmpty(orderDto.getSort())){
				pageInfo.setSortColumn(orderDto.getSort());
			}
			if(StringUtils.isNotEmpty(orderDto.getOrder())){
				pageInfo.setSortType(orderDto.getOrder());
			}
			if(orderDto.getStartDate() !=null &&!"".equals(orderDto.getStartDate())){
				pageInfo.setStartDate(orderDto.getStartDate()+" 00:00:00");
			}
			if(orderDto.getEndDate() !=null &&!"".equals(orderDto.getEndDate())){
				pageInfo.setEndDate(orderDto.getEndDate()+" 23:59:59");
			}
		}		
				
		List<OrderDto> orderDtos = null;
		orderDtos = orderService.orderSummary(orderDto,pageInfo,hasPage);
		if (hasPage) {
			return JsonUtil.getObjectList(Boolean.TRUE,orderDtos,orderService.orderSummaryCount(orderDto,pageInfo));
		}else{
			return JsonUtil.getObject(Boolean.TRUE,orderDtos);
		}	
	}
	
	/**
	 * @description 订单汇总页面
	 * @return String
	 * @param
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/order/manage", method={RequestMethod.GET,RequestMethod.POST})
	public String productSalesManage() {
		return "bus/summary/order/manage";
	}
	
	/**
	 * @description 查询
	 * @return ModelMap
	 * @param buyInfoDto
	 * @return
	 * @update 2013-3-11
	 */
	@RequestMapping(value = "/getDetailSummary", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap getDetailSummary(DetailSummary SummaryDetail){
		PageInfo pageInfo = new PageInfo();
		boolean isPage = false;
		if(null!=SummaryDetail){
			if(null!=SummaryDetail.getRows()&& null!=SummaryDetail.getPage()){
				int firstRecord = (SummaryDetail.getPage()-1)*SummaryDetail.getRows();
				pageInfo.setFirstRecord(firstRecord);
				pageInfo.setPageSize(SummaryDetail.getRows());
				isPage = true;
			}
			if(StringUtils.isNotEmpty(SummaryDetail.getSort())){
				pageInfo.setSortColumn(SummaryDetail.getSort());
			}
			if(StringUtils.isNotEmpty(SummaryDetail.getOrder())){
				pageInfo.setSortType(SummaryDetail.getOrder());
			}
			if(SummaryDetail.getStartDate() !=null &&!"".equals(SummaryDetail.getStartDate())){
				pageInfo.setStartDate(SummaryDetail.getStartDate()+" 00:00:00");
			}
			if(SummaryDetail.getEndDate() !=null &&!"".equals(SummaryDetail.getEndDate())){
				pageInfo.setEndDate(SummaryDetail.getEndDate()+" 23:59:59");
			}
		}
		
		List<DetailSummary> buyInfoDtos = detailSummaryService.getDetailSummary(SummaryDetail,pageInfo,isPage);
		return JsonUtil.getObjectList(Boolean.TRUE, buyInfoDtos, detailSummaryService.getSearchCount(SummaryDetail, pageInfo));
	}
	
	/*@RequestMapping(value = "/detail/excelExport", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView excelExport(ModelMap model, HttpServletRequest request,HttpServletResponse response,DetailSummary SummaryDetail){
		//view_excel是在spring配置文件里配置的ExcelRevenueReportView,第二个和第三个参数采用键值对方法提供给buildExcelDocument方法使用
		model.addAttribute("fileName", "订单明细表");
		HashMap<String,String> header = new HashMap<String,String>();
		header.put("orderCode", "订单编号");
		header.put("productCode", "产品编号");
		header.put("productName", "产品名称");
		header.put("style", "产品款号");
		header.put("number", "数量");
		header.put("realNumber", "实际数量");
		header.put("unit", "单位");
		header.put("customerName", "客户名称");
		header.put("receiveTime", "交货日期");
		header.put("onePrice", "单价(元)");
		header.put("allPrice", "金额(元)");
		header.put("papers", "大张数量");
		header.put("prints", "印次");
		header.put("description", "备注");		
		model.addAttribute("titles", header);
		
		//对得到的参数进行解码 
		try {		
			if(SummaryDetail.getCustomerName()!=null &&!"".equals(SummaryDetail.getCustomerName())){
				SummaryDetail.setCustomerName(URLDecoder.decode(SummaryDetail.getCustomerName(),"utf-8"));
			}
			if(SummaryDetail.getProductName()!=null &&!"".equals(SummaryDetail.getProductName())){
				SummaryDetail.setProductName(URLDecoder.decode(SummaryDetail.getProductName(),"utf-8"));
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		List<DetailSummary> data = detailSummaryService.getDataForExcelExport(SummaryDetail);
		model.addAttribute("data", data);
		
		ExportExcel exportExcel =  new ExportExcel(SummaryDetail);
		return new ModelAndView(exportExcel,model);
	}
	*/
	
	private String temp_path = "upload_temp/";
	
	@RequestMapping(value = "/detail/writeExcel", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap writeExcel(HttpServletRequest request,HttpServletResponse response,DetailSummary summaryDetail){	
		
		try{
			String rootPath = request.getSession().getServletContext().getRealPath("/");
			String fileName =  "订单明细表-"+ DateUtil.formateDate(new Date(), "yyyy-MM-dd") +".xlsx";
			String[] titles = {"订单编号","产品编号","产品名称","产品款号","数量",
					"实际数量","单位","客户名称","交货日期","单价(元)","金额(元)","大张数量","印次","备注"};
			fileName = detailSummaryService.writeExcel(summaryDetail,rootPath,temp_path,fileName,titles);			
			return JsonUtil.getObject(Boolean.TRUE,fileName);
		}catch (Exception e) {
			e.printStackTrace();
			return JsonUtil.getResult(Boolean.FALSE);
		}		
	}
	
	@RequestMapping(value = "/detail/excelExport1", method={RequestMethod.GET,RequestMethod.POST})
	public void excelExport1(HttpServletRequest request,HttpServletResponse response,
			@RequestParam("file") String file, @RequestParam("fileName") String fileName){
		
		InputStream inputStream =null;
		OutputStream os = null;
		try {						      	
			fileName = URLDecoder.decode(fileName,"utf-8")+"-"+ DateUtil.formateDate(new Date(), "yyyy-MM-dd") +".xlsx";
			response.setCharacterEncoding("utf-8");  
	        response.setContentType("multipart/form-data");
			response.setHeader("Content-Disposition", "attachment;filename="+ new String(fileName.getBytes("gb2312"), "ISO8859-1" ));
			
			String rootPath = request.getSession().getServletContext().getRealPath("/");
			String fileStr = URLDecoder.decode(file,"utf-8");
			inputStream = new FileInputStream(rootPath + temp_path +fileStr);			
	        os = response.getOutputStream();  
	        byte[] b=new byte[1024];  
	        int length;  
	        while((length=inputStream.read(b))>0){  
	            os.write(b,0,length);  
	        }  	         
	    } catch (FileNotFoundException e) {  
	        e.printStackTrace();  
	    }catch (IOException e) {  
	        e.printStackTrace();  
	    }finally {
        	try {
    			if(inputStream != null){
    				inputStream.close();
    			}
				if(os != null){
	        		os.close();
	        	}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}   
	}
	
	/**
	 * @description 订单明细汇总页面
	 * @return String
	 * @param
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/orderDetail/manage", method={RequestMethod.GET,RequestMethod.POST})
	public String productDetailManage() {
		return "bus/summary/orderDetail/manage";
	}
	
	
	/*************************************************        采购模块汇总             ******************************************************/
	
	/**
	 * @description 物料采购明细汇总页面
	 * @return String
	 * @param
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/buyDetail/manage", method={RequestMethod.GET,RequestMethod.POST})
	public String buyDetailManage() {
		return "bus/summary/buyDetail/manage";
	}
	
	/**
	 * 获取物料采购明细汇总表
	 * @return
	 */
	@RequestMapping(value = "/buyDetail/list", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap buyDetailSummary(BuyInfoDto buyInfoDto,cn.com.fsun.common.pageInfo.PageInfo pageInfo){
		
		try {
			List<BuyDetailDto> buyDetailDtos = detailSummaryService.buyDetailSummary(buyInfoDto,pageInfo);
			return JsonUtil.getObjectList(Boolean.TRUE,buyDetailDtos,pageInfo.getTotal());
		} catch (NumberFormatException e) {			
			e.printStackTrace();
			return JsonUtil.getObjectList(Boolean.TRUE,new ArrayList<BuyInfoDto>(),0);
		}		
	}

	
	@RequestMapping(value = "/detail/buyInfo/writeExcel", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap writeExcel(HttpServletRequest request,HttpServletResponse response,BuyInfoDto buyInfoDto){	
		
		try{
			String rootPath = request.getSession().getServletContext().getRealPath("/");
			String fileName =  "物料采购明细表-"+ DateUtil.formateDate(new Date(), "yyyy-MM-dd") +".xlsx";
			String[] titles = {"采购单号","物料名称","规格型号","供货厂家","数量","单位","单价(元)","金额(元)",
					"需求日期","存放仓库","收货人","计划人","备注"};
			fileName = detailSummaryService.writeExcel(buyInfoDto,rootPath,temp_path,fileName,titles);			
			return JsonUtil.getObject(Boolean.TRUE,fileName);
		}catch (Exception e) {
			e.printStackTrace();
			return JsonUtil.getResult(Boolean.FALSE);
		}		
	}
	
	
	/*****************************************************   送货单明细汇总表      ****************************************************************/
	/**
	 * @description 订单汇总页面
	 * @return String
	 * @param
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/deliveryDetail/manage", method={RequestMethod.GET,RequestMethod.POST})
	public String deliveryDetailManage() {
		return "bus/summary/deliveryDetail/manage";
	}
	
	/**
	 * @description 查询
	 * @return ModelMap
	 * @param buyInfoDto
	 * @return
	 * @update 2013-3-11
	 */
	@RequestMapping(value = "/deliveryDetail/getDetailSummary", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap getDeliveryDetailSummary(DeliverySummaryDto deliverySummaryDto){
		
		PageInfo pageInfo = new PageInfo();
		boolean isPage = false;
		if(null!= deliverySummaryDto){
			if(null!=deliverySummaryDto.getRows()&& null!=deliverySummaryDto.getPage()){
				int firstRecord = (deliverySummaryDto.getPage()-1)*deliverySummaryDto.getRows();
				pageInfo.setFirstRecord(firstRecord);
				pageInfo.setPageSize(deliverySummaryDto.getRows());
				isPage = true;
			}
			
			if(StringUtils.isNotEmpty(deliverySummaryDto.getSort())){
				pageInfo.setSortColumn(deliverySummaryDto.getSort());
			}
			if(StringUtils.isNotEmpty(deliverySummaryDto.getOrder())){
				pageInfo.setSortType(deliverySummaryDto.getOrder());
			}
			if(deliverySummaryDto.getStartDate() !=null &&!"".equals(deliverySummaryDto.getStartDate())){
				pageInfo.setStartDate(deliverySummaryDto.getStartDate()+" 00:00:00");
			}
			if(deliverySummaryDto.getEndDate() !=null &&!"".equals(deliverySummaryDto.getEndDate())){
				pageInfo.setEndDate(deliverySummaryDto.getEndDate()+" 23:59:59");
			}
		}	

		List<DeliverySummaryDto> deliveryExportDtos = deliveryDetailSummaryService.search(deliverySummaryDto, pageInfo, isPage);
		return JsonUtil.getObjectList(Boolean.TRUE, deliveryExportDtos,deliveryDetailSummaryService.searchCount(deliverySummaryDto, pageInfo));
	}
	
	
	@RequestMapping(value = "/deliveryDetail/writeExcel", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap deliveryDetailWriteExcel(HttpServletRequest request,HttpServletResponse response,
			DeliverySummaryDto deliverySummaryDto){	
		
		try{
			String rootPath = request.getSession().getServletContext().getRealPath("/");
			String fileName =  "送货明细汇总-"+ DateUtil.formateDate(new Date(), "yyyy-MM-dd") +".xlsx";
			String[] titles = {"送货单号","单据类型","客户名称","产品名称","款号","产品全称","数量","单位","收货时间",
					"收货状态","相关订单号", "制单人","制单时间","单价(元)","金额(元)","备注"};
			
			PageInfo pageInfo = new PageInfo();
			if(null!= deliverySummaryDto){
				if(StringUtils.isNotEmpty(deliverySummaryDto.getSort())){
					pageInfo.setSortColumn(deliverySummaryDto.getSort());
				}
				if(StringUtils.isNotEmpty(deliverySummaryDto.getOrder())){
					pageInfo.setSortType(deliverySummaryDto.getOrder());
				}
				if(deliverySummaryDto.getStartDate() !=null &&!"".equals(deliverySummaryDto.getStartDate())){
					pageInfo.setStartDate(deliverySummaryDto.getStartDate()+" 00:00:00");
				}
				if(deliverySummaryDto.getEndDate() !=null &&!"".equals(deliverySummaryDto.getEndDate())){
					pageInfo.setEndDate(deliverySummaryDto.getEndDate()+" 23:59:59");
				}
			}
			fileName = deliveryDetailSummaryService.writeExcel(deliverySummaryDto,pageInfo,rootPath,temp_path,fileName,titles);			
			return JsonUtil.getObject(Boolean.TRUE,fileName);
		}catch (Exception e) {
			e.printStackTrace();
			return JsonUtil.getResult(Boolean.FALSE);
		}		
	}
	
	
	/*@RequestMapping(value = "/deliveryDetail/excelExport", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView deliveryDetailExcelExport(ModelMap model, HttpServletRequest request,
		HttpServletResponse response, DeliverySummaryDto deliverySummaryDto){
		//view_excel是在spring配置文件里配置的ExcelRevenueReportView,第二个和第三个参数采用键值对方法提供给buildExcelDocument方法使用
		model.addAttribute("fileName", "送货单查询信息表");
		HashMap<String,String> header = new HashMap<String,String>();
	
		header.put("deliveryCode", "送货单号");
		header.put("deliveryTypeName", "单据类型");
		header.put("customerName", "客户名称");
		header.put("receiveTime", "收货时间");
		header.put("receiveStatus", "收货状态");
		header.put("createManName", "制单人");
		header.put("createTime", "制单时间");
		
		header.put("productName", "产品名称");
		header.put("style", "款号");
		header.put("number", "数量");
		header.put("unit", "单位");
		header.put("onePrice", "单价");
		header.put("allPrice", "总价");
		header.put("description", "备注");	
		model.addAttribute("titles", header);
		
		PageInfo pageInfo = new PageInfo();
		if(null!= deliverySummaryDto){
			if(StringUtils.isNotEmpty(deliverySummaryDto.getSort())){
				pageInfo.setSortColumn(deliverySummaryDto.getSort());
			}
			if(StringUtils.isNotEmpty(deliverySummaryDto.getOrder())){
				pageInfo.setSortType(deliverySummaryDto.getOrder());
			}
			if(deliverySummaryDto.getStartDate() !=null &&!"".equals(deliverySummaryDto.getStartDate())){
				pageInfo.setStartDate(deliverySummaryDto.getStartDate()+" 00:00:00");
			}
			if(deliverySummaryDto.getEndDate() !=null &&!"".equals(deliverySummaryDto.getEndDate())){
				pageInfo.setEndDate(deliverySummaryDto.getEndDate()+" 23:59:59");
			}
		}		
		List<DeliveryExportDto> data = deliveryDetailSummaryService.excelExport(deliverySummaryDto,pageInfo);
		model.addAttribute("data", data);
		
		ExportExcel exportExcel =  new ExportExcel(deliverySummaryDto);
		return new ModelAndView(exportExcel,model);
	}
	*/
	
	
	
	/*****************************************************   加工单明细汇总表      ****************************************************************/
	/**
	 * @description 订单汇总页面
	 * @return String
	 * @param
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/proxyDetail/manage", method={RequestMethod.GET,RequestMethod.POST})
	public String proxyDetailManage() {
		return "bus/summary/proxyDetail/manage";
	}
	
	/**
	 * @description 查询
	 * @return ModelMap
	 * @param buyInfoDto
	 * @return
	 * @update 2013-3-11
	 */
	@RequestMapping(value = "/proxyDetail/getDetailSummary", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap getProxyDetailSummary(ProxySummaryDto proxySummaryDto){
		
		PageInfo pageInfo = new PageInfo();
		boolean isPage = false;
		if(null!= proxySummaryDto){
			if(null!=proxySummaryDto.getRows()&& null!=proxySummaryDto.getPage()){
				int firstRecord = (proxySummaryDto.getPage()-1)*proxySummaryDto.getRows();
				pageInfo.setFirstRecord(firstRecord);
				pageInfo.setPageSize(proxySummaryDto.getRows());
				isPage = true;
			}
			
			if(StringUtils.isNotEmpty(proxySummaryDto.getSort())){
				pageInfo.setSortColumn(proxySummaryDto.getSort());
			}
			if(StringUtils.isNotEmpty(proxySummaryDto.getOrder())){
				pageInfo.setSortType(proxySummaryDto.getOrder());
			}
			if(proxySummaryDto.getStartDate() !=null &&!"".equals(proxySummaryDto.getStartDate())){
				pageInfo.setStartDate(proxySummaryDto.getStartDate()+" 00:00:00");
			}
			if(proxySummaryDto.getEndDate() !=null &&!"".equals(proxySummaryDto.getEndDate())){
				pageInfo.setEndDate(proxySummaryDto.getEndDate()+" 23:59:59");
			}
		}	

		List<ProxySummaryDto> proxyExportDtos = proxyDetailSummaryService.search(proxySummaryDto, pageInfo, isPage);
		return JsonUtil.getObjectList(Boolean.TRUE, proxyExportDtos,proxyDetailSummaryService.searchCount(proxySummaryDto, pageInfo));
	}
	
	
	@RequestMapping(value = "/proxyDetail/writeExcel", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap proxyDetailWriteExcel(HttpServletRequest request,HttpServletResponse response,
			ProxySummaryDto proxySummaryDto){	
		
		try{
			String rootPath = request.getSession().getServletContext().getRealPath("/");
			String fileName =  "加工明细汇总-"+ DateUtil.formateDate(new Date(), "yyyy-MM-dd") +".xlsx";
			String[] titles = {
				"加工单号", "客户名称", "是否付款", "单据金额", "注意事项", "交货日期", "制单人", "制单时间",
				"产品名称", "生产机型", "工序", "ps版数量", "印刷方式", "色数", "印刷数量", "印损", "备注"
			};
			
			PageInfo pageInfo = new PageInfo();
			if(null!= proxySummaryDto){
				if(StringUtils.isNotEmpty(proxySummaryDto.getSort())){
					pageInfo.setSortColumn(proxySummaryDto.getSort());
				}
				if(StringUtils.isNotEmpty(proxySummaryDto.getOrder())){
					pageInfo.setSortType(proxySummaryDto.getOrder());
				}
				if(proxySummaryDto.getStartDate() !=null &&!"".equals(proxySummaryDto.getStartDate())){
					pageInfo.setStartDate(proxySummaryDto.getStartDate()+" 00:00:00");
				}
				if(proxySummaryDto.getEndDate() !=null &&!"".equals(proxySummaryDto.getEndDate())){
					pageInfo.setEndDate(proxySummaryDto.getEndDate()+" 23:59:59");
				}
			}
			fileName = proxyDetailSummaryService.writeExcel(proxySummaryDto,pageInfo,rootPath,temp_path,fileName,titles);			
			return JsonUtil.getObject(Boolean.TRUE,fileName);
		}catch (Exception e) {
			e.printStackTrace();
			return JsonUtil.getResult(Boolean.FALSE);
		}		
	}
	
}


