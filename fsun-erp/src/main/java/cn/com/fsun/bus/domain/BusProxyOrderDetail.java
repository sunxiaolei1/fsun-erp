package cn.com.fsun.bus.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "bus_proxy_order_detail")
public class BusProxyOrderDetail implements java.io.Serializable {
	
	// Fields

	private String id;
	
	/**
	 * 加工单号
	 */
	private String proxyCode;
	
	/**
	 * 产品名称
	 */
	private String productName;
	
	/**
	 * 款号
	 */
	private String style;//生产产品款号(可以是同一个产品的组合款号)
	
	/**
	 * 材质名称
	 */
	private String material;
	
	/**
	 * 规格
	 */
	private String spec;
	
    /**
     * 开数
     */
	private Integer openNum;
	
	/**
	 * 开料尺寸
	 */
	private String openSize;
	
	/**
	 * 开料方法
	 */
	private String openMethod;
	
	/**
	 * 生产机型
	 */
	private String model;
	
	/**
	 * 印刷方式
	 */
	private String layout;
	
	/**
	 * 工序
	 */
	private String process;
	
	/**
	 * 大张数量
	 */
	private Integer papers;
	
	/**
	 * 印张总数
	 */
	private Integer prints;
	
	/**
	 * 色数
	 */
	private String colors;
	
	/**
	 * 是否看样
	 */
	private boolean viewed;
	
	/**
	 * 是否打样
	 */
	private boolean looked;
	
	/**
	 * 是否上光
	 */
	private boolean polished;
	
	/**
	 * 是否覆膜
	 */
	private boolean filmed;
	
	/**
	 * 拼数
	 */
	private Integer impos;
	
	/**
	 * 图片地址
	 */
	private String imageUrl;
	
	/**
	 * 印刷数量（预算）
	 */
	private Integer expects;
	
	/**
	 * 印张净数（实际）
	 */
	private Integer actuals;
	
	/**
	 * 印损
	 */
	private Integer loss;
	
	/**
	 * 单价
	 */
	private Float price;
	
	/**
	 * 总价
	 */
	private Float totalPrice;
	
	/**
	 * 备注
	 */
	private String descr;

	public BusProxyOrderDetail() {
		super();
		// TODO Auto-generated constructor stub
	}


	public BusProxyOrderDetail(String id, String proxyCode, String productName, String style, String material,
			String spec, Integer openNum, String openSize, String openMethod, String model, String layout,
			String process, Integer papers, Integer prints, String colors, boolean viewed, boolean looked,
			boolean polished, boolean filmed, Integer impos, String imageUrl, Integer expects, Integer actuals,
			Integer loss, Float price, Float totalPrice, String descr) {
		super();
		this.id = id;
		this.proxyCode = proxyCode;
		this.productName = productName;
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
		this.viewed = viewed;
		this.looked = looked;
		this.polished = polished;
		this.filmed = filmed;
		this.impos = impos;
		this.imageUrl = imageUrl;
		this.expects = expects;
		this.actuals = actuals;
		this.loss = loss;
		this.price = price;
		this.totalPrice = totalPrice;
		this.descr = descr;
	}



	@GenericGenerator(name = "generator", strategy = "uuid.hex")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "id", unique = true, nullable = false, length = 32)
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "proxy_code", nullable = false, length = 32)
	public String getProxyCode() {
		return proxyCode;
	}

	public void setProxyCode(String proxyCode) {
		this.proxyCode = proxyCode;
	}

	@Column(name = "product_name", nullable = false, length = 128)
	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	@Column(name = "style", length = 255)
	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	@Column(name = "material", length = 32)
	public String getMaterial() {
		return material;
	}

	public void setMaterial(String material) {
		this.material = material;
	}

	@Column(name = "spec", length = 32)
	public String getSpec() {
		return spec;
	}

	public void setSpec(String spec) {
		this.spec = spec;
	}

	@Column(name = "open_num")
	public Integer getOpenNum() {
		return openNum;
	}

	public void setOpenNum(Integer openNum) {
		this.openNum = openNum;
	}

	@Column(name = "open_size", length = 64)
	public String getOpenSize() {
		return openSize;
	}

	public void setOpenSize(String openSize) {
		this.openSize = openSize;
	}

	@Column(name = "open_method", length = 128)
	public String getOpenMethod() {
		return openMethod;
	}

	public void setOpenMethod(String openMethod) {
		this.openMethod = openMethod;
	}

	@Column(name = "model", length = 32)
	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	@Column(name = "layout", length = 16)
	public String getLayout() {
		return layout;
	}

	public void setLayout(String layout) {
		this.layout = layout;
	}

	@Column(name = "process", length = 64)
	public String getProcess() {
		return process;
	}

	public void setProcess(String process) {
		this.process = process;
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

	@Column(name = "colors",length = 64)
	public String getColors() {
		return colors;
	}

	public void setColors(String colors) {
		this.colors = colors;
	}

	@Column(name = "viewed")
	public boolean isViewed() {
		return viewed;
	}

	public void setViewed(boolean viewed) {
		this.viewed = viewed;
	}

	@Column(name = "impos")
	public Integer getImpos() {
		return impos;
	}

	public void setImpos(Integer impos) {
		this.impos = impos;
	}

	@Column(name = "image_url",length = 255)
	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	@Column(name = "expects")
	public Integer getExpects() {
		return expects;
	}

	public void setExpects(Integer expects) {
		this.expects = expects;
	}

	@Column(name = "actuals")
	public Integer getActuals() {
		return actuals;
	}

	public void setActuals(Integer actuals) {
		this.actuals = actuals;
	}

	@Column(name = "loss")
	public Integer getLoss() {
		return loss;
	}

	public void setLoss(Integer loss) {
		this.loss = loss;
	}

	@Column(name = "price")
	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	@Column(name = "total_price")
	public Float getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Float totalPrice) {
		this.totalPrice = totalPrice;
	}

	@Column(name = "descr",length = 255)
	public String getDescr() {
		return descr;
	}

	public void setDescr(String descr) {
		this.descr = descr;
	}

	@Column(name = "looked")
	public boolean isLooked() {
		return looked;
	}

	public void setLooked(boolean looked) {
		this.looked = looked;
	}

	@Column(name = "polished")
	public boolean isPolished() {
		return polished;
	}

	public void setPolished(boolean polished) {
		this.polished = polished;
	}

	@Column(name = "filmed")
	public boolean isFilmed() {
		return filmed;
	}

	public void setFilmed(boolean filmed) {
		this.filmed = filmed;
	}
	

}
