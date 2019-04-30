package cn.com.fsun.bus.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * BusMadeDetail entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "bus_proxy_print_detail")
public class BusProxyPrintDetail implements java.io.Serializable {

	// Fields

	private String id;
	private Integer lineNo;
	private String proxyCode;
	private String productName;
	
	private String model;
	private String layout;
	private String process;
	private Integer colors;
	private String colorsName;
	private Integer psNumber;
	private Integer number;
	private Integer loss;
	private String descr;

	private Double price;
	private Double totalPrice;
	
	/**
	 * 专色
	 */
	private String spotColors;
	// Constructors

	/** default constructor */
	public BusProxyPrintDetail() {
	}

	public BusProxyPrintDetail(String id, Integer lineNo, String proxyCode, String productName, String model,
			String layout, String process, Integer colors, Integer psNumber, Integer number, Integer loss, String descr,
			Double price, Double totalPrice) {
		super();
		this.id = id;
		this.lineNo = lineNo;
		this.proxyCode = proxyCode;
		this.productName = productName;
		this.model = model;
		this.layout = layout;
		this.process = process;
		this.colors = colors;
		this.psNumber = psNumber;
		this.number = number;
		this.loss = loss;
		this.descr = descr;
		this.price = price;
		this.totalPrice = totalPrice;
	}


	public BusProxyPrintDetail(String id, Integer lineNo, String proxyCode, String productName, String model,
			String layout, String process, Integer colors, String colorsName, Integer psNumber, Integer number,
			Integer loss, String descr, Double price, Double totalPrice) {
		super();
		this.id = id;
		this.lineNo = lineNo;
		this.proxyCode = proxyCode;
		this.productName = productName;
		this.model = model;
		this.layout = layout;
		this.process = process;
		this.colors = colors;
		this.colorsName = colorsName;
		this.psNumber = psNumber;
		this.number = number;
		this.loss = loss;
		this.descr = descr;
		this.price = price;
		this.totalPrice = totalPrice;
	}
	
	public BusProxyPrintDetail(String id, Integer lineNo, String proxyCode, String productName, String model,
			String layout, String process, Integer colors, String colorsName, Integer psNumber, Integer number,
			Integer loss, String descr, Double price, Double totalPrice, String spotColors) {
		super();
		this.id = id;
		this.lineNo = lineNo;
		this.proxyCode = proxyCode;
		this.productName = productName;
		this.model = model;
		this.layout = layout;
		this.process = process;
		this.colors = colors;
		this.colorsName = colorsName;
		this.psNumber = psNumber;
		this.number = number;
		this.loss = loss;
		this.descr = descr;
		this.price = price;
		this.totalPrice = totalPrice;
		this.spotColors = spotColors;
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

	@Column(name = "proxy_code", nullable = false, length = 32)
	public String getProxyCode() {
		return this.proxyCode;
	}

	public void setProxyCode(String proxyCode) {
		this.proxyCode = proxyCode;
	}

	
	@Column(name = "product_name", nullable = false, length = 255)
	public String getProductName() {
		return this.productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	@Column(name = "model", length = 32)
	public String getModel() {
		return this.model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	@Column(name = "layout", length = 16)
	public String getLayout() {
		return this.layout;
	}

	public void setLayout(String layout) {
		this.layout = layout;
	}

	@Column(name = "process", nullable = false, length = 64)
	public String getProcess() {
		return this.process;
	}

	public void setProcess(String process) {
		this.process = process;
	}

	@Column(name = "colors", nullable = false)
	public Integer getColors() {
		return this.colors;
	}

	public void setColors(Integer colors) {
		this.colors = colors;
	}

	@Column(name = "number")
	public Integer getNumber() {
		return this.number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	@Column(name = "loss")
	public Integer getLoss() {
		return this.loss;
	}

	public void setLoss(Integer loss) {
		this.loss = loss;
	}

	@Column(name = "descr", length = 128)
	public String getDescr() {
		return this.descr;
	}

	public void setDescr(String descr) {
		this.descr = descr;
	}

	@Column(name = "price")
	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	@Column(name = "total_price")
	public Double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}

	/**
	 * @return the psNumber
	 */
	@Column(name = "ps_number")
	public Integer getPsNumber() {
		return psNumber;
	}

	/**
	 * @param psNumber the psNumber to set
	 */
	public void setPsNumber(Integer psNumber) {
		this.psNumber = psNumber;
	}

	/**
	 * @return the lineNo
	 */
	@Column(name = "line_no")
	public Integer getLineNo() {
		return lineNo;
	}

	/**
	 * @param lineNo the lineNo to set
	 */
	public void setLineNo(Integer lineNo) {
		this.lineNo = lineNo;
	}

	/**
	 * @return the colorsName
	 */
	@Column(name = "colors_name", length = 32)
	public String getColorsName() {
		return colorsName;
	}

	/**
	 * @param colorsName the colorsName to set
	 */
	public void setColorsName(String colorsName) {
		this.colorsName = colorsName;
	}

	/**
	 * @return the spotColors
	 */
	@Column(name = "spot_colors", length = 64)
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