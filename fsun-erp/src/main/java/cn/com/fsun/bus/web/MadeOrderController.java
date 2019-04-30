/**  
 * Project Name:fsun-erp  
 * File Name:MadeOrderController.java  
 * Package Name:cn.com.fsun.bus.web  
 * Date:2017年8月11日 
 * Copyright (c) 2017, WFZ All Rights Reserved.  
 *  
*/  
  
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.com.fsun.bus.dto.CustomerDto;
import cn.com.fsun.bus.dto.MadeHeaderDto;
import cn.com.fsun.bus.dto.MadeOrderDto;
import cn.com.fsun.bus.dto.MadeOrderQueryDto;
import cn.com.fsun.bus.dto.MadePrintsDto;
import cn.com.fsun.bus.dto.OrderDto;
import cn.com.fsun.bus.dto.ShortcutOrderDto;
import cn.com.fsun.bus.exception.UnEnoughOrderCodeException;
import cn.com.fsun.bus.service.CustomerService;
import cn.com.fsun.bus.service.OrderService;
import cn.com.fsun.bus.service.itf.MadeHeaderService;
import cn.com.fsun.bus.service.itf.MadeOrderService;
import cn.com.fsun.common.result.JsonUtil;
import cn.com.fsun.common.utils.PKMapping;
import cn.com.fsun.common.utils.PageInfo;
import cn.com.fsun.common.web.BaseController;
import cn.com.fsun.constants.CommonConstant;
import cn.com.fsun.sys.service.LogService;

/**  
 * ClassName:MadeOrderController <br/>  
 * Description: TODO <br/>   
 * @author   lenovo  
 * @version  1.0  
 * @since    JDK 1.7        
 */
@Controller
@RequestMapping("/bus/madeOrder")
public class MadeOrderController extends BaseController {

	@Autowired
	private MadeOrderService madeOrderService;
	
