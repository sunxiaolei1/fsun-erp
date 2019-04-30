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

@Entity
@Table(name = "bus_proxy_order_header")
public class BusProxyOrderHeader implements java.io.Serializable {

	private String id;
	
	/**
	 * 打印状态
	 */
	private boolean printStatus;
	
	/**
	 * 加工类型
	 */
	private Integer proxyType;
	
	/**
	 * 加工单号
	 */
	private String proxyCode;
	
	/**
	 * 是否付款
	 */
	private boolean paid;
	
	/**
	 * 状态
	 */
	private String status;
	
	/**
	 * 客户名称
	 */
	private String customerName;
	
	/**
	 * 客户编号
	 */
	private String customerCode;
	
	/**
	 * 总套数
	 */
	private Integer totalVersions;
	
	/**
	 * 数量
	 */
	private Integer number;
	
	/**
	 * 金额
	 */
	private Float orderPrice;
	
	/**
	 * 交货时间
	 */
	private Date receiveTime;
	
	/**
	 * 联系人
	 */
	private String contract;
	
	/**
	 * 电话
	 */
	private String telephone;
	
	/**
	 * 备注
	 */
	private String descr;
	
	/**
	 * 创建人ID
	 */
	private String createManId;
	
	/**
	 * 创建人
	 */
	private String createManName;
	
	/**
	 * 创建时间
	 */
	private Date createTime;
	
	/**
	 * 更新人ID
	 */
	private String updateManId;
	
	/**
	 * 更新人
	 */
	private String updateManName;
	
	/**
	 * 更新时间
	 */
	private Date updateTime;
	
	/**
	 * 是否可用
	 */
	private boolean enabled;

	public BusProxyOrderHeader() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BusProxyOrderHeader(String id, boolean printStatus, Integer proxyType, String proxyCode, boolean paid,
			String status, String customerName, String customerCode, Integer totalVersions, Integer number,
			Float orderPrice, Date receiveTime, String contract, String telephone, String descr, String createManId,
			String createManName, Date createTime, String updateManId, String updateManName, Date updateTime,
			boolean enabled) {
		super();
		this.id = id;
		this.printStatus = printStatus;
		this.proxyType = proxyType;
		this.proxyCode = proxyCode;
		this.paid = paid;
		this.status = status;
		this.customerName = customerName;
		this.customerCode = customerCode;
		this.totalVersions = totalVersions;
		this.number = number;
		this.orderPrice = orderPrice;
		this.receiveTime = receiveTime;
		this.contract = contract;
		this.telephone = telephone;
		this.descr = descr;
		this.createManId = createManId;
		this.createManName = createManName;
		this.createTime = createTime;
		this.updateManId = updateManId;
		this.updateManName = updateManName;
		this.updateTime = updateTime;
		this.enabled = enabled;
	}


	@GenericGenerator(name = "generator", strategy = "uuid.hex")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "id", unique = true, nullable = false, length = 32)
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "print_status")
	public boolean isPrintStatus() {
		return printStatus;
	}

	public void setPrintStatus(boolean printStatus) {
		this.printStatus = printStatus;
	}

	@Column(name = "proxy_type")
	public Integer getProxyType() {
		return proxyType;
	}

	public void setProxyType(Integer proxyType) {
		this.proxyType = proxyType;
	}

	@Column(name = "proxy_code", length = 32)
	public String getProxyCode() {
		return proxyCode;
	}

	public void setProxyCode(String proxyCode) {
		this.proxyCode = proxyCode;
	}

	@Column(name = "paid")
	public boolean isPaid() {
		return paid;
	}

	public void setPaid(boolean paid) {
		this.paid = paid;
	}

	@Column(name = "status", length = 16)
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Column(name = "customer_name", length = 128)
	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	@Column(name = "customer_code", length = 32)
	public String getCustomerCode() {
		return customerCode;
	}

	public void setCustomerCode(String customerCode) {
		this.customerCode = customerCode;
	}

	@Column(name = "number")
	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	@Column(name = "order_price")
	public Float getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(Float orderPrice) {
		this.orderPrice = orderPrice;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "receive_time", length = 0)
	public Date getReceiveTime() {
		return receiveTime;
	}

	public void setReceiveTime(Date receiveTime) {
		this.receiveTime = receiveTime;
	}

	@Column(name = "contract", length = 32)
	public String getContract() {
		return contract;
	}

	public void setContract(String contract) {
		this.contract = contract;
	}

	@Column(name = "telephone", length = 32)
	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	@Column(name = "descr", length = 512)
	public String getDescr() {
		return descr;
	}

	public void setDescr(String descr) {
		this.descr = descr;
	}

	@Column(name = "create_man_id", length = 32)
	public String getCreateManId() {
		return createManId;
	}

	public void setCreateManId(String createManId) {
		this.createManId = createManId;
	}

	@Column(name = "create_man_name", length = 64)
	public String getCreateManName() {
		return createManName;
	}

	public void setCreateManName(String createManName) {
		this.createManName = createManName;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "create_time", length = 0)
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Column(name = "update_man_id", length = 32)
	public String getUpdateManId() {
		return updateManId;
	}

	public void setUpdateManId(String updateManId) {
		this.updateManId = updateManId;
	}

	@Column(name = "update_man_name", length = 64)
	public String getUpdateManName() {
		return updateManName;
	}

	public void setUpdateManName(String updateManName) {
		this.updateManName = updateManName;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "update_time", length = 0)
	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	@Column(name = "enabled")
	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	/**
	 * @return the totalVersions
	 */
	@Column(name = "total_versions")
	public Integer getTotalVersions() {
		return totalVersions;
	}

	/**
	 * @param totalVersions the totalVersions to set
	 */
	public void setTotalVersions(Integer totalVersions) {
		this.totalVersions = totalVersions;
	}
	
}
