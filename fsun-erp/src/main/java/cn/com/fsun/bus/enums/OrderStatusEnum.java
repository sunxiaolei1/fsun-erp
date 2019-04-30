package cn.com.fsun.bus.enums;

import java.util.ArrayList;
import java.util.List;

public enum OrderStatusEnum {

	ORDER_CREATING("制单中","制单中"),
	ORDER_CREATED("已下单","已下单"),
	ORDER_END("已结单","已结单"),
	UNKNOW("UNKNOW","未知");
	
	/** 常量code */
	private String code;
	/** 常量名称 */
	private String name;
    
	private OrderStatusEnum(String code, String name) {
		this.code = code;
		this.name = name;
	}

	public String getCode() {
		return code;
	}
	
	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public static OrderStatusEnum getByName(String code){
		for (OrderStatusEnum item : OrderStatusEnum.values()) {
			if(code.equals(item.getCode())){
				return item;
			}
		}
		return OrderStatusEnum.UNKNOW;
	}
	
	public static List<OrderStatusEnum> getAllMoods(){
		List<OrderStatusEnum> gradeList = new ArrayList<OrderStatusEnum>();
		OrderStatusEnum[] md = OrderStatusEnum.values();
		for (OrderStatusEnum item : md) {
			gradeList.add(item);
		}
		return gradeList;
	}
}
