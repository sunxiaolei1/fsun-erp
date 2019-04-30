/**  
 * Project Name:fsun-erp  
 * File Name:MadeDetailDto.java  
 * Package Name:cn.com.fsun.bus.dto  
 * Date:2017年8月3日 
 * Copyright (c) 2017, WFZ All Rights Reserved.  
 *  
*/  
  
package cn.com.fsun.bus.dto;

/**  
 * ClassName:MadeDetailDto <br/>  
 * Description: 生产明细 <br/>   
 * @author   lenovo  
 * @version  1.0  
 * @since    JDK 1.7        
 */
public class MadeDetailDto {
	
	/**
	 * 主键
	 */
	private String id;
	
	/**
	 * 生产单编号
	 */
	private String madeCode;
	
	
	/**
	 * 订单编号
	 */
	private String orderCode;
	
	/**
	 * 所属产品编号
	 */
	private String productCode;
	
	/**
	 * 后道工序编码
	 */
	private String processCode;
	
	/*****************************       制作工艺          ********************************/
	
	/**
	 * 款号
	 */
	private String style;

	
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
	 * 大张数量
	 */
	private Integer papers;
	
	/**
	 * 印张总数
	 */
	private Integer prints;
	
	/**
	 * 开料方法(暂弃用)
	 */
	private String openMethod;
	
	
	
	/********************************* 印刷工艺  ************************************/
	
	/**
	 * 生产机型
	 */
	private String model;

	/**
	 * 工序
	 */
	private String process;
	
	/**
	 * 印刷方式	
	 */
	private String layout;
	
	/**
	 * 色数
	 */
	private Integer colors;
	
	/**
	 * 拼数
	 */
	private Integer impos;
	
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
	 * 备注
	 */
	private String description;
	

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
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
	public Integer getColors() {
		return colors;
	}
	public void setColors(Integer colors) {
		this.colors = colors;
	}
	public Integer getImpos() {
		return impos;
	}
	public void setImpos(Integer impos) {
		this.impos = impos;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
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
	public String getMadeCode() {
		return madeCode;
	}
	public void setMadeCode(String madeCode) {
		this.madeCode = madeCode;
	}
	public String getProcessCode() {
		return processCode;
	}
	public void setProcessCode(String processCode) {
		this.processCode = processCode;
	}

}
  
