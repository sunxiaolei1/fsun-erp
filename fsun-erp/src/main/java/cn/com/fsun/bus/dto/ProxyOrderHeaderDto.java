package cn.com.fsun.bus.dto;

import java.util.Date;

/**
 * 加工单头对象
 * @author sunxiaolei
 *
 */
public class ProxyOrderHeaderDto {

	private String id;
	
	/**
	 * 打印状态
	 */
	private boolean printStatus;
	
	/**
	 * 打印状态名称
	 */
	private String printStatusName;
	
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
	 * 付款状态
	 */
	private String paidStatus;
	
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
	
	/**
	 * 是否结单（enabled: false:已结单, true:未结单）
	 */
	private String proxyStatus;
	
	
	/**
	 * 注意事项
	 */
	private String remark;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public boolean isPrintStatus() {
		return printStatus;
	}

	public void setPrintStatus(boolean printStatus) {
		this.printStatus = printStatus;
		if(printStatus){
			this.printStatusName = "已打印";
		}else{
			this.printStatusName = "未打印";
		}
	}

	public Integer getProxyType() {
		return proxyType;
	}

	public void setProxyType(Integer proxyType) {
		this.proxyType = proxyType;
	}

	public String getProxyCode() {
		return proxyCode;
	}

	public void setProxyCode(String proxyCode) {
		this.proxyCode = proxyCode;
	}

	public boolean isPaid() {
		return paid;
	}

	public void setPaid(boolean paid) {
		this.paid = paid;
		if(paid){
			this.paidStatus = "已付";
		}else{
			this.paidStatus = "未付";
		}
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCustomerCode() {
		return customerCode;
	}

	public void setCustomerCode(String customerCode) {
		this.customerCode = customerCode;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public Float getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(Float orderPrice) {
		this.orderPrice = orderPrice;
	}

	public Date getReceiveTime() {
		return receiveTime;
	}

	public void setReceiveTime(Date receiveTime) {
		this.receiveTime = receiveTime;
	}

	public String getContract() {
		return contract;
	}

	public void setContract(String contract) {
		this.contract = contract;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getDescr() {
		return descr;
	}

	public void setDescr(String descr) {
		this.descr = descr;
	}

	public String getCreateManId() {
		return createManId;
	}

	public void setCreateManId(String createManId) {
		this.createManId = createManId;
	}

	public String getCreateManName() {
		return createManName;
	}

	public void setCreateManName(String createManName) {
		this.createManName = createManName;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getUpdateManId() {
		return updateManId;
	}

	public void setUpdateManId(String updateManId) {
		this.updateManId = updateManId;
	}

	public String getUpdateManName() {
		return updateManName;
	}

	public void setUpdateManName(String updateManName) {
		this.updateManName = updateManName;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
		if(enabled){
			this.proxyStatus = "未结单";
		}else{
			this.proxyStatus = "已结单";
		}
	}

	/**
	 * @return the totalVersions
	 */
	public Integer getTotalVersions() {
		return totalVersions;
	}

	/**
	 * @param totalVersions the totalVersions to set
	 */
	public void setTotalVersions(Integer totalVersions) {
		this.totalVersions = totalVersions;
	}

	/**
	 * @return the remark
	 */
	public String getRemark() {
		return remark;
	}

	/**
	 * @param remark the remark to set
	 */
	public void setRemark(String remark) {
		this.remark = remark;
	}

	/**
	 * @return the proxyStatus
	 */
	public String getProxyStatus() {
		return proxyStatus;
	}

	/**
	 * @param proxyStatus the proxyStatus to set
	 */
	public void setProxyStatus(String proxyStatus) {
		this.proxyStatus = proxyStatus;
	}

	/**
	 * @return the printStatusName
	 */
	public String isPrintStatusName() {
		return printStatusName;
	}

	/**
	 * @param printStatusName the printStatusName to set
	 */
	public void setPrintStatusName(String printStatusName) {
		this.printStatusName = printStatusName;
	}

	/**
	 * @return the paidStatus
	 */
	public String getPaidStatus() {
		return paidStatus;
	}

	/**
	 * @param paidStatus the paidStatus to set
	 */
	public void setPaidStatus(String paidStatus) {
		this.paidStatus = paidStatus;
	}
	
}
