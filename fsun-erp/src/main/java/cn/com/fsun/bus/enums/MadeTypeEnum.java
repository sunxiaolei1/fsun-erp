/**  
 * Project Name:fsun-erp  
 * File Name:MadeTypeEnum.java  
 * Package Name:cn.com.fsun.bus.enums  
 * Date:2017年8月7日 
 * Copyright (c) 2017, WFZ All Rights Reserved.  
 *  
*/  
  
package cn.com.fsun.bus.enums;

import java.util.ArrayList;
import java.util.List;

/**  
 * ClassName:MadeTypeEnum <br/>  
 * Description: TODO <br/>   
 * @author   lenovo  
 * @version  1.0  
 * @since    JDK 1.7        
 */
public enum MadeTypeEnum {

	UNKNOW(-1,"未知"),
	SIMPLE(1,"普通型"),
	MERGE(2,"合并型"),
	SPLIT(3,"拆分型");
	
	/** 常量�?*/
	private int value;
	/** 常量描述 */
	private String comment;
    
	private MadeTypeEnum(int value, String comment) {
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

	public static MadeTypeEnum getByValue(int value){
		for (MadeTypeEnum item : MadeTypeEnum.values()) {
			if(item.getValue()==value){
				return item;
			}
		}
		return MadeTypeEnum.UNKNOW;
	}
	
	public static List<MadeTypeEnum> getAllMoods(){
		List<MadeTypeEnum> gradeList = new ArrayList<MadeTypeEnum>();
		MadeTypeEnum[] md = MadeTypeEnum.values();
		for (MadeTypeEnum item : md) {
			gradeList.add(item);
		}
		return gradeList;
	}
}
  
