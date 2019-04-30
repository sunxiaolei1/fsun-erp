package cn.com.fsun.bus.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Property;
import org.springframework.stereotype.Repository;

import cn.com.fsun.bus.domain.BusMaterielInfo;
import cn.com.fsun.common.dao.BaseDao;
import cn.com.fsun.common.pageInfo.PageInfo;

@Repository
public class MaterielDao extends BaseDao<BusMaterielInfo> {

	
	/**
	 * @description 组装查询条件
	 * @return DetachedCriteria
	 * @param materielInfo
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public DetachedCriteria getSearchCondition(BusMaterielInfo materielInfo,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(BusMaterielInfo.class);
		
		if(materielInfo!=null){
		    if(materielInfo.getClassifyId()!=null){
		    	detachedCriteria.add(Property.forName("classifyId").eq(materielInfo.getClassifyId()));
		    }
		    if(materielInfo.getName()!=null && !"".equals(materielInfo.getName())){
		    	detachedCriteria.add(Property.forName("name").like(materielInfo.getName(),MatchMode.ANYWHERE));
		    }
		}
		if(pageInfo!=null && null != pageInfo.getSort() && !"".equals(pageInfo.getSort())){
			if("DESC".equals(pageInfo.getOrder().toUpperCase()))
				detachedCriteria.addOrder(Order.desc(pageInfo.getSort()));
			else
				detachedCriteria.addOrder(Order.asc(pageInfo.getSort()));
		}
		detachedCriteria.addOrder(Order.desc("id"));
		detachedCriteria.add(Property.forName("enabled").eq(true));	
		return detachedCriteria;
	}
	
	/**
	 * @description 根据查询条件查询结果
	 * @return List<BusBuyInfo>
	 * @param materielInfo
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public List<BusMaterielInfo> search(BusMaterielInfo materielInfo,PageInfo pageInfo){
		List<BusMaterielInfo> list = null;
		DetachedCriteria detachedCriteria = getSearchCondition(materielInfo,pageInfo);
		if(pageInfo!=null && pageInfo.getPage()!=null && pageInfo.getRows()!=null &&
				pageInfo.getPage()>0 && pageInfo.getRows()>=0){
			list = super.hibernateTemplate.findByCriteria(detachedCriteria, (pageInfo.getPage()-1)*pageInfo.getRows(), pageInfo.getRows());
		}else{
			list = super.hibernateTemplate.findByCriteria(detachedCriteria);
		}
		return list;
	}
	
	/**
	 * 根据条件获取材料总数
	 * @param materielInfo
	 * @param pageInfo
	 * @return
	 */
	public int getSearchCount(BusMaterielInfo materielInfo,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = getSearchCondition(materielInfo,pageInfo);
		int count = super.count(detachedCriteria);
		return count;
	}

	/**
	 * 修改单个物料的状态
	 * @param id
	 * @param disabled
	 * @throws Exception 
	 */
	public void materielChangeStatus(Long id, boolean disabled) throws Exception{
		String hql = "update BusMaterielInfo set enabled = " + disabled + " where id = "+ id;
		this.excuteHQL(hql);
	}	
	
	/**
	 * @description 通过物料分类id判别是否已在物料信息中
	 * @return boolean
	 * @param classifyId
	 */
	public boolean classifyUsed(Long classifyId){
		String hql = "select id from BusMaterielInfo where classifyId = "+ classifyId;
		List list = this.find(hql);
		if(list!=null && list.size()>0){
			return true;
		}
		return false;
	}
	
}


