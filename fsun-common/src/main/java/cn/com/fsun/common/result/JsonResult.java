package cn.com.fsun.common.result;

import java.util.List;

import org.springframework.ui.ModelMap;

/**
 * 使用map返回参数
 * @author lenovo
 *
 */
public class JsonResult {
	public static String JSON_SUCCESS = "success";
	public static String JSON_TOTAL = "total";
	public static String JSON_DATA = "rows";
	public static String JSON_MESSAGE="message";
	public static String JSON_ERROR_CODE="errorCode";
	
	//获取jsonList对象
	public static ModelMap getObjectList(Boolean flag,List list,int totalCount,String message) {
		ModelMap jsonResult = new ModelMap();
		jsonResult.put(JSON_SUCCESS, flag);
		jsonResult.put(JSON_TOTAL, totalCount);
		jsonResult.put(JSON_DATA, list);
		jsonResult.put(JSON_MESSAGE, message);
		return jsonResult;
	}
	
	//获取jsonList对象
	public static ModelMap getObjectList(Boolean flag,List list,int totalCount) {
		ModelMap jsonResult = new ModelMap();
		jsonResult.put(JSON_SUCCESS, flag);
		jsonResult.put(JSON_TOTAL, totalCount);
		jsonResult.put(JSON_DATA, list);
		return jsonResult;
	}
	
	//获取json单个对象
	public static ModelMap getResult(Boolean flag, Object o,String message) {
		ModelMap jsonResult = new ModelMap();
		jsonResult.put(JSON_SUCCESS, flag);
		jsonResult.put(JSON_DATA, o);
		jsonResult.put(JSON_MESSAGE, message);
		return jsonResult;
	}
		
	public static ModelMap getResult(Boolean flag, String message, String errorCode) {
		ModelMap jsonResult = new ModelMap();
		jsonResult.put(JSON_SUCCESS, flag);
		jsonResult.put(JSON_MESSAGE, message);
		jsonResult.put(JSON_ERROR_CODE, errorCode);
		return jsonResult;
	}

	
	//获取jsonList对象
	public static ModelMap getResult(Boolean flag,String message) {
		ModelMap jsonResult = new ModelMap();
		jsonResult.put(JSON_SUCCESS, flag);
		jsonResult.put(JSON_MESSAGE, message);
		return jsonResult;
	}
	
	//获取jsonList对象
	public static ModelMap getResult(Boolean flag) {
		ModelMap jsonResult = new ModelMap();
		jsonResult.put(JSON_SUCCESS, flag);
		return jsonResult;
	}

	
}