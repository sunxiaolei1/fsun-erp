/**  
 * Project Name:fsun-erp  
 * File Name:DeliveryDetailDto.java  
 * Package Name:cn.com.fsun.bus.dto  
 * Date:2017年8月25日 
 * Copyright (c) 2017, WFZ All Rights Reserved.  
 *  
*/  
  
package cn.com.fsun.bus.dto;  
/**  
 * ClassName:DeliveryDetailDto <br/>  
 * Description: TODO <br/>   
 * @author   lenovo  
 * @version  1.0  
 * @since    JDK 1.7        
 */
public class DeliveryDetailDto {

	/**
	 * 主键
	 */
	private String id;
	
	/**
	 * 订单号集合
	 */
	private String orderCode;
	
	/**
	 * 送货单号
	 */
	private String deliveryCode;
	
	/**
	 * 产品编号
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

	public String getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}

	
}
  
