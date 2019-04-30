package cn.com.fsun.filter;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import cn.com.fsun.common.utils.DateUtil;
import cn.com.fsun.common.utils.EncryptionDecryption;
import cn.com.fsun.init.SettingsServletContextListener;



public class MyUsernamePasswordAuthenticationFilter extends UsernamePasswordAuthenticationFilter {

	private static final String SPRING_SECURITY_FORM_CHECKCODE_KEY = "j_checkcode";
	
	private static final Boolean isTest = false;

	/**
	 * 用户的username,password,checkcode验证
	 */
	public Authentication attemptAuthentication(HttpServletRequest request,
			HttpServletResponse response) throws AuthenticationException {

		//String request_check = obtainCheckcode(request);
		//String session_check = (String) request.getSession(true).getAttribute(
		//		"CUR_RANDIMAGE");	
		String registerKey = null;
		try {	
			registerKey = SettingsServletContextListener.getRegisterKey();
	    	EncryptionDecryption des = new EncryptionDecryption("tourhb");
	    	registerKey = des.decrypt(registerKey);
		} catch (Exception e) {
			throw new AuthenticationServiceException("系统无法使用,请联系管理员！");
		}
		if(registerKey!=null && !"".equals(registerKey)){
			Date currTime = new Date();					    
			Date startTime = DateUtil.parse(registerKey.split(",")[0], "yyyy-MM-dd HH:mm:ss");
			Date endTime = DateUtil.parse(registerKey.split(",")[1], "yyyy-MM-dd HH:mm:ss");
			if(currTime.getTime()> endTime.getTime()){
				throw new AuthenticationServiceException("试用期到期！");
			}
			if(currTime.getTime()<startTime.getTime()){
				throw new AuthenticationServiceException("系统无法使用,请联系管理员！");
			}
			
			// 判断验证码是否正确
			if (isTest || obtainCheckcode(request)
					.equalsIgnoreCase(
							(String) request.getSession(true).getAttribute(
									"CUR_RANDIMAGE")))
				return super.attemptAuthentication(request, response);
			else {
				throw new AuthenticationServiceException("验证码输入错误，请重新输入!");
			}
			
		}else{
			throw new AuthenticationServiceException("用户未注册成功,请注册或联系管理员！");
		}
		
		
	}

	/**
	 * @description 登入表单提交，通过request获取
	 * @return String
	 * @param request
	 * @update 2012-9-28
	 */
	protected String obtainCheckcode(HttpServletRequest request) {
		return request.getParameter(SPRING_SECURITY_FORM_CHECKCODE_KEY);
	}
}
