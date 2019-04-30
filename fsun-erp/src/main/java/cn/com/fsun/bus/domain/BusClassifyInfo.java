package cn.com.fsun.bus.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * BusProductTypeInfo entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "bus_classify_info")
public class BusClassifyInfo implements java.io.Serializable {

	// Fields
	private Long id;
	private String name;
	private String unit;
	private String description;
	
	private Boolean enabled;
	// Constructors

	/** default constructor */
	public BusClassifyInfo() {
	}

	/** full constructor */
	public BusClassifyInfo(String name,String description,Boolean enabled) {
		this.name = name;
		this.description = description;
		this.enabled = enabled;
	}
	
	/** full constructor */
	public BusClassifyInfo(Long id, String name,String description,Boolean enabled) {
		this.id = id;
		this.name = name;
		this.description = description;
		this.enabled = enabled;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy  = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false, length = 10)
	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Column(name = "name", length = 64)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
	@Column(name = "description", length = 65535)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	@Column(name = "enabled")
	public Boolean getEnabled() {
		return this.enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	@Column(name = "unit", length = 16)
	public String getUnit() {
		return unit;
	}
}