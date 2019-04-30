package cn.com.fsun.bus.dto;

import cn.com.fsun.common.dto.BaseDto;

public class ProxyOrderQueryDto extends BaseDto {

	/**
	 * 加工类型
	 */
	private Integer proxyType;
	
	/**
	 * 加工单号
	 */
	private String proxyCode;
	
	/**
	 * 状态
	 */
	private String status;

	/**
	 * 客户编号
	 */
	private String customerCode;

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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCustomerCode() {
		return customerCode;
	}

	public void setCustomerCode(String customerCode) {
		this.customerCode = customerCode;
	}
	
}
