package cn.com.fsun.bus.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Property;
import org.springframework.stereotype.Repository;

import cn.com.fsun.bus.domain.BusStockDetail;
import cn.com.fsun.common.dao.BaseDao;
import cn.com.fsun.common.utils.PageInfo;

@Repository
public class StockDetailDao extends BaseDao<BusStockDetail> {
	
	/**
	 * @description 组装查询条件
	 * @return DetachedCriteria
	 * @param busStockDetail
	 * @param pageInfo
	 * @return
	 * @update 2015-5-13
	 */
	public DetachedCriteria getSearchCondition(BusStockDetail busStockDetail,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(BusStockDetail.class);
		
		if(null!=busStockDetail){
			//查询条件
			if(null!=busStockDetail.getStockId() && !"".equals(busStockDetail.getStockId())){
				detachedCriteria.add(Property.forName("stockId").eq(busStockDetail.getStockId()));	
			}
		}		
		return detachedCriteria;
	}
	
	/**
	 * @description 根据查询条件查询结果
	 * @return List<BusStockBase>
	 * @param busStockInfo
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public List<BusStockDetail> getDetials(BusStockDetail busStockDetail,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = getSearchCondition(busStockDetail,pageInfo);
		List<BusStockDetail> list = null;
		if(pageInfo!=null && pageInfo.getPageSize()>0){
		    list = super.hibernateTemplate.findByCriteria(detachedCriteria, pageInfo.getFirstRecord(), pageInfo.getPageSize());
		}else{
			list = super.hibernateTemplate.findByCriteria(detachedCriteria);
		}
		return list;
	}

	public void deleteByStockId(Long stockId) throws Exception {
		String hql = "delete from BusStockDetail where stockId = "+stockId;
		super.excuteHQL(hql);
	}

	public void deleteByStockIds(String stockIds) throws Exception {
		String hql = "delete from BusStockDetail where stockId in ("+ stockIds +")";
		super.excuteHQL(hql);
	}


	

	
}
