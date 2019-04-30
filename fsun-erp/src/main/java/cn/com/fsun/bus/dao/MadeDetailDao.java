/**  
 * Project Name:fsun-erp  
 * File Name:MadeDetailDao.java  
 * Package Name:cn.com.fsun.bus.dao  
 * Date:2017年8月3日 
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

import cn.com.fsun.bus.domain.BusMadeDetail;
import cn.com.fsun.common.dao.BaseDao;
import cn.com.fsun.common.utils.PageInfo;

/**  
 * ClassName:MadeDetailDao <br/>  
 * Description: TODO <br/>   
 * @author   lenovo  
 * @version  1.0  
 * @since    JDK 1.7        
 */
@Repository
public class MadeDetailDao extends BaseDao<BusMadeDetail> {

	
	/**
	 * @description 组装查询条件
	 * @return DetachedCriteria
	 * @param madeDetail
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public DetachedCriteria getSearchCondition(BusMadeDetail madeDetail,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(BusMadeDetail.class);
		
		if(null!=madeDetail){
			//查询条件
			if(null!=madeDetail.getMadeCode() && !"".equals(madeDetail.getMadeCode())){
				detachedCriteria.add(Property.forName("madeCode").like(
						madeDetail.getMadeCode(),MatchMode.ANYWHERE));
			}
			
			if(null!=madeDetail.getProductCode() && !"".equals(madeDetail.getProductCode())){
				detachedCriteria.add(Property.forName("productCode").eq(
						madeDetail.getProductCode()));
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
	public List<BusMadeDetail> search(BusMadeDetail madeDetail,PageInfo pageInfo,boolean isPage){
		DetachedCriteria detachedCriteria = getSearchCondition(madeDetail,pageInfo);
		if(isPage){
			return super.hibernateTemplate.findByCriteria(detachedCriteria, pageInfo.getFirstRecord(), pageInfo.getPageSize());
		}else{
			return super.hibernateTemplate.findByCriteria(detachedCriteria);
		}
	}

	public void deleteByMadeCode(String madeCode) throws Exception {
		  
		String hql = "delete from BusMadeDetail where madeCode = '"+ madeCode +"'";
		this.excuteHQL(hql);	
	}

}
  
