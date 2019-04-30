package cn.com.fsun.bus.enums;

import java.util.ArrayList;
import java.util.List;

/**
 * 印刷色数C_M_Y_K_1---->蓝_红_黄_黑_专色
 * @author sunxiaolei
 *
 */
public enum PrintColorsEnum {

	C_M_Y_K(1,"C,M,Y,K"),
	C_M_Y_K_1(2,"C,M,Y,K,专色"), 
	C_M_Y(3,"C,M,Y"), 
	C_M_K(4,"C,M,K"), 
	C_Y_K(5,"C,Y,K"), 
	M_Y_K(6,"M,Y,K"), 
	C_M_Y_1(7,"C,M,Y,专色"), 
	C_M_K_1(8,"C,M,K,专色"), 
	C_Y_K_1(9,"C,Y,K,专色"), 
	M_Y_K_1(10,"M,Y,K,专色"), 
	C(11,"C"), 
	M(12,"M"), 
	Y(13,"Y"), 
	K(14,"K"),
	_1(15,"专色"), 
	OTHER(16,"其他"),
	C_M_Y_POLISH(17,"C,M,Y,上光"), 
	C_M_K_POLISH(18,"C,M,K,上光"), 
	C_Y_K_POLISH(19,"C,Y,K,上光"), 
	M_Y_K_POLISH(20,"M,Y,K,上光"), 
	C_POLISH(21,"C,上光"), 
	M_POLISH(22,"M,上光"), 
	Y_POLISH(23,"Y,上光"), 
	K_POLISH(24,"K,上光"),
	C_M_Y_K_POLISH(25,"C,M,Y,K,上光");
	
	/** 常量code */
	private int code;
	/** 常量名称 */
	private String name;
    
	private PrintColorsEnum(int code, String name) {
		this.code = code;
		this.name = name;
	}

	public int getCode() {
		return code;
	}
	
	public void setCode(int code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public static PrintColorsEnum getByCode(int code){
		for (PrintColorsEnum item : PrintColorsEnum.values()) {
			if(code == item.getCode()){
				return item;
			}
		}
		return PrintColorsEnum.OTHER;
	}
	
	public static List<PrintColorsEnum> getAllMoods(){
		List<PrintColorsEnum> gradeList = new ArrayList<PrintColorsEnum>();
		PrintColorsEnum[] md = PrintColorsEnum.values();
		for (PrintColorsEnum item : md) {
			gradeList.add(item);
		}
		return gradeList;
	}
	
}
