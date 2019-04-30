package cn.com.fsun.bus.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Property;
import org.springframework.stereotype.Repository;

import cn.com.fsun.bus.domain.BusStockBase;
import cn.com.fsun.bus.dto.DetailSummary;
import cn.com.fsun.bus.dto.StockBaseDto;
import cn.com.fsun.common.dao.BaseDao;
import cn.com.fsun.common.utils.PageInfo;

@Repository
public class StockBaseDao extends BaseDao<BusStockBase> {

	/**
	 * @description 组装查询条件
	 * @return DetachedCriteria
	 * @param busStockInfo
	 * @param pageInfo
	 * @return
	 * @update 2015-5-13
	 */
	public DetachedCriteria getSearchCondition(BusStockBase busStockBase,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(BusStockBase.class);
		
		if(null!=busStockBase){
			//查询条件
			if(null!=busStockBase.getId() && !"".equals(busStockBase.getId())){
				detachedCriteria.add(Property.forName("id").eq(busStockBase.getId()));	
			}
			if(null!=busStockBase.getImage() && !"".equals(busStockBase.getImage())){
				detachedCriteria.add(Property.forName("image").eq(busStockBase.getImage()));	
			}
			if(null!=busStockBase.getArtNum() && !"".equals(busStockBase.getArtNum())){
				detachedCriteria.add(Property.forName("artNum").eq(busStockBase.getArtNum()));
			}
			if(null!=busStockBase.getRackNum() && !"".equals(busStockBase.getRackNum())){
				detachedCriteria.add(Property.forName("rackNum").like(busStockBase.getRackNum(),MatchMode.ANYWHERE));
			}
			if(null!=busStockBase.getName() && !"".equals(busStockBase.getName())){
				detachedCriteria.add(Property.forName("name").like(busStockBase.getName(),MatchMode.ANYWHERE));
			}
		}	
		if(null != pageInfo.getSortColumn() && !"".equals(pageInfo.getSortColumn())){
			if("DESC".equals(pageInfo.getSortType().toUpperCase()))
				detachedCriteria.addOrder(Order.desc(pageInfo.getSortColumn()));
			else
				detachedCriteria.addOrder(Order.asc(pageInfo.getSortColumn()));
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
	public List<BusStockBase> search(BusStockBase busStockBase,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = getSearchCondition(busStockBase,pageInfo);
		if(pageInfo!=null && pageInfo.getPageSize()>0){
			return super.hibernateTemplate.findByCriteria(detachedCriteria, pageInfo.getFirstRecord(), pageInfo.getPageSize());
		}else{
			return super.hibernateTemplate.findByCriteria(detachedCriteria);
		}
	}
	
	/**
	 * @description 根据查询条件得到总记录
	 * @return List<BusStockBase>
	 * @param busStockInfo
	 * @param pageInfo
	 * @return
	 * @update 2013-6-25
	 */
	public int getSearchCount(BusStockBase busStockBase,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = getSearchCondition(busStockBase,pageInfo);
		return super.count(detachedCriteria);
	}

	public void deleteStocks(String ids) throws Exception {
		String hql = "delete from BusStockBase where id in ("+ ids +")";
		super.excuteHQL(hql);
	}

	public List<BusStockBase> findByIds(String ids) {
		String hql = "from BusStockBase where id in ("+ ids +")";
		return super.find(hql);
	}
	
	/**
	 * 
	 * 获取带查询要条件的分页信息
	 * @param hsql
	 * @param pageInfo
	 * @return
	 */
	public List<StockBaseDto> getStockBaseDtosForPage(String hql,PageInfo pageInfo) {
		List<StockBaseDto> list = new ArrayList<StockBaseDto>();
		Session session = null;
		try {		
			session = hibernateTemplate.getSessionFactory().openSession();
			list = session.createQuery(hql)
	    				.setFirstResult(pageInfo.getFirstRecord())
	    					.setMaxResults(pageInfo.getPageSize()).list();
			session.close();				
		}catch(Exception e){
			e.printStackTrace();
			session.close();
		}		 
	    return list;  
	}
	
	/**
	 * 
	 * 获取带查询要条件的信息
	 * @param hsql
	 * @return
	 */
	public List<StockBaseDto> getStockBaseDtos(String hql) {
		List<StockBaseDto> list = new ArrayList<StockBaseDto>();
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

	public List<StockBaseDto> getStockBaseInfo(PageInfo pageInfo) {
		String hql ="select new cn.com.fsun.bus.dto.StockBaseDto(a.id, a.name, a.artNum, a.image, " +
				"a.rackNum, a.storeId, a.customerCode,(select b.name from BusCustomerInfo b where a.customerCode = b.code), a.description) " +
				"from BusStockBase a ";
		if(pageInfo!=null && pageInfo.getPageSize()>0){
			return this.getStockBaseDtosForPage(hql, pageInfo);
		}else{
			return this.getStockBaseDtos(hql);
		}
	}
	
}
