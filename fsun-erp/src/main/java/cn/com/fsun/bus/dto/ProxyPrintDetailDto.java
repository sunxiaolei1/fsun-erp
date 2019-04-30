package cn.com.fsun.bus.dto;

/**
 * 印刷加工明细对象
 * @author sunxiaolei
 *
 */
public class ProxyPrintDetailDto {

	/**
	 * 主键
	 */
	private String id;
	
	/**
	 * 行号
	 */
	private Integer lineNo;
	
	/**
	 * 加工单号
	 */
	private String proxyCode;
	
	/**
	 * 产品名称
	 */
	private String productName;
	
	/**
	 * 机型
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
	 * 色数
	 */
	private Integer colors;
	
	/**
	 * 色数
	 */
	private String colorsName;
	
	/**
	 * ps版数量
	 */
	private Integer psNumber;
	
	/**
	 * 印刷数量
	 */
	private Integer number;
	
	/**
	 * 印损
	 */
	private Integer loss;
	
	/**
	 * 备注
	 */
	private String descr;

	/**
	 * 单价
	 */
	private Double price;
	
	/**
	 * 金额
	 */
	private Double totalPrice;
	
	/**
	 * 专色
	 */
	private String spotColors;
	
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
	public Integer getColors() {
		return colors;
	}
	public void setColors(Integer colors) {
		this.colors = colors;
	}
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	public Integer getLoss() {
		return loss;
	}
	public void setLoss(Integer loss) {
		this.loss = loss;
	}
	public String getDescr() {
		return descr;
	}
	public void setDescr(String descr) {
		this.descr = descr;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}
	/**
	 * @return the colorsName
	 */
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
	 * @return the psNumber
	 */
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
	 * @return the spotColors
	 */
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
