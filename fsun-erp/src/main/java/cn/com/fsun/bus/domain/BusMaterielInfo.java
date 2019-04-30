package cn.com.fsun.bus.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;

/**
 * BusStockInfo entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "bus_materiel_info")
public class BusMaterielInfo implements java.io.Serializable {

	// Fields

	private Long id;
	private String name;
	private Long classifyId;
	private String spec;
	private Double price;
	private String imagePath;
	private String description;
	private Boolean enabled;

	// Constructors

	/** default constructor */
	public BusMaterielInfo() {
	}

	/**all**/
	public BusMaterielInfo(Long id, String name, Long classifyId, String spec, Double price, String imagePath,
			String description, Boolean enabled) {
		super();
		this.id = id;
		this.name = name;
		this.setClassifyId(classifyId);
		this.spec = spec;
		this.price = price;
		this.imagePath = imagePath;
		this.description = description;
		this.enabled = enabled;
	}

	@Id
	@GeneratedValue(strategy  = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false, length = 10)
	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Column(name = "name", length = 128, nullable = false)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "spec", length = 32)
	public String getSpec() {
		return this.spec;
	}

	public void setSpec(String spec) {
		this.spec = spec;
	}

	@Column(name = "price", precision = 10, scale = 1)
	public Double getPrice() {
		return this.price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	@Column(name = "description", length = 65535)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	@Column(name = "enabled",nullable = false)
	public Boolean getEnabled() {
		return this.enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	@Column(name = "image_path", length = 128)
	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	@Column(name = "classify_id")
	public Long getClassifyId() {
		return classifyId;
	}

	public void setClassifyId(Long classifyId) {
		this.classifyId = classifyId;
	}

}