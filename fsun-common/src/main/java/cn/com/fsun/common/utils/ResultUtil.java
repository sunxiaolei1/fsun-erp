package cn.com.fsun.common.utils;

import java.util.ArrayList;
import java.util.List;

import org.springframework.ui.ModelMap;


/**
 * @author Felenwe Lee
 * @version create time：2012-12-28 上午10:05:00
 */

public class ResultUtil {

	public static ModelMap list(List list) {
		ModelMap modelMap = new ModelMap();
		if (null == list){
			modelMap.addAttribute("total", 0);
			modelMap.addAttribute("rows", new ArrayList<Object>());
		}
		else{
			modelMap.addAttribute("total", list.size());
			modelMap.addAttribute("rows", list);
		}
		return modelMap;
	}
	
	public static ModelMap load(List list) {
		ModelMap modelMap = new ModelMap();
		if (null == list){
			modelMap.addAttribute("rows", new ArrayList<Object>());
		}
		else{
			modelMap.addAttribute("rows", list);
		}
		return modelMap;
	}
	
	public static ModelMap searchNull(){
		return ResultUtil.search(new ArrayList<Object>(), 0);
	}

	public static ModelMap search(List list, int total) {
		ModelMap modelMap = new ModelMap();
		if (null == list){
			modelMap.addAttribute("total", 0);
			modelMap.addAttribute("rows", new ArrayList<Object>());
		}
		else{
			modelMap.addAttribute("total", total);
			modelMap.addAttribute("rows", list);
		}
		return modelMap;
	}
	
	public static ModelMap success(){
		return ResultUtil.success(null, null);
	}
	
//	public static ModelMap success(String msg){
//		return ResultUtil.success(msg, null);
//	}
	
	public static ModelMap success(Object object){
		return ResultUtil.success(null, object);
	}

	public static ModelMap success(String msg, Object object) {
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("success", Boolean.TRUE);
		if (null != msg)
			modelMap.addAttribute("msg", msg);
		modelMap.addAttribute("data", object);
		return modelMap;
	}

	public static ModelMap failure(){
		return ResultUtil.failure(null);
	}
	
	public static ModelMap failure(String msg) {
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("success", Boolean.FALSE);
		if (null != msg)
			modelMap.addAttribute("msg", msg);
		modelMap.addAttribute("rows", null);
		return modelMap;
	}
}
