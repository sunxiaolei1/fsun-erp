package cn.com.fsun.bus.dto;

import java.io.Serializable;

public class MaterielDto implements Serializable {

	private Long id;
	private String name;
	private Long classifyId;
	private String classifyName;
	private String spec;
	private Double price;
	private String imagePath;
	private String description;
	private Boolean enabled;
	
	public MaterielDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MaterielDto(Long id, String name, String spec, Double price, String imagePath, String description,
			Boolean enabled) {
		super();
		this.id = id;
		this.name = name;
		this.spec = spec;
		this.price = price;
		this.imagePath = imagePath;
		this.description = description;
		this.enabled = enabled;
	}

	public MaterielDto(Long id, String name, String spec, Double price, String description) {
		super();
		this.id = id;
		this.name = name;
		this.spec = spec;
		this.price = price;
		this.description = description;
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

	public String getSpec() {
		return spec;
	}

	public void setSpec(String spec) {
		this.spec = spec;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
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

	public Long getClassifyId() {
		return classifyId;
	}

	public void setClassifyId(Long classifyId) {
		this.classifyId = classifyId;
	}

	public String getClassifyName() {
		return classifyName;
	}

	public void setClassifyName(String classifyName) {
		this.classifyName = classifyName;
	}
	
}
