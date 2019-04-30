package cn.com.fsun.sys.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.stereotype.Service;

import cn.com.fsun.common.service.BaseService;
import cn.com.fsun.common.utils.PageInfo;
import cn.com.fsun.sys.dao.MenuDao;
import cn.com.fsun.sys.dao.PowerDao;
import cn.com.fsun.sys.dao.RoleDao;
import cn.com.fsun.sys.dao.RoleUserDao;
import cn.com.fsun.sys.dao.UserDao;
import cn.com.fsun.sys.domain.Menu;
import cn.com.fsun.sys.domain.Power;
import cn.com.fsun.sys.domain.RoleUser;
import cn.com.fsun.sys.domain.User;
import cn.com.fsun.sys.dto.RoleDto;
import cn.com.fsun.sys.dto.UserDto;




/**
 * @description service主要提供对对象的增删改查功能
 * @author lw
 */
@Service
public class UserService extends BaseService{

	@Autowired
	private UserDao userDao;
	
	@Autowired
	private RoleDao roleDao;
	
	@Autowired
	private MenuDao menuDao;
	
	@Autowired
	private PowerDao powerDao;
	
	@Autowired
	private RoleUserDao roleUserDao;
	
	private Md5PasswordEncoder md5PasswordEncoder = new Md5PasswordEncoder();
	
	/**
	 * @description 显示列表（无查询条件）
	 * @return List<User>
	 * @update 2012-8-13 上午9:36:48
	 */
	public List<UserDto> list() {

		List<User> users = userDao.list();
		List<UserDto> userDtos = DomainstoDtos(users);
		return userDtos;
	}
	
	
	/**
	 * @description 显示列表（有查询条件）
	 * @return List<User>
	 * @update 2012-8-13 上午9:36:48
	 */
	public List<UserDto> search(UserDto userDto,PageInfo pageInfo){
		
		User user = DtotoDomain(userDto);
		User currUser = super.getCurrentUser();
		if(currUser!=null && currUser.getUsername()!=null &&  currUser.getUsername().equals("super")){
			user.setId(currUser.getId());
		}
		List<User> users = userDao.search(user, pageInfo);
		List<UserDto> userDtos = DomainstoDtos(users);
		return userDtos;
	}
	
	/**
	 * @description 用于显示树
	 * @return List<TreeDto>
	 * @param pid
	 * @return
	 * @update 2013-3-11
	 */
	/*public List<TreeDto> listTree(String pid){
		List<TreeDto> treeDtos = new ArrayList<TreeDto>();
		List<User> users = userDao.getChildren(pid);
		if(null!=users&&users.size()>0){
			for(User user : users){
				if(null!=user){
					TreeDto treeDto = DomaintoTree(user);
					treeDto.setChildren(listTree(user.getId()));
					treeDtos.add(treeDto);
				}
			}
		}
		return treeDtos;
	}*/

	/**
	 * @description 增加或者修改
	 * @return UserDto
	 * @param userDto
	 * @return
	 * @update 2013-2-21
	 */ 
	public UserDto save(UserDto userDto){
		User user = DtotoDomain(userDto);
		if(StringUtils.isNotEmpty(user.getId())){
			user.setUpdateManId(super.getCurrentUserID());
			user.setUpdateTime(new Date());
		}else{
			user.setCreateTime(new Date());
			user.setCreateManId(super.getCurrentUserID());
			user.setPassword(md5PasswordEncoder.encodePassword(
					user.getPassword(), user.getUsername()));
		}
		userDao.save(user);
		return DomaintoDto(user);
		
	}
	
	
	/**
	 * 修改密码
	 * 
	 * @param id
	 * @param password
	 * @param newPassword
	 * @return
	 */
	public Boolean changePwd(String id, String password,
			String newPassword) {
		
		User user = userDao.load(id);
		Boolean flag = false;
		if (user != null) {
			password = md5PasswordEncoder.encodePassword(password, user.getUsername());
			//判断旧密码是否准确，准确的话进行保存操作
			if (password.equals(user.getPassword())) {
				newPassword = md5PasswordEncoder.encodePassword(newPassword,
						user.getUsername());
				user.setPassword(newPassword);
				userDao.save(user);
				flag = true;
			} else {
				flag = false;
			}
		} else {
			flag = false;
		}
		return flag;
	}
	
	
	/**
	 * @description 密码初始化
	 * @return User
	 * @param user
	 * @update 2012-8-15
	 */
	public UserDto pwdReset(UserDto userDto){
		User user = DtotoDomain(userDto);
		if(StringUtils.isNotEmpty(user.getId())){
			user.setPassword(md5PasswordEncoder.encodePassword(	"123456", user.getUsername()));
		}
		userDao.save(user);
		return DomaintoDto(user);
	}
	
	
	/**
	 * @description 删除一个菜单节点
	 * @return void
	 * @param id
	 * @update 2012-8-13 上午9:37:49
	 */
	public void delete(String id){
		try{
			userDao.delete(userDao.load(id));
		}catch (Exception e) {
//			System.out.println(e.getMessage());
		}
	}
	
