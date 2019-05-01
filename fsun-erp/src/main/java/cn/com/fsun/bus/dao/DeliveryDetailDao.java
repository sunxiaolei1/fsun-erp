/**  
 * Project Name:fsun-erp  
 * File Name:DeliveryDetailDao.java  
 * Package Name:cn.com.fsun.bus.dao  
 * Date:2017年8月25日 
 * Copyright (c) 2017, WFZ All Rights Reserved.  
 *  
*/  
  
package cn.com.fsun.bus.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Property;
import org.springframework.stereotype.Repository;

import cn.com.fsun.bus.domain.BusDeliveryDetail;
import cn.com.fsun.common.dao.BaseDao;
import cn.com.fsun.common.utils.PageInfo;

/**  
 * ClassName:DeliveryDetailDao <br/>  
 * Description: TODO <br/>   
 * @author   lenovo  
 * @version  1.0  
 * @since    JDK 1.7        
 */
@Repository
public class DeliveryDetailDao extends BaseDao<BusDeliveryDetail> {

	
	/**
	 * @description 组装查询条件
	 * @return DetachedCriteria
	 * @param madeDetail
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public DetachedCriteria getSearchCondition(BusDeliveryDetail deliveryDetail,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(BusDeliveryDetail.class);
		
		if(null!=deliveryDetail){
			//查询条件
			if(null!=deliveryDetail.getDeliveryCode() && !"".equals(deliveryDetail.getDeliveryCode())){
				detachedCriteria.add(Property.forName("deliveryCode").like(
						deliveryDetail.getDeliveryCode(),MatchMode.ANYWHERE));
			}
			
			if(null!=deliveryDetail.getProductCode() && !"".equals(deliveryDetail.getProductCode())){
				detachedCriteria.add(Property.forName("productCode").eq(
						deliveryDetail.getProductCode()));
			}
		}
		if(null != pageInfo.getSortColumn() && !"".equals(pageInfo.getSortColumn())){
			if("DESC".equals(pageInfo.getSortType().toUpperCase()))
				detachedCriteria.addOrder(Order.desc(pageInfo.getSortColumn()));
			else
				detachedCriteria.addOrder(Order.asc(pageInfo.getSortColumn()));
		}else{
			detachedCriteria.addOrder(Order.desc("deliveryCode"));
			detachedCriteria.addOrder(Order.asc("productCode"));
			detachedCriteria.addOrder(Order.asc("style"));
		}
		
		return detachedCriteria;
	}
	
	/**
	 * @description 根据查询条件查询结果
	 * @return List<BusMadeDetail>
	 * @param deliveryDetail
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public List<BusDeliveryDetail> search(BusDeliveryDetail deliveryDetail,PageInfo pageInfo,boolean isPage){
		DetachedCriteria detachedCriteria = getSearchCondition(deliveryDetail,pageInfo);
		if(isPage){
			return super.hibernateTemplate.findByCriteria(detachedCriteria, pageInfo.getFirstRecord(), pageInfo.getPageSize());
		}else{
			return super.hibernateTemplate.findByCriteria(detachedCriteria);
		}
	}

	public void deleteByDeliveryCode(String deliveryCode) throws Exception {
		  
		String hql = "delete from BusDeliveryDetail where deliveryCode = '"+ deliveryCode +"'";
		this.excuteHQL(hql);	
	}
	
	/**
	 * 
	 * TODO
	 * @Title getDeliveryCodesByProductCode   
	 * @param productCode
	 * @return List<String>
	 */
	public List<String> getDeliveryCodesByProductCode(String productCode) {
		  
		if(productCode==null || "".equals(productCode)){
			return null;
		}
		String hql = "select deliveryCode  from BusDeliveryDetail where productCode = '"+ productCode +"'";
		return this.find(hql);
	}
	
	
	/**
	 * 通过送货单号获取订单ID
	 * TODO
	 * @Title getOrderIdsByDeliveryCode   
	 * @param madeCode
	 * @return List<String>
	 */
	public List<String> getOrderIdsByDeliveryCode(String deliveryCode) {
		  
		if(deliveryCode==null || "".equals(deliveryCode)){
			return null;
		}
		String hql = "select d.orderCode from BusDeliveryDetail d where d.deliveryCode = '"+ deliveryCode +"'";
		hql = "select o.id  from BusOrderInfo o where o.code in ("+ hql +")";
		List list = this.find(hql);
		return list;
	}

	/**
	 * 
	 * 获取带查询要条件的分页信息
	 * @param hsql
	 * @param pageInfo
	 * @return
	 */
	public List findDetailSummaryForPage(String hsql,PageInfo pageInfo) {
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
	 * 获取带查询要条件的信息
	 * @param hsql
	 * @return
	 */
	public List findDetailSummary(String hsql) {
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

	
}
  
