package cn.com.fsun.sys.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.fsun.common.service.BaseService;
import cn.com.fsun.common.utils.PageInfo;
import cn.com.fsun.sys.dao.RoleDao;
import cn.com.fsun.sys.dao.RoleMenuDao;
import cn.com.fsun.sys.dao.RolePowerDao;
import cn.com.fsun.sys.dao.RoleUserDao;
import cn.com.fsun.sys.domain.Role;
import cn.com.fsun.sys.domain.RoleMenu;
import cn.com.fsun.sys.domain.RolePower;
import cn.com.fsun.sys.domain.RoleUser;
import cn.com.fsun.sys.dto.RoleDto;

/**
 * @description service主要提供对对象的增删改查功能
 * @author lw
 */
@Service
public class RoleService extends BaseService{

	@Autowired
	private RoleDao roleDao;

	@Autowired
	private RolePowerDao rolePowerDao;

	@Autowired
	private RoleMenuDao roleMenuDao;
	
	@Autowired
	private RoleUserDao roleUserDao;

	/**
	 * @description 显示列表（无查询条件）
	 * @return List<Role>
	 * @update 2012-8-13 上午9:36:48
	 */
	public List<RoleDto> list() {

		List<Role> roles = roleDao.list();
		List<RoleDto> roleDtos = DomainstoDtos(roles);
		return roleDtos;
	}

	/**
	 * 获取列表
	 * @param roleIds 当前用户的角色ids
	 * @param roleDto 查询条件
	 * @param pageInfo 分页条件
	 * @return
	 */
	public List<RoleDto> search(String roleIds, RoleDto roleDto, PageInfo pageInfo) {

		Role role = DtotoDomain(roleDto);
		
		role.setId(hasSuperRole(roleIds));		
		List<Role> roles = roleDao.search(role, pageInfo);
		List<RoleDto> roleDtos = DomainstoDtos(roles);
		return roleDtos;
	}
	
	private String hasSuperRole(String roleIds){
		Role superRole = roleDao.loadByCode("super");
		String[] ids = roleIds.split(",");
		for (int i = 0; i < ids.length; i++) {
			if(ids[i].equals(superRole.getId())){
				return superRole.getId();
			}
		}
		return "";
	}

	/**
	 * @description 用于显示树
	 * @return List<TreeDto>
	 * @param pid
	 * @return
	 * @update 2013-3-11
	 */
	/*
	 * public List<TreeDto> listTree(String pid){ List<TreeDto> treeDtos = new
	 * ArrayList<TreeDto>(); List<Role> roles = roleDao.getChildren(pid);
	 * if(null!=roles&&roles.size()>0){ for(Role role : roles){ if(null!=role){
	 * TreeDto treeDto = DomaintoTree(role);
	 * treeDto.setChildren(listTree(role.getId())); treeDtos.add(treeDto); } } }
	 * return treeDtos; }
	 */

	/**
	 * @description 增加或者修改
	 * @return RoleDto
	 * @param roleDto
	 * @return
	 * @update 2013-2-21
	 */
	public RoleDto save(RoleDto roleDto) {
		Role role = DtotoDomain(roleDto);
		if(StringUtils.isNotEmpty(role.getId())){
			role.setUpdateManId(super.getCurrentUserID());
			role.setUpdateTime(new Date());
		}else{
			role.setCreateTime(new Date());
			role.setCreateManId(super.getCurrentUserID());
		}
		roleDao.save(role);
		return DomaintoDto(role);
	}

	/**
	 * @description 删除一个菜单节点
	 * @return void
	 * @param id
	 * @update 2012-8-13 上午9:37:49
	 */
	public void delete(String id) {
		try {
			roleDao.delete(roleDao.load(id));
		} catch (Exception e) {
			// System.out.println(e.getMessage());
		}
	}

	/**
	 * @description 加载一个菜单节点
	 * @return Role
	 * @param id
	 * @update 2012-8-13 上午9:38:10
	 */
	public RoleDto load(String id) {
		return DomaintoDto(roleDao.load(id));
	}

	/**
	 * @description 根据父节点得到子集
	 * @return List<RoleDto>
	 * @param pid
	 * @return
	 * @update 2013-2-21
	 */
	/*
	 * public List<RoleDto> getChildren(String pid){ List<RoleDto> roleDtos =
	 * new ArrayList<RoleDto>(); String hql =
	 * "from Role role where role.pid='"+pid+"'"; List<Role> roles =
	 * roleDao.find(hql); if(null!=roles&&roles.size()>0){ for(Role role :
	 * roles){ roleDtos.add(DomaintoDto(role)); } } return roleDtos; }
	 */

	/**
	 * @description 禁用
	 * @param role
	 * @return Role
	 * @update 2012-9-5
	 */
	public Boolean forbiddenRole(String id) {
		try {
			String hql = "update Role role set role.state=" + Boolean.FALSE
					+ " where role.id='" + id + "'";
			roleDao.excuteHQL(hql);
			return Boolean.TRUE;
		} catch (Exception e) {
			System.out.print(e.getMessage());
			return Boolean.FALSE;
		}
	}

