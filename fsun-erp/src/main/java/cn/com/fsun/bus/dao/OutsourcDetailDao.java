package cn.com.fsun.bus.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Property;
import org.springframework.stereotype.Repository;

import cn.com.fsun.bus.domain.BusOutsourcDetail;
import cn.com.fsun.bus.dto.OrderDetailDto;
import cn.com.fsun.common.dao.BaseDao;
import cn.com.fsun.common.utils.PageInfo;

@Repository
public class OutsourcDetailDao extends BaseDao<BusOutsourcDetail> {

	
	/**
	 * @description 组装查询条件
	 * @return DetachedCriteria
	 * @param admin
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public DetachedCriteria getSearchCondition(BusOutsourcDetail outsourcDetail,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(BusOutsourcDetail.class);
		
		if(null!=outsourcDetail){
			//查询条件
			if(null!=outsourcDetail.getOrderCode() && !"".equals(outsourcDetail.getOrderCode())){
				detachedCriteria.add(Property.forName("orderCode").eq(outsourcDetail.getOrderCode()));
			}
			if(null!=outsourcDetail.getOutsourcName() && !"".equals(outsourcDetail.getOutsourcName())){
				detachedCriteria.add(Property.forName("outsourcName").eq(outsourcDetail.getOutsourcName()));
			}
		}
		if(null != pageInfo.getSortColumn() && !"".equals(pageInfo.getSortColumn())){
			if("DESC".equals(pageInfo.getSortType().toUpperCase()))
				detachedCriteria.addOrder(Order.desc(pageInfo.getSortColumn()));
			else
				detachedCriteria.addOrder(Order.asc(pageInfo.getSortColumn()));
		}
		detachedCriteria.addOrder(Order.desc("completeTime"));
		return detachedCriteria;
	}
	
	/**
	 * @description 根据查询条件查询结果
	 * @return List<BusOutsourcDetail>
	 * @param outsourcDetail
	 * @param pageInfo
	 * @param isPage
	 * @return
	 */
	public List<BusOutsourcDetail> search(BusOutsourcDetail outsourcDetail,PageInfo pageInfo,boolean isPage){
		DetachedCriteria detachedCriteria = getSearchCondition(outsourcDetail,pageInfo);
		if(isPage){
			return super.hibernateTemplate.findByCriteria(detachedCriteria, pageInfo.getFirstRecord(), pageInfo.getPageSize());
		}else{
			return super.hibernateTemplate.findByCriteria(detachedCriteria);
		}
	}

	/**
	 * 通过外协防的名称获取回执单ids
	 * @param name
	 * @return
	 */
	public List<String> getIdsByOutsourcName(String outsourcName) {
		String hql = "select id from BusOutsourcDetail where outsourcName = '"+ outsourcName +"'";
		return super.hibernateTemplate.find(hql);
	}
}

