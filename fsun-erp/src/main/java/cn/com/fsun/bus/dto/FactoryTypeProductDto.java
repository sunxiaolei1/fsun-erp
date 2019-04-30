package cn.com.fsun.bus.dto;

import cn.com.fsun.common.dto.BaseDto;

public class FactoryTypeProductDto extends BaseDto{

	private String id;
	private String factoryId;
	private String productTypeId;
	private String productId;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFactoryId() {
		return factoryId;
	}
	public void setFactoryId(String factoryId) {
		this.factoryId = factoryId;
	}
	public String getProductTypeId() {
		return productTypeId;
	}
	public void setProductTypeId(String productTypeId) {
		this.productTypeId = productTypeId;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public FactoryTypeProductDto(String id, String factoryId,
			String productTypeId, String productId) {
		super();
		this.id = id;
		this.factoryId = factoryId;
		this.productTypeId = productTypeId;
		this.productId = productId;
	}
	
	//ProductTypeController-----fatoryToType
	public FactoryTypeProductDto(String factoryId,
			String productTypeId) {
		super();
		this.factoryId = factoryId;
		this.productTypeId = productTypeId;
	}
	
	public FactoryTypeProductDto(String factoryId, String productTypeId,
			String productId) {
		super();
		this.factoryId = factoryId;
		this.productTypeId = productTypeId;
		this.productId = productId;
	}
	public FactoryTypeProductDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
