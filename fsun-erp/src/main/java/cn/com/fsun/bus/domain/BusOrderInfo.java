package cn.com.fsun.bus.domain;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;

import cn.com.fsun.common.domain.BaseDomain;

/**
 * BusOrderInfo entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "bus_order_info")
public class BusOrderInfo extends BaseDomain {

	// Fields
	private String id; //订单ID
	private String code; //订单编号
	private String orderType; //订单类型
	private String customerName;//客户名称
	private String customerCode;//客户编号
	private Date receiveTime;//交货时间	
	private String express;//快件单号
	private String contract;//合同号
	private String setWay;//结算方式
	private Double allPrice;//总价
	private Boolean isGet;//是否到账
	private String status;//订单状态
	private Boolean printStatus;//送货单打印状态
	private Boolean producePrintStatus;//生产单打印状态
	private Integer strip;//款数
	private Integer number;//总数量
	private String description;//备注
	private Boolean enabled;
	private Integer priority;
	private String createManId;
	private String createManName; //制单人名称
	private Date createTime; //制单时间
	private String updateManId;
	private Date updateTime;
	private String merchandiserId;//跟单人ID
	private Date merchandTime;//跟单时间

	
	private List<String> orderIds;

	// Constructors

	/** default constructor */
	public BusOrderInfo() {
	}

	/** full constructor */
	public BusOrderInfo(String code, String orderType, String customerName,
			String customerCode, Date receiveTime, String express,String contract, 
			String setWay, Double allPrice, Boolean isGet, String status,
			Boolean printStatus, Boolean producePrintStatus,Integer strip, Integer number,
			String description, Boolean enabled, Integer priority,
			String createManId, String createManName, Date createTime, String updateManId,
			Date updateTime,String merchandiserId,Date merchandTime) {
		super();
		this.code = code;
		this.orderType = orderType;
		this.customerName = customerName;
		this.customerCode = customerCode;
		this.receiveTime = receiveTime;
		this.setExpress(express);
		this.contract = contract;
		this.setWay = setWay;
		this.allPrice = allPrice;
		this.isGet = isGet;
		this.status = status;
		this.printStatus = printStatus;
		this.producePrintStatus = producePrintStatus;
		this.strip = strip;
		this.number = number;
		this.description = description;
		this.enabled = enabled;
		this.priority = priority;
		this.createManId = createManId;
		this.createTime = createTime;
		this.updateManId = updateManId;
		this.updateTime = updateTime;
		this.setMerchandiserId(merchandiserId);
		this.setMerchandTime(merchandTime);
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
	
	@Column(name = "code", length = 32)
	public String getCode() {
		return this.code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@Column(name = "order_type", length = 32)
	public String getOrderType() {
		return this.orderType;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}

	@Column(name = "customer_name", length = 64)
	public String getCustomerName() {
		return this.customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
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

	@Column(name = "is_get")
	public Boolean getIsGet() {
		return this.isGet;
	}

	public void setIsGet(Boolean isGet) {
		this.isGet = isGet;
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

	@Column(name = "priority")
	public Integer getPriority() {
		return this.priority;
	}

	public void setPriority(Integer priority) {
		this.priority = priority;
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

	@Column(name = "update_man_id", length = 32)
	public String getUpdateManId() {
		return this.updateManId;
	}

	public void setUpdateManId(String updateManId) {
		this.updateManId = updateManId;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "update_time", length = 0)
	public Date getUpdateTime() {
		return this.updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "receive_time", length = 0)
	public Date getReceiveTime() {
		return this.receiveTime;
	}

	public void setReceiveTime(Date receiveTime) {
		this.receiveTime = receiveTime;
	}
	
	@Column(name = "status", length = 32)
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setCustomerCode(String customerCode) {
		this.customerCode = customerCode;
	}

	@Column(name = "customer_code", length = 32)
	public String getCustomerCode() {
		return customerCode;
	}

	public void setExpress(String express) {
		this.express = express;
	}

	@Column(name = "express", length = 32)
	public String getExpress() {
		return express;
	}

	public void setCreateManName(String createManName) {
		this.createManName = createManName;
	}

	@Column(name = "create_man_name", length = 32)
	public String getCreateManName() {
		return createManName;
	}

	public void setContract(String contract) {
		this.contract = contract;
	}

	@Column(name = "contract", length = 32)
	public String getContract() {
		return contract;
	}

	public void setPrintStatus(Boolean printStatus) {
		this.printStatus = printStatus;
	}

	@Column(name = "print_status")
	public Boolean getPrintStatus() {
		return printStatus;
	}

	public void setStrip(Integer strip) {
		this.strip = strip;
	}

	@Column(name = "strip")
	public Integer getStrip() {
		return strip;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	@Column(name = "number")
	public Integer getNumber() {
		return number;
	}

	public void setMerchandiserId(String merchandiserId) {
		this.merchandiserId = merchandiserId;
	}

	@Column(name = "merchandiser_id", length = 32)
	public String getMerchandiserId() {
		return merchandiserId;
	}

	public void setMerchandTime(Date merchandTime) {
		this.merchandTime = merchandTime;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "merchand_time", length = 0)
	public Date getMerchandTime() {
		return merchandTime;
	}

	public void setProducePrintStatus(Boolean producePrintStatus) {
		this.producePrintStatus = producePrintStatus;
	}

	@Column(name = "produce_print_status")
	public Boolean getProducePrintStatus() {
		return producePrintStatus;
	}

	@Transient
	public List<String> getOrderIds() {
		return orderIds;
	}

	public void setOrderIds(List<String> orderIds) {
		this.orderIds = orderIds;
	}
}