	/**
	 * @description 加载一个菜单节点
	 * @return User
	 * @param id
	 * @update 2012-8-13 上午9:38:10
	 */
	public UserDto load(String id){
		return DomaintoDto(userDao.load(id));
	}
	
	/**
	 * @description 根据父节点得到子集
	 * @return List<UserDto>
	 * @param pid
	 * @return
	 * @update 2013-2-21
	 */
	/*public List<UserDto> getChildren(String pid){
		List<UserDto> userDtos = new ArrayList<UserDto>();
		String hql = "from User user where user.pid='"+pid+"'";
		List<User> users = userDao.find(hql);
		if(null!=users&&users.size()>0){
			for(User user : users){
				userDtos.add(DomaintoDto(user));
			}
		}
		return userDtos;
	}*/
	
	/**
	 * @description 根据角色找到他的权限集合
	 * @return String
	 * @param roleId
	 * @return
	 * @update 2013-3-26
	 */
	public String listRoleIdByUserId(String userId) {
		List<RoleUser> roleUsers = roleUserDao.listRoleIdByUserId(userId);
		String roleIds = "";
		if (null != roleUsers && roleUsers.size() > 0) {
			for (RoleUser roleUser : roleUsers) {
				roleIds += roleUser.getRoleId() + ",";
			}
			roleIds = StringUtils.substringBeforeLast(roleIds, ",");
		}
		return roleIds;
	}
	
	
	
	
	public Boolean saveRole(String userId,String roleIds_str){
		try {
			if(StringUtils.isNotEmpty(userId)&&StringUtils.isNotEmpty(roleIds_str)){
				String[] roleIds = roleIds_str.split(",");
				for(String roleId:roleIds){
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
	 * @description 根据用户帐号查找用户对象
	 * @return UserDto
	 * @param username
	 * @update 2012-9-28
	 */
	public UserDto loadUserByUsername(String username){
		User user = userDao.loadUserByUsername(username);
		if(null==user){
			return null;
		}
		UserDto userDto = DomaintoDto(user);
		String hql = "from RoleUser roleUser where roleUser.userId='"+user.getId()+"'";
		List<RoleUser> roleUsers = roleUserDao.find(hql);
		Set<RoleDto> roleDtos = new HashSet<RoleDto>();
		if(null!=roleUsers && roleUsers.size()>0){
			for(RoleUser roleUser:roleUsers){
				if(null!=roleUser&&StringUtils.isNotEmpty(roleUser.getRoleId())){
					String roleId = roleUser.getRoleId();
					RoleDto roleDto = new RoleDto();
					//设置menuDtos
					String hql_menu_temp = "select roleMenu.menuId from RoleMenu roleMenu where roleMenu.roleId='"+roleId+"'";
					String hql_menu = "from Menu menu where menu.id in("+hql_menu_temp+")";
					List<Menu> menus = menuDao.find(hql_menu);
					roleDto.setMenuDtos(new HashSet(MenuService.DomainstoDtos(menus)));
					
					//设置powerDtos
					String hql_power_temp = "select rolePower.powerId from RolePower rolePower where rolePower.roleId='"+roleId+"'";
					String hql_power = "from Power power where power.id in("+hql_power_temp+")";
					List<Power> powers = powerDao.find(hql_power);
					roleDto.setPowerDtos(new HashSet(PowerService.DomainstoDtos(powers)));
					
					roleDtos.add(roleDto);
				}
			}
		}
		userDto.setRoleDtos(roleDtos);
		return userDto;
	}
	
	
	/**
	 * @description 禁用
	 * @param user
	 * @return User
	 * @update 2012-9-5
	 */
	public Boolean forbiddenUser(String id){
		try {
			String hql = "update User user set user.state="+Boolean.FALSE+" where user.id='"+id+"'";
			userDao.excuteHQL(hql);
			return Boolean.TRUE;
		} catch (Exception e) {
			System.out.print(e.getMessage());
			return Boolean.FALSE;
		}
	}

	/**
	 * @description 启用
	 * @param user
	 * @return User
	 * @update 2012-9-5
	 */
	public Boolean startUpUser(String id){
		try {
			String hql = "update User user set user.state="+Boolean.TRUE+" where user.id='"+id+"'";
			userDao.excuteHQL(hql);
			return Boolean.TRUE;
		} catch (Exception e) {
			System.out.print(e.getMessage());
			return Boolean.FALSE;
		}
	}
	
	/**
	 * @description 交换节点
	 * @param user
	 * @return User
	 * @update 2012-9-5
	 */
	public Boolean exchange(String id,String brotherId,String parentNodeId){
		User current = userDao.load(id);
		User brother = userDao.load(brotherId);
		
		try {
			if(null!=brother && null!=current){
				String hql_current = "update User user set user.sort='"+brother.getPriority()+"' where user.id = '"+id+"'";
				userDao.excuteHQL(hql_current);
				
				String hql_brother = "update User user set user.sort='"+current.getPriority()+"' where user.id = '"+brotherId+"'";
				userDao.excuteHQL(hql_brother);
				
				return Boolean.TRUE;
			}else{
				return Boolean.FALSE;
			}
		} catch (Exception e) {
			System.out.print(e.getMessage());
			return Boolean.FALSE;
		}
	}
	
	/**
	 * @description 获取查询结果数量
	 * @return int
	 * @param userDto
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public int getSearchCount(UserDto userDto,PageInfo pageInfo){
		User user = DtotoDomain(userDto);
		List<User> users = userDao.getSearchCount(user, pageInfo);
		if(null!=users && users.size()>0){
			return users.size();
		}else{
			return new Integer(0);
		}
	}
	
	
	/**
	 * @description Domian转Dto
	 * @return User
	 * @param userDto
	 */
	public User DtotoDomain(UserDto userDto){
		if(null==userDto){
			return null;
		}
		User user = new User();
		user.setId(userDto.getId());
		user.setCode(userDto.getCode());
		user.setUsername(userDto.getUsername());
		user.setPassword(userDto.getPassword());
		user.setRealname(userDto.getRealname());
		user.setEmail(userDto.getEmail());
		user.setTelphone(userDto.getTelphone());
		user.setDescription(userDto.getDescription());
		user.setIssys(userDto.getIssys());
		user.setEnabled(userDto.getEnabled());
		user.setPriority(userDto.getPriority());
		user.setCreateManId(userDto.getCreateManId());
		user.setCreateTime(userDto.getCreateTime());
		user.setUpdateManId(userDto.getUpdateManId());
		user.setUpdateTime(userDto.getUpdateTime());
		
		return user;
	}
	
	/**
	 * @description Dto转Domian
	 * @return UserDto
	 * @param user
	 */
	public UserDto DomaintoDto(User user){
		if(null==user){
			return null;
		}
		UserDto userDto = new UserDto();
		userDto.setId(user.getId());
		userDto.setCode(user.getCode());
		userDto.setUsername(user.getUsername());
		userDto.setPassword(user.getPassword());
		userDto.setRealname(user.getRealname());
		userDto.setEmail(user.getEmail());
		userDto.setTelphone(user.getTelphone());
		userDto.setDescription(user.getDescription());
		userDto.setIssys(user.getIssys());
		userDto.setEnabled(user.getEnabled());
		userDto.setPriority(user.getPriority());
		userDto.setCreateManId(user.getCreateManId());
		userDto.setCreateTime(user.getCreateTime());
		userDto.setUpdateManId(user.getUpdateManId());
		userDto.setUpdateTime(user.getUpdateTime());
		
		String rolesName = getRoleNamesDtoByUserId(user.getId());
		userDto.setRoleNames(rolesName);
		
		return userDto;
	}
	
	public String getRoleNamesDtoByUserId(String userId){
		String roleIds = "select roleUser.roleId from RoleUser as roleUser where roleUser.userId = '"+userId+"'";
		String hql = "select role.name from Role as role where role.id in("+roleIds+")";
		List<String> rolesName = userDao.find(hql);
		StringBuffer roleName = new StringBuffer();;
		for(int i =0;i<rolesName.size();i++){
			roleName.append(rolesName.get(i)).append(",");
		}
		int length = roleName.length();
		if(length > 0){
			return roleName.substring(0,length-1);
		}
		return "";
	}
	
	/**
	 * @description Domian转Tree
	 * @return UserDto
	 * @param user
	 */
	/*public TreeDto DomaintoTree(User user){
		if(null==user){
			return null;
		}
		TreeDto treeDto = new TreeDto();
		treeDto.setId(user.getId());
		treeDto.setText(user.getName());
		treeDto.setIconCls(user.getIconcls());
		TreeAttributeDto treeAttributeDto = new TreeAttributeDto();
		treeAttributeDto.setUrl(user.getUrl());
		treeAttributeDto.set_parentId(user.getPid());
		treeDto.setAttributes(treeAttributeDto);
		
		return treeDto;
	}*/
	
	/**
	 * @description domians转dtos
	 * @return List<UserDto>
	 * @param users
	 * @return
	 */
	public List<UserDto> DomainstoDtos(List<User> users){
		List<UserDto> userDtos = new ArrayList<UserDto>();

		if (null != users && users.size() > 0) {
			for (User user : users) {
				UserDto userDto = DomaintoDto(user);
				if (null != userDto) {
					userDtos.add(userDto);
				}
			}
		}
		return userDtos;
	}
	
	
	public List<UserDto> getUsersByRoleID(String roleId,Boolean flag){
		ArrayList<UserDto> userDtos = new ArrayList<UserDto>();
		String hql = "select user from RoleUser as roleUser , User as user where roleUser.userId = user.id and roleUser.roleId = '"+roleId+"'";
		if(!flag){
			String hql_temp = "select user.id from RoleUser as roleUser , User as user where roleUser.userId = user.id and roleUser.roleId = '"+roleId+"'";
			hql = "select user from User as user where user.id not in("+hql_temp+") ";
		}
		List<User> users = userDao.find(hql);
		return DomainstoDtos(users);
	}
	
}
