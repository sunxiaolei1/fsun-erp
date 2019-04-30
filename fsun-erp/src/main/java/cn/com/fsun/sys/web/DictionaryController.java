package cn.com.fsun.sys.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.fsun.common.web.BaseController;
import cn.com.fsun.sys.dto.DictionaryDto;
import cn.com.fsun.sys.service.DictionaryService;
import cn.com.fsun.sys.service.LogService;

@Controller
@RequestMapping("/sys/dictionary")
public class DictionaryController extends BaseController{

	@Autowired
	private DictionaryService dictionaryService;
	
	@Autowired
	private LogService logService;
	
	private String message = null;
	
	
	/**
	 * @description 加载所有菜单节点
	 * @return ModelMap
	 * @return
	 * @update 2012-8-13 上午10:58:27
	 */
	@RequestMapping(value = "/getGroupList", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<DictionaryDto> getGroupList(DictionaryDto dictionaryDto) {
		List<DictionaryDto> list = dictionaryService.getGroupList(dictionaryDto);
		return list;
	}
}
