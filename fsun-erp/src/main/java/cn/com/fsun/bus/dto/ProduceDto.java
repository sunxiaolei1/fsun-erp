package cn.com.fsun.bus.dto;

import java.util.List;

import cn.com.fsun.bus.domain.BusCustomerInfo;
import cn.com.fsun.bus.domain.BusOrderInfo;
import cn.com.fsun.common.dto.BaseDto;

public class ProduceDto extends BaseDto{
	
	private BusOrderInfo orderInfo;
	private BusCustomerInfo customer;
	private List<OrderProductDto> orderProductDtoList;
	
	public BusCustomerInfo getCustomer() {
		return customer;
	}
	public void setCustomer(BusCustomerInfo customer) {
		this.customer = customer;
	}
	
	public void setOrderInfo(BusOrderInfo orderInfo) {
		this.orderInfo = orderInfo;
	}
	public BusOrderInfo getOrderInfo() {
		return orderInfo;
	}
	public void setOrderProductDtoList(List<OrderProductDto> orderProductDtoList) {
		this.orderProductDtoList = orderProductDtoList;
	}
	public List<OrderProductDto> getOrderProductDtoList() {
		return orderProductDtoList;
	}
	
	
}
