package cn.com.fsun.sys.dao;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import cn.com.fsun.common.dao.BaseDao;
import cn.com.fsun.common.utils.PageInfo;
import cn.com.fsun.sys.domain.Menu;


@Repository
public class MenuDao extends BaseDao<Menu> {

	/**
	 * @description 根据父亲节点查找子集
	 * @return List<Menu>
	 * @param menu
	 * @update 2012-9-4
	 */
	public List<Menu> getChildren(String pid){
		Criteria criteria = this.getSession().createCriteria(Menu.class);
		if(StringUtils.isNotEmpty(pid)){
			criteria.add(Property.forName("pid").eq(pid));
		}else{
			criteria.add(Property.forName("pid").isNull());
		}
		criteria.addOrder(Order.asc("priority"));
		return criteria.list();
	}
	
	
	public List<Menu> listByUserId(String userId){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Menu.class);
		String sql_temp = "select role_id from r_role_user where user_id='"+userId+"'";
		String sql = "select menu_id from r_role_menu where role_id in("+sql_temp+")";
//		String last_sql = "select id from sys_menu where enabled=1 and id in ("+sql+")";
		detachedCriteria.add(Restrictions
		.sqlRestriction("(this_.id in ("+sql+"))"));
		detachedCriteria.addOrder(Order.asc("priority"));
		List<Menu> list = super.hibernateTemplate.findByCriteria(detachedCriteria);
		return list;
	}
	
	/**
	 * @description 组装查询条件
	 * @return DetachedCriteria
	 * @param admin
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public DetachedCriteria getSearchCondition(Menu menu,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Menu.class);
		if(null!=menu){
			//查询条件
			if(null!=menu.getName() && !"".equals(menu.getName())){
				detachedCriteria.add(Property.forName("name").like(
						menu.getName(),MatchMode.ANYWHERE));	
			}
			if(null != menu.getCode() && !"".equals(menu.getCode())){
				detachedCriteria.add(Property.forName("code").like(
						menu.getCode(),MatchMode.ANYWHERE));
			}
		}
		if(null != pageInfo.getSortColumn() && !"".equals(pageInfo.getSortColumn())){
			if("DESC".equals(pageInfo.getSortType().toUpperCase()))
				detachedCriteria.addOrder(Order.desc(pageInfo.getSortColumn()));
			else
				detachedCriteria.addOrder(Order.asc(pageInfo.getSortColumn()));
		}
		detachedCriteria.addOrder(Order.asc("priority"));
		return detachedCriteria;
	}
	
	/**
	 * @description 根据查询条件查询结果
	 * @return List<Menu>
	 * @param menu
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public List<Menu> search(Menu menu,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = getSearchCondition(menu,pageInfo);
		List<Menu> list = super.hibernateTemplate.findByCriteria(detachedCriteria);
		return list;
	}
	
	public Integer maxPrioritySamePid(String pid ){
		String hql = "SELECT max(menu.priority) FROM Menu menu where menu.pid = '"+pid+"'";
		if(StringUtils.isEmpty(pid)){
			hql = "SELECT max(menu.priority) FROM Menu menu where menu.pid is null";
		}
		Integer maxPriority = 0 ;
		Session session =null;
		try {
			session = hibernateTemplate.getSessionFactory().openSession();
			Object obj = session.createQuery(hql).uniqueResult() ;
			maxPriority = obj == null ? 0 : (Integer)obj ;
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			session.close();
		}
		return maxPriority ;
	}
	

}
