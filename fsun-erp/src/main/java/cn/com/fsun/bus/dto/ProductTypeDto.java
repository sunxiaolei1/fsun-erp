package cn.com.fsun.bus.dto;

import cn.com.fsun.common.dto.BaseDto;

public class ProductTypeDto extends BaseDto{

	private String id;
	private String typeName;
	private String unit;
	private String description;
	private Boolean enabled;
	
	public ProductTypeDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProductTypeDto(String id, String typeName, String unit, String description,Boolean enabled) {
		super();
		this.id = id;
		this.typeName = typeName;
		this.unit = unit;
		this.description = description;
		this.setEnabled(enabled);
	}
	
	public ProductTypeDto(String id, String typeName, String unit, String description) {
		super();
		this.id = id;
		this.typeName = typeName;
		this.unit = unit;
		this.description = description;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}
	public Boolean getEnabled() {
		return enabled;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getUnit() {
		return unit;
	}

	
}
