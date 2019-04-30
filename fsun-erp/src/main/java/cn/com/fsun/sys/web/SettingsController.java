package cn.com.fsun.sys.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.fsun.common.web.BaseController;
import cn.com.fsun.sys.dto.SettingsDto;
import cn.com.fsun.sys.service.SettingsService;

/**
 * @author Felenwe Lee
 * @version create time：2012-11-27 下午7:08:05
 */
@Controller
@RequestMapping("/sys/settings")
public class SettingsController extends BaseController {
	
	private final String path = "/sys/settings/";
	
	@Autowired
	private SettingsService settingsService;

	@RequestMapping(value="/list.do",method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap list(){
		ModelMap mm = new ModelMap();
		mm.addAttribute("rows",settingsService.list());
		return mm;
	}
	
//	@RequestMapping(value="/search.do",method={RequestMethod.GET,RequestMethod.POST})
//	@ResponseBody
//	public ModelMap search(@ModelAttribute("settings") SettingsModel settingsModel){
//		return settingsService.search(settingsModel);
//	}
	

	
	
	@RequestMapping(value="/save.do",method={RequestMethod.GET,RequestMethod.POST})
	public void save(SettingsDto settings){
		settingsService.save(settings);
	}
//	
//	@RequestMapping(value="/delete.do",method={RequestMethod.GET,RequestMethod.POST})
//	public void delete(String id){
//		String[] ids = id.split(",");
//		settingsService.deleteByIds(ids);
//	}

	
	/**
	 * @description 显示列表
	 * @return ModelMap
	 * @param
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/manage", method={RequestMethod.GET,RequestMethod.POST})
	public String manage() {
		return "sys/settings/manage";
	}
}
