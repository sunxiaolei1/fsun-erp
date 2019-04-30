package cn.com.fsun.bus.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Property;
import org.springframework.stereotype.Repository;

import cn.com.fsun.bus.domain.BusOrderDetail;
import cn.com.fsun.bus.dto.OrderDetailDto;
import cn.com.fsun.common.dao.BaseDao;
import cn.com.fsun.common.utils.PageInfo;
import cn.com.fsun.common.utils.StringUtils;

@Repository
public class OrderDetailDao extends BaseDao<BusOrderDetail> {

	
	/**
	 * @description 组装查询条件
	 * @return DetachedCriteria
	 * @param admin
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public DetachedCriteria getSearchCondition(BusOrderDetail orderDetail,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(BusOrderDetail.class);
		
		if(null!=orderDetail){
			//查询条件
			if(null!=orderDetail.getOrderId() && !"".equals(orderDetail.getOrderId())){
				detachedCriteria.add(Property.forName("orderId").eq(orderDetail.getOrderId()));
			}
		}
		if(null != pageInfo.getSortColumn() && !"".equals(pageInfo.getSortColumn())){
			if("DESC".equals(pageInfo.getSortType().toUpperCase()))
				detachedCriteria.addOrder(Order.desc(pageInfo.getSortColumn()));
			else
				detachedCriteria.addOrder(Order.asc(pageInfo.getSortColumn()));
		}
		detachedCriteria.addOrder(Order.desc("productCode"));
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
	public List<BusOrderDetail> search(BusOrderDetail orderDetail,PageInfo pageInfo,boolean isPage){
		DetachedCriteria detachedCriteria = getSearchCondition(orderDetail,pageInfo);
		if(isPage){
			return super.hibernateTemplate.findByCriteria(detachedCriteria, pageInfo.getFirstRecord(), pageInfo.getPageSize());
		}else{
			return super.hibernateTemplate.findByCriteria(detachedCriteria);
		}
	}

		
	/**
	 * 
	 * 获取带查询要条件的进货分页信息(库存信息)
	 * @param hsql
	 * @param pageInfo
	 * @return
	 */
	public List<OrderDetailDto> findOrderDetailForPage(String hsql,PageInfo pageInfo) {
		List<OrderDetailDto> list = new ArrayList<OrderDetailDto>();
		Session session = null;
		try {		
			session = hibernateTemplate.getSessionFactory().openSession();
			list = session.createQuery(hsql)
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
	 * 获取带查询要条件的进货信息(库存信息)
	 * @param hsql
	 * @return
	 */
	public List<OrderDetailDto> findOrderDetail(String hsql) {
		List<OrderDetailDto> list = new ArrayList<OrderDetailDto>();
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

	public boolean existDetailByProductCode(String productCodes) {
		if(productCodes==null || "".equals(productCodes)){
			return true;
		}
		String hql = "select id  from BusOrderDetail where productCode in ("+ StringUtils.getStringToString(productCodes) +")";
		List list = this.find(hql);
		if(list!=null && list.size()>0){
			return true;
		}
		return false;
	}

	/**
	 * 通过产品编号查找对应的订单id
	 * TODO
	 * @Title getOrderIdsByProductCode   
	 * @param productCode
	 * @return List<String>
	 */
	public List<String> getOrderIdsByProductCode(String productCode) {
		  
		if(productCode==null || "".equals(productCode)){
			return null;
		}
		String hql = "select orderId  from BusOrderDetail where productCode = '"+ productCode +"'";
		return this.find(hql);
	}

	/**
	 * 通过订单号删除对应的明细
	 * TODO
	 * @Title deleteByOrderCode   
	 * @param orderCode
	 * @throws Exception void
	 */
	public void deleteByOrderCode(String orderCode) throws Exception {
		  
		String hql = "delete from BusOrderDetail where orderCode = '"+ orderCode +"'";
		this.excuteHQL(hql);
	}
	
}

