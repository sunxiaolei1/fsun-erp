package cn.com.fsun.bus.dao;

import java.util.List;

import org.apache.poi.ss.formula.functions.T;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import cn.com.fsun.common.dao.BaseDao;

@Repository
public class SummaryDao extends BaseDao<T>{

	/**
	 * 
	 * 通过SQL获取汇总列表(不分页)
	 * @param hsql
	 * @return
	 */
	public List getSummaryListBySQL(String sql) {
		List list = null;
		Session session = null;
		try {
			session = hibernateTemplate.getSessionFactory().openSession();
			list = session.createSQLQuery(sql).list();
			session.close();
		}catch(Exception e){
			e.printStackTrace();
			session.close();
		}
		return list;
	}
	
	/**
	 * 
	 * 通过HQL获取汇总列表(不分页)
	 * @param hsql
	 * @return
	 */
	public List getSummaryListByHQL(String hql) {
		List list = null;
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
