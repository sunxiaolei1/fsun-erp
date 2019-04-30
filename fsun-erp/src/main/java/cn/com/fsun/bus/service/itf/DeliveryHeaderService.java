/**  
 * Project Name:fsun-erp  
 * File Name:DeliveryHeaderService.java  
 * Package Name:cn.com.fsun.bus.service.itf  
 * Date:2017年8月25日 
 * Copyright (c) 2017, WFZ All Rights Reserved.  
 *  
*/  
  
package cn.com.fsun.bus.service.itf;

import java.util.List;

import cn.com.fsun.bus.dto.DeliveryHeaderDto;
import cn.com.fsun.common.utils.PageInfo;

/**  
 * ClassName:DeliveryHeaderService <br/>  
 * Description: TODO <br/>   
 * @author   lenovo  
 * @version  1.0  
 * @since    JDK 1.7        
 */
public interface DeliveryHeaderService {

	/**
	 * @description 显示列表（有查询条件）
	 * @return List<madeHeaderDto>
	 * @update 2012-8-13 上午9:36:48
	 */
	public List<DeliveryHeaderDto> search(DeliveryHeaderDto deliveryHeaderDto, PageInfo pageInfo,boolean isPage);


	/**
	 * 获取查询总数
	 * TODO
	 * @Title getSearchCount   
	 * @param madeHeaderDto
	 * @param pageInfo
	 * @return int
	 */
	public int getSearchCount(DeliveryHeaderDto deliveryHeaderDto, PageInfo pageInfo);
	
}
  
