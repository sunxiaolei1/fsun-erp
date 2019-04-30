package cn.com.fsun.bus.domain;

import static javax.persistence.GenerationType.IDENTITY;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * BusBuyInfo entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "bus_buy_info")
public class BusBuyInfo implements java.io.Serializable {

	// Fields

	private Integer id;
	
	/** 采购单编号*/
	private String purchaseId;
	
	/** 厂家编号*/
	private String factoryId;
	
	/** 分类编号*/
	private Long classifyId;
	
	/** 物料编号*/
	private Long materielId;
	
	/** 数量*/
	private Integer number;
	
	/** 单位*/
	private String unit;
	
	/** 单价*/
	private Double onePrice;
	
	/** 总价*/
	private Double allPrice;
	
	/** 备注*/
	private String description;
	private String createManId;
	private Date createTime;
	
	private Boolean enabled;

	private String spec;
	// Constructors

	/** default constructor */
	public BusBuyInfo() {
	}

	/** minimal constructor */
	public BusBuyInfo(String purchaseId, Long classifyId, Long materielId,
			Integer number) {
		this.purchaseId = purchaseId;
		this.classifyId = classifyId;
		this.materielId = materielId;
		this.number = number;
	}

	/** full constructor */
	public BusBuyInfo(String purchaseId, String factoryId, Long classifyId,
			Long materielId, Integer number, String unit, Double onePrice,
			Double allPrice, String description, String createManId,
			Date createTime, String spec) {
		this.purchaseId = purchaseId;
		this.factoryId = factoryId;
		this.classifyId = classifyId;
		this.materielId = materielId;
		this.number = number;
		this.unit = unit;
		this.onePrice = onePrice;
		this.allPrice = allPrice;
		this.description = description;
		this.createManId = createManId;
		this.createTime = createTime;
		this.spec = spec;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "purchase_id", nullable = false, length = 32)
	public String getPurchaseId() {
		return this.purchaseId;
	}

	public void setPurchaseId(String purchaseId) {
		this.purchaseId = purchaseId;
	}

	@Column(name = "factory_id", length = 32)
	public String getFactoryId() {
		return this.factoryId;
	}

	public void setFactoryId(String factoryId) {
		this.factoryId = factoryId;
	}

	@Column(name = "classify_id", nullable = false)
	public Long getClassifyId() {
		return this.classifyId;
	}

	public void setClassifyId(Long classifyId) {
		this.classifyId = classifyId;
	}

	@Column(name = "materiel_id", nullable = false)
	public Long getMaterielId() {
		return this.materielId;
	}

	public void setMaterielId(Long materielId) {
		this.materielId = materielId;
	}

	@Column(name = "number", nullable = false)
	public Integer getNumber() {
		return this.number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	@Column(name = "unit", length = 32)
	public String getUnit() {
		return this.unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	@Column(name = "one_price", precision = 10, scale = 1)
	public Double getOnePrice() {
		return this.onePrice;
	}

	public void setOnePrice(Double onePrice) {
		this.onePrice = onePrice;
	}

	@Column(name = "all_price", precision = 10, scale = 1)
	public Double getAllPrice() {
		return this.allPrice;
	}

	public void setAllPrice(Double allPrice) {
		this.allPrice = allPrice;
	}

	@Column(name = "description", length = 65535)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "create_man_id", length = 32)
	public String getCreateManId() {
		return this.createManId;
	}

	public void setCreateManId(String createManId) {
		this.createManId = createManId;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "create_time", length = 0)
	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	@Column(name = "enabled")
	public Boolean getEnabled() {
		return this.enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	@Column(name = "spec", length = 64)
	public String getSpec() {
		return spec;
	}

	public void setSpec(String spec) {
		this.spec = spec;
	}

}