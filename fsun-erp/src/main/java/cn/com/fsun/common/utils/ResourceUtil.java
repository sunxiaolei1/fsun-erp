package cn.com.fsun.common.utils;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;

import cn.com.fsun.security.MyUserDetails;


/**
 * 项目参数工具类
 * 
 */
public class ResourceUtil {

	/**
	 * @description 获取当前用户的UserDetails
	 * @return MyUserDetails
	 * @return
	 * @update 2013-4-16
	 */
	public static MyUserDetails getCurrentUser(){
		MyUserDetails userDetails = null;
		SecurityContext securityContext = SecurityContextHolder.getContext();
		Authentication auth = securityContext.getAuthentication();
		if(null!=auth && auth.getPrincipal() instanceof MyUserDetails){
			userDetails = (MyUserDetails)auth.getPrincipal();
		}
		return userDetails;
	}
	
	/**
	 * @description 获取用户ID
	 * @return String
	 * @return
	 * @update 2013-4-16
	 */
	public static String getCurrentUserId(){
		if(null==getCurrentUser()){
			return null;
		}
		return getCurrentUser().getId();
	}
	
	/**
	 * @description 获取用户真实名称
	 * @return String
	 * @return
	 * @update 2013-4-16
	 */
	public static String getCurrentUserRealName(){
		if(null==getCurrentUser()){
			return null;
		}
		return getCurrentUser().getDisplayName();
	}
	
	/**
	 * 获得请求路径
	 * 
	 * @param request
	 * @return
	 */
	public static String getRequestPath(HttpServletRequest request) {
		String requestPath = request.getRequestURI() + "?"
				+ request.getQueryString();
		if (requestPath.indexOf("&") > -1) {// 去掉其他参数
			requestPath = requestPath.substring(0, requestPath.indexOf("&"));
		}
		requestPath = requestPath
				.substring(request.getContextPath().length() + 1);// 去掉项目路径
		return requestPath;
	}

	public static String getSysPath() {
		String path = Thread.currentThread().getContextClassLoader()
				.getResource("").toString();
		String temp = path.replaceFirst("file:/", "").replaceFirst(
				"WEB-INF/classes/", "");
		String separator = System.getProperty("file.separator");
		String resultPath = temp.replaceAll("/", separator + separator)
				.replaceAll("%20", " ");
		return resultPath;
	}

	/**
	 * 获取项目根目录
	 * 
	 * @return
	 */
	public static String getPorjectPath() {
		String nowpath; // 当前tomcat的bin目录的路径 如
						// D:\java\software\apache-tomcat-6.0.14\bin
		String tempdir;
		nowpath = System.getProperty("user.dir");
		tempdir = nowpath.replace("bin", "webapps"); // 把bin 文件夹变到 webapps文件里面
		tempdir += "\\"; // 拼成D:\java\software\apache-tomcat-6.0.14\webapps\sz_pro
		return tempdir;
	}

	public static String getClassPath() {
		String path = Thread.currentThread().getContextClassLoader()
				.getResource("").toString();
		String temp = path.replaceFirst("file:/", "");
		String separator = System.getProperty("file.separator");
		String resultPath = temp.replaceAll("/", separator + separator);
		return resultPath;
	}

	public static String getSystempPath() {
		return System.getProperty("java.io.tmpdir");
	}

	public static String getSeparator() {
		return System.getProperty("file.separator");
	}

	public static String getParameter(String field) {
		HttpServletRequest request = ContextHolderUtils.getRequest();
		return request.getParameter(field);
	}

	public static void main(String[] args) {
		System.out.println(getPorjectPath());
		System.out.println(getSysPath());

	}
	
	
}
