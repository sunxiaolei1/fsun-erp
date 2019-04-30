/**  
 * Project Name:fsun-erp  
 * File Name:DeliveryOrderDto.java  
 * Package Name:cn.com.fsun.bus.dto  
 * Date:2017年8月25日 
 * Copyright (c) 2017, WFZ All Rights Reserved.  
 *  
*/  
  
package cn.com.fsun.bus.dto;

import java.util.List;

/**
 * 
 * 送货单对象
 * DeliveryOrderDto    
 * author fsun 
 * 2017年8月25日 上午9:32:45  
 *   
 * @version 1.0.0  
 *
 */
public class DeliveryOrderDto {

	/**
	 * 头信息
	 */
	private DeliveryHeaderDto deliveryHeaderDto;
	
	/**
	 * 明细
	 */
	private List<DeliveryDetailDto> deliveryDetailDtos;

	public DeliveryHeaderDto getDeliveryHeaderDto() {
		return deliveryHeaderDto;
	}

	public void setDeliveryHeaderDto(DeliveryHeaderDto deliveryHeaderDto) {
		this.deliveryHeaderDto = deliveryHeaderDto;
	}

	public List<DeliveryDetailDto> getDeliveryDetailDtos() {
		return deliveryDetailDtos;
	}

	public void setDeliveryDetailDtos(List<DeliveryDetailDto> deliveryDetailDtos) {
		this.deliveryDetailDtos = deliveryDetailDtos;
	}

}
  
