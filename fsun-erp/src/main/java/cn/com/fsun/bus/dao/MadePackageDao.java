/**  
 * Project Name:fsun-erp  
 * File Name:MadePackageDao.java  
 * Package Name:cn.com.fsun.bus.dao  
 * Date:2017年8月17日 
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

import cn.com.fsun.bus.domain.BusMadePackage;
import cn.com.fsun.common.dao.BaseDao;
import cn.com.fsun.common.utils.PageInfo;

/**  
 * ClassName:MadePackageDao <br/>  
 * Description: TODO <br/>   
 * @author   lenovo  
 * @version  1.0  
 * @since    JDK 1.7        
 */
@Repository
public class MadePackageDao extends BaseDao<BusMadePackage> {

	
	/**
	 * @description 组装查询条件
	 * @return DetachedCriteria
	 * @param madeDetail
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public DetachedCriteria getSearchCondition(BusMadePackage madePackage,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(BusMadePackage.class);
		
		if(null!=madePackage){
			//查询条件
			if(null!=madePackage.getMadeCode() && !"".equals(madePackage.getMadeCode())){
				detachedCriteria.add(Property.forName("madeCode").like(
						madePackage.getMadeCode(),MatchMode.ANYWHERE));
			}
		}
		if(null != pageInfo.getSortColumn() && !"".equals(pageInfo.getSortColumn())){
			if("DESC".equals(pageInfo.getSortType().toUpperCase()))
				detachedCriteria.addOrder(Order.desc(pageInfo.getSortColumn()));
			else
				detachedCriteria.addOrder(Order.asc(pageInfo.getSortColumn()));
		}
		detachedCriteria.addOrder(Order.desc("madeCode"));
		return detachedCriteria;
	}
	
	/**
	 * @description 根据查询条件查询结果
	 * @return List<BusMadeDetail>
	 * @param madeDetail
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public List<BusMadePackage> search(BusMadePackage madePackage,PageInfo pageInfo,boolean isPage){
		DetachedCriteria detachedCriteria = getSearchCondition(madePackage,pageInfo);
		if(isPage){
			return super.hibernateTemplate.findByCriteria(detachedCriteria, pageInfo.getFirstRecord(), pageInfo.getPageSize());
		}else{
			return super.hibernateTemplate.findByCriteria(detachedCriteria);
		}
	}

	public void deleteByMadeCode(String madeCode) throws Exception {
		  
		String hql = "delete from BusMadePackage where madeCode = '"+ madeCode +"'";
		this.excuteHQL(hql);	
	}

	
	/**
	 * 通过产品名称获取生产编号
	 * TODO
	 * @Title getMadeCodesByProductCode   
	 * @param productCode
	 * @return List<String>
	 */
	public List<String> getMadeCodesByProductCode(String productCode) {
		
		if(productCode==null || "".equals(productCode)){
			return null;
		}
		String hql = "select madeCode from BusMadePackage where productCode = '"+ productCode +"'";
		List list = this.find(hql);
		return list;
	}

	/**
	 * 通过生产单号获取订单ID
	 * TODO
	 * @Title getOrderIdsByMadeCode   
	 * @param madeCode
	 * @return List<String>
	 */
	public List<String> getOrderIdsByMadeCode(String madeCode) {
		  
		if(madeCode==null || "".equals(madeCode)){
			return null;
		}
		String hql = "select orderId from BusMadePackage where madeCode = '"+ madeCode +"'";
		List list = this.find(hql);
		return list;
	}
	
}
  
