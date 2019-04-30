/**  
 * Project Name:fsun-erp  
 * File Name:DeliveryOrderQueryDto.java  
 * Package Name:cn.com.fsun.bus.dto  
 * Date:2017年8月25日 
 * Copyright (c) 2017, WFZ All Rights Reserved.  
 *  
*/  
  
package cn.com.fsun.bus.dto;

import java.util.Date;

import cn.com.fsun.common.dto.BaseDto;

/**  
 * ClassName:DeliveryOrderQueryDto <br/>  
 * Description: TODO <br/>   
 * @author   lenovo  
 * @version  1.0  
 * @since    JDK 1.7        
 */
public class DeliveryOrderQueryDto extends BaseDto {

	/**
	 * 主键
	 */
	private String id;
	
	/**
	 * 送货单号
	 */
	private String deliveryCode;
	
	/*
	 * 订单号集合
	 */
	private String orderCode;
	
	/**
	 * 客户编号
	 */
	private String customerCode;
	
	/**
	 * 客户名称
	 */
	private String customerName;
	
	/**
	 * 订单类型
	 */
	private Integer deliveryType;
	
	/**
	 * 送货单类型名
	 */
	private String deliveryTypeName;
	
	/**
	 * 制单人
	 */
	private String createManName;
	
	/**
	 * 客户地址
	 */
	private String address;
	
	/**
	 * 电话
	 */
	private String tel;
	
	/**
	 * 联系人
	 */
	private String contacts;
	
	/**
	 * 发货日期
	 */
	private Date deliveryDate;
	
	/**
	 * 快件单号
	 */
	private String express;
	
	/**
	 * 合同号
	 */
	private String contract;
	
	/**
	 * 备注
	 */
	private String description;

	/**
	 * 确认收货时间
	 */
	private Date receiveTime;
	
	/**
	 * 是否已收货
	 */
	private boolean received; 
	
	/**
	 * 收货状态
	 */
	private String receiveStatus;
	
	/**
	 * 是否可用
	 */
	private boolean enabled;
	
	/**
	 * 创建时间
	 */
	private Date createTime;
	
	/**
	 * 是否已打印
	 */
	private boolean printStatus;
	
	
	/**
	 * 产品编号
	 */
	private String productCode;
	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDeliveryCode() {
		return deliveryCode;
	}

	public void setDeliveryCode(String deliveryCode) {
		this.deliveryCode = deliveryCode;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public Integer getDeliveryType() {
		return deliveryType;
	}

	public void setDeliveryType(Integer deliveryType) {
		this.deliveryType = deliveryType;
	}

	public String getCreateManName() {
		return createManName;
	}

	public void setCreateManName(String createManName) {
		this.createManName = createManName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getContacts() {
		return contacts;
	}

	public void setContacts(String contacts) {
		this.contacts = contacts;
	}

	public Date getDeliveryDate() {
		return deliveryDate;
	}

	public void setDeliveryDate(Date deliveryDate) {
		this.deliveryDate = deliveryDate;
	}

	public String getExpress() {
		return express;
	}

	public void setExpress(String express) {
		this.express = express;
	}

	public String getContract() {
		return contract;
	}

	public void setContract(String contract) {
		this.contract = contract;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getReceiveTime() {
		return receiveTime;
	}

	public void setReceiveTime(Date receiveTime) {
		this.receiveTime = receiveTime;
	}

	public boolean isReceived() {
		return received;
	}

	public void setReceived(boolean received) {
		this.received = received;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public String getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public boolean isPrintStatus() {
		return printStatus;
	}

	public void setPrintStatus(boolean printStatus) {
		this.printStatus = printStatus;
	}

	public String getReceiveStatus() {
		return receiveStatus;
	}

	public void setReceiveStatus(String receiveStatus) {
		this.receiveStatus = receiveStatus;
	}

	public String getDeliveryTypeName() {
		return deliveryTypeName;
	}

	public void setDeliveryTypeName(String deliveryTypeName) {
		this.deliveryTypeName = deliveryTypeName;
	}

	public String getCustomerCode() {
		return customerCode;
	}

	public void setCustomerCode(String customerCode) {
		this.customerCode = customerCode;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	
}
  
