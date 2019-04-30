/**  
 * Project Name:fsun-erp  
 * File Name:DeliveryExportDto.java  
 * Package Name:cn.com.fsun.bus.dto  
 * Date:2017年8月27日 
 * Copyright (c) 2017, WFZ All Rights Reserved.  
 *  
*/  
  
package cn.com.fsun.bus.dto;

import java.util.Date;

/**  
 * ClassName:DeliveryExportDto <br/>  
 * Description: TODO <br/>   
 * @author   lenovo  
 * @version  1.0  
 * @since    JDK 1.7        
 */
public class DeliveryExportDto {
	
	/**********************************************     头信息          *******************************************/

	/**
	 * 送货单号
	 */
	private String deliveryCode;
	
	/**
	 * 送货单类型名
	 */
	private String deliveryTypeName;
	
	/**
	 * 客户名称
	 */
	private String customerName;
	
	/**
	 * 确认收货时间
	 */
	private Date receiveTime;
	
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
	
	
	/*********************************************     明细                 ******************************************/
	
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
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

	public DeliveryExportDto(String deliveryCode, String deliveryTypeName, String customerName, Date receiveTime,
			String receiveStatus, String createManName, Date createTime, String productName, String style,
			Integer number, String unit, Double onePrice, Double allPrice, String description) {
		super();
		this.deliveryCode = deliveryCode;
		this.deliveryTypeName = deliveryTypeName;
		this.customerName = customerName;
		this.receiveTime = receiveTime;
		this.receiveStatus = receiveStatus;
		this.createManName = createManName;
		this.createTime = createTime;
		this.productName = productName;
		this.style = style;
		this.number = number;
		this.unit = unit;
		this.onePrice = onePrice;
		this.allPrice = allPrice;
		this.description = description;
	}

	public DeliveryExportDto() {
		  
		super();  
		// TODO Auto-generated constructor stub  
		
	}

	
}
  
