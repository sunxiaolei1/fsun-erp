/**  
 * Project Name:fsun-erp  
 * File Name:MadePackageDto.java  
 * Package Name:cn.com.fsun.bus.dto  
 * Date:2017年8月16日 
 * Copyright (c) 2017, WFZ All Rights Reserved.  
 *  
*/  
  
package cn.com.fsun.bus.dto;  
/**  
 * ClassName:MadePackageDto <br/>  
 * Description: TODO <br/>   
 * @author   lenovo  
 * @version  1.0  
 * @since    JDK 1.7        
 */
public class MadePackageDto {

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
	
	//用于快捷下单的订单明细中的单价
	private Double onePrice;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMadeCode() {
		return madeCode;
	}
	public void setMadeCode(String madeCode) {
		this.madeCode = madeCode;
	}
	public String getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}
	public String getOrderDetailId() {
		return orderDetailId;
	}
	public void setOrderDetailId(String orderDetailId) {
		this.orderDetailId = orderDetailId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	public String getStyle() {
		return style;
	}
	public void setStyle(String style) {
		this.style = style;
	}
	public Integer getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(Integer orderNumber) {
		this.orderNumber = orderNumber;
	}
	public Integer getExpectNumber() {
		return expectNumber;
	}
	public void setExpectNumber(Integer expectNumber) {
		this.expectNumber = expectNumber;
	}
	public Integer getRealNumber() {
		return realNumber;
	}
	public void setRealNumber(Integer realNumber) {
		this.realNumber = realNumber;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public Double getOnePrice() {
		return onePrice;
	}
	public void setOnePrice(Double onePrice) {
		this.onePrice = onePrice;
	}
	
	
}
  
