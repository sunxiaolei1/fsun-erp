package cn.com.fsun.security;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import cn.com.fsun.common.utils.BrowserUtils;
import cn.com.fsun.common.utils.oConvertUtils;
import cn.com.fsun.constants.CommonConstant;
import cn.com.fsun.sys.dto.LogDto;
import cn.com.fsun.sys.service.LogService;
import cn.com.fsun.sys.service.MenuService;

/**
 * 处理管理登录日志
 *
 */
public class LoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler{
	
	@Autowired
	private LogService logService;
	
	@Autowired
	private MenuService menuService;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request,
			HttpServletResponse response, Authentication authentication) throws IOException,
			ServletException {
		
		MyUserDetails userDetails = (MyUserDetails)authentication.getPrincipal();
	
		//创建日志对象
		String logcontent = "用户："+userDetails.getUsername()+"登录成功";
		String broswer=BrowserUtils.checkBrowse(request);
		LogDto logDto = new LogDto();
		logDto.setLogContent(logcontent);
		logDto.setLogLevel(CommonConstant.Log_Leavel_INFO);
		logDto.setOperateType(CommonConstant.Log_Type_LOGIN);
		logDto.setNote(oConvertUtils.getIp());
		logDto.setBroswer(broswer);
		logDto.setOperateTime(new Date());
		logDto.setUserId(logService.getCurrentUserID());
		logService.save(logDto);//添加日志
				
		this.changeUrlForward(request);
		super.onAuthenticationSuccess(request, response, authentication);
	}

	/**
	 * 清除缓存路径
	 * @param request
	 */
	private void changeUrlForward(HttpServletRequest request){
		HttpSession session = request.getSession();
		Object forwardParam = session.getAttribute("SPRING_SECURITY_SAVED_REQUEST_KEY");
		if(forwardParam!=null){
			session.removeAttribute("SPRING_SECURITY_SAVED_REQUEST_KEY");
		}
	}
	
}

