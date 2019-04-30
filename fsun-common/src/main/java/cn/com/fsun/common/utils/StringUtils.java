package cn.com.fsun.common.utils;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
/**
 * 字符串工具类。
 * 
 * @author pqj
 * @version 2009-9-4
 */
public class StringUtils {

	private StringUtils() {
	}

	public static boolean isEmpty(String str) {
		return (str == null || "".equals(str)) ? true : false;
	}

	public static boolean isNotEmpty(String str) {
		return !isEmpty(str);
	}

	/**
	 * @author Felenwe Lee
	 * @param objs
	 *            数组
	 * @param splitStr
	 *            分隔符
	 * @return 结果字符串
	 */
	public static String arrayToString(Object[] objs, String splitStr) {
		StringBuffer result = new StringBuffer("");
		if (null != objs && objs.length > 0) {
			result.append(objs[0].toString());
			for (int i = 1; i < objs.length; i++) {
				result.append(splitStr).append(objs[i].toString());
			}
		}

		return result.toString();
	}
	
	/**
	 * @author 
	 * @param str 字符串
	 * @param splitStr 分隔符
	 * @return  数组
	 */
	public static String[] stringToArray(String str, String splitStr) {
		if(str == null || splitStr ==null || "".equals(splitStr)){
			return new String[]{};
		}
		return str.split(splitStr);
	}

	public static String getContentType(String type) {
		String ret = "";
		if ("doc".equals(type)) {
			ret = "application/msword";
		} else if ("xls".equals(type)) {
			ret = "application/vnd.ms-excel";
		} else if ("txt".equals(type)) {
			ret = "text/plain";
		} else if ("rar".equals(type)) {
			ret = "application/x-rar-compressed";
		} else if ("zip".equals(type)) {
			ret = "application/zip";
		}

		return ret;
	}
	
	/**
	 * 将字符串数组转换成长整型数组
	 * @param ids
	 * @return
	 */
	public static Long[] getIdsToLong(String[] ids){
		Long[] d = new Long[ids.length];
		for(int i=0;i<ids.length;i++){				
		    d[i] = Long.valueOf(ids[i]);		
		}
		return d;
	}
	
	/**
	 * ids 将字符串数组转换为Integer数组
	 * @param ids
	 * @return
	 */
	public static Integer[] getIdsToInteger(String[] ids){
		Integer[] d = new Integer[ids.length];
		for(int i=0;i<ids.length;i++){				
		    d[i] = Integer.parseInt(ids[i]);		
		}
		return d;
	}

	public static String getContextTypeByFileName(String file) {
		String ret = "";
		int index = file.lastIndexOf(".");
		if (index > 0) {
			String type = file.substring(index + 1);
			ret = getContentType(type);
		}
		return ret;
	}

	public static String urlEncoder(String text) {
		String ret = "";
		if (text != null) {
			try {
				ret = URLEncoder.encode(text, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		return ret;
	}

	/**
	 * 超过指定长度的字符串自动加上...
	 * 
	 * @param string
	 * @param length
	 *            指定长度
	 * @return
	 */
	public static String omitString(String string, int length) {
		StringBuffer sb = new StringBuffer();
		if (byteLength(string) > length) {
			int count = 0;
			for (int i = 0; i < string.length(); i++) {
				char temp = string.charAt(i);
				if (Integer.toHexString(temp).length() == 4) {
					count += 2;
				} else {
					count++;
				}
				if (count < length - 3) {
					sb.append(temp);
				}
				if (count == length - 3) {
					sb.append(temp);
					break;
				}
				if (count > length - 3) {
					sb.append(" ");
					break;
				}
			}
			sb.append("...");
		} else {
			sb.append(string);
		}
		return sb.toString();
	}

	private static int byteLength(String str) {
		int count = 0;
		for (int i = 0; i < str.length(); i++) {
			if (Integer.toHexString(str.charAt(i)).length() == 4)
				count += 2;
			else
				count++;
		}
		return count;
	}
	
	/**
	  * 判断文件是否为图片<br>
	  * <br>
	  * @param pInput 文件名<br>
	  * @param pImgeFlag 判断具体文件类型<br>
	  * @return 检查后的结果<br>
	  * @throws Exception
	  */
	public static boolean isPicture(String  pInput,
	                           String pImgeFlag) throws Exception{
	  // 文件名称为空的场合
	  if(StringUtils.isEmpty(pInput)){
	   // 返回不和合法
	   return false;
	  }
	  // 获得文件后缀名
	  String tmpName = pInput.substring(pInput.lastIndexOf(".") + 1,
	                              pInput.length());
	  // 声明图片后缀名数组
	  String imgeArray [][] = {
	    {"bmp", "0"}, {"dib", "1"}, {"gif", "2"},
	    {"jfif", "3"}, {"jpe", "4"}, {"jpeg", "5"},
	    {"jpg", "6"}, {"png", "7"} ,{"tif", "8"},
	    {"tiff", "9"}, {"ico", "10"}
	  };
	  // 遍历名称数组
	  for(int i = 0; i<imgeArray.length;i++){
	   // 判断单个类型文件的场合
	   if(! StringUtils.isEmpty(pImgeFlag)
	      && imgeArray [i][0].equals(tmpName.toLowerCase())
	   && imgeArray [i][1].equals(pImgeFlag)){
	    return true;
	   }
	   // 判断符合全部类型的场合
	   if(StringUtils.isEmpty(pImgeFlag)
	      && imgeArray [i][0].equals(tmpName.toLowerCase())){
	    return true;
	   }
	  }
	  return false;
	} 
	
	/**
	 * 从字符串中获取某个子串在第N次出现的索引
	 * @param n
	 * @param subString 
	 * @param string
	 * @return
	 */
	public static int getIndexToN(int n,String subString,String string){
		int count=0;
		for(int i=1;i<=n;i++){
			count=string.indexOf(subString,count+1);
		}
		return count;
	}
	
	/**
	 * 将数值逗号分隔的字符串转换成对数值单引号引起来并逗号分隔的字符串例如 "a,b" ->"'a','b'"
	 * @param n
	 * @param subString 
	 * @param string
	 * @return
	 */
	public static String getStringToString(String fromString){
		String newValue = "";
		String [] values = fromString.split(",");
		
		for (int i = 0; i < values.length; i++) {
			newValue = newValue + "'"+values[i]+"',";
		}
		if(newValue.length()>0){
			newValue = newValue.substring(0, newValue.length()-1);
		}
		return newValue;
	}
}