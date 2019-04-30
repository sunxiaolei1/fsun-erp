package cn.com.fsun.init;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import cn.com.fsun.bus.dao.CustomerDao;
import cn.com.fsun.bus.dao.ProductDao;
import cn.com.fsun.common.utils.PropertiesUtil;
import cn.com.fsun.constants.SettingsConstants;
import cn.com.fsun.sys.dao.SettingsDAO;
import cn.com.fsun.sys.domain.Settings;


/**
 * spring启动时加载设置信息
 * @author lee
 *
 */
public class SettingsServletContextListener implements ServletContextListener{

	private static int MAX_CUSTOMER_CODE = 0;
	private static int MAX_PRODUCT_CODE = 0;
	private static String REGISTER_KEY = null;
	
	private static String DELIVERY_CODE_FORMAT = "yyyyMMdd"; 
	
	public void contextInitialized(ServletContextEvent sce) {
		System.out.println("Settings is loading ........................");
		ServletContext servletContext = sce.getServletContext();
		PropertiesUtil propertiesUtil= new PropertiesUtil("localConfig.properties");
		Properties ps  = propertiesUtil.getProperties();
		try {
			servletContext.setAttribute("systemName", new String(ps.getProperty("systemName").getBytes("ISO-8859-1"),"UTF-8"));
			servletContext.setAttribute("titleName", new String(ps.getProperty("titleName").getBytes("ISO-8859-1"),"UTF-8"));
			servletContext.setAttribute("companyLtd", new String(ps.getProperty("companyLtd").getBytes("ISO-8859-1"),"UTF-8"));
			servletContext.setAttribute("companyTel", new String(ps.getProperty("companyTel").getBytes("ISO-8859-1"),"UTF-8"));				
			servletContext.setAttribute("companyFax", new String(ps.getProperty("companyFax").getBytes("ISO-8859-1"),"UTF-8"));				
			servletContext.setAttribute("companyName", new String(ps.getProperty("companyName").getBytes("ISO-8859-1"),"UTF-8"));				
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}	
		
		ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(servletContext);
		SettingsDAO settingsDAO = applicationContext.getBean(SettingsDAO.class);
		List<Settings> settingsList = settingsDAO.list();
		for(Settings settings:settingsList){
			if(SettingsConstants.REGISTER_KEY.equals(settings.getCode())){
				REGISTER_KEY = settings.getValue();
			}else if(SettingsConstants.DELIVERY_CODE_FORMAT_KEY.equals(settings.getCode())){
				if(SettingsConstants.DELIVERY_CODE_FORMAT_VALUE.equals(settings.getValue())){
					DELIVERY_CODE_FORMAT = "yyyyMM";
				}
			}
			servletContext.setAttribute(settings.getCode(), settings.getValue());
		}
				
		CustomerDao customerDao = applicationContext.getBean(CustomerDao.class);
		MAX_CUSTOMER_CODE = customerDao.getMaxNumber();
		//System.out.println("MAX_CUSTOMER_CODE=="+MAX_CUSTOMER_CODE);
		ProductDao productDao = applicationContext.getBean(ProductDao.class);
		MAX_PRODUCT_CODE = productDao.getMaxNumber();	
		//System.out.println("MAX_PRODUCT_CODE=="+MAX_PRODUCT_CODE);
		
		System.out.println("Settings loaded successfully !");
	}
	
	public static int getMaxCustomerNumber(){
		return ++MAX_CUSTOMER_CODE;
	}
	
	public static int getMaxProductNumber(){
		return ++MAX_PRODUCT_CODE;
	}
	
	public static String getRegisterKey(){
		return REGISTER_KEY;
	}
	
	public static void setRegisterKey(String key){
		REGISTER_KEY = key;
	}
	
	public void contextDestroyed(ServletContextEvent sce) {
		
	}

	public static String getDELIVERY_CODE_FORMAT() {
		return DELIVERY_CODE_FORMAT;
	}

}