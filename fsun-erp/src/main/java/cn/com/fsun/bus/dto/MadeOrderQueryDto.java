/**  
 * Project Name:fsun-erp  
 * File Name:MadeOrderQueryDto.java  
 * Package Name:cn.com.fsun.bus.dto  
 * Date:2017年8月13日 
 * Copyright (c) 2017, WFZ All Rights Reserved.  
 *  
*/  
  
package cn.com.fsun.bus.dto;

import java.util.Date;

import cn.com.fsun.common.dto.BaseDto;

/**  
 * ClassName:MadeOrderQueryDto <br/>  
 * Description: TODO <br/>   
 * @author   lenovo  
 * @version  1.0  
 * @since    JDK 1.7        
 */
public class MadeOrderQueryDto extends BaseDto {

	private String id;
	
	/**
	 * 名称
	 */
	private String name;
	
	/**
	 * 订单编号
	 */
	private String orderCode;
	
	/**
	 * 打印状态
	 */
	private boolean printStatus;
	
	/**
	 * 生产单类型
	 */
	private Integer madeType;
	
	
	/**
	 * 生产单类型名称
	 */
	private String madeTypeName;
	
	/**
	 * 生产单编号
	 */
	private String madeCode;
	
	/**
	 * 创建人id
	 */
	private String createManId;
	
	/**
	 * 创建人名称
	 */
	private String createManName;
	
	/**
	 * 创建时间
	 */
	private Date createTime;
	
	/**
	 * 是否可用
	 */
	private boolean enabled;

	/**
	 * 产品编号
	 */
	private String productCode;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}

	public boolean isPrintStatus() {
		return printStatus;
	}

	public void setPrintStatus(boolean printStatus) {
		this.printStatus = printStatus;
	}

	public Integer getMadeType() {
		return madeType;
	}

	public void setMadeType(Integer madeType) {
		this.madeType = madeType;
	}

	public String getMadeTypeName() {
		return madeTypeName;
	}

	public void setMadeTypeName(String madeTypeName) {
		this.madeTypeName = madeTypeName;
	}

	public String getMadeCode() {
		return madeCode;
	}

	public void setMadeCode(String madeCode) {
		this.madeCode = madeCode;
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

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	
}
  
