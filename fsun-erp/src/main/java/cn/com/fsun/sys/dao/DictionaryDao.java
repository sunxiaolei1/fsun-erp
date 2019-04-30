package cn.com.fsun.sys.dao;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Property;
import org.springframework.stereotype.Repository;

import cn.com.fsun.common.dao.BaseDao;
import cn.com.fsun.common.utils.PageInfo;
import cn.com.fsun.sys.domain.Dictionary;

@Repository
public class DictionaryDao extends BaseDao<Dictionary>{

	/**
	 * @description 根据父亲节点查找子集
	 * @return List<Dictionary>
	 * @param dictionary
	 * @update 2012-9-4
	 */
	public List<Dictionary> getChildren(Integer pid){
		Criteria criteria = this.getSession().createCriteria(Dictionary.class);
		if(null!=pid && !"".equals(pid)){
			criteria.add(Property.forName("pid").eq(pid));
		}else{
			criteria.add(Property.forName("pid").isNull());
		}
		criteria.add(Property.forName("enabled").eq(true));
		criteria.addOrder(Order.asc("sequence"));
		return criteria.list();
	}
	
	/**
	 * @description 通过key获取父节点
	 * @return List<Dictionary>
	 * @param dictionary
	 * @update 2012-9-4
	 */
	public Dictionary getNodeByKey(String key){
		Criteria criteria = this.getSession().createCriteria(Dictionary.class);
		if(StringUtils.isNotEmpty(key)){
			criteria.add(Property.forName("key").eq(key));
		}
		return (Dictionary) criteria.uniqueResult();
	}
	
	/**
	 * @description 组装查询条件
	 * @return DetachedCriteria
	 * @param admin
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public DetachedCriteria getSearchCondition(Dictionary dictionary,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Dictionary.class);
		
		if(null!=dictionary){
			//查询条件
			if(null!=dictionary.getKey() && !"".equals(dictionary.getKey())){
				detachedCriteria.add(Property.forName("key").eq(dictionary.getKey()));	
			}
		}
		if(null != pageInfo.getSortColumn() && !"".equals(pageInfo.getSortColumn())){
			if("DESC".equals(pageInfo.getSortType().toUpperCase()))
				detachedCriteria.addOrder(Order.desc(pageInfo.getSortColumn()));
			else
				detachedCriteria.addOrder(Order.asc(pageInfo.getSortColumn()));
		}
		detachedCriteria.add(Property.forName("enabled").eq(true));
		return detachedCriteria;
	}
	
	/**
	 * @description 根据查询条件查询结果
	 * @return List<Dictionary>
	 * @param dictionary
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public List<Dictionary> search(Dictionary dictionary,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = getSearchCondition(dictionary,pageInfo);
		List<Dictionary> list = super.hibernateTemplate.findByCriteria(detachedCriteria, pageInfo.getFirstRecord(), pageInfo.getPageSize());
		return list;
	}
	
	/**
	 * @description 根据查询条件得到总记录
	 * @return List<Dictionary>
	 * @param dictionary
	 * @param pageInfo
	 * @return
	 * @update 2013-6-25
	 */
	public List<Dictionary> getSearchCount(Dictionary dictionary,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = getSearchCondition(dictionary,pageInfo);
		List<Dictionary> list = super.hibernateTemplate.findByCriteria(detachedCriteria);
		return list;
	}
}
