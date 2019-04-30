package cn.com.fsun.common.utils;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Map;


/**
 * url工具类
 * @author lee
 *
 */
public class UrlUtils {
	
	/** 
	* 获取对象属性，返回一个字符串数组     
	*  
	* @param  o 对象 
	* @return String[] 字符串数组 
	*/  
	private static String[] getFiledName(Object o){
		try{
			Field[] fields = o.getClass().getDeclaredFields();  
			String[] fieldNames = new String[fields.length];    
			for (int i=0; i < fields.length; i++){    
			    fieldNames[i] = fields[i].getName();    
			}    
			return fieldNames;  
		}catch (SecurityException e){  
			e.printStackTrace();  
			System.out.println(e.toString());  
		}  
	    return null;  
	}    
	  
	/** 
	* 使用反射根据属性名称获取属性值  
	*  
	* @param  fieldName 属性名称 
	* @param  o 操作对象 
	* @return Object 属性值 
	*/  
	  
	private static Object getFieldValueByName(String fieldName, Object o)   
	{      
	   try   
	   {      
	       String firstLetter = fieldName.substring(0, 1).toUpperCase();      
	       String getter = "get" + firstLetter + fieldName.substring(1);      
	       Method method = o.getClass().getMethod(getter, new Class[] {});      
	       Object value = method.invoke(o, new Object[] {});      
	       return value;      
	   } catch (Exception e)   
	   {      
	       System.out.println("属性不存在");      
	       return null;      
	   }      
	}  
	
	/**
	 * 根据查询对象obj，拼接查询条件
	 * @param url
	 * @param obj
	 * @return
	 */
	public static String generateUrlTemplate(String url,Object obj){
		StringBuffer urlBuffer = new StringBuffer("");
		String[] arr = getFiledName(obj);
		for (String string : arr) {
			Object value = getFieldValueByName(string, obj);
			if(value!=null){
				urlBuffer.append(string).append("=").append(value).append("&"); 
			}
		}
		if(urlBuffer.length()>0){
			return url+"?"+urlBuffer.toString();
		}
		return url;
	}

	public static String generateUrlTemplate(String url,Map<String, ?> uriVars){
		if(uriVars != null && !uriVars.isEmpty()){
			StringBuffer urlBuffer = new StringBuffer(url);
			String varsUrl = generateParams(null,uriVars);
			if(!varsUrl.isEmpty()){
				urlBuffer.append("?").append(varsUrl);
			}
			url = urlBuffer.toString();
			url = url.substring(0, url.length()-1);
		}
		return url;
	}
	
	private static String generateParams(String key,Map<String, ?> uriVars){
		if(key == null)
			key = "";
		StringBuffer urlBuffer = new StringBuffer("");
		Object value = null;
		String tempKey = null;
		for(String uriKey :uriVars.keySet()){
			value = uriVars.get(uriKey);
			if(value == null)
				break;
			
			if(key == null || key.isEmpty())
				tempKey = uriKey;
			else 
				tempKey = key + "."+uriKey;
			if(value.getClass().isArray()){
				
			}
			else if(value instanceof Map){
				urlBuffer.append(generateParams(tempKey,(Map<String,?>)value));
			}
			else
				urlBuffer.append(tempKey).append("=").append("{").append(tempKey).append("}").append("&");
		}
		return urlBuffer.toString();
	}
}
