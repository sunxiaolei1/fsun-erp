/**  
 * Project Name:fsun-erp  
 * File Name:DeliveryPrintsDto.java  
 * Package Name:cn.com.fsun.bus.dto  
 * Date:2017年8月25日 
 * Copyright (c) 2017, WFZ All Rights Reserved.  
 *  
*/  
  
package cn.com.fsun.bus.dto;

import java.util.List;

/**  
 * ClassName:DeliveryPrintsDto <br/>  
 * Description: TODO <br/>   
 * @author   lenovo  
 * @version  1.0  
 * @since    JDK 1.7        
 */
public class DeliveryPrintsDto {

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
  
