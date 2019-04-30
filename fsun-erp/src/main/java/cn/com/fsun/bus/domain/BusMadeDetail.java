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
@Table(name = "bus_made_detail")
public class BusMadeDetail implements java.io.Serializable {

	// Fields

	private String id;
	private String madeCode;
	private String orderCode;
	private String productCode;
	private String style;//生产产品款号(可以是同一个产品的组合款号)
	private String material;
	private String spec;
	private Integer openNum;
	private String openSize;
	private String openMethod;
	private String model;
	private String layout;
	private String process;
	private Integer papers;
	private Integer prints;
	private Integer colors;
	private Integer impos;
	private Integer expects;
	private Integer actuals;
	private Integer loss;
	private String description;

	private String processCode;
	// Constructors

	/** default constructor */
	public BusMadeDetail() {
	}

	/** minimal constructor */
	public BusMadeDetail(String madeCode, String productCode) {
		this.madeCode = madeCode;
		this.productCode = productCode;
	}

	/** full constructor */
	public BusMadeDetail(String processCode, String madeCode,String orderCode, String productCode, String style,
			String material, String spec, Integer openNum, String openSize,
			String openMethod, String model, String layout, String process,
			Integer papers, Integer prints, Integer colors, Integer impos,
			Integer expects, Integer actuals, Integer loss, String description) {
		this.processCode = processCode;
		this.madeCode = madeCode;
		this.orderCode = orderCode;
		this.productCode = productCode;
		this.style = style;
		this.material = material;
		this.spec = spec;
		this.openNum = openNum;
		this.openSize = openSize;
		this.openMethod = openMethod;
		this.model = model;
		this.layout = layout;
		this.process = process;
		this.papers = papers;
		this.prints = prints;
		this.colors = colors;
		this.impos = impos;
		this.expects = expects;
		this.actuals = actuals;
		this.loss = loss;
		this.description = description;
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

	@Column(name = "made_code", nullable = false, length = 32)
	public String getMadeCode() {
		return this.madeCode;
	}

	public void setMadeCode(String madeCode) {
		this.madeCode = madeCode;
	}
	
	@Column(name = "order_code", nullable = false, length = 256)
	public String getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}

	@Column(name = "product_code", nullable = false, length = 32)
	public String getProductCode() {
		return this.productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	@Column(name = "style", length = 128)
	public String getStyle() {
		return this.style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	@Column(name = "material", length = 32)
	public String getMaterial() {
		return this.material;
	}

	public void setMaterial(String material) {
		this.material = material;
	}

	@Column(name = "spec", length = 32)
	public String getSpec() {
		return this.spec;
	}

	public void setSpec(String spec) {
		this.spec = spec;
	}

	@Column(name = "open_num")
	public Integer getOpenNum() {
		return this.openNum;
	}

	public void setOpenNum(Integer openNum) {
		this.openNum = openNum;
	}

	@Column(name = "open_size", length = 64)
	public String getOpenSize() {
		return this.openSize;
	}

	public void setOpenSize(String openSize) {
		this.openSize = openSize;
	}

	@Column(name = "open_method", length = 128)
	public String getOpenMethod() {
		return this.openMethod;
	}

	public void setOpenMethod(String openMethod) {
		this.openMethod = openMethod;
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

	@Column(name = "process", length = 64)
	public String getProcess() {
		return this.process;
	}

	public void setProcess(String process) {
		this.process = process;
	}

	@Column(name = "papers")
	public Integer getPapers() {
		return this.papers;
	}

	public void setPapers(Integer papers) {
		this.papers = papers;
	}

	@Column(name = "prints")
	public Integer getPrints() {
		return this.prints;
	}

	public void setPrints(Integer prints) {
		this.prints = prints;
	}

	@Column(name = "colors")
	public Integer getColors() {
		return this.colors;
	}

	public void setColors(Integer colors) {
		this.colors = colors;
	}

	@Column(name = "impos")
	public Integer getImpos() {
		return this.impos;
	}

	public void setImpos(Integer impos) {
		this.impos = impos;
	}

	@Column(name = "expects")
	public Integer getExpects() {
		return this.expects;
	}

	public void setExpects(Integer expects) {
		this.expects = expects;
	}

	@Column(name = "actuals")
	public Integer getActuals() {
		return this.actuals;
	}

	public void setActuals(Integer actuals) {
		this.actuals = actuals;
	}

	@Column(name = "loss")
	public Integer getLoss() {
		return this.loss;
	}

	public void setLoss(Integer loss) {
		this.loss = loss;
	}

	@Column(name = "description", length = 128)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "process_code", length = 32)
	public String getProcessCode() {
		return processCode;
	}

	public void setProcessCode(String processCode) {
		this.processCode = processCode;
	}
	
}