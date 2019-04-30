package cn.com.fsun.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.security.web.util.AntUrlPathMatcher;
import org.springframework.security.web.util.UrlMatcher;

import cn.com.fsun.sys.dto.MenuDto;
import cn.com.fsun.sys.dto.PowerDto;
import cn.com.fsun.sys.service.MenuService;
import cn.com.fsun.sys.service.PowerService;


/**
 * 最核心的地方，就是提供某个资源对应的权限定义，即getAttributes方法返回的结果。 此类在初始化时，应该取到所有资源及其对应角色的定义。
 * (注意：这块现在做的只是针对menu的权限控制，权限集合里存的是菜单地址跟权限集合的map，所有只对菜单有用，假如有功能操作的话得加上)
 */
public class MyInvocationSecurityMetadataSourceService implements
		FilterInvocationSecurityMetadataSource {

	private MenuService menuService;
	
	private PowerService powerService;

	private UrlMatcher urlMatcher = new AntUrlPathMatcher();

	private static Map<String, Collection<ConfigAttribute>> resourceMap = new HashMap<String, Collection<ConfigAttribute>>();

	public MyInvocationSecurityMetadataSourceService(MenuService menuService,PowerService powerService){
		this.menuService = menuService;
		this.powerService = powerService;
		this.loadResourceDefine();
	}


	/**
	 * @description 得到资源集合
	 * @return void
	 * @update 2012-9-28
	 */
	private void loadResourceDefine() {
		// 得到菜单集合
		List<MenuDto> menuDtos = menuService.list();
		resourceMap = new HashMap<String, Collection<ConfigAttribute>>();
		if(null!=menuDtos&&menuDtos.size()>0){
			for (MenuDto menuDto : menuDtos) {
				Collection<ConfigAttribute> atts = new ArrayList<ConfigAttribute>();
				if(null!=menuDto && StringUtils.isNotEmpty(menuDto.getCode())){
					atts.add(new SecurityConfig(menuDto.getCode()));
					resourceMap.put(menuDto.getUrl(), atts);
				}
			}
		}
		List<PowerDto> powerDtos = powerService.list();
		if(null!=powerDtos && powerDtos.size()>0){
			for (PowerDto powerDto : powerDtos) {
				Collection<ConfigAttribute> atts = new ArrayList<ConfigAttribute>();
				if(null!=powerDto && StringUtils.isNotEmpty(powerDto.getCode())){
					atts.add(new SecurityConfig(powerDto.getCode()));
					resourceMap.put(powerDto.getUrl(), atts);
				}
			}
		}
	}

	/**
	 * 得到所有权限集合 遍历所有的url得到权限集合
	 */
	public Collection<ConfigAttribute> getAllConfigAttributes() {
		Collection<ConfigAttribute> atts = new ArrayList<ConfigAttribute>();
		Iterator<String> ite = resourceMap.keySet().iterator();
		while (ite.hasNext()) {
			String resURL = ite.next();

			Collection<ConfigAttribute> attributes = resourceMap.get(resURL);
			atts.addAll(attributes);
		}
		return atts;
	}

	/**
	 * 根据URL，找到其所有的权限集合
	 */
	public Collection<ConfigAttribute> getAttributes(Object object)
			throws IllegalArgumentException {

		
		// object 是一个URL，被用户请求的url。
		FilterInvocation filterInvocation  = (FilterInvocation) object;
		String url = filterInvocation.getRequestUrl();
		
		if((url.startsWith("/view/bus/")||url.startsWith("/view/sys/"))
				&& (url.endsWith("/manage")||url.endsWith("/manage.jsp"))){
			return new ArrayList<ConfigAttribute>();
		}
		
		int firstQuestionMarkIndex = url.indexOf("?");
		if (firstQuestionMarkIndex != -1) {
			url = url.substring(0, firstQuestionMarkIndex);
		}

		if((url.startsWith("/bus/")||url.startsWith("/sys/"))){
			if(url.endsWith("/manage")){
				//模块的权限控制
				return this.getPower(url);
			}else{
				//按钮的权限控制
				HttpServletRequest request = filterInvocation.getHttpRequest();
				//String method = request.getMethod();
				//if("POST".equals(method)){
					//System.out.println("url=="+url+",method=="+method);
					if(url.endsWith("/save")){
						String id = request.getParameter("id");
						if(id==null || "".equals(id)){							
							url += "toAdd";
						}else{
							url += "toUpdate";
						}
						return this.getPower(url);
					}else if(url.endsWith("/delete")||url.endsWith("/pwdReset")){
						return this.getPower(url);
					}
					
				//}
			}
			
		}
		
		// FilterInvocationSecurityMetadataSource 中的getAttributes(Object
		// object)方法返回null的话，AccessDecisionManager就不会起作用了
		return null;
	}
	
	private Collection<ConfigAttribute> getPower(String url){
		Iterator<String> ite = resourceMap.keySet().iterator();
		while (ite.hasNext()) {
			String tempUrl = ite.next();
			if (null != tempUrl) {
				String resURL = tempUrl;
				if (!tempUrl.startsWith("/")){
					resURL = "/" + tempUrl;
				}
				if (urlMatcher.pathMatchesUrl(url, resURL)) {
					//System.out.println("url=="+url+",power=="+resourceMap.get(tempUrl));
					return resourceMap.get(tempUrl);
				}
			}
		}
		return new ArrayList<ConfigAttribute>();
	}

	public boolean supports(Class<?> arg0) {

		return true;
	}

	public MenuService getMenuService() {
		return menuService;
	}

	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}
	
	public PowerService getPowerService() {
		return powerService;
	}

	public void setPowerService(PowerService powerService) {
		this.powerService = powerService;
	}

}