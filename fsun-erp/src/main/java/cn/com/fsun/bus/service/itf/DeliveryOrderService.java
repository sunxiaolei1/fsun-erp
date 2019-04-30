/**  
 * Project Name:fsun-erp  
 * File Name:DeliveryOrderService.java  
 * Package Name:cn.com.fsun.bus.service.itf  
 * Date:2017年8月25日 
 * Copyright (c) 2017, WFZ All Rights Reserved.  
 *  
*/  
  
package cn.com.fsun.bus.service.itf;

import java.util.List;

import cn.com.fsun.bus.dto.DeliveryExportDto;
import cn.com.fsun.bus.dto.DeliveryHeaderDto;
import cn.com.fsun.bus.dto.DeliveryOrderDto;
import cn.com.fsun.bus.dto.DeliveryPrintsDto;
import cn.com.fsun.bus.exception.UnEnoughOrderCodeException;
import cn.com.fsun.common.utils.PageInfo;

/**  
 * ClassName:DeliveryOrderService <br/>  
 * Description: TODO <br/>   
 * @author   lenovo  
 * @version  1.0  
 * @since    JDK 1.7        
 */
public interface DeliveryOrderService {
	
	
	/**
	 * 获取初始化送货单号
	 * TODO
	 * @Title getInitDeliveryCode   
	 * @return Object
	 * @throws UnEnoughOrderCodeException 
	 */
	public String getInitDeliveryCode() throws UnEnoughOrderCodeException;

	/**
	 * @description 增加或者修改
	 * @return DeliveryOrderDto
	 * @return
	 * @update 2013-2-21
	 */
	public void saveEntry(DeliveryOrderDto deliveryOrderDto);
	
	/**
	 * @description 删除一个菜单节点
	 * @return void
	 * @param deliveryCode
	 * @update 2012-8-13 上午9:37:49
	 */
	public void deleteEntry(String deliveryCode) throws Exception;
	
	/**
	 * @description 加载一个菜单节点
	 * @return DeliveryOrderDto
	 * @param deliveryCode
	 * @update 2012-8-13 上午9:38:10
	 */
	public DeliveryOrderDto getEntry(String deliveryCode);

	/**
	 * 更新操作
	 * TODO
	 * @Title update   
	 * @param DeliveryOrderDto void
	 * @throws Exception 
	 */
	public void updateEntry(DeliveryOrderDto deliveryOrderDto) throws Exception;

	/**
	 * 获取打印对象
	 * TODO
	 * @Title getDeliveryPrints   
	 * @param deliveryCode
	 * @return DeliveryPrintsDto
	 */
	public DeliveryPrintsDto getDeliveryPrints(String deliveryCode);

	/**
	 * 标记打印
	 * TODO
	 * @Title signPrint   
	 * @param deliveryCode void
	 */
	public void signPrint(String deliveryCode);

	/**
	 * 确认收货
	 * TODO
	 * @Title received   
	 * @param deliveryCode void
	 */
	public void received(String deliveryCode);
	
}
  
