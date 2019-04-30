/**  
 * Project Name:fsun-erp  
 * File Name:DeliveryHeaderServiceImpl.java  
 * Package Name:cn.com.fsun.bus.service  
 * Date:2017年8月25日 
 * Copyright (c) 2017, WFZ All Rights Reserved.  
 *  
*/  
  
package cn.com.fsun.bus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.fsun.bus.biz.itf.DeliveryHeaderManage;
import cn.com.fsun.bus.dto.DeliveryHeaderDto;
import cn.com.fsun.bus.service.itf.DeliveryHeaderService;
import cn.com.fsun.common.utils.PageInfo;

/**  
 * ClassName:DeliveryHeaderServiceImpl <br/>  
 * Description: TODO <br/>   
 * @author   lenovo  
 * @version  1.0  
 * @since    JDK 1.7        
 */
@Service
public class DeliveryHeaderServiceImpl implements DeliveryHeaderService{

	@Autowired
	private DeliveryHeaderManage deliveryHeaderManage;
	
	@Override
	public List<DeliveryHeaderDto> search(DeliveryHeaderDto deliveryHeaderDto, PageInfo pageInfo, boolean isPage) {
		  
		return deliveryHeaderManage.search(deliveryHeaderDto, pageInfo,isPage);
	}

	@Override
	public int getSearchCount(DeliveryHeaderDto deliveryHeaderDto, PageInfo pageInfo) {
		  
		List<DeliveryHeaderDto> list = deliveryHeaderManage.search(deliveryHeaderDto, pageInfo, false);
		if(list!=null){
			return list.size();
		}
		return 0;
	}

}
  
