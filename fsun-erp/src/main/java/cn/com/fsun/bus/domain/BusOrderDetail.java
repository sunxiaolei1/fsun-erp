package cn.com.fsun.bus.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;

/**
 * BusBuyInfo entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "bus_order_detail")
public class BusOrderDetail implements java.io.Serializable {

	// Fields
	private String id;
	private String orderId;  //订单编号
	private String productName;   //产品名称
	private String productCode;   //产品编号
	private Integer number;//数量
	private Integer realNumber;//实际数量
	private String spec;   //规格
	private String unit;   //单位
	private Double onePrice;//单价
	private Double allPrice;//金额
	private Integer papers;//大张数量 
	private Integer prints;////印次
	private String description;//描述
	private Boolean enabled;
	private String style;//产品款号
	
	
	private String orderCode;  //订单号
	
	// Constructors

	/** default constructor */
	public BusOrderDetail() {
	}

	/** full constructor */
	public BusOrderDetail(String id, String orderId, String productName,
			String productCode, Integer number, Integer realNumber, String spec,
			String unit, Double onePrice, Double allPrice, String description, Boolean enabled,String style,Integer papers,Integer prints) {
		super();
		this.orderId = orderId;
		this.productName = productName;
		this.setProductCode(productCode);
		this.number = number;
		this.realNumber = realNumber;
		this.spec = spec;
		this.setUnit(unit);
		this.onePrice = onePrice;
		this.setAllPrice(allPrice);
		this.description = description!=null?description:"";
		this.enabled = enabled;
		this.style = style!=null?style:"";;
		this.papers = papers;
		this.prints = prints;
	}
	
	public BusOrderDetail(String id, String orderId, String productName,
			String productCode, Integer number, Integer realNumber, String spec,
			String unit, String description, Boolean enabled,String style,Integer papers,Integer prints) {
		super();
		this.orderId = orderId;
		this.productName = productName;
		this.setProductCode(productCode);
		this.number = number;
		this.realNumber = realNumber;
		this.spec = spec;
		this.setUnit(unit);
		//this.onePrice = 0D;
		//this.setAllPrice(0D);
		this.description = description!=null?description:"";
		this.enabled = enabled;
		this.style = style!=null?style:"";;;
		this.papers = papers;
		this.prints = prints;
		
	}
	
	public BusOrderDetail(String id, String orderId, String productName,
			String productCode, Integer number, Integer realNumber, String spec,
			String unit, String description, Boolean enabled,Integer papers,Integer prints) {
		super();
		this.orderId = orderId;
		this.productName = productName;
		this.setProductCode(productCode);
		this.number = number;
		this.realNumber = realNumber;
		this.spec = spec;
		this.setUnit(unit);
		//this.onePrice = 0D;
		//this.setAllPrice(0D);
		this.description = description!=null?description:"";
		this.enabled = enabled;
		this.papers = papers;
		this.prints = prints;
	}


	// Property accessors
	@GenericGenerator(name = "generator", strategy = "uuid.hex")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "id", unique = true, nullable = false, length = 32)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "order_id", length = 32)
	public String getOrderId() {
		return this.orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	@Column(name = "product_name", length = 64)
	public String getProductName() {
		return this.productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	@Column(name = "number")
	public Integer getNumber() {
		return this.number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	@Column(name = "one_price", precision = 10, scale = 1)
	public Double getOnePrice() {
		return this.onePrice;
	}

	public void setOnePrice(Double onePrice) {
		this.onePrice = onePrice;
	}

	@Column(name = "description", length = 65535)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "enabled")
	public Boolean getEnabled() {
		return this.enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	@Column(name = "product_code", length = 32)
	public String getProductCode() {
		return productCode;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	@Column(name = "unit", length = 32)
	public String getUnit() {
		return unit;
	}

	public void setRealNumber(Integer realNumber) {
		this.realNumber = realNumber;
	}

	@Column(name = "real_number")
	public Integer getRealNumber() {
		return realNumber;
	}

	public void setAllPrice(Double allPrice) {
		this.allPrice = allPrice;
	}

	@Column(name = "all_price", precision = 10, scale = 1)
	public Double getAllPrice() {
		return allPrice;
	}

	public void setSpec(String spec) {
		this.spec = spec;
	}
	
	@Column(name = "spec", length = 32)
	public String getSpec() {
		return spec;
	}
	
	public void setStyle(String style) {
		this.style = style;
	}
	
	@Column(name = "style", length = 32)
	public String getStyle() {
		return style;
	}

	@Column(name = "papers")   
	public Integer getPapers() {
		return papers;
	}

	public void setPapers(Integer papers) {
		this.papers = papers;
	}

	@Column(name = "prints")
	public Integer getPrints() {
		return prints;
	}

	public void setPrints(Integer prints) {
		this.prints = prints;
	}

	@Column(name = "order_code", length = 32)
	public String getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}
}