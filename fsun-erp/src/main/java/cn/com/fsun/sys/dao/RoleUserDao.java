package cn.com.fsun.sys.dao;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Property;
import org.springframework.stereotype.Repository;

import cn.com.fsun.common.dao.BaseDao;
import cn.com.fsun.common.utils.PageInfo;
import cn.com.fsun.sys.domain.RoleUser;


/*
 * @author lw
 */

@Repository
public class RoleUserDao extends BaseDao<RoleUser> {

	/**
	 * @description 根据父亲节点查找子集
	 * @return List<RoleUser>
	 * @param roleUser
	 * @update 2012-9-4
	 */
	public List<RoleUser> getChildren(String pid){
		Criteria criteria = this.getSession().createCriteria(RoleUser.class);
		if(StringUtils.isNotEmpty(pid)){
			criteria.add(Property.forName("pid").eq(pid));
		}else{
			criteria.add(Property.forName("pid").isNull());
		}
		return criteria.list();
	}
	
	
	/**
	 * @description 根据用户获取它的角色集合
	 * @return List<RolePower>
	 * @param roleId
	 * @return
	 * @update 2013-3-26
	 */
	public List<RoleUser> listRoleIdByUserId(String userId){
		Criteria criteria = this.getSession().createCriteria(RoleUser.class);
		if(StringUtils.isNotEmpty(userId)){
			criteria.add(Property.forName("userId").eq(userId));
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
	public DetachedCriteria getSearchCondition(RoleUser roleUser,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(RoleUser.class);
		/*
		if(null!=roleUser){
			//查询条件
			if(null!=roleUser.getName() && !"".equals(roleUser.getName())){
				detachedCriteria.add(Property.forName("name").like(
						roleUser.getName(),MatchMode.ANYWHERE));	
			}
			if(null != roleUser.getCode() && !"".equals(roleUser.getCode())){
				detachedCriteria.add(Property.forName("code").like(
						roleUser.getCode(),MatchMode.ANYWHERE));
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
	 * @return List<RoleUser>
	 * @param roleUser
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public List<RoleUser> search(RoleUser roleUser,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = getSearchCondition(roleUser,pageInfo);
		List<RoleUser> list = super.hibernateTemplate.findByCriteria(detachedCriteria);
		return list;
	}
	
	/**
	 * @description 根据查询条件查询结果
	 * @return List<RoleUser>
	 * @param roleUser
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public Boolean remove(RoleUser roleUser){
		try{
			String sql = "delete from r_role_user where user_id='"+roleUser.getUserId()+"' and role_id='"+roleUser.getRoleId()+"'";
			this.getSession().createSQLQuery(sql).executeUpdate();
			return Boolean.TRUE;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return Boolean.FALSE;
	}
}
