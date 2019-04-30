package cn.com.fsun.bus.dto;

import java.util.Date;

import cn.com.fsun.common.dto.BaseDto;

public class ProductSalesDto extends BaseDto {
	
	private String name;
	private String productTypeName;
	private Integer number;
	private String unit;
	private Double allPrice;
	private Date endTime;
	
	
	public ProductSalesDto() {
		super();
	}

	public ProductSalesDto(String name, String productTypeName, Integer number,
			String unit, Double allPrice, Date endTime) {
		super();
		this.name = name;
		this.productTypeName = productTypeName;
		this.number = number;
		this.unit = unit;
		this.allPrice = allPrice;
		this.endTime = endTime;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getProductTypeName() {
		return productTypeName;
	}

	public void setProductTypeName(String productTypeName) {
		this.productTypeName = productTypeName;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public Double getAllPrice() {
		return allPrice;
	}

	public void setAllPrice(Double allPrice) {
		this.allPrice = allPrice;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public String getUnit() {
		return unit;
	}
	
}
