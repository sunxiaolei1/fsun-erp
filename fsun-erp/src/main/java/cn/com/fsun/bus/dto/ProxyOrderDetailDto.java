package cn.com.fsun.bus.dto;

/**
 * 加工单明细对象
 * @author sunxiaolei
 *
 */
public class ProxyOrderDetailDto {

	
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getProxyCode() {
		return proxyCode;
	}

	public void setProxyCode(String proxyCode) {
		this.proxyCode = proxyCode;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	public String getMaterial() {
		return material;
	}

	public void setMaterial(String material) {
		this.material = material;
	}

	public String getSpec() {
		return spec;
	}

	public void setSpec(String spec) {
		this.spec = spec;
	}

	public Integer getOpenNum() {
		return openNum;
	}

	public void setOpenNum(Integer openNum) {
		this.openNum = openNum;
	}

	public String getOpenSize() {
		return openSize;
	}

	public void setOpenSize(String openSize) {
		this.openSize = openSize;
	}

	public String getOpenMethod() {
		return openMethod;
	}

	public void setOpenMethod(String openMethod) {
		this.openMethod = openMethod;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getLayout() {
		return layout;
	}

	public void setLayout(String layout) {
		this.layout = layout;
	}

	public String getProcess() {
		return process;
	}

	public void setProcess(String process) {
		this.process = process;
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

	public String getColors() {
		return colors;
	}

	public void setColors(String colors) {
		this.colors = colors;
	}

	public boolean isViewed() {
		return viewed;
	}

	public void setViewed(boolean viewed) {
		this.viewed = viewed;
	}

	public Integer getImpos() {
		return impos;
	}

	public void setImpos(Integer impos) {
		this.impos = impos;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public Integer getExpects() {
		return expects;
	}

	public void setExpects(Integer expects) {
		this.expects = expects;
	}

	public Integer getActuals() {
		return actuals;
	}

	public void setActuals(Integer actuals) {
		this.actuals = actuals;
	}

	public Integer getLoss() {
		return loss;
	}

	public void setLoss(Integer loss) {
		this.loss = loss;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public Float getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Float totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getDescr() {
		return descr;
	}

	public void setDescr(String descr) {
		this.descr = descr;
	}

	public boolean isLooked() {
		return looked;
	}

	public void setLooked(boolean looked) {
		this.looked = looked;
	}

	public boolean isPolished() {
		return polished;
	}

	public void setPolished(boolean polished) {
		this.polished = polished;
	}

	public boolean isFilmed() {
		return filmed;
	}

	public void setFilmed(boolean filmed) {
		this.filmed = filmed;
	}
	
	
}
