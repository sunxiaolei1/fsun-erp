package cn.com.fsun.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import cn.com.fsun.common.utils.ResourceUtil;
import cn.com.fsun.constants.CommonConstant;
import cn.com.fsun.security.MyUserDetails;
import cn.com.fsun.sys.domain.User;


public class SessionTimeoutInterceptor implements HandlerInterceptor {

	// 直接配置不拦截的资源，在代码里面来排除
	public String[] excludeUrls;

	public String[] getExcludeUrls() {
		return excludeUrls;
	}

	public void setExcludeUrls(String[] excludeUrls) {
		this.excludeUrls = excludeUrls;
	}

	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object obj, Exception e)
			throws Exception {
	}

	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object obj, ModelAndView model)
			throws Exception {
	}

	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object obj) throws Exception {
		String requestUrl = request.getRequestURI().replace(
				request.getContextPath(), "");
		if (excludeUrls!=null && excludeUrls.length >= 1) {
			for (String url : excludeUrls) {
				if (requestUrl.contains(url)) {
					return true;
				}
			}
		}
		
		MyUserDetails user = ResourceUtil.getCurrentUser();
		if (user == null) {
			String requestType = request.getHeader("X-Requested-With");
			if (requestType!=null && requestType.equalsIgnoreCase("XMLHttpRequest")) {  
				response.setStatus(911);  
				response.setHeader("sessionstatus", "timeout");
				return false;
			}
			else{
				response.sendRedirect("index.jsp"); 
			}
			return false; 
		}
		
		return true;

	}
}
