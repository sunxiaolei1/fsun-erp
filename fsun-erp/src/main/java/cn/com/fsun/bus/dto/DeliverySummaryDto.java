/**  
 * Project Name:fsun-erp  
 * File Name:DeliverySummaryDto.java  
 * Package Name:cn.com.fsun.bus.dto  
 * Date:2017年8月27日 
 * Copyright (c) 2017, WFZ All Rights Reserved.  
 *  
*/  
  
package cn.com.fsun.bus.dto;

import java.util.Date;

import cn.com.fsun.bus.enums.DeliveryTypeEnum;
import cn.com.fsun.common.dto.BaseDto;

/**
 * 
 * detail是主表
 * DeliverySummaryDto    
 * author fsun 
 * 2017年8月27日 下午1:17:23  
 *   
 * @version 1.0.0  
 *
 */
public class DeliverySummaryDto extends BaseDto{
	
	
	/*********************************************     明细                 ******************************************/
	
	/**
	 * 明细主键
	 */
	private String detailId;
	
	/**
	 * 产品名称
	 */
	private String productCode;
	
	/**
	 * 产品名称
	 */
	private String productName;
	
	/**
	 * 款号
	 */
	private String style;
	
	/**
	 * 数量
	 */
	private Integer number;
	
	/**
	 * 单位
	 */
	private String unit;
	
	/**
	 * 单价
	 */
	private Double onePrice;
	
	/**
	 * 总价
	 */
	private Double allPrice;
	
	/**
	 * 备注
	 */
	private String description;

	
	/**********************************************     头信息          *******************************************/

	/**
	 * 订单编号
	 */
	private String orderCode;
	
	/**
	 * 送货单号
	 */
	private String deliveryCode;
	
	/**
	 * 送货单类型
	 */
	private Integer deliveryType;
	
	/**
	 * 送货单类型名
	 */
	private String deliveryTypeName;
	
	/**
	 * 客户名称
	 */
	private String customerCode;
	
	/**
	 * 客户名称
	 */
	private String customerName;
	
	/**
	 * 确认收货时间
	 */
	private Date receiveTime;
	
	/**
	 * 确认收货
	 */
	private Boolean received;
	
	/**
	 * 收货状态
	 */
	private String receiveStatus;
	
	
	/**
	 * 制单人
	 */
	private String createManName;
	
	
	/**
	 * 创建时间
	 */
	private Date createTime;

	
	public String getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}

	public String getDeliveryCode() {
		return deliveryCode;
	}

	public void setDeliveryCode(String deliveryCode) {
		this.deliveryCode = deliveryCode;
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

	public Boolean isReceived() {
		return received;
	}

	public void setReceived(Boolean received) {
		this.received = received;
	}

	public String getReceiveStatus() {
		return receiveStatus;
	}

	public void setReceiveStatus(String receiveStatus) {
		this.receiveStatus = receiveStatus;
	}

	public String getCreateManName() {
		return createManName;
	}

	public void setCreateManName(String createManName) {
		this.createManName = createManName;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getDetailId() {
		return detailId;
	}

	public void setDetailId(String detailId) {
		this.detailId = detailId;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
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

	public Double getOnePrice() {
		return onePrice;
	}

	public void setOnePrice(Double onePrice) {
		this.onePrice = onePrice;
	}

	public Double getAllPrice() {
		return allPrice;
	}

	public void setAllPrice(Double allPrice) {
		this.allPrice = allPrice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public DeliverySummaryDto() {
		  
		super();  
		// TODO Auto-generated constructor stub  
		
	}

	public DeliverySummaryDto(String detailId, String productCode, String productName, String style, Integer number,
			String unit, Double onePrice, Double allPrice, String description, String orderCode, String deliveryCode,
			Integer deliveryType, String customerCode, String customerName, Date receiveTime, boolean received,
			String createManName, Date createTime) {
		super();
		this.detailId = detailId;
		this.productCode = productCode;
		this.productName = productName;
		this.style = style;
		this.number = number;
		this.unit = unit;
		this.onePrice = onePrice;
		this.allPrice = allPrice;
		this.description = description;
		this.orderCode = orderCode;
		this.deliveryCode = deliveryCode;
		this.deliveryType = deliveryType;
		this.deliveryTypeName = DeliveryTypeEnum.getByValue(deliveryType).getComment();
		this.customerCode = customerCode;
		this.customerName = customerName;
		this.receiveTime = receiveTime;
		this.received = received;
		this.receiveStatus = received?"已收货":"未收货";
		this.createManName = createManName;
		this.createTime = createTime;
	}

	public Integer getDeliveryType() {
		return deliveryType;
	}

	public void setDeliveryType(Integer deliveryType) {
		this.deliveryType = deliveryType;
	}

	
}
  
