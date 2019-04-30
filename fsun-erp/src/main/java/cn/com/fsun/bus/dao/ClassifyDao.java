package cn.com.fsun.bus.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Property;
import org.springframework.stereotype.Repository;

import cn.com.fsun.bus.domain.BusClassifyInfo;
import cn.com.fsun.bus.dto.ProductDto;
import cn.com.fsun.common.dao.BaseDao;
import cn.com.fsun.common.pageInfo.PageInfo;

@Repository
public class ClassifyDao extends BaseDao<BusClassifyInfo> {

	
	/**
	 * @description 组装查询条件
	 * @return DetachedCriteria
	 * @param productTypeInfo
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public DetachedCriteria getSearchCondition(BusClassifyInfo info,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(BusClassifyInfo.class);
		
		if(pageInfo!=null && null != pageInfo.getSort() && !"".equals(pageInfo.getSort())){
			if("DESC".equals(pageInfo.getOrder().toUpperCase()))
				detachedCriteria.addOrder(Order.desc(pageInfo.getSort()));
			else
				detachedCriteria.addOrder(Order.asc(pageInfo.getSort()));
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
	public List<BusClassifyInfo> search(BusClassifyInfo productTypeInfo,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = getSearchCondition(productTypeInfo,pageInfo);
		return super.hibernateTemplate.findByCriteria(detachedCriteria);
	}

	/**
	 * 创建分类的键值对
	 * @param classifyMap
	 */
	public void createClassifyMap(HashMap<Long, String> classifyMap) {
		
		String hql = " from BusClassifyInfo where enabled = true ";
		List<BusClassifyInfo> infos = super.hibernateTemplate.find(hql);
		if(infos!=null && infos.size()>0){
			for (BusClassifyInfo info : infos) {
				classifyMap.put(info.getId(), info.getName());
			}
		}else{
			classifyMap.clear();
		}
	}
	
}


