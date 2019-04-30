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

/**
 * BusBuyInfo entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "bus_outsourc_detail")
public class BusOutsourcDetail implements java.io.Serializable {

	// Fields
	private String id;
	private String orderCode;  //订单编号
	private String outsourcName;   //外协方
	private String process;   //工艺流程
	private Double allPrice;  //金额
	private String pictures;   //图片集
	private Date completeTime; //完工时间
	private String createManId;
	private String createManName; //制单人名称
	private Date createTime; //制单时间
	private String description;//描述
	
	// Constructors

	/** default constructor */
	public BusOutsourcDetail() {
	}

	/** full constructor */
	public BusOutsourcDetail(String id, String orderCode, String outsourcName,
			String process, Double allPrice, String pictures,Date completeTime,
			String createManId, String createManName, Date createTime,
			String description) {
		super();
		this.id = id;
		this.orderCode = orderCode;
		this.outsourcName = outsourcName;
		this.process = process;
		this.allPrice = allPrice;
		this.pictures = pictures;
		this.createManId = createManId;
		this.createManName = createManName;
		this.createTime = createTime;
		this.description = description;
		this.completeTime = completeTime;
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

	@Column(name = "order_code", length = 32)
	public String getOrderCode() {
		return this.orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}

	@Column(name = "description", length = 65535)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setAllPrice(Double allPrice) {
		this.allPrice = allPrice;
	}

	@Column(name = "all_price", precision = 10, scale = 1)
	public Double getAllPrice() {
		return allPrice;
	}

	@Column(name = "outsourc_name", length = 64)
	public String getOutsourcName() {
		return outsourcName;
	}

	public void setOutsourcName(String outsourcName) {
		this.outsourcName = outsourcName;
	}

	@Column(name = "process", length = 64)
	public String getProcess() {
		return process;
	}

	public void setProcess(String process) {
		this.process = process;
	}

	@Column(name = "pictures", length = 65535)
	public String getPictures() {
		return pictures;
	}

	public void setPictures(String pictures) {
		this.pictures = pictures;
	}

	@Column(name = "create_man_id", length = 32)
	public String getCreateManId() {
		return this.createManId;
	}

	public void setCreateManId(String createManId) {
		this.createManId = createManId;
	}
	
	@Column(name = "create_man_name", length = 32)
	public String getCreateManName() {
		return createManName;
	}

	public void setCreateManName(String createManName) {
		this.createManName = createManName;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "create_time", length = 0)
	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public void setCompleteTime(Date completeTime) {
		this.completeTime = completeTime;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "complete_time", length = 0)
	public Date getCompleteTime() {
		return completeTime;
	}

	
}