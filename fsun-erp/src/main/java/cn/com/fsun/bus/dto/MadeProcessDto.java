/**  
 * Project Name:fsun-erp  
 * File Name:MadeProcessDto.java  
 * Package Name:cn.com.fsun.bus.dto  
 * Date:2017年8月3日 
 * Copyright (c) 2017, WFZ All Rights Reserved.  
 *  
*/  
  
package cn.com.fsun.bus.dto;  
/**  
 * ClassName:MadeProcessDto <br/>  
 * Description: TODO <br/>   
 * @author   lenovo  
 * @version  1.0  
 * @since    JDK 1.7        
 */
public class MadeProcessDto {

	private String id;
	private String processCode;
	private String madeCode;
	private String orderCode;
	private String outsourcer;
	private String name;
	private Integer number;
	private String demand;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMadeCode() {
		return madeCode;
	}
	public void setMadeCode(String madeCode) {
		this.madeCode = madeCode;
	}
	public String getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}
	public String getOutsourcer() {
		return outsourcer;
	}
	public void setOutsourcer(String outsourcer) {
		this.outsourcer = outsourcer;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	public String getDemand() {
		return demand;
	}
	public void setDemand(String demand) {
		this.demand = demand;
	}
	public String getProcessCode() {
		return processCode;
	}
	public void setProcessCode(String processCode) {
		this.processCode = processCode;
	}
	
}
  
