package cn.com.fsun.bus.dto;

import cn.com.fsun.common.dto.BaseDto;

public class TypeProductDto extends BaseDto{

	private String id;
	private String productTypeId;
	private String productId;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public TypeProductDto(String id,
			String productTypeId, String productId) {
		super();
		this.id = id;
		this.productTypeId = productTypeId;
		this.productId = productId;
	}
	
	//ProductTypeController-----fatoryToType
	public TypeProductDto(
			String productTypeId) {
		super();		
		this.productTypeId = productTypeId;
	}
	
	public TypeProductDto(String productTypeId,
			String productId) {
		super();	
		this.productTypeId = productTypeId;
		this.productId = productId;
	}
	public TypeProductDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
