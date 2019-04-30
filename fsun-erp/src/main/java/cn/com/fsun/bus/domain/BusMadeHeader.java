package cn.com.fsun.bus.domain;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;

/**
 * BusMadeHeader entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "bus_made_header")
public class BusMadeHeader implements java.io.Serializable {

	// Fields

	private String id;
	private String name;
	private String orderCode;
	private boolean printStatus;
	private Integer madeType;
	private String madeCode;
	private String createManId;
	private String createManName;
	private Date createTime;
	private boolean enabled;
	
	private List<String> madeCodes;

	// Constructors

	/** default constructor */
	public BusMadeHeader() {
	}

	/** minimal constructor */
	public BusMadeHeader(String madeCode) {
		this.madeCode = madeCode;
	}

	/** full constructor */
	public BusMadeHeader(String name, String orderCode, boolean printStatus,
			Integer madeType, String madeCode, String createManId,
			String createManName, Date createTime, boolean enabled) {
		this.name = name;
		this.orderCode = orderCode;
		this.printStatus = printStatus;
		this.madeType = madeType;
		this.madeCode = madeCode;
		this.createManId = createManId;
		this.createManName = createManName;
		this.createTime = createTime;
		this.enabled = enabled;
	}

	// Property accessors
	@GenericGenerator(name = "generator", strategy = "uuid.hex")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "id", unique = true, nullable = false, length = 32)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "name", length = 64)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "order_code", length = 256)
	public String getOrderCode() {
		return this.orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}

	@Column(name = "print_status")
	public boolean getPrintStatus() {
		return this.printStatus;
	}

	public void setPrintStatus(boolean printStatus) {
		this.printStatus = printStatus;
	}

	@Column(name = "made_type")
	public Integer getMadeType() {
		return this.madeType;
	}

	public void setMadeType(Integer madeType) {
		this.madeType = madeType;
	}

	@Column(name = "made_code", nullable = false, length = 32)
	public String getMadeCode() {
		return this.madeCode;
	}

	public void setMadeCode(String madeCode) {
		this.madeCode = madeCode;
	}

	@Column(name = "create_man_id", length = 32)
	public String getCreateManId() {
		return this.createManId;
	}

	public void setCreateManId(String createManId) {
		this.createManId = createManId;
	}

	@Column(name = "create_man_name", length = 64)
	public String getCreateManName() {
		return this.createManName;
	}

	public void setCreateManName(String createManName) {
		this.createManName = createManName;
	}

	@Column(name = "create_time", length = 0)
	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Column(name = "enabled")
	public boolean getEnabled() {
		return this.enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	@Transient
	public List<String> getMadeCodes() {
		return madeCodes;
	}

	public void setMadeCodes(List<String> madeCodes) {
		this.madeCodes = madeCodes;
	}
}