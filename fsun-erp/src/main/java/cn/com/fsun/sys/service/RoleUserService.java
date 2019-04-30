package cn.com.fsun.sys.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.fsun.common.service.BaseService;
import cn.com.fsun.common.utils.PageInfo;
import cn.com.fsun.sys.dao.RoleUserDao;
import cn.com.fsun.sys.domain.RoleUser;
import cn.com.fsun.sys.dto.RoleUserDto;

/**
 * @description service主要提供对对象的增删改查功能
 * @author lw
 */
@Service
public class RoleUserService extends BaseService{

	@Autowired
	private RoleUserDao roleUserDao;
	
	/**
	 * @description 显示列表（无查询条件）
	 * @return List<RoleUser>
	 * @update 2012-8-13 上午9:36:48
	 */
	public List<RoleUserDto> list() {

		List<RoleUser> roleUsers = roleUserDao.list();
		List<RoleUserDto> roleUserDtos = DomainstoDtos(roleUsers);
		return roleUserDtos;
	}
	
	
	/**
	 * @description 显示列表（有查询条件）
	 * @return List<RoleUser>
	 * @update 2012-8-13 上午9:36:48
	 */
	public List<RoleUserDto> search(RoleUserDto roleUserDto,PageInfo pageInfo){
		
		RoleUser roleUser = DtotoDomain(roleUserDto);
		List<RoleUser> roleUsers = roleUserDao.search(roleUser, pageInfo);
		List<RoleUserDto> roleUserDtos = DomainstoDtos(roleUsers);
		return roleUserDtos;
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
		List<RoleUser> roleUsers = roleUserDao.getChildren(pid);
		if(null!=roleUsers&&roleUsers.size()>0){
			for(RoleUser roleUser : roleUsers){
				if(null!=roleUser){
					TreeDto treeDto = DomaintoTree(roleUser);
					treeDto.setChildren(listTree(roleUser.getId()));
					treeDtos.add(treeDto);
				}
			}
		}
		return treeDtos;
	}*/

	/**
	 * @description 增加或者修改
	 * @return RoleUserDto
	 * @param roleUserDto
	 * @return
	 * @update 2013-2-21
	 */
	public RoleUserDto save(RoleUserDto roleUserDto){
		RoleUser roleUser = DtotoDomain(roleUserDto);
		roleUserDao.saveOrUpdate(roleUser);
		return DomaintoDto(roleUser);
	}
	
	/**
	 * @description 删除一个菜单节点
	 * @return void
	 * @param id
	 * @update 2012-8-13 上午9:37:49
	 */
	public void delete(String id){
		try{
			roleUserDao.delete(roleUserDao.load(id));
		}catch (Exception e) {
//			System.out.println(e.getMessage());
		}
	}
	
	/**
	 * @description 加载一个菜单节点
	 * @return RoleUser
	 * @param id
	 * @update 2012-8-13 上午9:38:10
	 */
	public RoleUserDto load(String id){
		return DomaintoDto(roleUserDao.load(id));
	}
	
	/**
	 * @description 根据父节点得到子集
	 * @return List<RoleUserDto>
	 * @param pid
	 * @return
	 * @update 2013-2-21
	 */
	/*public List<RoleUserDto> getChildren(String pid){
		List<RoleUserDto> roleUserDtos = new ArrayList<RoleUserDto>();
		String hql = "from RoleUser roleUser where roleUser.pid='"+pid+"'";
		List<RoleUser> roleUsers = roleUserDao.find(hql);
		if(null!=roleUsers&&roleUsers.size()>0){
			for(RoleUser roleUser : roleUsers){
				roleUserDtos.add(DomaintoDto(roleUser));
			}
		}
		return roleUserDtos;
	}*/
	
	/**
	 * @description 禁用
	 * @param roleUser
	 * @return RoleUser
	 * @update 2012-9-5
	 */
	public Boolean forbiddenRoleUser(String id){
		try {
			String hql = "update RoleUser roleUser set roleUser.state="+Boolean.FALSE+" where roleUser.id='"+id+"'";
			roleUserDao.excuteHQL(hql);
			return Boolean.TRUE;
		} catch (Exception e) {
			System.out.print(e.getMessage());
			return Boolean.FALSE;
		}
	}

