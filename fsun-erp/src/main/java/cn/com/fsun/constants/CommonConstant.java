package cn.com.fsun.constants;

import java.util.HashMap;
import java.util.LinkedHashMap;

/**
 * 整个应用通用的常量 <br>
 * <b>类描述:</b>
 * 
 * <pre>
 * |
 * </pre>
 * 
 * @see
 * @since
 */
public class CommonConstant {
	
	public static final String UPLOAD_BASE_PATH = "/uploads";
	
	/**
	 * 用户对象放到Session中的键名称
	 */
	public static final String USER_CONTEXT = "USER_CONTEXT";

	/**
	 * 将登录前的URL放到Session中的键名称
	 */
	public static final String LOGIN_TO_URL = "toUrl";

	/**
	 * 每页的记录数
	 */
	public static final int PAGE_SIZE = 3;

	/**
	 * 日志级别定义
	 */
	public static Integer Log_Leavel_INFO = 1;
	public static Integer Log_Leavel_WARRING = 2;
	public static Integer Log_Leavel_ERROR = 3;
	/**
	 * 日志类型
	 */
	public static Integer Log_Type_LOGIN = 1; // 登陆
	public static Integer Log_Type_EXIT = 2; // 退出
	public static Integer Log_Type_INSERT = 3; // 插入
	public static Integer Log_Type_DEL = 4; // 删除
	public static Integer Log_Type_UPDATE = 5; // 更新
	public static Integer Log_Type_UPLOAD = 6; // 上传
	public static Integer Log_Type_OTHER = 7; // 其他
	public static Integer Log_Type_BACKUP = 8; // 数据库备份
	public static Integer Log_Type_RECOVER = 9; // 数据库恢复

	public static String getNameByLgType(String i) {
		HashMap<String, String> header = new LinkedHashMap<String, String>();
		header.put("1", "登陆");
		header.put("2", "退出");
		header.put("3", " 插入");
		header.put("4", "删除");
		header.put("5", "更新");
		header.put("6", " 上传");
		header.put("7", "其他");
		header.put("8", "数据库备份");
		header.put("9", "数据库恢复");
		return header.get(i);
	}
	
	private static HashMap<String, String> setWay;
	
	static{		
		setWay = new LinkedHashMap<String, String>();
		setWay.put("0", "付现");
		setWay.put("1", "一个月后付款");
		setWay.put("2", "两个月后付款");
		setWay.put("3", "其他");		
	} 
	
	public static String getSetWayByNumber(String i) {
		return setWay.get(i);
	}
	
}
