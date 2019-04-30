/**  
 * Project Name:fsun-erp  
 * File Name:MadeProcessDao.java  
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

import cn.com.fsun.bus.domain.BusMadeProcess;
import cn.com.fsun.common.dao.BaseDao;
import cn.com.fsun.common.utils.PageInfo;

/**  
 * ClassName:MadeProcessDao <br/>  
 * Description: TODO <br/>   
 * @author   lenovo  
 * @version  1.0  
 * @since    JDK 1.7        
 */

@Repository
public class MadeProcessDao extends BaseDao<BusMadeProcess>{

	/**
	 * @description 组装查询条件
	 * @return DetachedCriteria
	 * @param madeProcess
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public DetachedCriteria getSearchCondition(BusMadeProcess madeProcess,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(BusMadeProcess.class);
		
		if(null!=madeProcess){
			//查询条件
			if(null!=madeProcess.getOrderCode() && !"".equals(madeProcess.getOrderCode())){
				detachedCriteria.add(Property.forName("orderCode").like(
						madeProcess.getOrderCode(),MatchMode.ANYWHERE));
			}
			
			if(null!=madeProcess.getMadeCode() && !"".equals(madeProcess.getMadeCode())){
				detachedCriteria.add(Property.forName("madeCode").eq(madeProcess.getMadeCode()));
			}
		}
		if(null != pageInfo.getSortColumn() && !"".equals(pageInfo.getSortColumn())){
			if("DESC".equals(pageInfo.getSortType().toUpperCase()))
				detachedCriteria.addOrder(Order.desc(pageInfo.getSortColumn()));
			else
				detachedCriteria.addOrder(Order.asc(pageInfo.getSortColumn()));
		}
		detachedCriteria.addOrder(Order.desc("orderCode"));
		return detachedCriteria;
	}
	
	/**
	 * @description 根据查询条件查询结果
	 * @return List<BusMadeProcess>
	 * @param madeProcess
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public List<BusMadeProcess> search(BusMadeProcess madeProcess,PageInfo pageInfo,boolean isPage){
		DetachedCriteria detachedCriteria = getSearchCondition(madeProcess,pageInfo);
		if(isPage){
			return super.hibernateTemplate.findByCriteria(detachedCriteria, pageInfo.getFirstRecord(), pageInfo.getPageSize());
		}else{
			return super.hibernateTemplate.findByCriteria(detachedCriteria);
		}
	}
	
	public void deleteByMadeCode(String madeCode) throws Exception {
		  
		String hql = "delete from BusMadeProcess where madeCode = '"+ madeCode +"'";
		this.excuteHQL(hql);	
	}
}
  
