package cn.com.fsun.sys.dao;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Property;
import org.springframework.stereotype.Repository;

import cn.com.fsun.common.dao.BaseDao;
import cn.com.fsun.common.utils.PageInfo;
import cn.com.fsun.sys.domain.RoleMenu;

/*
 * @author lw
 */

@Repository
public class RoleMenuDao extends BaseDao<RoleMenu> {

	/**
	 * @description 根据父亲节点查找子集
	 * @return List<RoleMenu>
	 * @param roleMenu
	 * @update 2012-9-4
	 */
	public List<RoleMenu> getChildren(String pid){
		Criteria criteria = this.getSession().createCriteria(RoleMenu.class);
		if(StringUtils.isNotEmpty(pid)){
			criteria.add(Property.forName("pid").eq(pid));
		}else{
			criteria.add(Property.forName("pid").isNull());
		}
		return criteria.list();
	}
	
	/**
	 * @description 组装查询条件
	 * @return DetachedCriteria
	 * @param admin
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public DetachedCriteria getSearchCondition(RoleMenu roleMenu,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(RoleMenu.class);
		/*
		if(null!=roleMenu){
			//查询条件
			if(null!=roleMenu.getName() && !"".equals(roleMenu.getName())){
				detachedCriteria.add(Property.forName("name").like(
						roleMenu.getName(),MatchMode.ANYWHERE));	
			}
			if(null != roleMenu.getCode() && !"".equals(roleMenu.getCode())){
				detachedCriteria.add(Property.forName("code").like(
						roleMenu.getCode(),MatchMode.ANYWHERE));
			}
		}*/
		if(null != pageInfo.getSortColumn() && !"".equals(pageInfo.getSortColumn())){
			if("DESC".equals(pageInfo.getSortType().toUpperCase()))
				detachedCriteria.addOrder(Order.desc(pageInfo.getSortColumn()));
			else
				detachedCriteria.addOrder(Order.asc(pageInfo.getSortColumn()));
		}
		return detachedCriteria;
	}
	
	/**
	 * @description 根据角色获取它的菜单集合
	 * @return List<RolePower>
	 * @param roleId
	 * @return
	 * @update 2013-3-26
	 */
	public List<RoleMenu> getMenuIdsByRoleId(String roleId){
		Criteria criteria = this.getSession().createCriteria(RoleMenu.class);
		if(StringUtils.isNotEmpty(roleId)){
			criteria.add(Property.forName("roleId").eq(roleId));
		}
		return criteria.list();
	}
	
	
	/**
	 * @description 根据查询条件查询结果
	 * @return List<RoleMenu>
	 * @param roleMenu
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public List<RoleMenu> search(RoleMenu roleMenu,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = getSearchCondition(roleMenu,pageInfo);
		List<RoleMenu> list = super.hibernateTemplate.findByCriteria(detachedCriteria);
		return list;
	}
}
