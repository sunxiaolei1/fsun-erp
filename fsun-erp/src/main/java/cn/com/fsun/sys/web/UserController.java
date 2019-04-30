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

import cn.com.fsun.common.result.JsonResult;
import cn.com.fsun.common.result.JsonUtil;
import cn.com.fsun.common.utils.PageInfo;
import cn.com.fsun.common.web.BaseController;
import cn.com.fsun.constants.CommonConstant;
import cn.com.fsun.sys.dto.UserDto;
import cn.com.fsun.sys.service.LogService;
import cn.com.fsun.sys.service.UserService;


/*
 * @author lw
 */

@Controller
@RequestMapping("/sys/user")
public class UserController extends BaseController {

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
	@RequestMapping(value = "/list", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap list() {
		List<UserDto> list = userService.list();
		return JsonUtil.getObjectList(Boolean.TRUE, list, list.size());
	}
	
	/**
	 * @description 查询
	 * @return ModelMap
	 * @param userDto
	 * @return
	 * @update 2013-3-11
	 */
	@RequestMapping(value = "/search", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap search(UserDto userDto){
		PageInfo pageInfo = new PageInfo();
		if(null!=userDto){
			if(null!=userDto.getRows()&& null!=userDto.getPage()){
				int firstRecord = (userDto.getPage()-1)*userDto.getRows();
				pageInfo.setFirstRecord(firstRecord);
				pageInfo.setPageSize(userDto.getRows());
			}
			if(StringUtils.isNotEmpty(userDto.getSort())){
				pageInfo.setSortColumn(userDto.getSort());
			}
			if(StringUtils.isNotEmpty(userDto.getOrder())){
				pageInfo.setSortType(userDto.getOrder());
			}
		}
		List<UserDto> userDtos = userService.search(userDto, pageInfo);
		return JsonUtil.getObjectList(Boolean.TRUE, userDtos, userService.getSearchCount(userDto, pageInfo));
	}
	
	
	/**
	 * @description 用于生成树
	 * @return List<TreeDto>
	 * @return
	 * @update 2013-3-11
	 */
	/*@RequestMapping(value = "/listTree", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<TreeDto> listTree() {
		List<TreeDto> list = userService.listTree(null);
		return list;
	}*/
	
	

	/**
	 * @description 增加或者更新
	 * @return ModelMap
	 * @param userDto
	 * @param _parentId
	 * @return
	 * @update 2013-2-21
	 */
	@RequestMapping(value = "/save", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap save(UserDto userDto) {
		Integer loglevel = null;
		userService.save(userDto);
		if(StringUtils.isNotEmpty(userDto.getId())){
			message = "用户: " + userDto.getUsername()+ "更新成功";
			loglevel = CommonConstant.Log_Type_UPDATE;
		}else{
			message = "用户: " + userDto.getUsername()+ "插入成功";
			loglevel = CommonConstant.Log_Type_INSERT;
		}
		logService.addLog(message, loglevel, CommonConstant.Log_Leavel_INFO);
		return JsonUtil.getResult(Boolean.TRUE);
	}

	
	
	/**
	 * @description 主页修改密码
	 * @return ModelMap
	 * @param userDto
	 * @param _parentId
	 * @return
	 * @update 2013-2-21
	 */
	@RequestMapping(value = "/changePwd", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap changePwd(@RequestParam("password") String password,
			@RequestParam("newPassword") String newPassword) {
		
		Boolean flag = userService.changePwd(super.getCurrentUserID(), password, newPassword);
		return JsonUtil.getResult(flag);
	}
	
	
	/**
	 * @description 密码初始化
	 * @return ModelMap
	 * @param userDto
	 * @update 2012-8-9 下午3:52:36
	 */
	@RequestMapping(value = "/pwdReset", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap pwdInit(@RequestParam("id") String id) {
		UserDto userDto = userService.load(id);
		if(null!=userDto){
			userDto = userService.pwdReset(userDto);
		}
		if(null!=userDto){
			return JsonUtil.getObject(Boolean.TRUE, userDto);
		}else{
			return JsonUtil.getResult(Boolean.FALSE);
		}
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
		UserDto userDto = userService.load(id);
		if (null != userDto) {
			return JsonUtil.getObject(Boolean.TRUE, userDto);
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
		if(null!=id&&!"".equalsIgnoreCase(id)){
			String ids[] = id.split(",");
			//删除多条记录
			if(null!=ids && ids.length>0){
				for(int i=0;i<ids.length;i++){
					UserDto userDto = userService.load(ids[i]);
					if("super".equalsIgnoreCase(userDto.getUsername())){
						message = "超级管理员不能被操作！";
						return JsonResult.getResult(Boolean.FALSE, message);
					}
					userService.delete(ids[i]);
					message = "用户：" + userDto.getUsername() + "删除成功";
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
		return "sys/user/manage";
	}

	/**
	 * @description 上移
	 * @return ModelMap
	 * @param user
	 * @update 2012-8-9 下午3:52:36
	 */
	@RequestMapping(value = "/upgrade", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap upgrade(@RequestParam("id") String id,
			@RequestParam("parentNodeId") String parentNodeId,
			@RequestParam("prevBrotherId") String prevBrotherId) {

		if (null != parentNodeId
				&& parentNodeId.toLowerCase().indexOf("xnode") >= 0) {
			parentNodeId = "0";
		}

		Boolean flag = userService.exchange(id, prevBrotherId, parentNodeId);

		if (flag) {
			return JsonUtil.getResult(Boolean.TRUE);
		} else {
			return JsonUtil.getResult(Boolean.FALSE);
		}
	}

	/**
	 * @description 下移
	 * @return ModelMap
	 * @param user
	 * @update 2012-8-9 下午3:52:36
	 */
	@RequestMapping(value = "/degrade", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap degrade(@RequestParam("id") String id,
			@RequestParam("parentNodeId") String parentNodeId,
			@RequestParam("nextBrotherId") String nextBrotherId) {

		if (null != parentNodeId
				&& parentNodeId.toLowerCase().indexOf("xnode") >= 0) {
			parentNodeId = "0";
		}

		Boolean flag = userService.exchange(id, nextBrotherId, parentNodeId);

		if (flag) {
			return JsonUtil.getResult(Boolean.TRUE);
		} else {
			return JsonUtil.getResult(Boolean.FALSE);
		}
	}
	
	/**
	 * @description 禁用
	 * @return ModelMap
	 * @param user
	 * @update 2012-8-9 下午3:52:36
	 */
	@RequestMapping(value = "/forbiddenUser", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap forbiddenUser(@RequestParam("id") String id) {

		Boolean flag = userService.forbiddenUser(id);

		if (flag) {
			return JsonUtil.getResult(Boolean.TRUE);
		} else {
			return JsonUtil.getResult(Boolean.FALSE);
		}
	}

	/**
	 * @description 启用
	 * @return ModelMap
	 * @param user
	 * @update 2012-8-9 下午3:52:36
	 */
	@RequestMapping(value = "/startUpUser", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap startUpUser(@RequestParam("id") String id) {

		Boolean flag = userService.startUpUser(id);

		if (flag) {
			return JsonUtil.getResult(Boolean.TRUE);
		} else {
			return JsonUtil.getResult(Boolean.FALSE);
		}
	}
	
	
	/**
	 * @description 根据用户找到他的角色集合
	 * @return ModelMap
	 * @param role
	 * @update 2012-8-9 下午3:52:36
	 */
	@RequestMapping(value = "/listRoleIdByUserId", method = {
			RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String listRoleIdByUserId(@RequestParam("userId") String userId) {
		return userService.listRoleIdByUserId(userId);
	}
	
	
	
	
	@RequestMapping(value = "/saveRole", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap saveRole(@RequestParam("userId") String userId,@RequestParam("roleIds") String roleIds) {

		Boolean flag = userService.saveRole(userId, roleIds);

		if (flag) {
			return JsonUtil.getResult(Boolean.TRUE);
		} else {
			return JsonUtil.getResult(Boolean.FALSE);
		}
	}
	
	/**
	 * @description 查找相应角色下面的用户列表
	 * @return ModelMap
	 * @param roleId
	 * @return
	 * @update 2013-6-21
	 */
	@RequestMapping(value = "/getUsersByRoleID", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap getUsersByRoleID(@RequestParam("roleId") String roleId,@RequestParam("flag") Boolean flag) {

		List<UserDto> list = userService.getUsersByRoleID(roleId,flag);
		return JsonUtil.getObjectList(Boolean.TRUE, list, list.size());
	}

}
