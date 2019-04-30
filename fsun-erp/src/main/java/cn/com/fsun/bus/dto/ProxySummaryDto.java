package cn.com.fsun.bus.dto;

import java.util.Date;

import cn.com.fsun.common.dto.BaseDto;

/**
 * detail是主表
 * @author sunxiaolei
 *
 */
public class ProxySummaryDto extends BaseDto{
	
/**************************    头          *******************************/
	/**
	 * 加工单号
	 */
	private String proxyCode;
	
	/**
	 * 客户名称
	 */
	private String customerName;
	
	/**
	 * 客户编号
	 */
	private String customerCode;
	
	/**
	 * 是否付款
	 */
	private String hasPaid;
	
	
	/**
	 * 金额
	 */
	private Float orderPrice;
	
	/**
	 * 交货时间
	 */
	private Date receiveTime;
	

	/**
	 * 创建人
	 */
	private String createManName;
	
	/**
	 * 制单时间
	 */
	private Date createTime;
	
	/**
	 * 注意事项
	 */
	private String remark;
	
	/**************************    明细           *******************************/
	
	
	/**
	 * 产品名称
	 */
	private String productName;
	
	/**
	 * 机型
	 */
	private String model;
	
	/**
	 * 工序
	 */
	private String process;
	
	/**
	 * ps版数量
	 */
	private Integer psNumber;
	
	/**
	 * 印刷方式
	 */
	private String layout;
	
	/**
	 * 色数
	 */
	private String colorsName;
	
	/**
	 * 印刷数量
	 */
	private Integer number;
	
	/**
	 * 印损
	 */
	private Integer loss;
	
	/**
	 * 备注
	 */
	private String descr;
	
	
	/**
	 * 专色
	 */
	private String spotColors;

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

	public String getProxyCode() {
		return proxyCode;
	}

	public void setProxyCode(String proxyCode) {
		this.proxyCode = proxyCode;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getProcess() {
		return process;
	}

	public void setProcess(String process) {
		this.process = process;
	}

	public Integer getPsNumber() {
		return psNumber;
	}

	public void setPsNumber(Integer psNumber) {
		this.psNumber = psNumber;
	}

	public String getLayout() {
		return layout;
	}

	public void setLayout(String layout) {
		this.layout = layout;
	}

	public String getColorsName() {
		return colorsName;
	}

	public void setColorsName(String colorsName) {
		this.colorsName = colorsName;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public Integer getLoss() {
		return loss;
	}

	public void setLoss(Integer loss) {
		this.loss = loss;
	}

	public String getDescr() {
		return descr;
	}

	public void setDescr(String descr) {
		this.descr = descr;
	}

	public ProxySummaryDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProxySummaryDto(String proxyCode, String customerName, String customerCode, 
			Boolean paid, Float orderPrice, Date receiveTime, String createManName, Date createTime,  
			String remark, String productName, String model, String process,
			Integer psNumber, String layout, String colorsName, Integer number, Integer loss,
			String descr, String spotColors) {
		super();
		this.customerName = customerName;
		this.customerCode = customerCode;
		this.hasPaid = ((paid!=null&&paid)?"是":"否");
		this.orderPrice = orderPrice;
		this.receiveTime = receiveTime;
		this.createManName = createManName;
		this.createTime = createTime;
		this.remark = remark;
		this.proxyCode = proxyCode;
		this.productName = productName;
		this.model = model;
		this.process = process;
		this.psNumber = psNumber;
		this.layout = layout;
		this.colorsName = ((spotColors!=null && !spotColors.equals(""))?(colorsName+"("+ spotColors +")"):colorsName);
		this.number = number;
		this.loss = loss;
		this.descr = descr;
		this.spotColors = spotColors;
	}

	/**
	 * @return the hasPaid
	 */
	public String getHasPaid() {
		return hasPaid;
	}

	/**
	 * @param hasPaid the hasPaid to set
	 */
	public void setHasPaid(String hasPaid) {
		this.hasPaid = hasPaid;
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
	 * @return the spotColors
	 */
	public String getSpotColors() {
		return spotColors;
	}

	/**
	 * @param spotColors the spotColors to set
	 */
	public void setSpotColors(String spotColors) {
		this.spotColors = spotColors;
	}

	
}
