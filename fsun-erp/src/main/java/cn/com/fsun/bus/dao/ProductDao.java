package cn.com.fsun.bus.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import cn.com.fsun.bus.domain.BusCustomerInfo;
import cn.com.fsun.bus.domain.BusProductInfo;
import cn.com.fsun.common.dao.BaseDao;
import cn.com.fsun.common.utils.PageInfo;

@Repository
public class ProductDao extends BaseDao<BusProductInfo> {

	
	/**
	 * @description 组装查询条件
	 * @return DetachedCriteria
	 * @param productInfo
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public DetachedCriteria getSearchCondition(BusProductInfo productInfo,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(BusProductInfo.class);
		
		if(null!=productInfo){
			//查询条件
			if(null!=productInfo.getName() && !"".equals(productInfo.getName())){
				detachedCriteria.add(Property.forName("name").like(
						productInfo.getName(),MatchMode.ANYWHERE));	
			}
			if(null!=productInfo.getCode() && !"".equals(productInfo.getCode())){
				detachedCriteria.add(Property.forName("code").like(
						productInfo.getCode(),MatchMode.ANYWHERE));	
			}
			if(null!=productInfo.getQ() && !"".equals(productInfo.getQ())){
				String q = "%"+productInfo.getQ()+"%";
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
		detachedCriteria.addOrder(Order.desc("code"));
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
	public List<BusProductInfo> search(BusProductInfo productInfo,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = getSearchCondition(productInfo,pageInfo);
		List<BusProductInfo> list = super.hibernateTemplate.findByCriteria(detachedCriteria, pageInfo.getFirstRecord(), pageInfo.getPageSize());
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
	public List<BusProductInfo> getSearchCount(BusProductInfo productInfo,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = getSearchCondition(productInfo,pageInfo);
		List<BusProductInfo> list = super.hibernateTemplate.findByCriteria(detachedCriteria);
		return list;
	}

	/**
	 * 获取产品信息表中的编码最大值
	 * @return
	 */
	public Integer getMaxNumber() {
		
		String code = "";	
		String hql =" from BusProductInfo order by code desc ";
		List<BusProductInfo> list = super.find(hql);
		if(list!=null && list.size()>0){
			BusProductInfo customer = list.get(0);
			code = customer.getCode();
			return formatFromStringToInt(code);
		}else{
			return 0;
		}					
	}

}


