package cn.com.fsun.bus.dto;

import cn.com.fsun.common.dto.BaseDto;

public class StockBaseDto extends BaseDto {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long id;
	private String name;
	private String artNum; //货号
	private String image; //图片
	private String rackNum; //机架号
	private Integer storeId; //所属仓库
	private String customerCode; //所属客户编码
	private String description;
	
	private String customerName; //所属客户名称
	private String storeName; //所属仓库名称
	
	public StockBaseDto(Long id, String name, String artNum, String image,
			String rackNum, Integer storeId, String customerCode,
		    String customerName, String description) {
		super();
		this.id = id;
		this.name = name;
		this.artNum = artNum;
		this.image = image;
		this.rackNum = rackNum;
		this.storeId = storeId;
		this.customerCode = customerCode;	
		this.customerName = customerName;
		this.description = description;
	}
	
	public StockBaseDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getArtNum() {
		return artNum;
	}
	public void setArtNum(String artNum) {
		this.artNum = artNum;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getRackNum() {
		return rackNum;
	}
	public void setRackNum(String rackNum) {
		this.rackNum = rackNum;
	}
	public Integer getStoreId() {
		return storeId;
	}
	public void setStoreId(Integer storeId) {
		this.storeId = storeId;
	}
	public String getCustomerCode() {
		return customerCode;
	}
	public void setCustomerCode(String customerCode) {
		this.customerCode = customerCode;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	/**
	 * @param customerName the customerName to set
	 */
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	/**
	 * @return the customerName
	 */
	public String getCustomerName() {
		return customerName;
	}

	/**
	 * @param storeName the storeName to set
	 */
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	/**
	 * @return the storeName
	 */
	public String getStoreName() {
		return storeName;
	}
	
}
