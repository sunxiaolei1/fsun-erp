/**  
 * Project Name:fsun-erp  
 * File Name:OrderSourceEnum.java  
 * Package Name:cn.com.fsun.bus.enums  
 * Date:2017年8月24日 
 * Copyright (c) 2017, WFZ All Rights Reserved.  
 *  
*/  
  
package cn.com.fsun.bus.enums;

/**  
 * ClassName:OrderSourceEnum <br/>  
 * Description: TODO <br/>   
 * @author   lenovo  
 * @version  1.0  
 * @since    JDK 1.7        
 */
public enum OrderSourceEnum {

	UNKNOW(0,"未知"),
	SALE_ORDER(1,"销售单"),
	MADE_ORDER(2,"生产单"),
	DELIVERY_ORDER(3,"送货单"),
	PROXY_ORDER(4,"加工单");
	
	/** 常量�?*/
	private int value;
	/** 常量描述 */
	private String comment;
    
	private OrderSourceEnum(int value, String comment) {
		this.value = value;
		this.comment = comment;
	}

	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public static OrderSourceEnum getByValue(int value){
		for (OrderSourceEnum item : OrderSourceEnum.values()) {
			if(item.getValue()==value){
				return item;
			}
		}
		return OrderSourceEnum.UNKNOW;
	}
	
}
  
