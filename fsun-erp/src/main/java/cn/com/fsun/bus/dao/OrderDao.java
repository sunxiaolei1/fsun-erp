package cn.com.fsun.bus.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Property;
import org.springframework.stereotype.Repository;

import cn.com.fsun.bus.domain.BusOrderInfo;
import cn.com.fsun.common.dao.BaseDao;
import cn.com.fsun.common.utils.DateUtil;
import cn.com.fsun.common.utils.PageInfo;
import cn.com.fsun.common.utils.StringUtils;

@Repository
public class OrderDao extends BaseDao<BusOrderInfo> {

	
	/**
	 * @description 组装查询条件
	 * @return DetachedCriteria
	 * @param admin
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public DetachedCriteria getSearchCondition(BusOrderInfo orderInfo,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(BusOrderInfo.class);
		
		if(null!=orderInfo){
			//查询条件
			if(null!=orderInfo.getCustomerCode() && !"".equals(orderInfo.getCustomerCode())){
				detachedCriteria.add(Property.forName("customerCode").like(
						orderInfo.getCustomerCode(),MatchMode.ANYWHERE));	
			}
			if(null!=orderInfo.getCustomerName() && !"".equals(orderInfo.getCustomerName())){
				detachedCriteria.add(Property.forName("customerName").like(
						orderInfo.getCustomerName(),MatchMode.ANYWHERE));	
			}
			if(null!=orderInfo.getCode() && !"".equals(orderInfo.getCode())){
				detachedCriteria.add(Property.forName("code").like(
						orderInfo.getCode(),MatchMode.ANYWHERE));	
			}
			if(null!=orderInfo.getStatus() && !"".equals(orderInfo.getStatus())){
				detachedCriteria.add(Property.forName("status").eq(orderInfo.getStatus()));	
			}
			if(null != orderInfo.getOrderType() && !"".equals(orderInfo.getOrderType())){
				detachedCriteria.add(Property.forName("orderType").eq(orderInfo.getOrderType()));
			}
			if(null != orderInfo.getIsGet()){
				detachedCriteria.add(Property.forName("isGet").eq(orderInfo.getIsGet()));
			}		
			List<String> orderIds = orderInfo.getOrderIds();
			if(orderIds!=null ){
				if(orderIds.size()==0){
					orderIds.add("0");
				}
				detachedCriteria.add(Property.forName("id").in(orderIds));
			}
		}
		
		if(pageInfo!=null){
			
			if (pageInfo.getStartDate()!=null){
				detachedCriteria.add(Property.forName("receiveTime").ge(DateUtil.parse(pageInfo.getStartDate(), "yyyy-MM-dd HH:mm:ss")));
			}
			if(pageInfo.getEndDate()!=null){
				detachedCriteria.add(Property.forName("receiveTime").le(DateUtil.parse(pageInfo.getEndDate(), "yyyy-MM-dd HH:mm:ss")));
			}
			if(null != pageInfo.getSortColumn() && !"".equals(pageInfo.getSortColumn())){
				if("DESC".equals(pageInfo.getSortType().toUpperCase()))
					detachedCriteria.addOrder(Order.desc(pageInfo.getSortColumn()));
				else
					detachedCriteria.addOrder(Order.asc(pageInfo.getSortColumn()));
			}
		}
		detachedCriteria.addOrder(Order.desc("code"));
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
	public List<BusOrderInfo> search(BusOrderInfo orderInfo,PageInfo pageInfo,boolean isPage){
		DetachedCriteria detachedCriteria = getSearchCondition(orderInfo,pageInfo);
		if(isPage){
			return super.hibernateTemplate.findByCriteria(detachedCriteria, pageInfo.getFirstRecord(), pageInfo.getPageSize());
		}else{
			return super.hibernateTemplate.findByCriteria(detachedCriteria);	
		}
	}
	
	/**
	 * @description 根据查询条件得到总记录
	 * @return List<User>
	 * @param user
	 * @param pageInfo
	 * @return
	 * @update 2013-6-25
	 */
	public List<BusOrderInfo> getSearchCount(BusOrderInfo orderInfo,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = getSearchCondition(orderInfo,pageInfo);
		List<BusOrderInfo> list = super.hibernateTemplate.findByCriteria(detachedCriteria);
		return list;
	}
	
	/**
	 * @description 根据订单帐号查找订单对象
	 * @return User
	 * @param account
	 * @return
	 * @update 2012-9-28
	 */
	public BusOrderInfo loadOrderById(String id){
		Criteria criteria = this.getSession().createCriteria(BusOrderInfo.class);
		criteria.add(Property.forName("id").eq(id));
		return (BusOrderInfo)criteria.uniqueResult();
	}
	
	/**
	 * 
	 * 获取带查询要条件的订单分页信息
	 * @param hsql
	 * @param pageInfo
	 * @return
	 */
	public List findOrderForPage(String hsql,PageInfo pageInfo) {
		List list = new ArrayList();
		Session session = null;
		try {			
			session = hibernateTemplate.getSessionFactory().openSession();
			list = session.createQuery(hsql)
	    				.setFirstResult(pageInfo.getFirstRecord())
	    					.setMaxResults(pageInfo.getPageSize()).list();
			session.close();			
		}catch(Exception e){
			e.printStackTrace();
			session.close();
		}	 
	    return list;  
	}
	
	/**
	 * 
	 * 获取带查询要条件的订单未分页信息
	 * @param hsql
	 * @param pageInfo
	 * @return
	 */
	public List findOrder(String hsql) {
		List list = new ArrayList();
		Session session = null;
		try {			
			session = hibernateTemplate.getSessionFactory().openSession();
			list = session.createQuery(hsql).list();
			session.close();			
		}catch(Exception e){
			e.printStackTrace();
			session.close();
		}	 
	    return list;  
	}
	
	/**
	 * 
	 * 获取带查询要条件的订单未分页信息
	 * 前几条数据
	 * @param hsql
	 * @param limit 条数
	 * @return
	 */
	public List findOrder(String hsql,int limit) {
		List list = new ArrayList();
		Session session = null;
		try {			
			session = hibernateTemplate.getSessionFactory().openSession();
			list = session.createQuery(hsql).setFirstResult(0).setMaxResults(limit).list();
			session.close();			
		}catch(Exception e){
			e.printStackTrace();
			session.close();
		}	 
	    return list;  
	}
	
	/**
	 * 获取初始化的订单编码
	 * @return
	 */
	public Long getInitCode(String sign) {
		
		String hql ="select a.code from BusOrderInfo a where a.code like '"+ sign +"%' order by a.code desc ";
		List<String> list = super.find(hql);
		if(list!=null && list.size()>0){
			return Long.valueOf(list.get(0))+1;
		}else{	
			return Long.valueOf(sign+"00000")+1;
		}					
	}

	public boolean existOrderByCustomerCode(String customerCodes) {
		if(customerCodes==null && "".equals(customerCodes)){
			return true;
		}
		String hql = "select id  from BusOrderInfo where customerCode in ("+ StringUtils.getStringToString(customerCodes) +")";
		List list = this.find(hql);
		if(list!=null && list.size()>0){
			return true;
		}
		return false;
	}
}
