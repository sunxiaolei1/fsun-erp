package cn.com.fsun.bus.dto;

import java.io.Serializable;

public class ClassifyDto implements Serializable{

	// Fields
	private Long id;
	private String name;
	private String unit;
	private String description;
	private Boolean enabled;
	
	public ClassifyDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ClassifyDto(Long id, String name, String unit, String description, Boolean enabled) {
		super();
		this.id = id;
		this.name = name;
		this.unit = unit;
		this.description = description;
		this.enabled = enabled;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}
	
}
