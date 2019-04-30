/**  
 * Project Name:fsun-erp  
 * File Name:BusDeliveryHeader.java  
 * Package Name:cn.com.fsun.bus.domain  
 * Date:2017年8月24日 
 * Copyright (c) 2017, WFZ All Rights Reserved.  
 *  
*/  
  
package cn.com.fsun.bus.domain;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;

/**  
 * ClassName:BusDeliveryHeader <br/>  
 * Description: TODO <br/>   
 * @author   lenovo  
 * @version  1.0  
 * @since    JDK 1.7        
 */
@Entity
@Table(name = "bus_delivery_header")
public class BusDeliveryHeader {
	
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
	 * 送货单编号集合
	 */
	private List<String> deliveryCodes;
	
	@GenericGenerator(name = "generator", strategy = "uuid.hex")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "id", unique = true, nullable = false, length = 32)
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "delivery_code", unique = true, nullable = false,length = 32)
	public String getDeliveryCode() {
		return deliveryCode;
	}

	public void setDeliveryCode(String deliveryCode) {
		this.deliveryCode = deliveryCode;
	}
	
	@Column(name = "order_code", length = 256)
	public String getOrderCode() {
		return this.orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}
	
	@Column(name = "customer_code", length = 64)
	public String getCustomerCode() {
		return customerCode;
	}

	public void setCustomerCode(String customerCode) {
		this.customerCode = customerCode;
	}
	

	@Column(name = "customer_name", length = 64)
	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	@Column(name = "delivery_type")
	public Integer getDeliveryType() {
		return deliveryType;
	}

	public void setDeliveryType(Integer deliveryType) {
		this.deliveryType = deliveryType;
	}

	@Column(name = "create_man_name", length = 32)
	public String getCreateManName() {
		return createManName;
	}

	public void setCreateManName(String createManName) {
		this.createManName = createManName;
	}

	@Column(name = "address", length = 256)
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "tel", length = 32)
	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	@Column(name = "contacts", length = 32)
	public String getContacts() {
		return contacts;
	}

	public void setContacts(String contacts) {
		this.contacts = contacts;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "delivery_date", length = 0)
	public Date getDeliveryDate() {
		return deliveryDate;
	}

	public void setDeliveryDate(Date deliveryDate) {
		this.deliveryDate = deliveryDate;
	}

	@Column(name = "express", length = 64)
	public String getExpress() {
		return express;
	}

	public void setExpress(String express) {
		this.express = express;
	}

	@Column(name = "contract", length = 64)
	public String getContract() {
		return contract;
	}

	public void setContract(String contract) {
		this.contract = contract;
	}

	@Column(name = "description", length = 256)
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}	
	
	@Column(name = "received")
	public boolean isReceived() {
		return received;
	}

	public void setReceived(boolean received) {
		this.received = received;
	}

	@Column(name = "enabled")
	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "receive_time", length = 0)
	public Date getReceiveTime() {
		return this.receiveTime;
	}

	public void setReceiveTime(Date receiveTime) {
		this.receiveTime = receiveTime;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "create_time", length = 0)
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Column(name = "print_status")
	public boolean isPrintStatus() {
		return printStatus;
	}

	public void setPrintStatus(boolean printStatus) {
		this.printStatus = printStatus;
	}

	@Transient
	public List<String> getDeliveryCodes() {
		return deliveryCodes;
	}

	public void setDeliveryCodes(List<String> deliveryCodes) {
		this.deliveryCodes = deliveryCodes;
	}

}
  
