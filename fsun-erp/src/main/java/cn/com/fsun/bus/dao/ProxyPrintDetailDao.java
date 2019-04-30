package cn.com.fsun.bus.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import cn.com.fsun.bus.domain.BusProxyPrintDetail;
import cn.com.fsun.bus.dto.ProxySummaryDto;
import cn.com.fsun.common.dao.BaseDao;
import cn.com.fsun.common.utils.PageInfo;

@Repository
public class ProxyPrintDetailDao extends BaseDao<BusProxyPrintDetail> {

	/**
	 * 根据加工单号批量删除
	 * @param proxyCode
	 * @throws RuntimeException
	 */
	public void deleteByProxyCode(String proxyCode) throws RuntimeException {
		
		try {
			String hql = "delete from BusProxyPrintDetail where proxyCode = '"+ proxyCode+"'";
			this.excuteHQL(hql);
		} catch (Exception e) {
			throw new RuntimeException();
		}			
	}
	
	
	/**
	 * 
	 * @param hql
	 * @param pageInfo
	 * @return
	 */
	public List<ProxySummaryDto> findDetailSummaryForPage(String hql, PageInfo pageInfo) {
		List list = new ArrayList();
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
	 * @param hql
	 * @return
	 */
	public List<ProxySummaryDto> findDetailSummary(String hql) {
		List list = new ArrayList();
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
