package cn.com.fsun.common.result;

import java.util.List;
import org.springframework.ui.ModelMap;

public class JsonUtil {
	
	public static String JSON_SUCCESS = "success";
	public static String JSON_TOTAL = "total";
	public static String JSON_DATA = "rows";
	public static String JSON_ORDER = "order";
	public static String JSON_FOOTER = "footer";
	
	
	//获取json单个对象
	public static ModelMap getObject(Boolean flag, Object o) {
		ModelMap jsonResult = new ModelMap();
		jsonResult.put(JSON_SUCCESS, flag);
		jsonResult.put(JSON_DATA, o);
		return jsonResult;
	}
	
	//获取json单个对象(带有订单对象)
	public static ModelMap getObject(Boolean flag, Object o, Object order) {
		ModelMap jsonResult = new ModelMap();
		jsonResult.put(JSON_SUCCESS, flag);
		jsonResult.put(JSON_DATA, o);
		jsonResult.put(JSON_ORDER, order);	
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
	
	/**
	 * 获取jsonList对象(在页脚添加统计数)
	 * @param flag
	 * @param list
	 * @param totalCount
	 * @return
	 */
	public static ModelMap getObjectList(Boolean flag,List list,int totalCount,Object footer) {
		ModelMap jsonResult = new ModelMap();
		jsonResult.put(JSON_SUCCESS, flag);
		jsonResult.put(JSON_TOTAL, totalCount);
		jsonResult.put(JSON_DATA, list);
		jsonResult.put(JSON_FOOTER, footer);
		return jsonResult;
	}
		
	//获取jsonList对象
	public static ModelMap getResult(Boolean flag) {
		ModelMap jsonResult = new ModelMap();
		jsonResult.put(JSON_SUCCESS, flag);
		return jsonResult;
	}
}
