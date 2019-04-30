package cn.com.fsun.bus.web;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.com.fsun.bus.dto.AfterProcessDto;
import cn.com.fsun.bus.dto.AfterProcessDtoList;
import cn.com.fsun.bus.dto.CustomerDto;
import cn.com.fsun.bus.dto.OrderDto;
import cn.com.fsun.bus.dto.ProduceDto;
import cn.com.fsun.bus.dto.ProductDto;
import cn.com.fsun.bus.service.AfterProcessService;
import cn.com.fsun.bus.service.OrderService;
import cn.com.fsun.bus.service.ProduceService;
import cn.com.fsun.bus.service.ProductService;
import cn.com.fsun.common.result.JsonUtil;
import cn.com.fsun.common.utils.PageInfo;
import cn.com.fsun.common.web.BaseController;
import cn.com.fsun.constants.CommonConstant;
import cn.com.fsun.sys.service.LogService;
import cn.com.fsun.sys.service.MenuService;

@Controller
@RequestMapping("/bus/produce")
public class ProduceController extends BaseController{

	@Autowired
	private ProduceService produceService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private AfterProcessService afterProcessService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private LogService logService;
	
	private String message = null;
	
	/**
	 * @description 显示列表
	 * @return ModelMap
	 * @param
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/manage", method={RequestMethod.GET,RequestMethod.POST})
	public String manage() {
		return "bus/produce/manage";
	}
	
	/**
	 * @description 显示列表
	 * @return ModelMap
	 * @param
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/orderDetail-{orderId}-{isEdit}", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView orderDetail(@PathVariable("orderId") String orderId,@PathVariable("isEdit") Boolean isEdit) {
		ModelAndView mav = new ModelAndView("bus/produce/operate/order_detail");
		mav.addObject("orderId", orderId);
		mav.addObject("isEdit", isEdit);
		OrderDto orderDto = orderService.load(orderId);
		mav.addObject("orderDto", orderDto);
		return mav;
	}
	
	/**
	 * @description 查询
	 * @return ModelMap
	 * @param orderDto
	 * @return
	 * @update 2013-3-11
	 */
	@RequestMapping(value = "/getOrderList", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap getOrderList(OrderDto orderDto){
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
		List<OrderDto> orderDtos = produceService.getOrderList(orderDto, pageInfo,isPage);
		return JsonUtil.getObjectList(Boolean.TRUE, orderDtos,produceService.getOrderCount(orderDto, pageInfo) );
	}
	
	/**
	 * @description 查询
	 * @return ModelMap
	 * @param orderDto
	 * @return
	 * @update 2013-3-11
	*/
	@RequestMapping(value = "/getDeliverInfo", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap getDeliverInfo(@RequestParam("ids") String ids,@RequestParam("productIds") String productIds){
		List<ProduceDto> produceDtos = produceService.getDeliverInfo(ids,productIds,menuService.hasOperatePower(super.getCurrentUserID()));
		return JsonUtil.getObjectList(Boolean.TRUE,produceDtos,produceDtos!=null?produceDtos.size():0);
	}
	 
	
	/**
	 * @description 获取生产单及相关信息
	 * @return ModelMap
	 * @param orderDto
	 * @return
	 * @update 2013-3-11
	 */
	@RequestMapping(value = "/getProduceInfo", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap getProduceInfo(@RequestParam("ids") String ids){
		List<ProduceDto> produceDtos = produceService.getProduceInfo(ids);
		return JsonUtil.getObjectList(Boolean.TRUE,produceDtos,produceDtos!=null?produceDtos.size():0);
	}
	
	
	@RequestMapping(value="/product/view",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView view(@RequestParam("productCode") String productCode,@RequestParam("rowIndex") String rowIndex){
		ModelAndView mav = new ModelAndView();
		ProductDto productDto=null;
		AfterProcessDtoList afterProcess = new AfterProcessDtoList();
		if(null==productCode){
			productDto = new ProductDto();
		}
		else{
			productDto = productService.loadByCode(productCode);
			if(productDto!=null && !"".equals(productDto.getId())){
				List<AfterProcessDto> list = afterProcessService.getProcessByProductId(productDto.getId());				
				afterProcess.setAfterProcessDtoList(list);
			}						
		}		
		mav.addObject("product",productDto);
		mav.addObject("afterProcessList",afterProcess);
		mav.addObject("rowIndex",rowIndex);
		mav.setViewName("bus/produce/view");		
		return mav;
	}
	
	/**
	 * @description 修改送货单打印状态
	 * @return ModelMap
	 * @param
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/changePrintStatus", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap changePrintStatus(@RequestParam("id") String id) {
		Integer loglevel = null;
		try{
			orderService.changePrintStatus(id,true);	
			message = "订单ids: " + id + "修改送货单打印状态成功";
			loglevel = CommonConstant.Log_Type_UPDATE;
			logService.addLog(message, loglevel, CommonConstant.Log_Leavel_INFO);
			return JsonUtil.getResult(Boolean.TRUE);
		}catch (Exception e) {
			return JsonUtil.getResult(Boolean.FALSE);
		}					
		
	}
	
	/**
	 * @description 修改生产单打印状态
	 * @return ModelMap
	 * @param
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/changeProducePrintStatus", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap changeProducePrintStatus(@RequestParam("id") String id) {
		Integer loglevel = null;
		try{
			orderService.changeProducePrintStatus(id,true);	
			message = "订单ids: " + id + "修改生产单打印状态成功";
			loglevel = CommonConstant.Log_Type_UPDATE;
			logService.addLog(message, loglevel, CommonConstant.Log_Leavel_INFO);
			return JsonUtil.getResult(Boolean.TRUE);
		}catch (Exception e) {
			return JsonUtil.getResult(Boolean.FALSE);
		}					
		
	}
	
	
	/**
	 * @description 更新快件单号
	 * @return ModelMap
	 * @param orderDto
	 * @return
	 * @update 2013-2-21
	 */
	@RequestMapping(value = "/order/update", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap orderUpdate(OrderDto orderDto) {
		try{					
			produceService.orderUpdate(orderDto);						
			message = "生产单ID: " + orderDto.getId()+ "更新成功";			
			logService.addLog(message, CommonConstant.Log_Type_UPDATE, CommonConstant.Log_Leavel_INFO);
			return JsonUtil.getResult(Boolean.TRUE);
		}catch (Exception e) {
			e.printStackTrace();
			return JsonUtil.getObject(Boolean.FALSE, "保存失败！");
		}
		
	}

}
