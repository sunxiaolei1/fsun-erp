/**  
 * Project Name:fsun-erp  
 * File Name:DeliveryOrderController.java  
 * Package Name:cn.com.fsun.bus.web  
 * Date:2017年8月25日 
 * Copyright (c) 2017, WFZ All Rights Reserved.  
 *  
*/  
  
package cn.com.fsun.bus.web;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

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

import cn.com.fsun.bus.dto.DeliveryDetailDto;
import cn.com.fsun.bus.dto.DeliveryHeaderDto;
import cn.com.fsun.bus.dto.DeliveryOrderDto;
import cn.com.fsun.bus.dto.DeliveryOrderQueryDto;
import cn.com.fsun.bus.dto.DeliveryPrintsDto;
import cn.com.fsun.bus.dto.OrderDetailDto;
import cn.com.fsun.bus.exception.UnEnoughOrderCodeException;
import cn.com.fsun.bus.service.OrderDetailService;
import cn.com.fsun.bus.service.itf.DeliveryHeaderService;
import cn.com.fsun.bus.service.itf.DeliveryOrderService;
import cn.com.fsun.common.result.JsonUtil;
import cn.com.fsun.common.utils.PageInfo;
import cn.com.fsun.common.web.BaseController;
import cn.com.fsun.constants.CommonConstant;
import cn.com.fsun.sys.service.LogService;

/**
 * 
 *   
 * DeliveryOrderController    
 * author fsun 
 * 2017年8月25日 上午9:50:18  
 *   
 * @version 1.0.0  
 *
 */
@Controller
@RequestMapping("/bus/deliveryOrder")
public class DeliveryOrderController extends BaseController {

	@Autowired
	private DeliveryOrderService deliveryOrderService;
	
	@Autowired
	private DeliveryHeaderService deliveryHeaderService;
	
