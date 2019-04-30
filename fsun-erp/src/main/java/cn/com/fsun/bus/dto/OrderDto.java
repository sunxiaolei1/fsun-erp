package cn.com.fsun.bus.dto;

import java.util.Date;

import cn.com.fsun.common.dto.BaseDto;
import cn.com.fsun.common.utils.DateUtil;

public class OrderDto extends BaseDto {	
	
	private String id; //订单ID
	private String code; //订单编号
	private String orderType; //订单类型
	private String customerName;//客户名称
	private String customerCode;//客户编号
	private String receiveTime;//交货时间	
	private String express;//快件单号
	private String contract;//合同号
	private String setWay;//结算方式
	private Double allPrice;//总价
	private Boolean isGet;//是否到账
	private String status;//订单状态
	private Boolean printStatus;//打印状态
	private Boolean producePrintStatus;//生产单打印状态
	private Integer strip;//款数
	private Integer number;//总数量
	private String description;//备注
	private Boolean enabled;
	private Integer priority;
	private String createManId;//制单人ID
	private String createManName;//制单人名称
	private String createTime; //制单时间
	private String updateManId;
	private Date updateTime;
	private String merchandiserId;//跟单人ID
	private String merchandTime;//跟单时间
	
	private String contacts; //联系人
	private String address; //地址
	private String tel; //电话
	private String hasGet;
	private String hasPrintStatus;
	private String hasProducePrintStatus;
	
	/*
	 * 产品编号
	 */
	private String productCode;
	
	/**
	 * 生产单号
	 */
	private String madeCode;
	
	/**
	 * 送货单号
	 */
	private String deliveryCode;
	
	public OrderDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OrderDto(String id, String code, String orderType,
			String customerName, String customerCode, Date receiveTime,
			String express, String contract, String setWay, Double allPrice, Boolean isGet,
			String status, Boolean printStatus,Boolean producePrintStatus, Integer strip, Integer number, String description, Boolean enabled,
			Integer priority, String createManId, String createManName, Date createTime,
			String updateManId, Date updateTime,String merchandiserId,Date merchandTime) {
		super();
		this.id = id;
		this.code = code;
		this.orderType = orderType;
		this.customerName = customerName;
		this.customerCode = customerCode;
		this.receiveTime = (receiveTime!=null?DateUtil.formateDate(receiveTime, "yyyy-MM-dd"):"");
		this.express = express;
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
		this.setCreateManName(createManName);
		this.createTime = (createTime!=null?DateUtil.formateDate(createTime, "yyyy-MM-dd"):"");
		this.updateManId = updateManId;
		this.updateTime = updateTime;
		this.merchandiserId = merchandiserId;
		this.merchandTime = (merchandTime!=null?DateUtil.formateDate(merchandTime, "yyyy-MM-dd"):"");;
	}
	
	public OrderDto(String code, String orderType,String customerName, Date receiveTime,
			String express, String contract, Double allPrice, Boolean isGet,
			String status, Integer strip, String description, String createManName, Date createTime,Date merchandTime) {
		super();		
		this.code = code;
		this.orderType = orderType;
		this.customerName = customerName;		
		this.receiveTime = (receiveTime!=null?DateUtil.formateDate(receiveTime, "yyyy-MM-dd"):"");
		this.express = express;
		this.contract = contract;		
		this.allPrice = allPrice;
		this.isGet = isGet;
		if(isGet!=null){
			this.setHasGet(isGet?"是":"否");
		}	
		this.status = status;		
		this.strip = strip;		
		this.description = description;	
		this.createManName = createManName;
		this.createTime = (createTime!=null?DateUtil.formateDate(createTime, "yyyy-MM-dd"):"");
		this.merchandTime = (merchandTime!=null?DateUtil.formateDate(merchandTime, "yyyy-MM-dd"):"");;
	}
	
	public OrderDto(String customerName, String orderType, String status, Boolean isGet,Double allPrice, Date receiveTime,Date updateTime) {
		super();
		this.customerName = customerName;
		this.orderType = orderType;
		this.status = status;
		this.setIsGet(isGet);
		if(isGet!=null){
			this.setHasGet(isGet?"是":"否");
		}	
		this.allPrice = allPrice;	
		this.receiveTime = DateUtil.formateDate(receiveTime, "yyyy-MM-dd");
		this.updateTime = updateTime;
	}

	public Boolean getProducePrintStatus() {
		return producePrintStatus;
	}

	public void setProducePrintStatus(Boolean producePrintStatus) {
		this.producePrintStatus = producePrintStatus;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getOrderType() {
		return orderType;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
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

	public String getReceiveTime() {
		return receiveTime;
	}

	public void setReceiveTime(String receiveTime) {
		this.receiveTime = receiveTime;
	}

	public String getExpress() {
		return express;
	}

	public void setExpress(String express) {
		this.express = express;
	}

	public String getContract() {
		return contract;
	}

	public void setContract(String contract) {
		this.contract = contract;
	}

	public String getSetWay() {
		return setWay;
	}

	public void setSetWay(String setWay) {
		this.setWay = setWay;
	}

	public Double getAllPrice() {
		return allPrice;
	}

	public void setAllPrice(Double allPrice) {
		this.allPrice = allPrice;
	}

	public Boolean getIsGet() {
		return isGet;
	}

	public void setIsGet(Boolean isGet) {
		this.isGet = isGet;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Boolean getPrintStatus() {
		return printStatus;
	}

	public void setPrintStatus(Boolean printStatus) {
		this.printStatus = printStatus;
	}

	public Integer getStrip() {
		return strip;
	}

	public void setStrip(Integer strip) {
		this.strip = strip;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public Integer getPriority() {
		return priority;
	}

	public void setPriority(Integer priority) {
		this.priority = priority;
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

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getUpdateManId() {
		return updateManId;
	}

	public void setUpdateManId(String updateManId) {
		this.updateManId = updateManId;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getMerchandiserId() {
		return merchandiserId;
	}

	public void setMerchandiserId(String merchandiserId) {
		this.merchandiserId = merchandiserId;
	}


	public String getContacts() {
		return contacts;
	}

	public void setContacts(String contacts) {
		this.contacts = contacts;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public void setHasGet(String hasGet) {
		this.hasGet = hasGet;
	}

	public String getHasGet() {
		return hasGet;
	}

	public void setMerchandTime(String merchandTime) {
		this.merchandTime = merchandTime;
	}

	public String getMerchandTime() {
		return merchandTime;
	}

	public void setHasProducePrintStatus(String hasProducePrintStatus) {
		this.hasProducePrintStatus = hasProducePrintStatus;
	}

	public String getHasProducePrintStatus() {
		return hasProducePrintStatus;
	}

	public void setHasPrintStatus(String hasPrintStatus) {
		this.hasPrintStatus = hasPrintStatus;
	}

	public String getHasPrintStatus() {
		return hasPrintStatus;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public String getMadeCode() {
		return madeCode;
	}

	public void setMadeCode(String madeCode) {
		this.madeCode = madeCode;
	}

	public String getDeliveryCode() {
		return deliveryCode;
	}

	public void setDeliveryCode(String deliveryCode) {
		this.deliveryCode = deliveryCode;
	}
	
}

