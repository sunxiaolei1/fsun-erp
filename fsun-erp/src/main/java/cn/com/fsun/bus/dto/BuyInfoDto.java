package cn.com.fsun.bus.dto;

import java.io.Serializable;
import java.util.Date;

public class BuyInfoDto implements Serializable {

	private Integer id;
	
	/** 采购单编号*/
	private String purchaseId;
	
	/** 厂家编号*/
	private String factoryId;
	
	private String factoryName;
	
	/** 分类编号*/
	private Long classifyId;
	
	private String classifyName;
	
	/** 物料编号*/
	private Long materielId;
	
	private String materielName;
	
	private String spec;
	
	/* 验收状况 */
	private String inStatus;
	
	/** 数量*/
	private Integer number;
	
	/** 单位*/
	private String unit;
	
	/** 单价*/
	private Double onePrice;
	
	/** 总价*/
	private Double allPrice;
	
	
	private String createManId;
	private Date createTime;
	
	private Boolean enabled;
	
	/**
	 * 用于导出excel
	 */
	private Integer storeId;
	
	private String storeName;  //存放仓库名称
	private String consignee;//收货人 
	
	/** 备注*/
	private String description;
	
		
	public BuyInfoDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * 用于查询
	 * @param id
	 * @param purchaseId
	 * @param factoryId
	 * @param factoryName
	 * @param classifyId
	 * @param classifyName
	 * @param materielId
	 * @param materielName
	 * @param number
	 * @param unit
	 * @param onePrice
	 * @param allPrice
	 * @param description
	 * @param createManId
	 * @param createTime
	 * @param enabled
	 */
	public BuyInfoDto(Integer id, String purchaseId, String factoryId, String factoryName, Long classifyId,
			String classifyName, Long materielId, String materielName, Integer number, String unit, Double onePrice,
			Double allPrice, String description, String createManId, Date createTime, Boolean enabled,String spec) {
		super();
		this.id = id;
		this.purchaseId = purchaseId;
		this.factoryId = factoryId;
		this.factoryName = factoryName;
		this.classifyId = classifyId;
		this.classifyName = classifyName;
		this.materielId = materielId;
		this.materielName = materielName;
		this.number = number;
		this.unit = unit;
		this.onePrice = onePrice;
		this.allPrice = allPrice;
		this.description = description;
		this.createManId = createManId;
		this.createTime = createTime;
		this.enabled = enabled;
		if(enabled){
			this.inStatus = "未验收";
		}else{
			this.inStatus = "已验收";
		}
		this.spec = spec;
	}
	
	
	/**
	 * 用于导出excel
	 * @param purchaseId
	 * @param factoryName
	 * @param classifyName
	 * @param materielName
	 * @param number
	 * @param unit
	 * @param onePrice
	 * @param allPrice
	 * @param description
	 * @param enabled
	 * @param storeName
	 * @param consignee
	 */
	public BuyInfoDto(String purchaseId, String factoryName, String classifyName, String materielName, Integer number,
			String unit, Double onePrice, Double allPrice, String description, Boolean enabled, String storeName,
			String consignee, String spec) {
		super();
		this.purchaseId = purchaseId;
		this.factoryName = factoryName;
		this.classifyName = classifyName;
		this.materielName = materielName;
		this.number = number;
		this.unit = unit;
		this.onePrice = onePrice;
		this.allPrice = allPrice;
		this.description = description;
		if(enabled){
			this.inStatus = "未验收";
		}else{
			this.inStatus = "已验收";
		}
		this.storeName = storeName;
		this.consignee = consignee;
		this.spec = spec;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPurchaseId() {
		return purchaseId;
	}

	public void setPurchaseId(String purchaseId) {
		this.purchaseId = purchaseId;
	}

	public String getFactoryId() {
		return factoryId;
	}

	public void setFactoryId(String factoryId) {
		this.factoryId = factoryId;
	}

	public String getFactoryName() {
		return factoryName;
	}

	public void setFactoryName(String factoryName) {
		this.factoryName = factoryName;
	}

	public Long getClassifyId() {
		return classifyId;
	}

	public void setClassifyId(Long classifyId) {
		this.classifyId = classifyId;
	}

	public String getClassifyName() {
		return classifyName;
	}

	public void setClassifyName(String classifyName) {
		this.classifyName = classifyName;
	}

	public Long getMaterielId() {
		return materielId;
	}

	public void setMaterielId(Long materielId) {
		this.materielId = materielId;
	}

	public String getMaterielName() {
		return materielName;
	}

	public void setMaterielName(String materielName) {
		this.materielName = materielName;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public Double getOnePrice() {
		return onePrice;
	}

	public void setOnePrice(Double onePrice) {
		this.onePrice = onePrice;
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

	public String getCreateManId() {
		return createManId;
	}

	public void setCreateManId(String createManId) {
		this.createManId = createManId;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public String getInStatus() {
		return inStatus;
	}

	public void setInStatus(String inStatus) {
		this.inStatus = inStatus;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getConsignee() {
		return consignee;
	}

	public void setConsignee(String consignee) {
		this.consignee = consignee;
	}

	public String getSpec() {
		return spec;
	}

	public void setSpec(String spec) {
		this.spec = spec;
	}

	public Integer getStoreId() {
		return storeId;
	}

	public void setStoreId(Integer storeId) {
		this.storeId = storeId;
	}
	
	
}
