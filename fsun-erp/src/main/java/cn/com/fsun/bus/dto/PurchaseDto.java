package cn.com.fsun.bus.dto;

import java.io.Serializable;
import java.util.Date;

import cn.com.fsun.common.utils.DateUtil;

public class PurchaseDto implements Serializable {
	
	private String id; //订单号
	private String setWay;//结算方式
	private Double allPrice;//总价
	private Double carriage;//运费	
	private String description;//备注
	private Boolean enabled;	
	private String createManId;
	private String createTime;
	private String expire; //需求日期
	
	private String createManName;
	
	private Integer storeId;  //存放仓库Id
	private String storeName;  //存放仓库名称
	private String consignee;//收货人
	
	public PurchaseDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	//all
	public PurchaseDto(String id, String setWay, Double allPrice, Double carriage, 
			String description,  Boolean enabled, String createManName, Date createTime,
			Date expire, Integer storeId,String storeName, String consignee) {
		super();
		this.id = id;
		this.setWay = setWay;
		this.allPrice = allPrice;
		this.carriage = carriage;
		this.description = description;
		this.enabled = enabled;	
		this.createManName = createManName;
		this.createTime = (createTime!=null?DateUtil.formateDate(createTime, "yyyy-MM-dd"):"");	
		this.storeId = storeId;
		this.setStoreName(storeName);
		this.consignee = consignee;
		this.expire = (expire!=null?DateUtil.formateDate(expire, "yyyy-MM-dd"):"");
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getCreateManId() {
		return createManId;
	}
	public void setCreateManId(String createManId) {
		this.createManId = createManId;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getConsignee() {
		return consignee;
	}
	public void setConsignee(String consignee) {
		this.consignee = consignee;
	}
	public void setCarriage(Double carriage) {
		this.carriage = carriage;
	}

	public Double getCarriage() {
		return carriage;
	}

	public void setStoreId(Integer storeId) {
		this.storeId = storeId;
	}

	public Integer getStoreId() {
		return storeId;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getStoreName() {
		return storeName;
	}

	public String getCreateManName() {
		return createManName;
	}

	public void setCreateManName(String createManName) {
		this.createManName = createManName;
	}

	public String getExpire() {
		return expire;
	}

	public void setExpire(String expire) {
		this.expire = expire;
	}

	
	
}
