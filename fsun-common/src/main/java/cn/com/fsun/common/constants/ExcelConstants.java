package cn.com.fsun.common.constants;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

public class ExcelConstants {
	
	public static final String SYSTEM_EXCEL_DOWNLOAD_TEMP_PATH ="E:\\";
	
	/**
	 * 导入权限
	 */
	public static final String[] EXCEL_POWER = new String[]{"name","code","menuId"};
	
	/**
	 * 导入虚拟机
	 */
	public static final String[] EXCEL_VMUSER = new String[]{"username","passwd"};

	/**
	 *导出虚拟机用户
	 */
	public static Map<String,String> header_vmuser(){
		HashMap<String,String> header = new LinkedHashMap<String,String>();
		header.put("username", "帐号");
		header.put("passwd", "密码");
		return header;
	} 
	
	/**
	 *导出权限
	 */
	public static Map<String,String> header_power(){
		HashMap<String,String> header = new LinkedHashMap<String,String>();
		//header.put("id", "id");
		header.put("name", "名称");
		header.put("code", "编码");
		//header.put("menuId", "所属模块");
		return header;
	} 
	
	
}
