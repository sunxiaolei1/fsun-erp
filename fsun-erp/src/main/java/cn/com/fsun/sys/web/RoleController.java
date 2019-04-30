package cn.com.fsun.sys.web;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.fsun.common.result.JsonUtil;
import cn.com.fsun.common.utils.PageInfo;
import cn.com.fsun.common.web.BaseController;
import cn.com.fsun.constants.CommonConstant;
import cn.com.fsun.sys.dto.RoleDto;
import cn.com.fsun.sys.service.LogService;
import cn.com.fsun.sys.service.RoleService;
import cn.com.fsun.sys.service.RoleUserService;
import cn.com.fsun.sys.service.UserService;


/*
 * @author lw
 */

@Controller
@RequestMapping("/sys/role")
public class RoleController extends BaseController {

	@Autowired
	private RoleService roleService;
	
	@Autowired
	private RoleUserService roleUserService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private LogService logService;
	
	private String message = null;


	/**
	 * @description 加载所有菜单节点
	 * @return ModelMap
	 * @return
	 * @update 2012-8-13 上午10:58:27
	 */
	@RequestMapping(value = "/list", method = { RequestMethod.GET,
			RequestMethod.POST })
	@ResponseBody
	public ModelMap list() {
		List<RoleDto> list = roleService.list();
		return JsonUtil.getObjectList(Boolean.TRUE, list, list.size());
	}

	/**
	 * @description 查询
	 * @return ModelMap
	 * @param roleDto
	 * @return
	 * @update 2013-3-11
	 */
	@RequestMapping(value = "/search", method = { RequestMethod.GET,
			RequestMethod.POST })
	@ResponseBody
	public ModelMap search(RoleDto roleDto) {
		PageInfo pageInfo = new PageInfo();
		if (null != roleDto) {
			int firstRecord = (roleDto.getPage()-1)*roleDto.getRows();
			pageInfo.setFirstRecord(firstRecord);
			pageInfo.setPageSize(roleDto.getRows());
			if (StringUtils.isNotEmpty(roleDto.getSort())) {
				pageInfo.setSortColumn(roleDto.getSort());
			}
			if (StringUtils.isNotEmpty(roleDto.getOrder())) {
				pageInfo.setSortType(roleDto.getOrder());
			}
		}
		List<RoleDto> roleDtos = roleService.search(userService.listRoleIdByUserId(super.getCurrentUserID()),roleDto, pageInfo);
		return JsonUtil.getObjectList(Boolean.TRUE, roleDtos,
				roleService.getSearchCount(roleDto, pageInfo));
	}

	/**
	 * @description 用于生成树
	 * @return List<TreeDto>
	 * @return
	 * @update 2013-3-11
	 */
	/*
	 * @RequestMapping(value = "/listTree",
	 * method={RequestMethod.GET,RequestMethod.POST})
	 * 
	 * @ResponseBody public List<TreeDto> listTree() { List<TreeDto> list =
	 * roleService.listTree(null); return list; }
	 */

