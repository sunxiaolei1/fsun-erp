package cn.com.fsun.bus.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Property;
import org.springframework.stereotype.Repository;

import cn.com.fsun.bus.domain.BusFactoryInfo;
import cn.com.fsun.bus.dto.FactoryInfoDto;
import cn.com.fsun.common.dao.BaseDao;
import cn.com.fsun.common.utils.PageInfo;

@Repository
public class FactoryInfoDao extends BaseDao<BusFactoryInfo> {

	
	/**
	 * @description 组装查询条件
	 * @return DetachedCriteria
	 * @param factoryInfo
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public DetachedCriteria getSearchCondition(BusFactoryInfo factoryInfo,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(BusFactoryInfo.class);
		
		if(null!=factoryInfo){
			//查询条件
			if(null!=factoryInfo.getName() && !"".equals(factoryInfo.getName())){
				detachedCriteria.add(Property.forName("name").like(
						factoryInfo.getName(),MatchMode.ANYWHERE));	
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
	public List<BusFactoryInfo> search(BusFactoryInfo factoryInfo,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = getSearchCondition(factoryInfo,pageInfo);
		List<BusFactoryInfo> list = super.hibernateTemplate.findByCriteria(detachedCriteria, pageInfo.getFirstRecord(), pageInfo.getPageSize());
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
	public List<BusFactoryInfo> getSearchCount(BusFactoryInfo factoryInfo,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = getSearchCondition(factoryInfo,pageInfo);
		List<BusFactoryInfo> list = super.hibernateTemplate.findByCriteria(detachedCriteria);
		return list;
	}
	
	/**
	 * 获取带查询要条件的厂商信息
	 * @param hql
	 * @return
	 */
	public List<FactoryInfoDto> findFactory(String hql) {
		
		List<FactoryInfoDto> list = new ArrayList<FactoryInfoDto>();
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
	
}