	/**
	 * @description 启用
	 * @param roleUser
	 * @return RoleUser
	 * @update 2012-9-5
	 */
	public Boolean startUpRoleUser(String id){
		try {
			String hql = "update RoleUser roleUser set roleUser.state="+Boolean.TRUE+" where roleUser.id='"+id+"'";
			roleUserDao.excuteHQL(hql);
			return Boolean.TRUE;
		} catch (Exception e) {
			System.out.print(e.getMessage());
			return Boolean.FALSE;
		}
	}
	
	/**
	 * @description 交换节点
	 * @param roleUser
	 * @return RoleUser
	 * @update 2012-9-5
	 */
	/*public Boolean exchange(String id,String brotherId,String parentNodeId){
		RoleUser current = roleUserDao.load(id);
		RoleUser brother = roleUserDao.load(brotherId);
		
		try {
			if(null!=brother && null!=current){
				String hql_current = "update RoleUser roleUser set roleUser.sort='"+brother.getPriority()+"' where roleUser.id = '"+id+"'";
				roleUserDao.excuteHQL(hql_current);
				
				String hql_brother = "update RoleUser roleUser set roleUser.sort='"+current.getPriority()+"' where roleUser.id = '"+brotherId+"'";
				roleUserDao.excuteHQL(hql_brother);
				
				return Boolean.TRUE;
			}else{
				return Boolean.FALSE;
			}
		} catch (Exception e) {
			System.out.print(e.getMessage());
			return Boolean.FALSE;
		}
	}*/
	
	/**
	 * @description 获取查询结果数量
	 * @return int
	 * @param roleUserDto
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public int getSearchCount(RoleUserDto roleUserDto,PageInfo pageInfo){
		RoleUser roleUser = DtotoDomain(roleUserDto);
		List<RoleUser> roleUsers = roleUserDao.search(roleUser, pageInfo);
		if(null!=roleUsers && roleUsers.size()>0){
			return roleUsers.size();
		}else{
			return new Integer(0);
		}
	}
	
	
	/**
	 * @description Domian转Dto
	 * @return RoleUser
	 * @param roleUserDto
	 */
	public RoleUser DtotoDomain(RoleUserDto roleUserDto){
		if(null==roleUserDto){
			return null;
		}
		RoleUser roleUser = new RoleUser();
		roleUser.setId(roleUserDto.getId());
		roleUser.setRoleId(roleUserDto.getRoleId());
		roleUser.setUserId(roleUserDto.getUserId());
		return roleUser;
	}
	
	/**
	 * @description Dto转Domian
	 * @return RoleUserDto
	 * @param roleUser
	 */
	public RoleUserDto DomaintoDto(RoleUser roleUser){
		if(null==roleUser){
			return null;
		}
		RoleUserDto roleUserDto = new RoleUserDto();
		roleUserDto.setId(roleUser.getId());
		roleUserDto.setRoleId(roleUser.getRoleId());
		roleUserDto.setUserId(roleUser.getUserId());
		return roleUserDto;
	}
	
	/**
	 * @description Domian转Tree
	 * @return RoleUserDto
	 * @param roleUser
	 */
	/*public TreeDto DomaintoTree(RoleUser roleUser){
		if(null==roleUser){
			return null;
		}
		TreeDto treeDto = new TreeDto();
		treeDto.setId(roleUser.getId());
		treeDto.setText(roleUser.getName());
		treeDto.setIconCls(roleUser.getIconcls());
		TreeAttributeDto treeAttributeDto = new TreeAttributeDto();
		treeAttributeDto.setUrl(roleUser.getUrl());
		treeAttributeDto.set_parentId(roleUser.getPid());
		treeDto.setAttributes(treeAttributeDto);
		
		return treeDto;
	}*/
	
	/**
	 * @description domians转dtos
	 * @return List<RoleUserDto>
	 * @param roleUsers
	 * @return
	 */
	public List<RoleUserDto> DomainstoDtos(List<RoleUser> roleUsers){
		List<RoleUserDto> roleUserDtos = new ArrayList<RoleUserDto>();

		if (null != roleUsers && roleUsers.size() > 0) {
			for (RoleUser roleUser : roleUsers) {
				RoleUserDto roleUserDto = DomaintoDto(roleUser);
				if (null != roleUserDto) {
					roleUserDtos.add(roleUserDto);
				}
			}
		}
		return roleUserDtos;
	}
	
}
