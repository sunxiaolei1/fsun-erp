/**  
 * Project Name:fsun-erp  
 * File Name:Bus.java  
 * Package Name:cn.com.fsun.bus.domain  
 * Date:2017年8月16日 
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
 * ClassName:Bus <br/>  
 * Description: TODO <br/>   
 * @author   lenovo  
 * @version  1.0  
 * @since    JDK 1.7        
 */
@Entity
@Table(name = "bus_made_package")
public class BusMadePackage {

	private String id;
	private String madeCode;//生产单号
	private String orderId;  //订单编号(主键)
	private String orderCode;  //订单号
	private String orderDetailId;//订单明细编号
	private String productName;   //产品名称
	private String productCode;   //产品编号
	private String style;//产品款号
	private Integer orderNumber;//订单数量
	private Integer expectNumber;//预计数量
	private Integer realNumber;//包装数量
	private String unit;   //单位
	private String description;//描述
	
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
	
	@Column(name = "made_code", length = 32, nullable = false)
	public String getMadeCode() {
		return madeCode;
	}
	public void setMadeCode(String madeCode) {
		this.madeCode = madeCode;
	}
	
	@Column(name = "order_id", length = 32)
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	
	@Column(name = "order_code", length = 32)
	public String getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}
	
	@Column(name = "order_detail_id", length = 32)
	public String getOrderDetailId() {
		return orderDetailId;
	}
	public void setOrderDetailId(String orderDetailId) {
		this.orderDetailId = orderDetailId;
	}
	
	
	@Column(name = "product_name", length = 64)
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	@Column(name = "product_code", length = 32)
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	
	@Column(name = "order_number")
	public Integer getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(Integer orderNumber) {
		this.orderNumber = orderNumber;
	}
	
	@Column(name = "expect_number")
	public Integer getExpectNumber() {
		return expectNumber;
	}
	public void setExpectNumber(Integer expectNumber) {
		this.expectNumber = expectNumber;
	}
	
	@Column(name = "real_number")
	public Integer getRealNumber() {
		return realNumber;
	}
	public void setRealNumber(Integer realNumber) {
		this.realNumber = realNumber;
	}
	
	@Column(name = "unit", length = 32)
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	
	@Column(name = "description", length = 256)
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	@Column(name = "style", length = 64)
	public String getStyle() {
		return style;
	}
	public void setStyle(String style) {
		this.style = style;
	}
	
}
  