	@Autowired
	private OrderDetailService orderDetailService;
	
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
		return "bus/deliveryOrder/manage";
	}
	
	/**
	 * @description 显示列表
	 * @return ModelMap
	 * @param
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/deliveryDetail-{deliveryCode}", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView deliveryDetail(@PathVariable("deliveryCode") String deliveryCode) {
		ModelAndView mav = new ModelAndView("bus/deliveryOrder/operate/delivery-detail");
		mav.addObject("deliveryCode", deliveryCode);
		return mav;
	}
	
	/**
	 * @description 显示列表
	 * @return ModelMap
	 * @param
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/order-relation-{deliveryCode}", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView orderRelation(@PathVariable("deliveryCode") String deliveryCode) {
		ModelAndView mav = new ModelAndView("bus/deliveryOrder/operate/order-relation");
		mav.addObject("deliveryCode", deliveryCode);
		return mav;
	}
	
	/**
	 * @description 显示列表
	 * @return ModelMap
	 * @param
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/deliveryAdd-{orderDetailIds}", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView deliveryAdd(@PathVariable("orderDetailIds") String orderDetailIds) {
		ModelAndView mav = new ModelAndView("bus/deliveryOrder/operate/delivery-add");
		try {
			mav.addObject("deliveryCode", deliveryOrderService.getInitDeliveryCode());
			if(orderDetailIds!=null && !"".equals(orderDetailIds)){
				mav.addObject("orderDetailIds", orderDetailIds);
				String[] ids = orderDetailIds.split(",");
				String detailId = ids[0];
				String customerCode = orderDetailService.getCustomerCodeByOrderDetailId(detailId);
				if(customerCode!=null){
					mav.addObject("customerCode", customerCode);
				}
			}		
		} catch (UnEnoughOrderCodeException e) {
			e.printStackTrace();  	
		}
		return mav;
	}
	

	/**
	 * @description 显示列表
	 * @return ModelMap
	 * @param
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/reSelect/orderList-{deliveryCode}", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView reSelectOrderList(@PathVariable("deliveryCode") String deliveryCode) {
		ModelAndView mav = new ModelAndView("bus/deliveryOrder/operate/order-reSelect-list");
		mav.addObject("deliveryCode", deliveryCode);
		return mav;
	}
	
	/**
	 * @description 追加单界面
	 * @return ModelMap
	 * @param
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/detail/tack-{deliveryCode}", method={RequestMethod.GET})
	public ModelAndView tackDetail(@PathVariable("deliveryCode") String deliveryCode) {
		ModelAndView mav = new ModelAndView("bus/deliveryOrder/operate/detail-tack-list");
		mav.addObject("deliveryCode", deliveryCode);
		return mav;
	}
	
	
	/**
	 * @description 显示列表
	 * @return ModelMap
	 * @param
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/orderList", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView orderList() {
		ModelAndView mav = new ModelAndView("bus/deliveryOrder/operate/order-select-list");
		return mav;
	}
	
	/**
	 * @description 显示列表
	 * @return ModelMap
	 * @param
	 * @throws UnsupportedEncodingException 
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/order-detail-{index}-{orderId}", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView orderDetail(@PathVariable("index") String index,@PathVariable("orderId") String orderId) {
		ModelAndView modelAndView = new ModelAndView();		
		modelAndView.setViewName("/bus/deliveryOrder/operate/order-detail");
		modelAndView.addObject("orderId", orderId);
		modelAndView.addObject("currIndex", index);	
		return modelAndView;
	}
	
	
	/**
	 * @description 添加送货明细
	 * @return ModelMap
	 * @param
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/getDetailsByIds", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<DeliveryDetailDto> getDetailsByIds(@RequestParam("orderDetailIds") String orderDetailIds) {
		List<DeliveryDetailDto> deliveryDetailDtos = new ArrayList<>();
		try {
			if(orderDetailIds!=null && !"".equals(orderDetailIds)){
				List<OrderDetailDto> orderDetailDtos = orderDetailService.getDetailsByIds(orderDetailIds);
				for (OrderDetailDto orderDetailDto : orderDetailDtos) {
					if(deliveryDetailDtos!=null && deliveryDetailDtos.size()>0){
						boolean exist = false;
						for (DeliveryDetailDto deliveryDetailDto : deliveryDetailDtos) {
							String style = orderDetailDto.getStyle();
							String productCode = orderDetailDto.getProductCode();
							String orderCode = orderDetailDto.getOrderCode();
							double onePrice = (orderDetailDto.getOnePrice()!=null?orderDetailDto.getOnePrice():0);
							double allPrice = (orderDetailDto.getAllPrice()!=null?orderDetailDto.getAllPrice():0);
							if(style!=null && !"".equals(style)){
								if(style.equals(deliveryDetailDto.getStyle()) && productCode!=null
									&& productCode.equals(deliveryDetailDto.getProductCode())){
									deliveryDetailDto.setNumber(deliveryDetailDto.getNumber()+orderDetailDto.getNumber());
									if(!deliveryDetailDto.getOrderCode().contains(orderCode)){
										deliveryDetailDto.setOrderCode(deliveryDetailDto.getOrderCode()+","+orderCode);
									}
									deliveryDetailDto.setOnePrice((deliveryDetailDto.getOnePrice()+onePrice)/2.0);
									deliveryDetailDto.setAllPrice(deliveryDetailDto.getAllPrice()+allPrice);									
									exist = true;									
								}		
							}else{
								if(productCode!=null && productCode.equals(deliveryDetailDto.getProductCode())){
									deliveryDetailDto.setNumber(deliveryDetailDto.getNumber()+orderDetailDto.getNumber());
									if(!deliveryDetailDto.getOrderCode().contains(orderCode)){
										deliveryDetailDto.setOrderCode(deliveryDetailDto.getOrderCode()+","+orderCode);
									}
									deliveryDetailDto.setOnePrice((deliveryDetailDto.getOnePrice()+onePrice)/2.0);						
									deliveryDetailDto.setAllPrice(deliveryDetailDto.getAllPrice()+allPrice);	
									exist = true;
								}
							}
						}
						if(!exist){
							deliveryDetailDtos.add(getInitDetails(orderDetailDto));
						}
					}else{
						deliveryDetailDtos.add(getInitDetails(orderDetailDto));
					}
				}
				return deliveryDetailDtos;
			}
		} catch (Exception e) {
			e.printStackTrace();	
		}
		return new ArrayList<>();
	}
	
	
	/**
	 * 获取初始送货明细
	 * TODO
	 * @Title getInitDetails   
	 * @param orderDetailDto
	 * @return DeliveryDetailDto
	 */
	private DeliveryDetailDto getInitDetails(OrderDetailDto orderDetailDto){
		DeliveryDetailDto deliveryDetailDto = new DeliveryDetailDto();
		deliveryDetailDto.setProductCode(orderDetailDto.getProductCode());
		deliveryDetailDto.setProductName(orderDetailDto.getProductName());
		deliveryDetailDto.setOrderCode(orderDetailDto.getOrderCode());
		deliveryDetailDto.setStyle(orderDetailDto.getStyle());
		deliveryDetailDto.setNumber(orderDetailDto.getNumber());
		deliveryDetailDto.setUnit(orderDetailDto.getUnit());
		if(orderDetailDto.getOnePrice()==null){
			deliveryDetailDto.setOnePrice(0D);
		}else{
			deliveryDetailDto.setOnePrice(orderDetailDto.getOnePrice());
		}
		if(orderDetailDto.getAllPrice()==null){
			deliveryDetailDto.setAllPrice(0D);
		}else{
			deliveryDetailDto.setAllPrice(orderDetailDto.getAllPrice());
		}
		deliveryDetailDto.setDescription(orderDetailDto.getDescription());
		return deliveryDetailDto;
	}
	
	/**
	 * @description 查询
	 * @return ModelMap
	 * @param deliveryOrderQueryDto
	 * @return
	 * @update 2013-3-11
	 */
	@RequestMapping(value = "/search", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap search(DeliveryOrderQueryDto deliveryOrderQueryDto){
		
		List<DeliveryHeaderDto> deliveryHeaderDtos = new ArrayList<>();
		try {
			PageInfo pageInfo = new PageInfo();
			boolean isPage = false;
			if(null!= deliveryOrderQueryDto){
				if(null!=deliveryOrderQueryDto.getRows()&& null!=deliveryOrderQueryDto.getPage()){
					int firstRecord = (deliveryOrderQueryDto.getPage()-1)*deliveryOrderQueryDto.getRows();
					pageInfo.setFirstRecord(firstRecord);
					pageInfo.setPageSize(deliveryOrderQueryDto.getRows());
					isPage = true;
				}
				if(StringUtils.isNotEmpty(deliveryOrderQueryDto.getSort())){
					pageInfo.setSortColumn(deliveryOrderQueryDto.getSort());
				}
				if(StringUtils.isNotEmpty(deliveryOrderQueryDto.getOrder())){
					pageInfo.setSortType(deliveryOrderQueryDto.getOrder());
				}
			}
			
			DeliveryHeaderDto deliveryHeaderDto = new DeliveryHeaderDto();
			deliveryHeaderDto.setDeliveryType(deliveryOrderQueryDto.getDeliveryType());
			deliveryHeaderDto.setOrderCode(deliveryOrderQueryDto.getOrderCode());
			deliveryHeaderDto.setDeliveryCode(deliveryOrderQueryDto.getDeliveryCode());
			deliveryHeaderDto.setCustomerCode(deliveryOrderQueryDto.getCustomerCode());
			deliveryHeaderDto.setProductCode(deliveryOrderQueryDto.getProductCode());
			deliveryHeaderDtos = deliveryHeaderService.search(deliveryHeaderDto, pageInfo,isPage);
			return JsonUtil.getObjectList(Boolean.TRUE, deliveryHeaderDtos, deliveryHeaderService.getSearchCount(deliveryHeaderDto, pageInfo));

		} catch (Exception e) {
			e.printStackTrace();
			return JsonUtil.getObjectList(Boolean.TRUE, deliveryHeaderDtos, 0);
		}
	}

	
	/**
	 * 获取送货单据编码
	 * @return
	 */
	@RequestMapping(value = "/getInitDeliveryCode", method = RequestMethod.GET)
	@ResponseBody
	public ModelMap getInitDeliveryCode() {
		try {		
			String deliveryCode = deliveryOrderService.getInitDeliveryCode();
			return JsonUtil.getObject(Boolean.TRUE, deliveryCode);
		} catch (Exception e) {
			e.printStackTrace();
			return JsonUtil.getResult(Boolean.FALSE);
		}
	}
	
	
	//新增送货单(表头和明细)
	@RequestMapping(value = "/saveEntry", method = RequestMethod.POST)
	@ResponseBody
	public ModelMap saveEntry(@RequestBody DeliveryOrderDto deliveryOrderDto){
		try {
			deliveryOrderService.saveEntry(deliveryOrderDto);
			message = "送货单(编号:" + deliveryOrderDto.getDeliveryHeaderDto().getDeliveryCode()+ ")插入成功";
			logService.addLog(message, CommonConstant.Log_Type_INSERT, CommonConstant.Log_Leavel_INFO);
			return JsonUtil.getResult(Boolean.TRUE);
		} catch (Exception e) {
			e.printStackTrace();
			return JsonUtil.getResult(Boolean.FALSE);
		}
	}
	
	//根据单据编号查询所有的明细
	@RequestMapping(value = "/getEntry", method = RequestMethod.GET)
	@ResponseBody
	public ModelMap getEntry(String deliveryCode) {
		try {
			DeliveryOrderDto deliveryOrderDto = deliveryOrderService.getEntry(deliveryCode);
			return JsonUtil.getObject(Boolean.TRUE, deliveryOrderDto);
		} catch (Exception e) {
			e.printStackTrace();
			return JsonUtil.getResult(Boolean.FALSE);
		}
	}
	
	/**
	 * 更新单据(表头和明细)
	 * @param condition
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/updateEntry", method = RequestMethod.POST)
	@ResponseBody
	public ModelMap updateEntry(@RequestBody DeliveryOrderDto deliveryOrderDto){
		try {
			deliveryOrderService.updateEntry(deliveryOrderDto);
			message = "送货单(编号:" + deliveryOrderDto.getDeliveryHeaderDto().getDeliveryCode() + ")更新成功";
			logService.addLog(message, CommonConstant.Log_Type_UPDATE, CommonConstant.Log_Leavel_INFO);
			return JsonUtil.getResult(Boolean.TRUE);
		} catch (Exception e) {
			e.printStackTrace();
			return JsonUtil.getResult(Boolean.FALSE);
		}
	}
	
	/**
	 * 删除送货单
	 * @param asnNos
	 * @return
	 */
	@RequestMapping(value = "/deleteEntry", method = RequestMethod.GET)
	@ResponseBody
	public ModelMap delete(String[] deliveryCodes){
		try {
			for (String deliveryCode : deliveryCodes) {
				deliveryOrderService.deleteEntry(deliveryCode);
				message = "送货单(编号:" + deliveryCode + ")删除成功";
				logService.addLog(message, CommonConstant.Log_Type_DEL, CommonConstant.Log_Leavel_INFO);
			}
			return JsonUtil.getResult(Boolean.TRUE);
		} catch (Exception e) {
			e.printStackTrace();
			return JsonUtil.getResult(Boolean.FALSE);
		}
	}
	
	/**
	 * 确认收货
	 * @param madeCodes
	 * @return
	 */
	@RequestMapping(value = "/received", method = RequestMethod.GET)
	@ResponseBody
	public ModelMap received(String[] deliveryCodes){
		try {
			for (String deliveryCode : deliveryCodes) {
				deliveryOrderService.received(deliveryCode);
				message = "送货单(编号:" + deliveryCode + ")结单成功";
				logService.addLog(message, CommonConstant.Log_Type_UPDATE, CommonConstant.Log_Leavel_INFO);
			}
			return JsonUtil.getResult(Boolean.TRUE);
		} catch (Exception e) {
			e.printStackTrace();
			return JsonUtil.getResult(Boolean.FALSE);
		}
	}
	
	/**
	 * 获取打印对象
	 * TODO
	 * @Title getDeliveryPrints   
	 * @param deliveryCode
	 * @return ModelMap
	 */
	@RequestMapping(value = "/getDeliveryPrints", method = RequestMethod.GET)
	@ResponseBody
	public ModelMap getDeliveryPrints(@RequestParam("deliveryCode") String deliveryCode){
		try {
			 DeliveryPrintsDto deliveryPrintsDto = deliveryOrderService.getDeliveryPrints(deliveryCode);
			return JsonUtil.getObject(Boolean.TRUE, deliveryPrintsDto);
		} catch (Exception e) {
			e.printStackTrace();
			return JsonUtil.getResult(Boolean.FALSE);
		}
	}
	
	/**
	 * 标记打印
	 * TODO
	 * @Title signPrint   
	 * @param madeCode
	 * @return ModelMap
	 */
	@RequestMapping(value = "/signPrint", method = RequestMethod.GET)
	@ResponseBody
	public ModelMap signPrint(@RequestParam("deliveryCode") String deliveryCode){
		try {
			deliveryOrderService.signPrint(deliveryCode);
			return JsonUtil.getResult(Boolean.TRUE);
		} catch (Exception e) {
			e.printStackTrace();
			return JsonUtil.getResult(Boolean.FALSE);
		}
	}
	
	
}
  
