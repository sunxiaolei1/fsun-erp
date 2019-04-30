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

import cn.com.fsun.bus.domain.BusMadeHeader;
import cn.com.fsun.common.dao.BaseDao;
import cn.com.fsun.common.utils.PageInfo;

/**  
 * ClassName:MadeHeaderDao <br/>  
 * Description: TODO <br/>   
 * @author   lenovo  
 * @version  1.0  
 * @since    JDK 1.7        
 */
@Repository
public class MadeHeaderDao extends BaseDao<BusMadeHeader> {

	
	/**
	 * @description 组装查询条件
	 * @return DetachedCriteria
	 * @param madeHeader
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public DetachedCriteria getSearchCondition(BusMadeHeader madeHeader,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(BusMadeHeader.class);
		
		if(null!=madeHeader){
			//查询条件
			if(null!=madeHeader.getOrderCode() && !"".equals(madeHeader.getOrderCode())){
				detachedCriteria.add(Property.forName("orderCode").like(
						madeHeader.getOrderCode(),MatchMode.ANYWHERE));
			}
			if(null!=madeHeader.getMadeCode() && !"".equals(madeHeader.getMadeCode())){
				detachedCriteria.add(Property.forName("madeCode").like(
						madeHeader.getMadeCode(),MatchMode.ANYWHERE));
			}
			if(null!=madeHeader.getMadeType() && !"".equals(madeHeader.getMadeType())){
				detachedCriteria.add(Property.forName("madeType").eq(madeHeader.getMadeType()));
			}
			List<String> madeCodes = madeHeader.getMadeCodes();
			if(madeCodes!=null){
				if(madeCodes.size()==0){
					madeCodes.add("0");
				}
				detachedCriteria.add(Property.forName("madeCode").in(madeCodes));	
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
	 * @return List<BusMadeHeader>
	 * @param madeDetail
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public List<BusMadeHeader> search(BusMadeHeader madeHeader,PageInfo pageInfo,boolean isPage){
		DetachedCriteria detachedCriteria = getSearchCondition(madeHeader,pageInfo);
		if(isPage){
			return super.hibernateTemplate.findByCriteria(detachedCriteria, pageInfo.getFirstRecord(), pageInfo.getPageSize());
		}else{
			return super.hibernateTemplate.findByCriteria(detachedCriteria);
		}
	}

	/**
	 * 通过code码删除生产单
	 * TODO
	 * @Title deleteByMadeCode   
	 * @param madeCode
	 * @throws Exception void
	 */
	public void deleteByMadeCode(String madeCode) throws Exception {
		  
		String hql = "delete from BusMadeHeader where madeCode = '"+ madeCode +"'";
		this.excuteHQL(hql);		
	}

	/**
	 * 生成生产单编号
	 * TODO
	 * @Title getInitCode   
	 * @param sign
	 * @return Long
	 */
	public Long getInitCode(String sign) {
		  
		String hql ="select a.madeCode from BusMadeHeader a where a.madeCode like '"+ sign +"%' order by a.madeCode desc ";
		List<String> list = super.find(hql);
		if(list!=null && list.size()>0){
			return Long.valueOf(list.get(0))+1;
		}else{	
			return Long.valueOf(sign+"00000")+1;
		}
	}

}
  
