package cn.com.fsun.bus.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import cn.com.fsun.bus.domain.BusAfterProcess;
import cn.com.fsun.common.dao.BaseDao;

@Repository
public class AfterProcessDao extends BaseDao<BusAfterProcess>{

	/**
	 * 
	 * 获取带查询要条件的信息
	 * @param hsql
	 * @return
	 */
	public List<BusAfterProcess> getProcessByProductId(String productId) {
		String hql = " from BusAfterProcess where productId ='"+ productId +"'";
		List<BusAfterProcess> list = new ArrayList<BusAfterProcess>();
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
