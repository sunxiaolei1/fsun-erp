package cn.com.fsun.bus.dto;

import java.util.Date;

import cn.com.fsun.common.dto.BaseDto;

public class TransactionDto extends BaseDto{
	
	private String productName;   //产品名称
	private String code; //订单编号
	private String orderType; //订单类型
	private String customerName;//客户名称
	private Date receiveTime;//交货时间	
	private Integer number;//数量
	private String unit;   //单位
	private String style; //产品款号
	
	public TransactionDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public TransactionDto(String productName, String style, String code, String orderType,
			String customerName, Date receiveTime, Integer number, String unit) {
		super();
		this.productName = productName;
		this.code = code;
		this.orderType = orderType;
		this.customerName = customerName;
		this.receiveTime = receiveTime;
		this.number = number;
		this.unit = unit;
		this.style = (style!=null?style:"");
	}
	
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getOrderType() {
		return orderType;
	}
	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public Date getReceiveTime() {
		return receiveTime;
	}
	public void setReceiveTime(Date receiveTime) {
		this.receiveTime = receiveTime;
	}
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	public String getStyle() {
		return style;
	}
	
	
}
