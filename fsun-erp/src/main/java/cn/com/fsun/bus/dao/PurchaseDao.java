package cn.com.fsun.bus.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Property;
import org.springframework.stereotype.Repository;

import cn.com.fsun.bus.domain.BusOrderInfo;
import cn.com.fsun.bus.domain.BusPurchaseInfo;
import cn.com.fsun.bus.dto.PurchaseDto;
import cn.com.fsun.common.dao.BaseDao;
import cn.com.fsun.common.pageInfo.PageInfo;

@Repository
public class PurchaseDao extends BaseDao<BusPurchaseInfo> {

	
	/**
	 * @description 组装查询条件
	 * @return DetachedCriteria
	 * @param admin
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public DetachedCriteria getSearchCondition(BusPurchaseInfo purchaseInfo,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(BusOrderInfo.class);
		
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
	 * @description 根据查询条件得到总记录
	 * @return List<BusPurchaseInfo>
	 * @param user
	 * @param pageInfo
	 * @return
	 * @update 2013-6-25
	 */
	public List<BusPurchaseInfo> getSearchCount(BusPurchaseInfo purchaseInfo,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = getSearchCondition(purchaseInfo,pageInfo);
		List<BusPurchaseInfo> list = super.hibernateTemplate.findByCriteria(detachedCriteria);
		return list;
	}
	
	/**
	 * 
	 * 获取带查询要条件的订单信息(可分页)
	 * @param hsql
	 * @param pageInfo
	 * @return
	 */
	public List<PurchaseDto> findPurchase(String hsql,PageInfo pageInfo) {
		List<PurchaseDto> list = new ArrayList<PurchaseDto>();
		Session session = null;
		try {			
			session = hibernateTemplate.getSessionFactory().openSession();
			if(pageInfo!=null && pageInfo.getPage()!=null && pageInfo.getRows()!=null &&
					pageInfo.getPage()>0 && pageInfo.getRows()>=0){
				list = session.createQuery(hsql)
	    				.setFirstResult((pageInfo.getPage()-1)*pageInfo.getRows())
	    					.setMaxResults(pageInfo.getRows()).list();
			}else{
				list = session.createQuery(hsql).list();
			}
			session.close();			
		}catch(Exception e){
			e.printStackTrace();
			session.close();
		}	 
	    return list;  
	}

	public Long getInitId(String currDate) {
		String hql ="select a.id from BusPurchaseInfo a where a.id like '"+ currDate +"%' order by a.id desc ";
		List<String> list = super.find(hql);
		if(list!=null && list.size()>0){
			return Long.valueOf(list.get(0))+1;
		}else{	
			return Long.valueOf(currDate+"0000")+1;
		}	
	}

	/**
	 * 通过id获取purchaseDto对象
	 * @param id
	 * @return
	 */
	public PurchaseDto loadToDto(String id) {
		String hql = "select new cn.com.fsun.bus.dto.PurchaseDto(a.id,a.setWay,a.allPrice,a.carriage, "
				+ " a.description,a.enabled,"
				+ "(select user.realname from User user where user.id = a.createManId),a.createTime,a.expire,a.storeId, " 
				+ "(select storeInfo.name from BusStore storeInfo where storeInfo.id = a.storeId),a.consignee) " 
				+ " from BusPurchaseInfo a where a.id = '" + id + "' ";
		List<PurchaseDto> purchaseDtos = this.find(hql);
		if(purchaseDtos!=null && purchaseDtos.size()==1){
			return purchaseDtos.get(0);
		}
		return null;
	}
	
}
