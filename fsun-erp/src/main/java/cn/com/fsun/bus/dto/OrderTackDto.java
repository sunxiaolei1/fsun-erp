/**  
 * Project Name:fsun-erp  
 * File Name:OrderTackDto.java  
 * Package Name:cn.com.fsun.bus.dto  
 * Date:2017年10月2日 
 * Copyright (c) 2017, WFZ All Rights Reserved.  
 *  
*/  
  
package cn.com.fsun.bus.dto;

import java.util.List;

/**  
 * ClassName:OrderTackDto <br/>  
 * Description: 订单追加单对象 <br/>   
 * @author   lenovo  
 * @version  1.0  
 * @since    JDK 1.7        
 */
public class OrderTackDto {

	private OrderDto orderDto;
	
	private List<OrderDetailDto> orderDetailDtos;

	public OrderDto getOrderDto() {
		return orderDto;
	}

	public void setOrderDto(OrderDto orderDto) {
		this.orderDto = orderDto;
	}

	public List<OrderDetailDto> getOrderDetailDtos() {
		return orderDetailDtos;
	}

	public void setOrderDetailDtos(List<OrderDetailDto> orderDetailDtos) {
		this.orderDetailDtos = orderDetailDtos;
	}
	
}
  
