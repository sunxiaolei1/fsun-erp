package cn.com.fsun.bus.dto;

import java.util.List;

public class ReorderDto {
	
    private OrderDto orderDto; //订单基本信息
    private List<OrderDetailDto> orderDetailDtos; //订单详情
	
    public ReorderDto() {
		super();
	}
	
    public ReorderDto(OrderDto orderDto, List<OrderDetailDto> orderDetailDtos) {
		super();
		this.orderDto = orderDto;
		this.orderDetailDtos = orderDetailDtos;
	}
	
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
