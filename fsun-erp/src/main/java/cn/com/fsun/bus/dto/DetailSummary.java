package cn.com.fsun.bus.dto;

import java.util.Date;

import cn.com.fsun.common.dto.BaseDto;
import cn.com.fsun.common.utils.DateUtil;

public class DetailSummary extends BaseDto {

	private String orderCode;  //订单编号
	private String productName;   //产品名称
	private String productCode;   //产品编号
	private String style;//产品款号
	private String customerName;//客户名称
	private String receiveTime;//交货日期
	private Integer number;//数量
	private Integer realNumber;//实际数量
	private String unit;   //单位
	private Double onePrice;//单价
	private Double allPrice;//金额
	
	private Integer papers;//大张数量 
	private Integer prints;////印次
	private String description;//描述	
	
	public DetailSummary() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public DetailSummary(String orderCode, String productName,
			String productCode, String style, String customerName,
			Date receiveTime, Integer number, Integer realNumber,
			String unit, Double onePrice, Double allPrice, String description,
			Integer papers, Integer prints) {
		super();
		this.orderCode = orderCode;
		this.productName = productName;
		this.productCode = productCode;
		this.style = style;
		this.customerName = customerName;
		this.receiveTime = (receiveTime!=null?DateUtil.formateDate(receiveTime, "yyyy-MM-dd"):"");;
		this.number = number;
		this.realNumber = realNumber;
		this.unit = unit;
		this.onePrice = onePrice;
		this.allPrice = allPrice;
		this.description = description;
		this.papers = papers;
		this.prints = prints;
	}


	public String getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
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
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getReceiveTime() {
		return receiveTime;
	}
	public void setReceiveTime(String receiveTime) {
		this.receiveTime = receiveTime;
	}
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
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
	public Integer getPapers() {
		return papers;
	}
	public void setPapers(Integer papers) {
		this.papers = papers;
	}
	public Integer getPrints() {
		return prints;
	}
	public void setPrints(Integer prints) {
		this.prints = prints;
	}
	
	
}