	/**
	 * @description 增加或者更新
	 * @return ModelMap
	 * @param roleDto
	 * @param _parentId
	 * @return
	 * @update 2013-2-21
	 */
	@RequestMapping(value = "/save", method = { RequestMethod.GET,
			RequestMethod.POST })
	@ResponseBody
	public ModelMap save(RoleDto roleDto) {
		Integer loglevel = null;
		roleService.save(roleDto);
		if(StringUtils.isNotEmpty(roleDto.getId())){
			message = "角色: " + roleDto.getName()+ "更新成功";
			loglevel = CommonConstant.Log_Type_UPDATE;
		}else{
			message = "角色: " + roleDto.getName()+ "插入成功";
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
	@RequestMapping(value = "/load", method = { RequestMethod.GET,
			RequestMethod.POST })
	@ResponseBody
	public ModelMap load(@RequestParam("id") String id) {
		RoleDto roleDto = roleService.load(id);
		if (null != roleDto) {
			return JsonUtil.getObject(Boolean.TRUE, roleDto);
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
	@RequestMapping(value = "/delete", method = { RequestMethod.GET,
			RequestMethod.POST })
	@ResponseBody
	public ModelMap delete(@RequestParam("id") String id) {
		if(null!=id&&!"".equalsIgnoreCase(id)){
			String ids[] = id.split(",");
			//删除多条记录
			if(null!=ids && ids.length>0){
				for(int i=0;i<ids.length;i++){
					RoleDto roleDto = roleService.load(ids[i]);
					roleService.delete(ids[i]);
					message = "角色：" + roleDto.getName() + "删除成功";
					logService.addLog(message, CommonConstant.Log_Type_DEL, CommonConstant.Log_Leavel_INFO);
				}
			//删除单条记录
			}else{
				RoleDto roleDto = roleService.load(id);
				roleService.delete(id);
				message = "角色：" + roleDto.getName() + "删除成功";
				logService.addLog(message, CommonConstant.Log_Type_DEL, CommonConstant.Log_Leavel_INFO);
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
	@RequestMapping(value = "/manage", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String manage() {
		return "sys/role/manage";
	}

	/**
	 * @description 上移
	 * @return ModelMap
	 * @param role
	 * @update 2012-8-9 下午3:52:36
	 */
	@RequestMapping(value = "/upgrade", method = { RequestMethod.GET,
			RequestMethod.POST })
	@ResponseBody
	public ModelMap upgrade(@RequestParam("id") String id,
			@RequestParam("parentNodeId") String parentNodeId,
			@RequestParam("prevBrotherId") String prevBrotherId) {

		if (null != parentNodeId
				&& parentNodeId.toLowerCase().indexOf("xnode") >= 0) {
			parentNodeId = "0";
		}

		Boolean flag = roleService.exchange(id, prevBrotherId, parentNodeId);

		if (flag) {
			return JsonUtil.getResult(Boolean.TRUE);
		} else {
			return JsonUtil.getResult(Boolean.FALSE);
		}
	}

	/**
	 * @description 下移
	 * @return ModelMap
	 * @param role
	 * @update 2012-8-9 下午3:52:36
	 */
	@RequestMapping(value = "/degrade", method = { RequestMethod.GET,
			RequestMethod.POST })
	@ResponseBody
	public ModelMap degrade(@RequestParam("id") String id,
			@RequestParam("parentNodeId") String parentNodeId,
			@RequestParam("nextBrotherId") String nextBrotherId) {

		if (null != parentNodeId
				&& parentNodeId.toLowerCase().indexOf("xnode") >= 0) {
			parentNodeId = "0";
		}

		Boolean flag = roleService.exchange(id, nextBrotherId, parentNodeId);

		if (flag) {
			return JsonUtil.getResult(Boolean.TRUE);
		} else {
			return JsonUtil.getResult(Boolean.FALSE);
		}
	}

	/**
	 * @description 禁用
	 * @return ModelMap
	 * @param role
	 * @update 2012-8-9 下午3:52:36
	 */
	@RequestMapping(value = "/forbiddenRole", method = { RequestMethod.GET,
			RequestMethod.POST })
	@ResponseBody
	public ModelMap forbiddenRole(@RequestParam("id") String id) {

		Boolean flag = roleService.forbiddenRole(id);

		if (flag) {
			return JsonUtil.getResult(Boolean.TRUE);
		} else {
			return JsonUtil.getResult(Boolean.FALSE);
		}
	}

	/**
	 * @description 启用
	 * @return ModelMap
	 * @param role
	 * @update 2012-8-9 下午3:52:36
	 */
	@RequestMapping(value = "/startUpRole", method = { RequestMethod.GET,
			RequestMethod.POST })
	@ResponseBody
	public ModelMap startUpRole(@RequestParam("id") String id) {

		Boolean flag = roleService.startUpRole(id);

		if (flag) {
			return JsonUtil.getResult(Boolean.TRUE);
		} else {
			return JsonUtil.getResult(Boolean.FALSE);
		}
	}

	/**
	 * @description 根据角色找到他的权限集合
	 * @return ModelMap
	 * @param role
	 * @update 2012-8-9 下午3:52:36
	 */
	@RequestMapping(value = "/getOperateIdsByRoleId", method = {
			RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String getOperateIdsByRoleId(@RequestParam("roleId") String roleId) {
		return roleService.getPowerIdsByRoleId(roleId);
	}
	
	/**
	 * @description 根据角色找到他的菜单集合
	 * @return ModelMap
	 * @param role
	 * @update 2012-8-9 下午3:52:36
	 */
	@RequestMapping(value = "/getMenuIdsByRoleId", method = {
			RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String getMenuIdsByRoleId(@RequestParam("roleId") String roleId) {
		return roleService.getMenuIdsByRoleId(roleId);
	}

	/**
	 * @description 根据角色找到他的权限集合
	 * @return ModelMap
	 * @param role
	 * @update 2012-8-9 下午3:52:36
	 */
	@RequestMapping(value = "/savePowerAndMenu", method = { RequestMethod.GET,
			RequestMethod.POST })
	@ResponseBody
	public ModelMap savePowerAndMenu(@RequestParam("roleId") String roleId,
			@RequestParam("menuIds") String menuIds,
			@RequestParam("powerIds") String powerIds) {
		Boolean flag = roleService
				.savePowerAndMenu(roleId, menuIds, powerIds);

		if (flag) {
			return JsonUtil.getResult(Boolean.TRUE);
		} else {
			return JsonUtil.getResult(Boolean.FALSE);
		}
	}
	
	/**
	 * @description 添加用户
	 * @return ModelMap
	 * @return
	 * @update 2012-8-13 上午10:58:27
	 */
	@RequestMapping(value = "/addUser", method = { RequestMethod.GET,
			RequestMethod.POST })
	@ResponseBody
	public ModelMap addUser(@RequestParam("roleId") String roleId,@RequestParam("userIds") String userIds) {
		Boolean flag = roleService.addUser(roleId,userIds);
		if (flag) {
			return JsonUtil.getResult(Boolean.TRUE);
		} else {
			return JsonUtil.getResult(Boolean.FALSE);
		}
		
	}
	
	/**
	 * @description 移除用户
	 * @return ModelMap
	 * @return
	 * @update 2012-8-13 上午10:58:27
	 */
	@RequestMapping(value = "/removeUser", method = { RequestMethod.GET,
			RequestMethod.POST })
	@ResponseBody
	public ModelMap removeUser(@RequestParam("roleId") String roleId,@RequestParam("userIds") String userIds) {
		Boolean flag = roleService.removeUser(roleId,userIds);
		if (flag) {
			return JsonUtil.getResult(Boolean.TRUE);
		} else {
			return JsonUtil.getResult(Boolean.FALSE);
		}
	}

}
