package cn.com.fsun.bus.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import cn.com.fsun.bus.domain.BusCustomerInfo;
import cn.com.fsun.common.dao.BaseDao;
import cn.com.fsun.common.utils.PageInfo;

@Repository
public class CustomerDao extends BaseDao<BusCustomerInfo> {

	
	/**
	 * @description 组装查询条件
	 * @return DetachedCriteria
	 * @param factoryInfo
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public DetachedCriteria getSearchCondition(BusCustomerInfo customerInfo,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(BusCustomerInfo.class);
		
		if(null!=customerInfo){
			
			//查询条件
			if(null!=customerInfo.getType() && !"".equals(customerInfo.getType())){
				detachedCriteria.add(Property.forName("type").eq(customerInfo.getType()));	
			}
			if(null!=customerInfo.getName() && !"".equals(customerInfo.getName())){
				detachedCriteria.add(Property.forName("name").like(
						customerInfo.getName(),MatchMode.ANYWHERE));	
			}
			if(null!=customerInfo.getCode() && !"".equals(customerInfo.getCode())){
				detachedCriteria.add(Property.forName("code").like(
						customerInfo.getCode(),MatchMode.ANYWHERE));	
			}
			if(null!=customerInfo.getContacts() && !"".equals(customerInfo.getContacts())){
				detachedCriteria.add(Property.forName("contacts").like(
						customerInfo.getContacts(),MatchMode.ANYWHERE));	
			}
			if(null!=customerInfo.getQ() && !"".equals(customerInfo.getQ())){
				String q = "%"+customerInfo.getQ()+"%";
				detachedCriteria.add(Restrictions.or(   
						Restrictions.like("name", q),   
						Restrictions.like("code", q)));	
			}
		}
		if(null != pageInfo.getSortColumn() && !"".equals(pageInfo.getSortColumn())){
			if("DESC".equals(pageInfo.getSortType().toUpperCase()))
				detachedCriteria.addOrder(Order.desc(pageInfo.getSortColumn()));
			else
				detachedCriteria.addOrder(Order.asc(pageInfo.getSortColumn()));
		}
		
		detachedCriteria.add(Property.forName("enabled").eq(true));
		return detachedCriteria;
	}
	
	/**
	 * @description 根据查询条件查询结果
	 * @return List<BusFactoryInfo>
	 * @param factoryInfo
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public List<BusCustomerInfo> search(BusCustomerInfo customerInfo,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = getSearchCondition(customerInfo,pageInfo);
		List<BusCustomerInfo> list = super.hibernateTemplate.findByCriteria(detachedCriteria, pageInfo.getFirstRecord(), pageInfo.getPageSize());
		return list;
	}
	
	/**
	 * @description 根据查询条件得到总记录
	 * @return List<BusFactoryInfo>
	 * @param factoryInfo
	 * @param pageInfo
	 * @return
	 * @update 2013-6-25
	 */
	public List<BusCustomerInfo> getSearchCount(BusCustomerInfo customerInfo,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = getSearchCondition(customerInfo,pageInfo);
		List<BusCustomerInfo> list = super.hibernateTemplate.findByCriteria(detachedCriteria);
		return list;
	}
	
	/**
	 * 获取带查询要条件的客户信息
	 * @param hql
	 * @return
	 */
	public List findCostomer(String hql) {
		
		List list = new ArrayList();
		Session session = null;
		try {
			session = hibernateTemplate.getSessionFactory().openSession();
			list = session.createQuery(hql).list();
			session.close();
		}catch(Exception e){
			e.printStackTrace();
			session.close();
		}
		return list;
	}

	/**
	 * 获取客户信息表中的编码最大值
	 * @return
	 */
	public Integer getMaxNumber() {
		
		String code = "";	
		String hql =" from BusCustomerInfo order by code desc ";
		List<BusCustomerInfo> list = super.find(hql);
		if(list!=null && list.size()>0){
			BusCustomerInfo customer = list.get(0);
			code = customer.getCode();
			return formatFromStringToInt(code);
		}else{
			return 0;
		}					
	}
	
}


