package cn.com.fsun.bus.web;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.com.fsun.bus.domain.BusOrderDetail;
import cn.com.fsun.bus.dto.AfterProcessDto;
import cn.com.fsun.bus.dto.CustomerDto;
import cn.com.fsun.bus.dto.OrderDetailDto;
import cn.com.fsun.bus.dto.OrderDto;
import cn.com.fsun.bus.dto.OrderTackDto;
import cn.com.fsun.bus.dto.ProductDto;
import cn.com.fsun.bus.dto.ReorderDto;
import cn.com.fsun.bus.exception.UnEnoughOrderCodeException;
import cn.com.fsun.bus.service.CustomerService;
import cn.com.fsun.bus.service.OrderService;
import cn.com.fsun.common.dto.CommonDto;
import cn.com.fsun.common.excel.ExportExcel;
import cn.com.fsun.common.result.JsonUtil;
import cn.com.fsun.common.utils.PageInfo;
import cn.com.fsun.common.web.BaseController;
import cn.com.fsun.constants.CommonConstant;
import cn.com.fsun.sys.service.LogService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/bus/order")
public class OrderController extends BaseController {

	@Autowired
	private OrderService orderService;
	
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private LogService logService;
	
	private String message = null;
	
	/**
	 * @description 加载所有菜单节点
	 * @return ModelMap
	 * @return
	 * @update 2012-8-13 上午10:58:27
	 */
	@RequestMapping(value = "/list", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap list() {
		List<OrderDto> list = orderService.list();
		return JsonUtil.getObjectList(Boolean.TRUE, list, list.size());
	}

	/**
	 * @description 查询
	 * @return ModelMap
	 * @param buyInfoDto
	 * @return
	 * @update 2013-3-11
	 */
	@RequestMapping(value = "/existOrderByCustomerCode-{customerCodes}", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap existOrderByCustomerCode(@PathVariable("customerCodes") String customerCodes){
		try{
			if (orderService.existOrderByCustomerCode(customerCodes)) {
				return JsonUtil.getResult(Boolean.TRUE);
			}	
		}catch (Exception e) {
			e.printStackTrace();
			return JsonUtil.getResult(Boolean.TRUE);
		}
		return JsonUtil.getResult(Boolean.FALSE);	
	}
	
	/**
	 * 获取键值对code
	 * @return List<CommonDto>
	 */	
	@RequestMapping(value = "/getCodes", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<CommonDto> getCodes(){
		return orderService.getCodes();
	}
	
	/**
	 * @description 查询
	 * @return ModelMap
	 * @param orderDto
	 * @return
	 * @update 2013-3-11
	 */
	@RequestMapping(value = "/search", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap search(OrderDto orderDto){
		PageInfo pageInfo = new PageInfo();
		boolean isPage = false;
		if(null!=orderDto){
			if(null!=orderDto.getRows()&& null!=orderDto.getPage()){
				int firstRecord = (orderDto.getPage()-1)*orderDto.getRows();
				pageInfo.setFirstRecord(firstRecord);
				pageInfo.setPageSize(orderDto.getRows());
				isPage = true;
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
		
		List<OrderDto> orderDtos = orderService.search(orderDto, pageInfo,isPage);
		return JsonUtil.getObjectList(Boolean.TRUE, orderDtos, orderService.getSearchCount(orderDto, pageInfo));
	}
	
	
	/**
	 * @description 增加或者更新
	 * @return ModelMap
	 * @param orderDto
	 * @return
	 * @update 2013-2-21
	 */
	@RequestMapping(value = "/save", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap save(OrderDto orderDto) {
		try{
			if(!orderDto.getCustomerName().equals(orderDto.getCustomerCode())){
				return JsonUtil.getObject(Boolean.FALSE, "客户不存在");
			}else{
				CustomerDto customerDto = customerService.loadByCode(orderDto.getCustomerName());
				if(customerDto==null|| customerDto.getName()==null || "".equals(customerDto.getName())){
					return JsonUtil.getObject(Boolean.FALSE, "客户不存在");
				}else{
					orderDto.setCustomerName(customerDto.getName());			
				}
			}		
			
			Integer loglevel = null;		
			orderDto = orderService.save(orderDto);			
			if(StringUtils.isNotEmpty(orderDto.getId())){
				message = "订单ID: " + orderDto.getId()+ "更新成功";
				loglevel = CommonConstant.Log_Type_UPDATE;
			}else{
				message = "订单ID: " + orderDto.getId()+ "插入成功";
				loglevel = CommonConstant.Log_Type_INSERT;
			}
			logService.addLog(message, loglevel, CommonConstant.Log_Leavel_INFO);
			return JsonUtil.getResult(Boolean.TRUE);
		}catch (UnEnoughOrderCodeException e) {
			e.printStackTrace();
			return JsonUtil.getObject(Boolean.FALSE, e.getMessage());
		}catch (Exception e) {
			e.printStackTrace();
			return JsonUtil.getObject(Boolean.FALSE, "保存失败！");
		}
		
	}
	
	/**
	 * @description 追加新订单
	 * @return ModelMap
	 * @param orderDto
	 * @return
	 * @update 2013-2-21
	 */
	@RequestMapping(value = "/tack", method={RequestMethod.POST})
	@ResponseBody
	public ModelMap tack(@RequestBody OrderTackDto orderTackDto) {
		try{
			List<BusOrderDetail> orderDetails = orderService.tack(orderTackDto);			
			return JsonUtil.getObject(Boolean.TRUE, orderDetails);
		}catch (UnEnoughOrderCodeException e) {
			e.printStackTrace();
			return JsonUtil.getObject(Boolean.FALSE, e.getMessage());
		}catch (Exception e) {
			e.printStackTrace();
			return JsonUtil.getObject(Boolean.FALSE, "追加单保存失败！");
		}
		
	}
	
	/**
	 * @description 增加产品及去订单信息
	 * @return ModelMap
	 * @param orderDto
	 * @return
	 * @update 2013-2-21
	 */
	@RequestMapping(value = "/product/save", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap saveProduct(@RequestParam("products") String products,@RequestParam("productInfo") String productInfo
			,@RequestParam("process") String process,@RequestParam("orderId") String orderId,HttpServletRequest request, HttpServletResponse response) {
		
		ProductDto productDto = null;
		try{			
			JSONArray json = JSONArray.fromObject(products);
			List<OrderDetailDto> orderDetailDtos = (List<OrderDetailDto>)JSONArray.toCollection(json, OrderDetailDto.class);
			
			JSONObject jsonObject = JSONObject.fromObject(productInfo);
			productDto =(ProductDto) JSONObject.toBean(jsonObject, ProductDto.class) ;
		
			productDto.setEnabled(true);			
			
			JSONArray json1 = JSONArray.fromObject(process);
			List<AfterProcessDto> afterProcessDtos = (List<AfterProcessDto>)JSONArray.toCollection(json1, AfterProcessDto.class);
			
			Integer loglevel = null;		
            orderService.saveProduct(orderDetailDtos,productDto,afterProcessDtos,orderId);			
			
			message = "订单ID: " + orderId+ "下的产品"+ productDto.getName() +"及其订单信息插入成功";	
			loglevel = CommonConstant.Log_Type_INSERT;			
			logService.addLog(message, loglevel, CommonConstant.Log_Leavel_INFO);
			return JsonUtil.getResult(Boolean.TRUE);
		}catch (Exception e) {			 
			if(productDto!=null && productDto.getIcon()!=null && !"".equals(productDto.getIcon())){
				File f = new File(request.getSession().getServletContext().getRealPath("/") + CommonConstant.UPLOAD_BASE_PATH + "/product"+productDto.getIcon());
			    f.delete();
			}			
			return JsonUtil.getResult(Boolean.FALSE);
		}
		
	}
	
	/**
	 * @description 新建返单
	 * @return ModelMap
	 * @param orderDto
	 * @return
	 * @update 2013-2-21
	 */
	@RequestMapping(value = "/reorder/save", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap saveReorder(@RequestParam("reorderDetails") String reorderDetails,@RequestParam("orderInfo") String orderInfo
			,@RequestParam("orderId") String orderId) {
		
		OrderDto orderDto = null;
		try{			
			JSONArray json = JSONArray.fromObject(reorderDetails);
			List<OrderDetailDto> orderDetailDtos = (List<OrderDetailDto>)JSONArray.toCollection(json, OrderDetailDto.class);
			
			JSONObject jsonObject = JSONObject.fromObject(orderInfo);
			orderDto =(OrderDto) JSONObject.toBean(jsonObject, OrderDto.class) ;
				
			if(!orderDto.getCustomerName().equals(orderDto.getCustomerCode())){
				return JsonUtil.getObject(Boolean.FALSE, "客户不存在");
			}else{
				CustomerDto customerDto = customerService.loadByCode(orderDto.getCustomerName());
				if(customerDto==null|| customerDto.getName()==null || "".equals(customerDto.getName())){
					return JsonUtil.getObject(Boolean.FALSE, "客户不存在");
				}else{
					orderDto.setCustomerName(customerDto.getName());			
				}
			}	
			
			Integer loglevel = null;		
			String errorInfo = orderService.saveReorder(orderDetailDtos,orderDto);
            if(errorInfo!=null){
            	return JsonUtil.getObject(Boolean.FALSE, errorInfo);
            }			
			message = "订单: " + orderId+ "的返单及其返单产品信息添加成功";	
			loglevel = CommonConstant.Log_Type_INSERT;			
			logService.addLog(message, loglevel, CommonConstant.Log_Leavel_INFO);
			return JsonUtil.getResult(Boolean.TRUE);
		}catch (UnEnoughOrderCodeException e) {
			e.printStackTrace();
			return JsonUtil.getObject(Boolean.FALSE, e.getMessage());
		}catch (Exception e) {			 			
			return JsonUtil.getObject(Boolean.FALSE, "保存失败！");
		}
		
	}
	
	/**
	 * @description 加载一个菜单节点
	 * @return ModelMap
	 * @return
	 * @update 2012-8-13 上午10:58:27
	 */
	@RequestMapping(value = "/load", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap load(@RequestParam("id") String id) {
		OrderDto orderDto = orderService.load(id);
		if (null != orderDto) {
			return JsonUtil.getObject(Boolean.TRUE, orderDto);
		} else {
			return JsonUtil.getResult(Boolean.FALSE);
		}
	}
	
	
	/**
	 * @description 加载一个菜单节点
	 * @return ModelMap
	 * @return
	 * @update 2012-8-13 上午10:58:27
	 */
	@RequestMapping(value = "/existOrderCode", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap existOrderCode(@RequestParam("orderCode") String orderCode) {		
		return JsonUtil.getResult(orderService.existOrderCode(orderCode));
	}
	
	/**
	 * @description 加载一个菜单节点
	 * @return ModelMap
	 * @return
	 * @update 2012-8-13 上午10:58:27
	 */
	@RequestMapping(value = "/getReorderInfo", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap getReorderInfo(@RequestParam("id") String id) {
		ReorderDto reorderDto = orderService.getReorderInfo(id);
		if (null != reorderDto) {
			return JsonUtil.getObject(Boolean.TRUE, reorderDto);
		} else {
			return JsonUtil.getResult(Boolean.FALSE);
		}
	}

	/**
	 * @description 删除多条记录(删除订单信息及订单下相关的进货或者出货信息)
	 * @return ModelMap
	 * @param id
	 * @update 2012-8-9 下午3:53:10
	 */
	@RequestMapping(value = "/delete", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap delete(@RequestParam("id") String id) {
		if(null!=id&&!"".equalsIgnoreCase(id)){
			String ids[] = id.split(",");
			//删除多条记录
			if(null!=ids && ids.length>0){			
				try{
					orderService.delete(ids,"ids");
				}catch(Exception e){
					e.printStackTrace();
					return JsonUtil.getResult(Boolean.FALSE);
				}
				message = "订单(：" + id + ")删除成功";
				logService.addLog(message, CommonConstant.Log_Type_DEL, CommonConstant.Log_Leavel_INFO);		
			}			
		}
		return JsonUtil.getResult(Boolean.TRUE);
	}
	
	/**
	 * @description 显示列表
	 * @return ModelMap
	 * @param
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/manage", method={RequestMethod.GET,RequestMethod.POST})
	public String manage() {
		return "bus/order/manage";
	}

	/**
	 * @description 显示列表
	 * @return ModelMap
	 * @param
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/manage-{orderId}-{pageNumber}-{pageSize}", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView manage(@PathVariable("orderId") String orderId,
			@PathVariable("pageNumber") String pageNumber,@PathVariable("pageSize") String pageSize) {
		ModelAndView mav = new ModelAndView("bus/order/manage");
		mav.addObject("orderId", orderId);
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("pageSize", pageSize);
		return mav;
	}
	
	/**
	 * @description 跳转到添加产品信息的界面
	 * @return ModelMap
	 * @param
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/addProduct-{orderId}-{pageNumber}-{pageSize}", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView addProduct(@PathVariable("orderId") String orderId,
			@PathVariable("pageNumber") String pageNumber,@PathVariable("pageSize") String pageSize) {
		ModelAndView mav = new ModelAndView("bus/order/operate/add_product");
		mav.addObject("orderId", orderId);
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("pageSize", pageSize);
		return mav;
	}
	
	
	/**
	 * @description 跳转到新增返单的界面
	 * @return ModelMap
	 * @param
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/reorder-{orderId}-{pageNumber}-{pageSize}", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView reorder(@PathVariable("orderId") String orderId,
			@PathVariable("pageNumber") String pageNumber,@PathVariable("pageSize") String pageSize) {
		ModelAndView mav = new ModelAndView("bus/order/operate/reorder");
		mav.addObject("orderId", orderId);
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("pageSize", pageSize);
		return mav;
	}
	
	
	@RequestMapping(value = "/shortcutOrder-{orderId}-{pageNumber}-{pageSize}", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView shortcutOrder(@PathVariable("orderId") String orderId,
			@PathVariable("pageNumber") String pageNumber,@PathVariable("pageSize") String pageSize) {
		ModelAndView mav = new ModelAndView("bus/order/operate/shortcut_order");
		try{
			if(orderId==null){
				orderId = orderService.initOrderCode();
			}		
		}catch(Exception e){
			e.printStackTrace();
		}
		mav.addObject("orderId", orderId);
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("pageSize", pageSize);
		return mav;
	}
	
	
	
	/**
	 * @description 跳转到新增或者编辑订单的界面
	 * @return ModelMap
	 * @param
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/operateOrder-{orderId}-{pageNumber}-{pageSize}", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView operateOrder(@PathVariable("orderId") String orderId,
			@PathVariable("pageNumber") String pageNumber,@PathVariable("pageSize") String pageSize) {
		ModelAndView mav = new ModelAndView("bus/order/operate/operate_order");
		mav.addObject("orderId", orderId);
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("pageSize", pageSize);
		return mav;
	}
	
	
	/**
	 * @description 显示列表
	 * @return ModelMap
	 * @param
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/orderDetail-{orderId}", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView orderDetail(@PathVariable("orderId") String orderId) {
		ModelAndView mav = new ModelAndView("bus/order/operate/order_detail");
		mav.addObject("orderId", orderId);
		return mav;
	}
	
	
	/**
	 * @description 显示列表
	 * @return ModelMap
	 * @param
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/changeStatus", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap changeStatus(@RequestParam("orderId") String orderId) {
		Integer loglevel = null;
		orderService.changeStatus(orderService.load(orderId));		
		message = "订单ID: " + orderId+ "更新成功";
		loglevel = CommonConstant.Log_Type_UPDATE;
		logService.addLog(message, loglevel, CommonConstant.Log_Leavel_INFO);
		return JsonUtil.getResult(Boolean.TRUE);
	}
	
	/**
	 * @description 通过id判别是否有操作权限
	 * @return ModelMap
	 * @param
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/operatePower", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap operatePower(@RequestParam("orderId") String orderId) {		
		Boolean operatePower = orderService.operatePower(orderService.load(orderId));		
		return JsonUtil.getResult(operatePower);
	}
	
	@RequestMapping(value = "/excelExport", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView excelExport(ModelMap model, HttpServletRequest request,HttpServletResponse response,OrderDto orderDto){
		//view_excel是在spring配置文件里配置的ExcelRevenueReportView,第二个和第三个参数采用键值对方法提供给buildExcelDocument方法使用
		model.addAttribute("fileName", "订单查询信息表");
		HashMap<String,String> header = new HashMap<String,String>();
		header.put("code", "订单编号");
		header.put("orderType", "订单类型");
		header.put("customerName", "客户名称");
		header.put("receiveTime", "交货时间");
		header.put("express", "快件单号");
		header.put("contract", "合同号");
		header.put("allPrice", "总价(元)");
		header.put("hasGet", "是否已付款");
		header.put("status", "订单状态");
		header.put("strip", "款数");
		//header.put("number", "总数量");
		header.put("createManName", "制单人");
		header.put("createTime", "制单时间");
		header.put("merchandTime", "下单时间");
		header.put("description", "备注");		
		model.addAttribute("titles", header);
		
		//对得到的参数进行解码 
		try {		
			if(orderDto.getCustomerName()!=null &&!"".equals(orderDto.getCustomerName())){
				orderDto.setCustomerName(URLDecoder.decode(orderDto.getCustomerName(),"utf-8"));
			}
			if(orderDto.getStatus()!=null &&!"".equals(orderDto.getStatus())){
				orderDto.setStatus(URLDecoder.decode(orderDto.getStatus(),"utf-8"));
			}
			if(orderDto.getOrderType()!=null &&!"".equals(orderDto.getOrderType())){
				orderDto.setOrderType(URLDecoder.decode(orderDto.getOrderType(),"utf-8"));
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		List<OrderDto> data = orderService.getDataForExcelExport(orderDto);
		model.addAttribute("data", data);
		
		ExportExcel exportExcel =  new ExportExcel(orderDto);
		return new ModelAndView(exportExcel,model);
	}
	
}
