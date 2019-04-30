package cn.com.fsun.sys.web;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.fsun.common.dto.TreeDto;
import cn.com.fsun.common.result.JsonUtil;
import cn.com.fsun.common.utils.PageInfo;
import cn.com.fsun.common.web.BaseController;
import cn.com.fsun.constants.CommonConstant;
import cn.com.fsun.sys.dto.IconDto;
import cn.com.fsun.sys.dto.MenuDto;
import cn.com.fsun.sys.service.LogService;
import cn.com.fsun.sys.service.MenuService;

@Controller
@RequestMapping("/sys/menu")
public class MenuController extends BaseController {

	@Autowired
	private MenuService menuService;
	
	@Autowired
	private LogService logService;
	
	private String message = null;

	/**
	 * @description 加载所有菜单节点
	 * @return ModelMap
	 * @return
	 * @update 2012-8-13 上午10:58:27
	 */
	@RequestMapping(value = "/list", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap list() {
		List<MenuDto> list = menuService.list();
		return JsonUtil.getObjectList(Boolean.TRUE, list, list.size());
	}
	
	/**
	 * @description 查询
	 * @return ModelMap
	 * @param menuDto
	 * @return
	 * @update 2013-3-11
	 */
	@RequestMapping(value = "/search", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap search(MenuDto menuDto){
		PageInfo pageInfo = new PageInfo();
		List<MenuDto> menuDtos = menuService.search(menuDto, pageInfo);
		return JsonUtil.getObjectList(Boolean.TRUE, menuDtos, menuService.getSearchCount(menuDto, pageInfo));
	}
	
	
	/**
	 * @description 用于生成树
	 * @return List<TreeDto>
	 * @return
	 * @update 2013-3-11
	 */
	@RequestMapping(value = "/listTree", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<TreeDto> listTree() {
		List<TreeDto> list = menuService.listTree(null);
		return list;
	}

	/**
	 * @description 用于生成树
	 * @return List<TreeDto>
	 * @return
	 * @update 2013-3-11
	 */
	@RequestMapping(value = "/listMyTree", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<TreeDto> listMyTree() {
		List<TreeDto> list = menuService.listMyTree();
		return list;
	}
	/**
	 * @description 增加或者更新
	 * @return ModelMap
	 * @param menuDto
	 * @param _parentId
	 * @return
	 * @update 2013-2-21
	 */
	@RequestMapping(value = "/save", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap save(MenuDto menuDto,
			@RequestParam("_parentId") String _parentId) {
		Integer loglevel = null;
		menuDto.set_parentId(_parentId);
		menuService.save(menuDto);
		if(StringUtils.isNotEmpty(menuDto.getId())){
			message = "菜单: " + menuDto.getName()+ "更新成功";
			loglevel = CommonConstant.Log_Type_UPDATE;
		}else{
			message = "菜单: " + menuDto.getName()+ "插入成功";
			loglevel = CommonConstant.Log_Type_INSERT;
		}
		logService.addLog(message, loglevel, CommonConstant.Log_Leavel_INFO);
		return JsonUtil.getResult(Boolean.TRUE);
	}

	/**
	 * @description 加载一个菜单节点
	 * @return ModelMap
	 * @return
	 * @update 2012-8-13 上午10:58:27
	 */
	@RequestMapping(value = "/load", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap load(@RequestParam("id") String id) {
		MenuDto menuDto = menuService.load(id);
		if (null != menuDto) {
			return JsonUtil.getObject(Boolean.TRUE, menuDto);
		} else {
			return JsonUtil.getResult(Boolean.FALSE);
		}
	}

	/**
	 * @description 删除一条记录
	 * @return ModelMap
	 * @param id
	 * @update 2012-8-9 下午3:53:10
	 */
	@RequestMapping(value = "/delete", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap delete(@RequestParam("id") String id) {
		MenuDto menuDto = menuService.load(id);
		menuService.delete(id);
		message = "菜单：" + menuDto.getName() + "删除成功";
		logService.addLog(message, CommonConstant.Log_Type_DEL, CommonConstant.Log_Leavel_INFO);
		List<MenuDto> menuDtos = menuService.getChildren(id);
		if (null != menuDtos && menuDtos.size() > 0) {
			for (MenuDto menuDto1 : menuDtos) {
				if (null != menuDto1) {
					menuService.delete(menuDto1.getId());
					message = "菜单：" + menuDto1.getName() + "删除成功";
					logService.addLog(message, CommonConstant.Log_Type_DEL, CommonConstant.Log_Leavel_INFO);
				}
			}
		}

		return JsonUtil.getResult(Boolean.TRUE);
	}

	/**
	 * @description 显示列表
	 * @return ModelMap
	 * @param
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/manage", method={RequestMethod.GET,RequestMethod.POST})
	public String manage() {
		return "sys/menu/manage";
	}

	
	/**
	 * @description 上移
	 * @return ModelMap
	 * @param menu
	 * @update 2012-8-9 下午3:52:36
	 */
	@RequestMapping(value = "/upgrade", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap upgrade(@RequestParam("id") String id,
			@RequestParam("prevBrotherId") String prevBrotherId) {
		Boolean flag = menuService.exchange(id,prevBrotherId);
		if(flag){
			return JsonUtil.getResult(Boolean.TRUE);
		}else{
			return JsonUtil.getResult(Boolean.FALSE);
		}
	}

	/**
	 * @description 下移
	 * @return ModelMap
	 * @param menu
	 * @update 2012-8-9 下午3:52:36
	 */
	@RequestMapping(value = "/degrade", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap degrade(@RequestParam("id") String id,
			@RequestParam("nextBrotherId") String nextBrotherId) {
		Boolean flag = menuService.exchange(id,nextBrotherId);
		if(flag){
			return JsonUtil.getResult(Boolean.TRUE);
		}else{
			return JsonUtil.getResult(Boolean.FALSE);
		}
	}

	/**
	 * @description 禁用
	 * @return ModelMap
	 * @param menu
	 * @update 2012-8-9 下午3:52:36
	 */
	@RequestMapping(value = "/forbiddenMenu", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap forbiddenMenu(@RequestParam("id") String id) {

		Boolean flag = menuService.forbiddenMenu(id);

		if (flag) {
			return JsonUtil.getResult(Boolean.TRUE);
		} else {
			return JsonUtil.getResult(Boolean.FALSE);
		}
	}

	/**
	 * @description 启用
	 * @return ModelMap
	 * @param menu
	 * @update 2012-8-9 下午3:52:36
	 */
	@RequestMapping(value = "/startUpMenu", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap startUpMenu(@RequestParam("id") String id) {

		Boolean flag = menuService.startUpMenu(id);

		if (flag) {
			return JsonUtil.getResult(Boolean.TRUE);
		} else {
			return JsonUtil.getResult(Boolean.FALSE);
		}
	}
	
	
	@RequestMapping(value = "/getIcons", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Object getIcons(HttpServletRequest request,HttpServletResponse httpResponse) throws Exception{
	  String root = request.getSession().getServletContext().getRealPath("");
	  String path = root+"/images/icons";
	  File file=new File(path);
	  String test[];
	  test=file.list();
	  ArrayList<IconDto> imgPath = new ArrayList<IconDto>();
	  for(String pInput : test){
		  if(cn.com.fsun.common.utils.StringUtils.isPicture(pInput,"")){
			  IconDto iconDto = new IconDto();
			  iconDto.setName(pInput);
			  iconDto.setPath("images/icons/" + pInput);
			  imgPath.add(iconDto);
		  }
	  }
	  
	  return imgPath;
	  
	  
	}
}
