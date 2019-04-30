/**  
 * Project Name:fsun-erp  
 * File Name:MadeHeaderDao.java  
 * Package Name:cn.com.fsun.bus.dao  
 * Date:2017年8月9日 
 * Copyright (c) 2017, WFZ All Rights Reserved.  
 *  
*/  
  
package cn.com.fsun.bus.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Property;
import org.springframework.stereotype.Repository;

import cn.com.fsun.bus.domain.BusDeliveryHeader;
import cn.com.fsun.common.dao.BaseDao;
import cn.com.fsun.common.utils.PageInfo;

/**  
 * ClassName:DeliveryHeaderDao <br/>  
 * Description: TODO <br/>   
 * @author   lenovo  
 * @version  1.0  
 * @since    JDK 1.7        
 */
@Repository
public class DeliveryHeaderDao extends BaseDao<BusDeliveryHeader> {

	
	/**
	 * @description 组装查询条件
	 * @return DetachedCriteria
	 * @param deliveryHeader
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public DetachedCriteria getSearchCondition(BusDeliveryHeader deliveryHeader,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(BusDeliveryHeader.class);
		
		if(null!=deliveryHeader){
			//查询条件
			if(null!=deliveryHeader.getOrderCode() && !"".equals(deliveryHeader.getOrderCode())){
				detachedCriteria.add(Property.forName("orderCode").like(
						deliveryHeader.getOrderCode(),MatchMode.ANYWHERE));
			}
			if(null!=deliveryHeader.getDeliveryCode() && !"".equals(deliveryHeader.getDeliveryCode())){
				detachedCriteria.add(Property.forName("deliveryCode").like(
						deliveryHeader.getDeliveryCode(),MatchMode.ANYWHERE));
			}
			if(null!=deliveryHeader.getCustomerCode() && !"".equals(deliveryHeader.getCustomerCode())){
				detachedCriteria.add(Property.forName("customerCode").eq(deliveryHeader.getCustomerCode()));
			}
			if(null!=deliveryHeader.getDeliveryType() && !"".equals(deliveryHeader.getDeliveryType())){
				detachedCriteria.add(Property.forName("deliveryType").eq(deliveryHeader.getDeliveryType()));
			}
			List<String> deliveryCodes = deliveryHeader.getDeliveryCodes();
			if(deliveryCodes!=null){
				if(deliveryCodes.size()==0){
					deliveryCodes.add("0");
				}
				detachedCriteria.add(Property.forName("deliveryCode").in(deliveryCodes));
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
	 * @return List<BusDeliveryHeader>
	 * @param deliveryHeader
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public List<BusDeliveryHeader> search(BusDeliveryHeader deliveryHeader,PageInfo pageInfo,boolean isPage){
		DetachedCriteria detachedCriteria = getSearchCondition(deliveryHeader,pageInfo);
		if(isPage){
			return super.hibernateTemplate.findByCriteria(detachedCriteria, pageInfo.getFirstRecord(), pageInfo.getPageSize());
		}else{
			return super.hibernateTemplate.findByCriteria(detachedCriteria);
		}
	}

	/**
	 * 通过code码删除送货单
	 * TODO
	 * @Title deleteByDeliveryCode   
	 * @param deliveryCode
	 * @throws Exception void
	 */
	public void deleteByDeliveryCode(String deliveryCode) throws Exception {
		  
		String hql = "delete from BusDeliveryHeader where deliveryCode = '"+ deliveryCode +"'";
		this.excuteHQL(hql);		
	}

	/**
	 * 生成送货单编号
	 * TODO
	 * @Title getInitCode   
	 * @param sign
	 * @return Long
	 */
	public Long getInitCode(String sign) {
		  
		String hql ="select a.deliveryCode from BusDeliveryHeader a where a.deliveryCode like '"+ sign +"%' order by a.deliveryCode desc ";
		List<String> list = super.find(hql);
		if(list!=null && list.size()>0){
			return Long.valueOf(list.get(0))+1;
		}else{	
			return Long.valueOf(sign+"00000")+1;
		}
	}

}
  
