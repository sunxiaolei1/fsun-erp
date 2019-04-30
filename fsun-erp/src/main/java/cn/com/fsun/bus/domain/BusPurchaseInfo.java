package cn.com.fsun.bus.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

import cn.com.fsun.common.domain.BaseDomain;

/**
 * BusPurchaseInfo entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "bus_purchase_info")
public class BusPurchaseInfo extends BaseDomain {

	// Fields

	private String id; //订单号
	private String setWay;//结算方式
	private Double allPrice;//总价
	private Double carriage;//运费
	private String description;//备注
	private Boolean enabled;
	private String createManId;
	private Date createTime;
	private Date expire;//需求日期
	
	private Integer storeId;  //存放仓库
	private String consignee; //收货人
	

	// Constructors

	/** default constructor */
	public BusPurchaseInfo() {
	}

	/** full constructor */
	public BusPurchaseInfo(String id, String setWay, Double allPrice,
			Double carriage, String description, Boolean enabled, String createManId,
			Date createTime, Date expire, Integer storeId, String consignee) {
		super();
		this.id = id;
		this.setWay = setWay;
		this.allPrice = allPrice;
		this.carriage = carriage;
		this.description = description;
		this.enabled = enabled;
		this.createManId = createManId;
		this.createTime = createTime;
		this.expire = expire;
		this.storeId = storeId;
		this.consignee = consignee;
	}

	// Property accessors
	@Id
	@Column(name = "id", unique = true, nullable = false, length = 12)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "set_way", length = 32)
	public String getSetWay() {
		return this.setWay;
	}

	public void setSetWay(String setWay) {
		this.setWay = setWay;
	}

	@Column(name = "all_price", precision = 10, scale = 1)
	public Double getAllPrice() {
		return this.allPrice;
	}

	public void setAllPrice(Double allPrice) {
		this.allPrice = allPrice;
	}
	
	@Column(name = "carriage", precision = 10, scale = 1)
	public Double getCarriage() {
		return this.carriage;
	}

	public void setCarriage(Double carriage) {
		this.carriage = carriage;
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

	@Column(name = "consignee", length = 32)
	public String getConsignee() {
		return this.consignee;
	}

	public void setConsignee(String consignee) {
		this.consignee = consignee;
	}
	
	@Column(name = "store_id")
	public Integer getStoreId() {
		return this.storeId;
	}

	public void setStoreId(Integer storeId) {
		this.storeId = storeId;
	}

	@Column(name = "expire", length = 0)
	public Date getExpire() {
		return expire;
	}

	public void setExpire(Date expire) {
		this.expire = expire;
	}
}
