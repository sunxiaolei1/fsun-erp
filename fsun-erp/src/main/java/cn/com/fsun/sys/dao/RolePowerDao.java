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
import cn.com.fsun.sys.domain.RolePower;

/*
 * @author lw
 */

@Repository
public class RolePowerDao extends BaseDao<RolePower> {

	/**
	 * @description 根据父亲节点查找子集
	 * @return List<RolePower>
	 * @param rolePower
	 * @update 2012-9-4
	 */
	public List<RolePower> getChildren(String pid){
		Criteria criteria = this.getSession().createCriteria(RolePower.class);
		if(StringUtils.isNotEmpty(pid)){
			criteria.add(Property.forName("pid").eq(pid));
		}else{
			criteria.add(Property.forName("pid").isNull());
		}
		return criteria.list();
	}
	
	/**
	 * @description 根据角色获取它的权限集合
	 * @return List<RolePower>
	 * @param roleId
	 * @return
	 * @update 2013-3-26
	 */
	public List<RolePower> getPowerIdsByRoleId(String roleId){
		Criteria criteria = this.getSession().createCriteria(RolePower.class);
		if(StringUtils.isNotEmpty(roleId)){
			criteria.add(Property.forName("roleId").eq(roleId));
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
	public DetachedCriteria getSearchCondition(RolePower rolePower,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(RolePower.class);
		/*
		if(null!=rolePower){
			//查询条件
			if(null!=rolePower.getName() && !"".equals(rolePower.getName())){
				detachedCriteria.add(Property.forName("name").like(
						rolePower.getName(),MatchMode.ANYWHERE));	
			}
			if(null != rolePower.getCode() && !"".equals(rolePower.getCode())){
				detachedCriteria.add(Property.forName("code").like(
						rolePower.getCode(),MatchMode.ANYWHERE));
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
	 * @description 根据查询条件查询结果
	 * @return List<RolePower>
	 * @param rolePower
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public List<RolePower> search(RolePower rolePower,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = getSearchCondition(rolePower,pageInfo);
		List<RolePower> list = super.hibernateTemplate.findByCriteria(detachedCriteria);
		return list;
	}
}
