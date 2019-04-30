package cn.com.fsun.init;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.web.context.support.WebApplicationContextUtils;

import cn.com.fsun.bus.dto.StoreDto;
import cn.com.fsun.bus.service.itf.StoreService;

/**
 * 仓库初始化
 * app启动时加载
 * @author lee
 *
 */
public class StoreServletContextListener implements ServletContextListener {

	public void contextInitialized(ServletContextEvent sce) {
		ServletContext servletContext = sce.getServletContext();
		StoreService storeService = (StoreService)WebApplicationContextUtils.getWebApplicationContext(servletContext).getBean("storeServiceImpl");
		List<StoreDto> storeDtos = storeService.listEnabled();
		Map<Integer, String> storeMap = new HashMap<Integer, String>();
		for(StoreDto storeDto : storeDtos)
			storeMap.put(storeDto.getId(), storeDto.getName());
		servletContext.setAttribute("stores", storeMap);
	}

	public void contextDestroyed(ServletContextEvent sce) {

	}

}
