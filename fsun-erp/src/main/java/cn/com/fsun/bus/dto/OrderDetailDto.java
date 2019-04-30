package cn.com.fsun.bus.dto;

import cn.com.fsun.common.dto.BaseDto;

public class OrderDetailDto extends BaseDto {

	private String id;
	private String orderId;  //订单编号
	private String orderCode;  //订单号
	
	private String productName;   //产品名称
	private String productCode;   //产品编号
	private Integer number;//数量
	private Integer realNumber;//实际数量
	private String spec;   //规格
	private String unit;   //单位
	private Double onePrice;//单价
	private Double allPrice;//金额
	private String description;//描述
	private Boolean enabled;
	
	private String style;//产品款号
	
	private Integer papers;//大张数量 
	private Integer prints;////印次
	
	public OrderDetailDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OrderDetailDto(String id, String orderId, String productName,
			String productCode, Integer number, Integer realNumber,String spec,
			String unit, Double onePrice, Double allPrice, String description,
			Boolean enabled,String style,Integer papers,Integer prints) {
		super();
		this.id = id;
		this.orderId = orderId;
		this.productName = productName;
		this.productCode = productCode;
		this.number = number;
		this.realNumber = realNumber;
		this.spec =spec;
		this.unit = unit;
		this.onePrice = onePrice;
		this.allPrice = allPrice;
		this.description = description;
		this.enabled = enabled;
		this.style = style;
		this.papers = papers;
		this.prints = prints;
	}
	
	public OrderDetailDto(String id, String orderId, String productName,
			String productCode, Integer number, Integer realNumber, String spec,
			String unit, String description, Boolean enabled,String style,Integer papers,Integer prints) {
		super();
		this.id = id;
		this.orderId = orderId;
		this.productName = productName;
		this.productCode = productCode;
		this.number = number;
		this.realNumber = realNumber;
		this.spec = spec;
		this.setUnit(unit);
		//this.onePrice = 0D;
		//this.setAllPrice(0D);
		this.description = description;
		this.enabled = enabled;
		this.style = style;
		this.papers = papers;
		this.prints = prints;
		
	}
	
	public OrderDetailDto(String id, String orderId, String productName,
			String productCode, Integer number, Integer realNumber, String spec,
			String unit, String description, Boolean enabled,String style,
			Integer papers,Integer prints, String orderCode) {
		super();
		this.id = id;
		this.orderId = orderId;
		this.productName = productName;
		this.productCode = productCode;
		this.number = number;
		this.realNumber = realNumber;
		this.spec = spec;
		this.setUnit(unit);
		this.description = description;
		this.enabled = enabled;
		this.style = style;
		this.papers = papers;
		this.prints = prints;
		this.orderCode = orderCode;
		
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public Integer getRealNumber() {
		return realNumber;
	}

	public void setRealNumber(Integer realNumber) {
		this.realNumber = realNumber;
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

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public void setSpec(String spec) {
		this.spec = spec;
	}

	public String getSpec() {
		return spec;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	public String getStyle() {
		return style;
	}

	public Integer getPapers() {
		return papers;
	}

	public void setPapers(Integer papers) {
		this.papers = papers;
	}

	public Integer getPrints() {
		return prints;
	}

	public void setPrints(Integer prints) {
		this.prints = prints;
	}

	public String getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}
	
	
	
}
