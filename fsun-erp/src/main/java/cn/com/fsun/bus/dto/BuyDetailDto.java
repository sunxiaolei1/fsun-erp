package cn.com.fsun.bus.dto;

import java.io.Serializable;
import java.util.Date;

import cn.com.fsun.common.utils.DateUtil;


public class BuyDetailDto implements Serializable {

	    private Integer id;
	    
		/** 采购单编号*/
		private String purchaseId;
		
		private String factoryName;
		
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
		
		private Boolean enabled;
		
		private String storeName;  //存放仓库名称
		
		private String consignee;//收货人 
		
		/**
		 * 需求日期
		 */
		private String expire;
		
		/**
		 * 计划人
		 */
		private String createManName;
		
		/** 备注*/
		private String description;
		
			
		public BuyDetailDto() {}
	
		/**
		 * 用于汇总查询
		 */
		public BuyDetailDto(Integer id, String purchaseId, String materielName, String spec, String factoryName, Boolean enabled,
				Integer number, String unit, Double onePrice, Double allPrice, Date expire, String storeName,
				String consignee, String createManName, String description) {
			super();
			this.setId(id);
			this.purchaseId = purchaseId;
			this.materielName = materielName;
			this.spec = spec;
			this.factoryName = factoryName;
			this.enabled = enabled;
			if(enabled){
				this.inStatus = "未验收";
			}else{
				this.inStatus = "已验收";
			}
			this.number = number;
			this.unit = unit;
			this.onePrice = onePrice;
			this.allPrice = allPrice;
			this.expire = (expire!=null?DateUtil.formateDate(expire, "yyyy-MM-dd"):"");;
			this.storeName = storeName;
			this.consignee = consignee;
			this.createManName = createManName;
			this.description = description;
		}

		public String getPurchaseId() {
			return purchaseId;
		}

		public void setPurchaseId(String purchaseId) {
			this.purchaseId = purchaseId;
		}

		public String getFactoryName() {
			return factoryName;
		}

		public void setFactoryName(String factoryName) {
			this.factoryName = factoryName;
		}

		public String getMaterielName() {
			return materielName;
		}

		public void setMaterielName(String materielName) {
			this.materielName = materielName;
		}

		public String getSpec() {
			return spec;
		}

		public void setSpec(String spec) {
			this.spec = spec;
		}

		public String getInStatus() {
			return inStatus;
		}

		public void setInStatus(String inStatus) {
			this.inStatus = inStatus;
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

		public Boolean getEnabled() {
			return enabled;
		}

		public void setEnabled(Boolean enabled) {
			this.enabled = enabled;
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

		public String getExpire() {
			return expire;
		}

		public void setExpire(String expire) {
			this.expire = expire;
		}

		public String getCreateManName() {
			return createManName;
		}

		public void setCreateManName(String createManName) {
			this.createManName = createManName;
		}

		public String getDescription() {
			return description;
		}

		public void setDescription(String description) {
			this.description = description;
		}

		public Integer getId() {
			return id;
		}

		public void setId(Integer id) {
			this.id = id;
		}

}