	/**
	 * @description 启用
	 * @param role
	 * @return Role
	 * @update 2012-9-5
	 */
	public Boolean startUpRole(String id) {
		try {
			String hql = "update Role role set role.state=" + Boolean.TRUE
					+ " where role.id='" + id + "'";
			roleDao.excuteHQL(hql);
			return Boolean.TRUE;
		} catch (Exception e) {
			System.out.print(e.getMessage());
			return Boolean.FALSE;
		}
	}

	/**
	 * @description 交换节点
	 * @param role
	 * @return Role
	 * @update 2012-9-5
	 */
	public Boolean exchange(String id, String brotherId, String parentNodeId) {
		Role current = roleDao.load(id);
		Role brother = roleDao.load(brotherId);

		try {
			if (null != brother && null != current) {
				String hql_current = "update Role role set role.sort='"
						+ brother.getPriority() + "' where role.id = '" + id
						+ "'";
				roleDao.excuteHQL(hql_current);

				String hql_brother = "update Role role set role.sort='"
						+ current.getPriority() + "' where role.id = '"
						+ brotherId + "'";
				roleDao.excuteHQL(hql_brother);

				return Boolean.TRUE;
			} else {
				return Boolean.FALSE;
			}
		} catch (Exception e) {
			System.out.print(e.getMessage());
			return Boolean.FALSE;
		}
	}

	/**
	 * @description 根据角色找到他的权限集合
	 * @return String
	 * @param roleId
	 * @return
	 * @update 2013-3-26
	 */
	public String getPowerIdsByRoleId(String roleId) {
		List<RolePower> rolePowers = rolePowerDao
				.getPowerIdsByRoleId(roleId);
		String powerIds = "";
		if (null != rolePowers && rolePowers.size() > 0) {
			for (RolePower rolePower : rolePowers) {
				powerIds += rolePower.getPowerId() + ",";
			}
			powerIds = StringUtils.substringBeforeLast(powerIds, ",");
		}
		return powerIds;
	}
	
	/**
	 * @description 根据角色找到他的权限集合
	 * @return String
	 * @param roleId
	 * @return
	 * @update 2013-3-26
	 */
	public String getMenuIdsByRoleId(String roleId) {
		List<RoleMenu> roleMenus = roleMenuDao
				.getMenuIdsByRoleId(roleId);
		String menuIds = "";
		if (null != roleMenus && roleMenus.size() > 0) {
			for (RoleMenu roleMenu : roleMenus) {
				menuIds += roleMenu.getMenuId() + ",";
			}
			menuIds = StringUtils.substringBeforeLast(menuIds, ",");
		}
		return menuIds;
	}
	

