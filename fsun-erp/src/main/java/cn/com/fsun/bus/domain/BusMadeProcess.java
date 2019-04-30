package cn.com.fsun.bus.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;

/**
 * BusMadeProcess entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "bus_made_process")
public class BusMadeProcess implements java.io.Serializable {

	// Fields

	private String id;
	private String processCode;
	private String madeCode;
	private String orderCode;
	private String outsourcer;
	private String name;
	private Integer number;
	private String demand;

	// Constructors

	/** default constructor */
	public BusMadeProcess() {
	}

	/** minimal constructor */
	public BusMadeProcess(String processCode, String madeCode, String orderCode) {
		this.madeCode = madeCode;
		this.orderCode = orderCode;
		this.processCode = processCode;
	}

	/** full constructor */
	public BusMadeProcess(String processCode, String madeCode, String orderCode, String outsourcer,
			String name, Integer number, String demand) {
		this.setProcessCode(processCode);
		this.madeCode = madeCode;
		this.orderCode = orderCode;
		this.outsourcer = outsourcer;
		this.name = name;
		this.number = number;
		this.demand = demand;
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

	@Column(name = "made_code", nullable = false, length = 32)
	public String getMadeCode() {
		return this.madeCode;
	}

	public void setMadeCode(String madeCode) {
		this.madeCode = madeCode;
	}

	@Column(name = "order_code", nullable = false, length = 256)
	public String getOrderCode() {
		return this.orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}

	@Column(name = "outsourcer", length = 32)
	public String getOutsourcer() {
		return this.outsourcer;
	}

	public void setOutsourcer(String outsourcer) {
		this.outsourcer = outsourcer;
	}

	@Column(name = "name", length = 32)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "number")
	public Integer getNumber() {
		return this.number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	@Column(name = "demand", length = 65535)
	public String getDemand() {
		return this.demand;
	}

	public void setDemand(String demand) {
		this.demand = demand;
	}

	@Column(name = "process_code", nullable = false, length = 32)
	public String getProcessCode() {
		return processCode;
	}

	public void setProcessCode(String processCode) {
		this.processCode = processCode;
	}

}