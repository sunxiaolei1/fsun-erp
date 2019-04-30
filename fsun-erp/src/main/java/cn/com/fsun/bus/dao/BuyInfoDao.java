package cn.com.fsun.bus.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Property;
import org.springframework.stereotype.Repository;

import cn.com.fsun.bus.domain.BusBuyInfo;
import cn.com.fsun.bus.dto.BuyDetailDto;
import cn.com.fsun.bus.dto.BuyInfoDto;
import cn.com.fsun.common.dao.BaseDao;
import cn.com.fsun.common.pageInfo.PageInfo;
import cn.com.fsun.common.utils.StringUtils;

@Repository
public class BuyInfoDao extends BaseDao<BusBuyInfo> {

	
	/**
	 * @description 组装查询条件
	 * @return DetachedCriteria
	 * @param admin
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public DetachedCriteria getSearchCondition(BusBuyInfo buyInfo,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(BusBuyInfo.class);
		
		if(null!=buyInfo){
			//查询条件
			if(null!=buyInfo.getPurchaseId() && !"".equals(buyInfo.getPurchaseId())){
				detachedCriteria.add(Property.forName("purchaseId").eq(buyInfo.getPurchaseId()));
			}
		}
		if(pageInfo!=null && null != pageInfo.getSort() && !"".equals(pageInfo.getSort())){
			if("DESC".equals(pageInfo.getOrder().toUpperCase()))
				detachedCriteria.addOrder(Order.desc(pageInfo.getSort()));
			else
				detachedCriteria.addOrder(Order.asc(pageInfo.getSort()));
		}
		detachedCriteria.addOrder(Order.desc("createTime"));
		return detachedCriteria;
	}
	
	/**
	 * @description 根据查询条件查询结果
	 * @return List<User>
	 * @param user
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public List<BusBuyInfo> search(BusBuyInfo buyInfo,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = getSearchCondition(buyInfo,pageInfo);
		List<BusBuyInfo> list = super.hibernateTemplate.findByCriteria(detachedCriteria, (pageInfo.getPage()-1)*pageInfo.getRows(), pageInfo.getRows());
		return list;
	}
	
	/**
	 *    List result = session.createQuery(hql)
                                         .setFirstResult(offset)
                                         .setMaxResults(pageSize)
                                         .list();
	 */
	
	/**
	 * @description 根据查询条件得到总记录
	 * @return List<User>
	 * @param user
	 * @param pageInfo
	 * @return
	 * @update 2013-6-25
	 */
	public List<BusBuyInfo> getSearchCount(BusBuyInfo buyInfo,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = getSearchCondition(buyInfo,pageInfo);
		List<BusBuyInfo> list = super.hibernateTemplate.findByCriteria(detachedCriteria);
		return list;
	}
	
	/**
	 * @description 根据进货ID查找进货对象
	 * @return User
	 * @param account
	 * @return
	 * @update 2012-9-28
	 */
	public BusBuyInfo loadBuyInfoById(String id){
		Criteria criteria = this.getSession().createCriteria(BusBuyInfo.class);
		criteria.add(Property.forName("id").eq(id));
		return (BusBuyInfo)criteria.uniqueResult();
	}

		
	/**
	 * 
	 * 获取带查询要条件的进货分页信息(库存信息)
	 * @param hsql
	 * @param pageInfo
	 * @return
	 */
	public List findBuyInfoForPage(String hsql,PageInfo pageInfo) {
		List list = new ArrayList();
		Session session = null;
		try {		
			session = hibernateTemplate.getSessionFactory().openSession();
			list = session.createQuery(hsql)
	    				.setFirstResult((pageInfo.getPage()-1)*pageInfo.getRows())
	    					.setMaxResults(pageInfo.getRows()).list();
			session.close();				
		}catch(Exception e){
			e.printStackTrace();
			session.close();
		}		 
	    return list;  
	}
	
	/**
	 * 
	 * 获取带查询要条件的进货信息(库存信息)
	 * @param hsql
	 * @return
	 */
	public List findBuyInfo(String hsql) {
		List list = new ArrayList();
		Session session = null;
		try {
			session = hibernateTemplate.getSessionFactory().openSession();
			list = session.createQuery(hsql).list();
			session.close();
		}catch(Exception e){
			e.printStackTrace();
			session.close();
		}
		return list;
	}

	/**
	 * 获取带查询要条件(采购单ID或者buyInfoIds)的进货信息（不分页）
	 * @param purchaseId
	 * @param buyInfoIds
	 * @return
	 */
	public List<BuyInfoDto> findBuyInfoByRequest(String purchaseId, String buyInfoIds) {
		String hql = "select new cn.com.fsun.bus.dto.BuyInfoDto(buyInfo.id, buyInfo.purchaseId, buyInfo.factoryId, "
				+ " (select factoryInfo.name from BusFactoryInfo factoryInfo where buyInfo.factoryId = factoryInfo.id), buyInfo.classifyId, "
				+ " (select classifyInfo.name from BusClassifyInfo classifyInfo where buyInfo.classifyId = classifyInfo.id), buyInfo.materielId, "
				+ " (select materielInfo.name from BusMaterielInfo materielInfo where buyInfo.materielId = materielInfo.id), buyInfo.number, buyInfo.unit, buyInfo.onePrice,"
				+ " buyInfo.allPrice, buyInfo.description, buyInfo.createManId, buyInfo.createTime, buyInfo.enabled, buyInfo.spec)" 
                + " from BusBuyInfo buyInfo ";
		
		String where = " where 1=1 ";
		if (purchaseId != null && !"".equals(purchaseId)) {
			where += " and buyInfo.purchaseId = '" + purchaseId + "' ";
		}
		if (buyInfoIds != null && !"".equals(buyInfoIds)) {
			where += " and buyInfo.id in (" + StringUtils.getStringToString(buyInfoIds) + ")";
		}
		return this.findBuyInfo(hql + where);
	}
	
	/**
	 * @description 通过物料id判别是否已下过单
	 * @return boolean
	 * @param materielId
	 */
	public boolean materielUsed(Long materielId){
		String hql = "select id from BusBuyInfo where materielId = "+ materielId;
		List list = this.findBuyInfo(hql);
		if(list!=null && list.size()>0){
			return true;
		}
		return false;
	}

	/**
	 * @description 通过工厂id判别是否已下过单
	 * @param factoryId
	 * @return
	 */
	public boolean factoryUsed(String factoryId) {
		String hql = "select id from BusBuyInfo where factoryId = '"+ factoryId +"'";
		List list = this.findBuyInfo(hql);
		if(list!=null && list.size()>0){
			return true;
		}
		return false;
	}
	
	
}

