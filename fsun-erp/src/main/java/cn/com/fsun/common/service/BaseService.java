package cn.com.fsun.common.service;

import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import cn.com.fsun.common.utils.ResourceUtil;
import cn.com.fsun.sys.dao.UserDao;
import cn.com.fsun.sys.domain.User;


/**
 * @description 提供service公用的一些方法给基本
 * @version 1.0
 * @update 2012-8-10 下午1:46:06
 */

public class BaseService{
	
	@Autowired
	private UserDao userDao;

	public User getCurrentUser(){
		String userId = ResourceUtil.getCurrentUserId();
		return userDao.load(userId);
	}

	public String getCurrentUserID(){
		return ResourceUtil.getCurrentUserId();
	}
	
	public String getCurrentUserRealName(){
		return ResourceUtil.getCurrentUserRealName();
	}
	
	/**
	 * 设置格式为小于4位的按四位计算，否则直接获取
	 * @param number
	 * @param maxNumber
	 * @return
	 */
	public String formatFormIntToString(int number,int maxNumber) {
		String numbers = "";
		int value = maxNumber/number;
		if(value>1000){
			numbers = "000" + number;
		}else if(value>=100){
			numbers = "00" + number;
		}else if(value>=10){
			numbers = "0" + number;
		}else if(value>=1){
			numbers = "" + number;
		}else if(value==0){
			numbers = "" + number;
		}
		return numbers;
	}

	@Autowired
	private ServletContext servletContext;
	
	public Map<Integer, String> getStoreMap(){
		return (Map<Integer, String>) servletContext.getAttribute("stores");
	}
}
