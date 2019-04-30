/**  
 * Project Name:fsun-erp  
 * File Name:BusDeliveryDetail.java  
 * Package Name:cn.com.fsun.bus.domain  
 * Date:2017年8月24日 
 * Copyright (c) 2017, WFZ All Rights Reserved.  
 *  
*/  
  
package cn.com.fsun.bus.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**  
 * ClassName:BusDeliveryDetail <br/>  
 * Description: TODO <br/>   
 * @author   lenovo  
 * @version  1.0  
 * @since    JDK 1.7        
 */

@Entity
@Table(name = "bus_delivery_detail")
public class BusDeliveryDetail {

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

	@Column(name = "delivery_code", length = 32)
	public String getDeliveryCode() {
		return deliveryCode;
	}

	public void setDeliveryCode(String deliveryCode) {
		this.deliveryCode = deliveryCode;
	}

	@Column(name = "product_code", length = 32)
	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	
	@Column(name = "product_name", length = 64)
	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	@Column(name = "style", length = 128)
	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	@Column(name = "number")
	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	@Column(name = "unit", length = 32)
	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	@Column(name = "one_price", precision = 10, scale = 2)
	public Double getOnePrice() {
		return onePrice;
	}

	public void setOnePrice(Double onePrice) {
		this.onePrice = onePrice;
	}

	@Column(name = "all_price", precision = 10, scale = 2)
	public Double getAllPrice() {
		return allPrice;
	}

	public void setAllPrice(Double allPrice) {
		this.allPrice = allPrice;
	}

	@Column(name = "description", length = 256)
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "order_code", length = 256)
	public String getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}

}
  
