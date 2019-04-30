package cn.com.fsun.sys.dao;

import java.text.SimpleDateFormat;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import cn.com.fsun.common.dao.BaseDao;
import cn.com.fsun.common.utils.PageInfo;
import cn.com.fsun.sys.domain.Log;


/*
 * @author lw
 */

@Repository
public class LogDao extends BaseDao<Log> {

	
	/**
	 * @description 组装查询条件
	 * @return DetachedCriteria
	 * @param admin
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public DetachedCriteria getSearchCondition(Log log,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Log.class);
		
		if(null!=log){
			//查询条件
			if(null!=log.getOperateType() && !"".equals(log.getOperateType())){
				detachedCriteria.add(Property.forName("operateType").eq(
						log.getOperateType()));	
			}
			if(null!=pageInfo.getStartDate() && null!=pageInfo.getEndDate()){
				detachedCriteria.add(Property.forName("operateTime").ge(pageInfo.getStartDate()));
				detachedCriteria.add(Property.forName("operateTime").le(pageInfo.getEndDate()));	
			}
		}
		if(null != pageInfo.getSortColumn() && !"".equals(pageInfo.getSortColumn())){
			if("DESC".equals(pageInfo.getSortType().toUpperCase()))
				detachedCriteria.addOrder(Order.desc(pageInfo.getSortColumn()));
			else
				detachedCriteria.addOrder(Order.asc(pageInfo.getSortColumn()));
		}
		detachedCriteria.addOrder(Order.desc("operateTime"));
		return detachedCriteria;
	}
	
	/**
	 * @description 根据查询条件查询结果
	 * @return List<Log>
	 * @param log
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public List<Log> search(Log log,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = getSearchCondition(log,pageInfo);
		List<Log> list = super.hibernateTemplate.findByCriteria(detachedCriteria, pageInfo.getFirstRecord(), pageInfo.getPageSize());
		return list;
	}
	
	/**
	 * @description 根据查询条件得到总记录
	 * @return List<Log>
	 * @param log
	 * @param pageInfo
	 * @return
	 * @update 2013-6-25
	 */
	public List<Log> getSearchCount(Log log,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = getSearchCondition(log,pageInfo);
		List<Log> list = super.hibernateTemplate.findByCriteria(detachedCriteria);
		return list;
	}
}
