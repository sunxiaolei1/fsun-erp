package cn.com.fsun.bus.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.poi.ss.formula.functions.T;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import cn.com.fsun.bus.dto.DetailSummary;
import cn.com.fsun.common.dao.BaseDao;
import cn.com.fsun.common.utils.PageInfo;

@Repository
public class DetailSummaryDao extends BaseDao<T>{
	
	/**
	 * 
	 * 获取带查询要条件的分页信息
	 * @param hsql
	 * @param pageInfo
	 * @return
	 */
	public List<DetailSummary> findDetailSummaryForPage(String hsql,PageInfo pageInfo) {
		List<DetailSummary> list = new ArrayList<DetailSummary>();
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
	 * 获取带查询要条件的信息
	 * @param hsql
	 * @return
	 */
	public List<DetailSummary> findDetailSummary(String hsql) {
		List<DetailSummary> list = new ArrayList<DetailSummary>();
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
	 * 
	 * 获取带查询要条件的信息
	 * @param hsql
	 * @return
	 */
	public List<Object> findExcelExport(String hsql) {
		List<Object> list = new ArrayList<Object>();
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

	public List<List<Object>> findForPage(String hql, PageInfo pageInfo) {
		List<Object> list = null;
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
		
		List<List<Object>> ddd = new ArrayList<List<Object>>(); 
		List<Object> ll = null;
		Object[] obj = null;
		if(list!=null){
			for (int i = 0; i < list.size(); i++) {
				obj = (Object[])list.get(i);
				ll = new ArrayList<Object>();
				for (int j = 0; j < obj.length; j++) {
					ll.add(obj[j]!=null?obj[j] : "");
				}
				ddd.add(ll);			
			}
		}
		return ddd;
	}
	

}
