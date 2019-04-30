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
import cn.com.fsun.sys.domain.Role;

/*
 * @author lw
 */

@Repository
public class RoleDao extends BaseDao<Role> {

	/**
	 * @description 根据父亲节点查找子集
	 * @return List<Role>
	 * @param role
	 * @update 2012-9-4
	 */
	public List<Role> getChildren(String pid){
		Criteria criteria = this.getSession().createCriteria(Role.class);
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
	public DetachedCriteria getSearchCondition(Role role,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Role.class);
		/*
		if(null!=role){
			//查询条件
			if(null!=role.getName() && !"".equals(role.getName())){
				detachedCriteria.add(Property.forName("name").like(
						role.getName(),MatchMode.ANYWHERE));	
			}
			if(null != role.getCode() && !"".equals(role.getCode())){
				detachedCriteria.add(Property.forName("code").like(
						role.getCode(),MatchMode.ANYWHERE));
			}
		}*/
		
		if(role.getId()==null || "".equals(role.getId())){
			detachedCriteria.add(Property.forName("code").ne("super"));	
		}
		
		
		if(null != pageInfo.getSortColumn() && !"".equals(pageInfo.getSortColumn())){
			if("DESC".equals(pageInfo.getSortType().toUpperCase()))
				detachedCriteria.addOrder(Order.desc(pageInfo.getSortColumn()));
			else
				detachedCriteria.addOrder(Order.asc(pageInfo.getSortColumn()));
		}
		detachedCriteria.addOrder(Order.desc("createTime"));
		return detachedCriteria;
	}
	
	/**
	 * @description 根据查询条件查询结果
	 * @return List<Role>
	 * @param role
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public List<Role> search(Role role,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = getSearchCondition(role,pageInfo);
		List<Role> list = super.hibernateTemplate.findByCriteria(detachedCriteria, pageInfo.getFirstRecord(), pageInfo.getPageSize());
		return list;
	}
	
	/**
	 * @description 根据查询条件得到总记录
	 * @return List<Role>
	 * @param role
	 * @param pageInfo
	 * @return
	 * @update 2013-6-25
	 */
	public List<Role> getSearchCount(Role role,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = getSearchCondition(role,pageInfo);
		List<Role> list = super.hibernateTemplate.findByCriteria(detachedCriteria);
		return list;
	}
}
