/**  
 * @title OverViewController.java
 * @package sanlogic.vdi.bus.web
 * @description 用一句话描述该文件做什么  
 * @update 2013-12-20 上午10:35:26
 * @version V1.0  
 */
package cn.com.fsun.bus.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import net.sf.json.JSONArray;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.com.fsun.bus.dto.OrderDto;
import cn.com.fsun.bus.service.OrderService;
import cn.com.fsun.common.result.JsonUtil;
import cn.com.fsun.common.utils.PageInfo;


/**
 * @description 这里用一句话描述这个类的作用
 * @version 1.0
 * @update 2013-12-20 上午10:35:26
 */

@Controller
@RequestMapping("/bus/overview")
public class OverViewController {
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value = "/manage", method = { RequestMethod.GET,RequestMethod.POST })
	public ModelAndView manage() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/bus/overview/manage");
		return modelAndView;	
	}
	
	@RequestMapping(value = "/toVideo", method = { RequestMethod.GET,RequestMethod.POST })
	public ModelAndView toVideo() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/bus/overview/video/video");
		return modelAndView;	
	}
	
	/**
	 * @description 查询
	 * @return ModelMap
	 * @param orderDto
	 * @return
	 * @update 2013-3-11
	 */
	@RequestMapping(value = "/getOrders", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap getOrders(OrderDto orderDto){
		PageInfo pageInfo = new PageInfo();
		boolean isPage = false;
		orderDto.setStatus("已下单");
		int limit = 100;
		List<OrderDto> orderDtos = orderService.getOrders(orderDto, pageInfo,limit);
		return JsonUtil.getObjectList(Boolean.TRUE, orderDtos,orderDtos.size());
	}
		
	/**
	 * 返回json数据
	 * @param obj
	 * @param response
	 * @throws IOException
	 */
	private void resultJsonData(Object obj,HttpServletResponse response) throws IOException{
		JSONArray jsonArray = JSONArray.fromObject(obj); //封装成Json
	    response.setHeader("Cache-Control", "no-cache");
	    response.setContentType("text/json;charset=UTF-8");
	    response.getWriter().print(jsonArray);
	}
	
}
