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
import cn.com.fsun.sys.domain.User;


/*
 * @author lw
 */

@Repository
public class UserDao extends BaseDao<User> {

	/**
	 * @description 根据父亲节点查找子集
	 * @return List<User>
	 * @param user
	 * @update 2012-9-4
	 */
	public List<User> getChildren(String pid){
		Criteria criteria = this.getSession().createCriteria(User.class);
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
	public DetachedCriteria getSearchCondition(User user,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(User.class);
		
		if(null!=user){
			
			if(user.getId()==null || "".equals(user.getId())){
				detachedCriteria.add(Property.forName("username").ne("super"));	
			}
			//查询条件
			if(null!=user.getUsername() && !"".equals(user.getUsername())){
				detachedCriteria.add(Property.forName("username").like(
						user.getUsername(),MatchMode.ANYWHERE));	
			}
			if(null != user.getRealname() && !"".equals(user.getRealname())){
				detachedCriteria.add(Property.forName("realname").like(
						user.getRealname(),MatchMode.ANYWHERE));
			}
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
	 * @return List<User>
	 * @param user
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public List<User> search(User user,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = getSearchCondition(user,pageInfo);
		List<User> list = super.hibernateTemplate.findByCriteria(detachedCriteria, pageInfo.getFirstRecord(), pageInfo.getPageSize());
		return list;
	}
	
	/**
	 * @description 根据查询条件得到总记录
	 * @return List<User>
	 * @param user
	 * @param pageInfo
	 * @return
	 * @update 2013-6-25
	 */
	public List<User> getSearchCount(User user,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = getSearchCondition(user,pageInfo);
		List<User> list = super.hibernateTemplate.findByCriteria(detachedCriteria);
		return list;
	}
	
	/**
	 * @description 根据用户帐号查找用户对象
	 * @return User
	 * @param account
	 * @return
	 * @update 2012-9-28
	 */
	public User loadUserByUsername(String username){
		Criteria criteria = this.getSession().createCriteria(User.class);
		criteria.add(Property.forName("username").eq(username));
		return (User)criteria.uniqueResult();
	}
}
