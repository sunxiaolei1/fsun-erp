package cn.com.fsun.common.web;

import java.io.File;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;

import cn.com.fsun.common.utils.ResourceUtil;
import cn.com.fsun.constants.CommonConstant;
import cn.com.fsun.security.MyUserDetails;
import cn.com.fsun.sys.domain.User;





/**
 * 
 * <br>
 * <b>类描述:</b>
 * 
 * <pre>
 * 所有Controller的基类
 * </pre>
 * 
 * @see
 * @since
 */
@Controller
public class BaseController {

	protected static final String ERROR_MSG_KEY = "errorMsg";
	
	//@Autowired
	//SessionRegistry sessionRegistry;

	@InitBinder
	private void initBinder(WebDataBinder binder) {
		//BeanUtilsBean.getInstance().getConvertUtils().register(new SqlDateConverter(null), Date.class);
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		CustomDateEditor dateEditor = new CustomDateEditor(fmt, true);
		binder.registerCustomEditor(Date.class, dateEditor);
		binder.registerCustomEditor(Timestamp.class, dateEditor);
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(
				Boolean.TRUE);
		binder.registerCustomEditor(String.class, stringTrimmerEditor);
	}
	
//	@InitBinder
//	public void initBinder(WebDataBinder binder) {
//	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//	    dateFormat.setLenient(false);
//	    binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
//	}

	/**
	 * 获取保存在Session中的用户对象
	 * 
	 * @param request
	 * @return
	 */
	protected User getSessionUser(HttpServletRequest request) {
		return (User) request.getSession().getAttribute(
				CommonConstant.USER_CONTEXT);
	}

	/**
	 * 保存用户对象到Session中
	 * 
	 * @param request
	 * @param user
	 */
	protected void setSessionUser(HttpServletRequest request, User user) {
		request.getSession().setAttribute(CommonConstant.USER_CONTEXT, user);
	}

	/**
	 * 获取保存在Session中的对象
	 * 
	 * @param request
	 * @return
	 */
	public Object getSessionObject(HttpServletRequest request, String key) {
		return (Object) request.getSession().getAttribute(key);
	}

	/**
	 * 保存对象到Session中
	 * 
	 * @param request
	 * @param user
	 */
	public void setSessionObject(HttpServletRequest request, String key,
			Object value) {
		request.getSession().setAttribute(key, value);
	}

	/**
	 *  获取当前会话的用户ID
	 * @return
	 */
	public String getCurrentUserID(){
		return ResourceUtil.getCurrentUserId();
	}
	
	/**
	 *  获取当前会话的用户名称
	 * @return
	 */
	public String getCurrentUserRealName(){
		return ResourceUtil.getCurrentUserRealName();
	}
	
	/**
	 * 获取当前会话的用户信息
	 * @return
	 */
	public MyUserDetails getCurrentUser(){
		return ResourceUtil.getCurrentUser();
	}
	
	/**
	 * 获取基于应用程序的url绝对路径
	 * 
	 * @param request
	 * @param url
	 *            以"/"打头的URL地址
	 * @return 基于应用程序的url绝对路径
	 */
	public final String getAppbaseUrl(HttpServletRequest request, String url) {
		Assert.hasLength(url, "url不能为空");
		Assert.isTrue(url.startsWith("/"), "必须以/打头");
		return request.getContextPath() + url;
	}
	
    
	@ModelAttribute("numUsers")
	public int getNumberOfUsers() {
	   //return sessionRegistry.getAllPrincipals().size();
	   return new Integer(100);
	}
	
	protected String getRootPath() {
		try {
			String rootString = this.getClass().getResource("/").getFile();
			return new File(rootString).getParentFile().getParentFile()
					.getCanonicalPath();
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}
	}
}
