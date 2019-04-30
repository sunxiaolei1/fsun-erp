package cn.com.fsun.bus.dto;

import java.util.Date;

import cn.com.fsun.common.dto.BaseDto;
import cn.com.fsun.common.utils.DateUtil;

public class OutsourcDetailDto extends BaseDto {

	private String id;
	private String orderCode;  //订单编号
	private String outsourcName;   //外协方
	private String process;   //工艺流程
	private Double allPrice;  //金额
	private String pictures;   //图片集
	private String completeTime; //完工时间
	private String createManId;
	private String createManName; //制单人名称
	private Date createTime; //制单时间
	private String description;//描述
	
	public OutsourcDetailDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OutsourcDetailDto(String id, String orderCode, String outsourcName,
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
		this.completeTime = (completeTime!=null?DateUtil.formateDate(completeTime, "yyyy-MM-dd"):"");
		this.createManId = createManId;
		this.createManName = createManName;
		this.createTime = createTime;
		this.description = description;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}

	public String getOutsourcName() {
		return outsourcName;
	}

	public void setOutsourcName(String outsourcName) {
		this.outsourcName = outsourcName;
	}

	public String getProcess() {
		return process;
	}

	public void setProcess(String process) {
		this.process = process;
	}

	public Double getAllPrice() {
		return allPrice;
	}

	public void setAllPrice(Double allPrice) {
		this.allPrice = allPrice;
	}

	public String getPictures() {
		return pictures;
	}

	public void setPictures(String pictures) {
		this.pictures = pictures;
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setCompleteTime(String completeTime) {
		this.completeTime = completeTime;
	}

	public String getCompleteTime() {
		return completeTime;
	}
	
}
