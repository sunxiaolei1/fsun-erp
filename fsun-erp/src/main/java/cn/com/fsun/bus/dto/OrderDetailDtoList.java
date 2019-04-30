/**  
 * Project Name:fsun-erp  
 * File Name:OrderDetailDtoList.java  
 * Package Name:cn.com.fsun.bus.dto  
 * Date:2017年9月12日 
 * Copyright (c) 2017, WFZ All Rights Reserved.  
 *  
*/  
  
package cn.com.fsun.bus.dto;

import java.util.List;

/**  
 * ClassName:OrderDetailDtoList <br/>  
 * Description: TODO <br/>   
 * @author   lenovo  
 * @version  1.0  
 * @since    JDK 1.7        
 */
public class OrderDetailDtoList {
	
	private String orderCode;
	
	List<OrderDetailDto> orderDetailDtos ;

	public List<OrderDetailDto> getOrderDetailDtos() {
		return orderDetailDtos;
	}

	public void setOrderDetailDtos(List<OrderDetailDto> orderDetailDtos) {
		this.orderDetailDtos = orderDetailDtos;
	}

	public String getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}
	
}
  