	@Autowired
	private MadeHeaderService madeHeaderService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private CustomerService customerService;
	
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
		return "bus/madeOrder/manage";
	}
	
	/**
	 * @description 显示列表
	 * @return ModelMap
	 * @param
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/shortcutOrder", method=RequestMethod.GET)
	public ModelAndView shortcutOrder() {
		ModelAndView mav = new ModelAndView("bus/madeOrder/operate/shortcut_order");
		return mav;
	}
	
	/**
	 * @description 显示列表
	 * @return ModelMap
	 * @param
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/madeDetail-{madeCode}", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView madeDetail(@PathVariable("madeCode") String madeCode) {
		ModelAndView mav = new ModelAndView("bus/madeOrder/operate/made-detail");
		mav.addObject("madeCode", madeCode);
		return mav;
	}
	
	/**
	 * @description 显示列表
	 * @return ModelMap
	 * @param
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/order-relation-{madeCode}", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView orderRelation(@PathVariable("madeCode") String madeCode) {
		ModelAndView mav = new ModelAndView("bus/madeOrder/operate/order-relation");
		mav.addObject("madeCode", madeCode);
		return mav;
	}
	
	/**
	 * @description 显示列表
	 * @return ModelMap
	 * @param
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/madeAdd-{orderDetailIds}", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView addMade(@PathVariable("orderDetailIds") String orderDetailIds) {
		ModelAndView mav = new ModelAndView("bus/madeOrder/operate/made-add");
		try {
			mav.addObject("madeCode", madeOrderService.getInitCode());
			mav.addObject("orderDetailIds", orderDetailIds);
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
	@RequestMapping(value = "/madeDetail/create-{productCode}", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView madeDetailCreate(@PathVariable("productCode") String productCode,
			@RequestParam("detailName") String detailName,
			@RequestParam("madeCode") String madeCode,
			@RequestParam("orderCode") String orderCode) {
		ModelAndView mav = new ModelAndView("bus/madeOrder/operate/made-detail-create");
		mav.addObject("processCode",this.createCode(PKMapping.bus_made_order_details_process));
		mav.addObject("productCode", productCode);
		mav.addObject("madeCode", madeCode);
		mav.addObject("orderCode", orderCode);
		try {
			if(detailName!=null && !"".equals(detailName)){
				mav.addObject("detailName", "("+URLDecoder.decode(detailName,"utf-8")+")");
			}else{
				mav.addObject("detailName", "");
			}	
		} catch (UnsupportedEncodingException e) {
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
	@RequestMapping(value = "/select/orderList", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView selectOrderList() {
		ModelAndView mav = new ModelAndView("bus/madeOrder/operate/order-select-list");
		return mav;
	}
	
	/**
	 * @description 显示列表
	 * @return ModelMap
	 * @param
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/reSelect/orderList-{madeCode}", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView reSelectOrderList(@PathVariable("madeCode") String madeCode) {
		ModelAndView mav = new ModelAndView("bus/madeOrder/operate/order-reSelect-list");
		mav.addObject("madeCode", madeCode);
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
		modelAndView.setViewName("/bus/madeOrder/operate/order-detail");
		modelAndView.addObject("orderId", orderId);
		modelAndView.addObject("currIndex", index);	
		return modelAndView;
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
	public ModelMap search(MadeOrderQueryDto msadeOrderQueryDto){
		
		List<MadeHeaderDto> madeHeaderDtos = new ArrayList<>();
		try {
			PageInfo pageInfo = new PageInfo();
			boolean isPage = false;
			if(null!= msadeOrderQueryDto){
				if(null!=msadeOrderQueryDto.getRows()&& null!=msadeOrderQueryDto.getPage()){
					int firstRecord = (msadeOrderQueryDto.getPage()-1)*msadeOrderQueryDto.getRows();
					pageInfo.setFirstRecord(firstRecord);
					pageInfo.setPageSize(msadeOrderQueryDto.getRows());
					isPage = true;
				}
				if(StringUtils.isNotEmpty(msadeOrderQueryDto.getSort())){
					pageInfo.setSortColumn(msadeOrderQueryDto.getSort());
				}
				if(StringUtils.isNotEmpty(msadeOrderQueryDto.getOrder())){
					pageInfo.setSortType(msadeOrderQueryDto.getOrder());
				}
			}
			
			MadeHeaderDto madeHeaderDto = new MadeHeaderDto();
			madeHeaderDto.setMadeType(msadeOrderQueryDto.getMadeType());
			madeHeaderDto.setOrderCode(msadeOrderQueryDto.getOrderCode());
			madeHeaderDto.setMadeCode(msadeOrderQueryDto.getMadeCode());
			madeHeaderDto.setProductCode(msadeOrderQueryDto.getProductCode());
			madeHeaderDtos = madeHeaderService.search(madeHeaderDto, pageInfo,isPage);
			return JsonUtil.getObjectList(Boolean.TRUE, madeHeaderDtos, madeHeaderService.getSearchCount(madeHeaderDto, pageInfo));

		} catch (Exception e) {
			e.printStackTrace();
			return JsonUtil.getObjectList(Boolean.TRUE, madeHeaderDtos, 0);
		}
	}

	
	/**
	 * 获取生产单据编码
	 * @return
	 */
	@RequestMapping(value = "/getInitMadeCode", method = RequestMethod.GET)
	@ResponseBody
	public ModelMap getInitMadeCode() {
		try {		
			String madeCode = madeOrderService.getInitCode();
			return JsonUtil.getObject(Boolean.TRUE, madeCode);
		}catch (UnEnoughOrderCodeException e) {
			e.printStackTrace();
			return JsonUtil.getResult(Boolean.FALSE);
		} catch (Exception e) {
			e.printStackTrace();
			return JsonUtil.getResult(Boolean.FALSE);
		}
	}
	
	/**
	 * 获取厚道工序编码
	 * @return
	 */
	@RequestMapping(value = "/getInitProcessCode", method = RequestMethod.GET)
	@ResponseBody
	public ModelMap getInitProcessCode() {
		try {
			String processCode = this.createCode(PKMapping.bus_made_order_details_process);
			return JsonUtil.getObject(Boolean.TRUE, processCode);
		} catch (Exception e) {
			e.printStackTrace();
			return JsonUtil.getResult(Boolean.FALSE);
		}
	}
	
	//新增生产单(表头和明细)
	@RequestMapping(value = "/saveEntry", method = RequestMethod.POST)
	@ResponseBody
	public ModelMap saveEntry(@RequestBody MadeOrderDto madeOrderDto){
		try {
			madeOrderService.saveEntry(madeOrderDto);
			message = "生产单(编号:" + madeOrderDto.getMadeHeaderDto().getMadeCode()+ ")插入成功";
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
	public ModelMap getEntry(String madeCode) {
		try {
			MadeOrderDto madeOrderDto = madeOrderService.getEntry(madeCode);
			return JsonUtil.getObject(Boolean.TRUE, madeOrderDto);
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
	public ModelMap updateEntry(@RequestBody MadeOrderDto madeOrderDto){
		try {
			madeOrderService.updateEntry(madeOrderDto);
			message = "生产单(编号:" + madeOrderDto.getMadeHeaderDto().getMadeCode()+ ")更新成功";
			logService.addLog(message, CommonConstant.Log_Type_UPDATE, CommonConstant.Log_Leavel_INFO);
			return JsonUtil.getResult(Boolean.TRUE);
		} catch (Exception e) {
			e.printStackTrace();
			return JsonUtil.getResult(Boolean.FALSE);
		}
	}
	
	/**
	 * 删除生产单
	 * @param asnNos
	 * @return
	 */
	@RequestMapping(value = "/deleteEntry", method = RequestMethod.GET)
	@ResponseBody
	public ModelMap delete(String[] madeCodes){
		try {
			for (String madeCode : madeCodes) {
				madeOrderService.deleteEntry(madeCode);
				message = "生产单(编号:" + madeCode + ")删除成功";
				logService.addLog(message, CommonConstant.Log_Type_DEL, CommonConstant.Log_Leavel_INFO);
			}
			return JsonUtil.getResult(Boolean.TRUE);
		} catch (Exception e) {
			e.printStackTrace();
			return JsonUtil.getResult(Boolean.FALSE);
		}
	}
	
	/**
	 * 结单
	 * @param madeCodes
	 * @return
	 */
	@RequestMapping(value = "/completeMades", method = RequestMethod.GET)
	@ResponseBody
	public ModelMap completeMades(String[] madeCodes){
		try {
			for (String madeCode : madeCodes) {
				madeOrderService.completeMade(madeCode);
				message = "生产单(编号:" + madeCode + ")结单成功";
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
	 * @Title getMadePrints   
	 * @param madeCode
	 * @return ModelMap
	 */
	@RequestMapping(value = "/getMadePrints", method = RequestMethod.GET)
	@ResponseBody
	public ModelMap getMadePrints(@RequestParam("madeCode") String madeCode){
		try {
			 MadePrintsDto madePrintsDto = madeOrderService.getMadePrints(madeCode);
			return JsonUtil.getObject(Boolean.TRUE, madePrintsDto);
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
	public ModelMap signPrint(@RequestParam("madeCode") String madeCode){
		try {
			madeOrderService.signPrint(madeCode);
			return JsonUtil.getResult(Boolean.TRUE);
		} catch (Exception e) {
			e.printStackTrace();
			return JsonUtil.getResult(Boolean.FALSE);
		}
	}
	
	
	/**
	 * 快捷下单创建
	 * @param shortcutOrderDto
	 * @return
	 */
	@RequestMapping(value = "/shortcut/create", method=RequestMethod.POST)
	@ResponseBody
	public ModelMap createShortcut(@RequestBody ShortcutOrderDto shortcutOrderDto) {
		try{			
			OrderDto orderDto = shortcutOrderDto.getOrderDto();
			String customerName = orderDto.getCustomerName();
			if(StringUtils.isBlank(customerName) || !customerName.equals(orderDto.getCustomerCode())){
				return JsonUtil.getObject(Boolean.FALSE, "客户不存在");
			}else{
				CustomerDto customerDto = customerService.loadByCode(customerName);
				if(customerDto==null|| customerDto.getName()==null || "".equals(customerDto.getName())){
					return JsonUtil.getObject(Boolean.FALSE, "客户不存在");
				}else{
					orderDto.setCustomerName(customerDto.getName());			
				}
			}		
			
			String orderCode = orderService.initOrderCode();
			String madeCode = madeOrderService.getInitCode();
			shortcutOrderDto.setMadeCode(madeCode);
			shortcutOrderDto.setOrderCode(orderCode);
			madeOrderService.createShortcut(shortcutOrderDto);			
			message = "订单号: " + orderCode + "及生产单号："+ madeCode +"插入成功";
			logService.addLog(message, CommonConstant.Log_Type_INSERT, CommonConstant.Log_Leavel_INFO);
			return JsonUtil.getObject(Boolean.TRUE, madeCode);
		}catch (UnEnoughOrderCodeException e) {
			e.printStackTrace();
			return JsonUtil.getObject(Boolean.FALSE, e.getMessage());
		}catch (Exception e) {
			e.printStackTrace();
			return JsonUtil.getObject(Boolean.FALSE, "保存失败！");
		}
		
	}
	
	/********************************    私有方法     ***************************************/
	
	/**
	 * 创建编号
	 * TODO
	 * @Title createCode   
	 * @param code
	 * @return String
	 */
	private String createCode(int code){
		String madeCode = PKMapping.GUUID(code);
		return madeCode;
	}
	
}
  
