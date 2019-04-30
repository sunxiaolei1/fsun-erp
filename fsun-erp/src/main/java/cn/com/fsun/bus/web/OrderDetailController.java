package cn.com.fsun.bus.web;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
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

import cn.com.fsun.bus.dto.OrderDetailDto;
import cn.com.fsun.bus.dto.OrderDetailDtoList;
import cn.com.fsun.bus.dto.OrderDto;
import cn.com.fsun.bus.service.OrderDetailService;
import cn.com.fsun.bus.service.OrderService;
import cn.com.fsun.bus.service.ProductService;
import cn.com.fsun.common.result.JsonUtil;
import cn.com.fsun.common.utils.PageInfo;
import cn.com.fsun.common.web.BaseController;
import cn.com.fsun.constants.CommonConstant;
import cn.com.fsun.sys.service.LogService;

@Controller
@RequestMapping("/bus/orderDetail")
public class OrderDetailController extends BaseController {

	@Autowired
	private OrderDetailService orderDetailService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private LogService logService;
	
	private String message = null;
	
	
	/**
	 * @description 查询
	 * @return ModelMap
	 * @param buyInfoDto
	 * @return
	 * @update 2013-3-11
	 */
	@RequestMapping(value = "/search", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap search(OrderDetailDto orderDetailDto){
		PageInfo pageInfo = new PageInfo();
		boolean isPage = false;
		if(null!=orderDetailDto){
			if(null!=orderDetailDto.getRows()&& null!=orderDetailDto.getPage()){
				int firstRecord = (orderDetailDto.getPage()-1)*orderDetailDto.getRows();
				pageInfo.setFirstRecord(firstRecord);
				pageInfo.setPageSize(orderDetailDto.getRows());
				isPage = true;
			}
			if(StringUtils.isNotEmpty(orderDetailDto.getSort())){
				pageInfo.setSortColumn(orderDetailDto.getSort());
			}
			if(StringUtils.isNotEmpty(orderDetailDto.getOrder())){
				pageInfo.setSortType(orderDetailDto.getOrder());
			}
		}
		List<OrderDetailDto> orderDtos = orderDetailService.search(orderDetailDto,pageInfo,isPage);
		if (isPage) {
			return JsonUtil.getObjectList(Boolean.TRUE,orderDtos,orderDetailService.getSearchCount(orderDetailDto, pageInfo));
		}else{
			return JsonUtil.getObject(Boolean.TRUE,orderDtos);
		}
	}
	
	/**
	 * 通过ids获取明细列表
	 * TODO
	 * @Title getDetailsByIds   
	 * @param detailIds
	 * @return List<OrderDetailDto>
	 */
	@RequestMapping(value = "/getDetailsByIds-{detailIds}", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<OrderDetailDto> getDetailsByIds(@PathVariable("detailIds") String detailIds) {
		try{
			if(detailIds==null || "".equals(detailIds)){
				return new ArrayList<>();
			}
			return orderDetailService.getDetailsByIds(detailIds);
		}catch (Exception e) {
			e.printStackTrace();
			return new ArrayList<>();
		}
		
	}
	
	/**
	 * @description 查询
	 * @return ModelMap
	 * @param buyInfoDto
	 * @return
	 * @update 2013-3-11
	 */
	@RequestMapping(value = "/existDetailByProductCode-{productCodes}", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap existDetailByProductCode(@PathVariable("productCodes") String productCodes){
		try{
			if (orderDetailService.existDetailByProductCode(productCodes)) {
				return JsonUtil.getResult(Boolean.TRUE);
			}	
		}catch (Exception e) {
			e.printStackTrace();
			return JsonUtil.getResult(Boolean.TRUE);
		}
		return JsonUtil.getResult(Boolean.FALSE);	
	}
	
	/**
	 * @description 显示列表
	 * @return ModelMap
	 * @param
	 * @throws UnsupportedEncodingException 
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/manage_edit", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView manage_edit(@RequestParam("orderId") String orderId,@RequestParam("status") String status) throws UnsupportedEncodingException {
		ModelAndView modelAndView = new ModelAndView();		
		modelAndView.setViewName("/bus/orderDetail/manage_edit");
		modelAndView.addObject("orderId", orderId);
		
		if(URLDecoder.decode(status!=null?status:"","utf-8").equals("已结单")){
			modelAndView.addObject("hasOperatePower", false);
		}else{
			modelAndView.addObject("hasOperatePower", true);
		}		
		return modelAndView;
	}
	
	/**
	 * @description 显示列表
	 * @return ModelMap
	 * @param
	 * @throws UnsupportedEncodingException 
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/order-detail-{index}-{orderId}", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView orderDetail(@PathVariable("index") String index, @PathVariable("orderId") String orderId) {
		ModelAndView modelAndView = new ModelAndView();		
		modelAndView.setViewName("/bus/orderDetail/order-detail");
		modelAndView.addObject("orderId", orderId);
		modelAndView.addObject("currIndex", index);
		OrderDto orderDto = orderService.load(orderId);
		modelAndView.addObject("orderCode", orderDto.getCode());
		if(orderDto.getStatus()!=null && orderDto.getStatus().equals("已结单")){
			modelAndView.addObject("hasOperatePower", false);
		}else{
			modelAndView.addObject("hasOperatePower", true);
		}		
		return modelAndView;
	}
	
	
	
	/**
	 * @description 增加或者更新
	 * @return ModelMap
	 * @param buyInfoDto
	 * @return
	 * @update 2013-2-21
	 */
	@RequestMapping(value = "/save", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap save(OrderDetailDto orderDetailDto) {
		try{
			if(orderDetailDto.getProductCode()==null){
				return JsonUtil.getObject(Boolean.FALSE, "必须选择产品");
			}
						
			Integer loglevel = null;
			orderDetailDto.setEnabled(true);
			try {
				orderDetailDto = orderDetailService.save(orderDetailDto);
			} catch (Exception e) {
				e.printStackTrace();
				return JsonUtil.getResult(Boolean.FALSE);
			}
			OrderDto orderDto = orderService.load(orderDetailDto.getOrderId());
			if(StringUtils.isNotEmpty(orderDetailDto.getId())){
				message = "订单(编号:"+ orderDto.getCode() +")下的产品: " + orderDetailDto.getProductName()+ "更新成功";
				loglevel = CommonConstant.Log_Type_UPDATE;
			}else{
				message = "订单(编号:"+ orderDto.getCode() +")下的产品: " + orderDetailDto.getProductName()+ "插入成功";
				loglevel = CommonConstant.Log_Type_INSERT;
			}
			logService.addLog(message, loglevel, CommonConstant.Log_Leavel_INFO);
			return JsonUtil.getObject(Boolean.TRUE,orderDetailDto,orderDto);		
		}catch (Exception e) {
			e.printStackTrace();
			return JsonUtil.getObject(Boolean.FALSE, "保存失败！");
		}
		
	}
	
	
	/**
	 * @description 增加或者更新(暂时弃用)
	 * @return ModelMap
	 * @param buyInfoDto
	 * @return
	 * @update 2013-2-21
	 */
	@RequestMapping(value = "/batchSave", method = RequestMethod.POST)
	@ResponseBody
	public ModelMap batchSave(OrderDetailDtoList orderDetailDtoList) {
		try{
			String orderCode = orderDetailDtoList.getOrderCode(); 
			if(orderCode!=null && orderDetailDtoList.getOrderDetailDtos()!=null){
				OrderDto orderDto = orderDetailService.batchSave(orderDetailDtoList);
				message = "订单(编号:"+ orderCode +")下的产品批量保存成功";
				logService.addLog(message, CommonConstant.Log_Type_UPDATE, CommonConstant.Log_Leavel_INFO);
				return JsonUtil.getObject(Boolean.TRUE,orderDto);		
			}	
		}catch (Exception e) {
			e.printStackTrace();
		}
		return JsonUtil.getObject(Boolean.FALSE, "批量保存失败！");
		
	}
	
	
	/**
	 * @description 更新
	 * @return ModelMap
	 * @param buyInfoDto
	 * @return
	 * @update 2013-2-21
	 */
	@RequestMapping(value = "/update", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap update(OrderDetailDto orderDetailDto) {
		try{									
			if(StringUtils.isNotEmpty(orderDetailDto.getId())){
				orderDetailService.update(orderDetailDto);
				message = "订单(订单号:"+ orderDetailDto.getOrderId() +")下的产品: " + orderDetailDto.getProductName()+ "更新成功";
				logService.addLog(message, CommonConstant.Log_Type_UPDATE, CommonConstant.Log_Leavel_INFO);
				return JsonUtil.getResult(Boolean.TRUE);
			}else{
				return JsonUtil.getObject(Boolean.FALSE, "该明细不存在！");
			}
					
		}catch (Exception e) {
			e.printStackTrace();
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
		OrderDetailDto orderDetailDto = orderDetailService.load(id);
		if (null != orderDetailDto) {
			return JsonUtil.getObject(Boolean.TRUE, orderDetailDto);
		} else {
			return JsonUtil.getResult(Boolean.FALSE);
		}
	}
	
	/**
	 * @description 删除一条记录
	 * @return ModelMap
	 * @param id
	 * @update 2012-8-9 下午3:53:10
	 */
	@RequestMapping(value = "/delete", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap delete(@RequestParam("id") String id) {
		OrderDto currOrder = new OrderDto();
		try{
			if(null!=id&&!"".equalsIgnoreCase(id)){
				String ids[] = id.split(",");
				String orderId = "";
				//删除多条记录
				if(null!=ids && ids.length>0){
					for(int i=0;i<ids.length;i++){
						OrderDetailDto orderDetailDto = orderDetailService.load(ids[i]);
						orderId = orderDetailDto.getOrderId();
						OrderDto orderDto = orderService.load(orderId);
						orderDetailService.delete(ids[i],orderId);					
						message = "订单(编号:"+ orderDto.getCode() +")下的产品: " + orderDetailDto.getProductName()+ "删除成功";
						logService.addLog(message, CommonConstant.Log_Type_DEL, CommonConstant.Log_Leavel_INFO);
					}
					currOrder = orderService.load(orderId);
				}
				return JsonUtil.getObject(Boolean.TRUE,currOrder);
			}	
		}catch (Exception e) {
			e.printStackTrace();
		}
		return JsonUtil.getObject(Boolean.FALSE,currOrder);
	}
	
	
}