	/**
	 * @description 保存菜单和权限
	 * @return Boolean
	 * @param roleId
	 * @param menuIds_str
	 * @param powerIds_str
	 * @return
	 * @update 2013-3-26
	 */
	public Boolean savePowerAndMenu(String roleId, String menuIds_str,
			String powerIds_str) {
		try {
			this.saveMenu(roleId, menuIds_str);
			this.savePower(roleId, powerIds_str);
			return Boolean.TRUE;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Boolean.FALSE;
	}

	/**
	 * @description 保存菜单
	 * @return Boolean
	 * @param roleId
	 * @param menuIds_str
	 * @throws Exception
	 * @update 2012-9-27
	 */
	public Boolean saveMenu(String roleId, String menuIds_str) {
		try {
			if (StringUtils.isNotEmpty(roleId)
					&& StringUtils.isNotEmpty(menuIds_str)) {
				delMenu(roleId);
				String[] menuIds = menuIds_str.split(",");
				for (String menuId : menuIds) {
					RoleMenu roleMenu = new RoleMenu();
					roleMenu.setRoleId(roleId);
					roleMenu.setMenuId(menuId);
					roleMenuDao.create(roleMenu);
				}
				return Boolean.TRUE;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Boolean.FALSE;
	}

	/**
	 * @description 保存权限
	 * @return Boolean
	 * @param roleId
	 * @param menuIds_str
	 * @update 2012-9-27
	 */
	public Boolean savePower(String roleId, String powerIds_str) {
		try {
			if (StringUtils.isNotEmpty(roleId)
					&& StringUtils.isNotEmpty(powerIds_str)) {
				delPower(roleId);
				String[] powerIds = powerIds_str.split(",");
				for (String powerId : powerIds) {
					RolePower rolePower = new RolePower();
					rolePower.setRoleId(roleId);
					rolePower.setPowerId(powerId);
					rolePowerDao.create(rolePower);
				}
				return Boolean.TRUE;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Boolean.FALSE;
	}

	/**
	 * @description 新增之前得先删除原有的菜单
	 * @return void
	 * @param roleId
	 * @throws Exception
	 * @update 2012-10-23
	 */
	public void delMenu(String roleId) throws Exception {
		String hql = "delete from RoleMenu where roleId='" + roleId + "'";
		rolePowerDao.excuteHQL(hql);
	}

	/**
	 * @description 新增之前得先删除原有的权限
	 * @return void
	 * @param roleId
	 * @throws Exception
	 * @update 2012-10-23
	 */
	public void delPower(String roleId) throws Exception {
		String hql = "delete from RolePower where roleId='" + roleId + "'";
		rolePowerDao.excuteHQL(hql);
	}

	/**
	 * @description 获取查询结果数量
	 * @return int
	 * @param roleDto
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public int getSearchCount(RoleDto roleDto, PageInfo pageInfo) {
		Role role = DtotoDomain(roleDto);
		List<Role> roles = roleDao.getSearchCount(role, pageInfo);
		if (null != roles && roles.size() > 0) {
			return roles.size();
		} else {
			return new Integer(0);
		}
	}

	/**
	 * @description Domian转Dto
	 * @return Role
	 * @param roleDto
	 */
	public Role DtotoDomain(RoleDto roleDto) {
		if (null == roleDto) {
			return null;
		}
		Role role = new Role();
		role.setId(roleDto.getId());
		role.setCode(roleDto.getCode());
		role.setName(roleDto.getName());
		role.setDescription(roleDto.getDescription());
		role.setEnabled(roleDto.getEnabled());
		role.setPriority(roleDto.getPriority());
		role.setCreateManId(roleDto.getCreateManId());
		role.setCreateTime(roleDto.getCreateTime());
		role.setUpdateManId(roleDto.getUpdateManId());
		role.setUpdateTime(roleDto.getUpdateTime());
		return role;
	}

	/**
	 * @description Dto转Domian
	 * @return RoleDto
	 * @param role
	 */
	public static RoleDto DomaintoDto(Role role) {
		if (null == role) {
			return null;
		}
		RoleDto roleDto = new RoleDto();
		roleDto.setId(role.getId());
		roleDto.setCode(role.getCode());
		roleDto.setName(role.getName());
		roleDto.setDescription(role.getDescription());
		roleDto.setEnabled(role.getEnabled());
		roleDto.setPriority(role.getPriority());
		roleDto.setCreateManId(role.getCreateManId());
		roleDto.setCreateTime(role.getCreateTime());
		roleDto.setUpdateManId(role.getUpdateManId());
		roleDto.setUpdateTime(role.getUpdateTime());
		return roleDto;
	}

	/**
	 * @description Domian转Tree
	 * @return RoleDto
	 * @param role
	 */
	/*
	 * public TreeDto DomaintoTree(Role role){ if(null==role){ return null; }
	 * TreeDto treeDto = new TreeDto(); treeDto.setId(role.getId());
	 * treeDto.setText(role.getName()); treeDto.setIconCls(role.getIconcls());
	 * TreeAttributeDto treeAttributeDto = new TreeAttributeDto();
	 * treeAttributeDto.setUrl(role.getUrl());
	 * treeAttributeDto.set_parentId(role.getPid());
	 * treeDto.setAttributes(treeAttributeDto);
	 * 
	 * return treeDto; }
	 */

	/**
	 * @description domians转dtos
	 * @return List<RoleDto>
	 * @param roles
	 * @return
	 */
	public List<RoleDto> DomainstoDtos(List<Role> roles) {
		List<RoleDto> roleDtos = new ArrayList<RoleDto>();

		if (null != roles && roles.size() > 0) {
			for (Role role : roles) {
				RoleDto roleDto = DomaintoDto(role);
				if (null != roleDto) {
					roleDtos.add(roleDto);
				}
			}
		}
		return roleDtos;
	}
	
	/**
	 * @description 增加角色下的用户
	 * @return Boolean
	 * @param roleId
	 * @param userIds_str
	 * @return
	 * @update 2013-6-21
	 */
	public Boolean addUser(String roleId,String userIds_str){
		try {
			if(StringUtils.isNotEmpty(roleId)&&StringUtils.isNotEmpty(userIds_str)){
				String[] userIds = userIds_str.split(",");
				for(String userId:userIds){
					RoleUser roleUser = new RoleUser();
					roleUser.setUserId(userId);
					roleUser.setRoleId(roleId);
					roleUserDao.create(roleUser);
				}
			}
			return Boolean.TRUE;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Boolean.FALSE;
	}
	
	/**
	 * @description 删除角色下的用户
	 * @return Boolean
	 * @param roleId
	 * @param userIds_str
	 * @return
	 * @update 2013-6-21
	 */
	public Boolean removeUser(String roleId,String userIds_str){
		try {
			if(StringUtils.isNotEmpty(roleId)&&StringUtils.isNotEmpty(userIds_str)){
				String[] userIds = userIds_str.split(",");
				for(String userId:userIds){
					RoleUser roleUser = new RoleUser();
					roleUser.setUserId(userId);
					roleUser.setRoleId(roleId);
					roleUserDao.remove(roleUser);
				}
			}
			return Boolean.TRUE;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Boolean.FALSE;
	}

}
