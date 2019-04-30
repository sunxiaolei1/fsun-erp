package cn.com.fsun.bus.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Property;
import org.springframework.stereotype.Repository;

import cn.com.fsun.bus.domain.BusMadeHeader;
import cn.com.fsun.bus.domain.BusProxyOrderHeader;
import cn.com.fsun.common.dao.BaseDao;
import cn.com.fsun.common.utils.PageInfo;

/**
 * 
 * @author sunxiaolei
 *
 */
@Repository
public class ProxyOrderHeaderDao extends BaseDao<BusProxyOrderHeader> {

	/**
	 * @description 组装查询条件
	 * @return DetachedCriteria
	 * @param header
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public DetachedCriteria getSearchCondition(BusProxyOrderHeader header, PageInfo pageInfo){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(BusProxyOrderHeader.class);
		
		if(null!=header){
			//查询条件
			if(null!=header.getProxyCode() && !"".equals(header.getProxyCode())){
				detachedCriteria.add(Property.forName("proxyCode").like(
						header.getProxyCode(),MatchMode.ANYWHERE));
			}
			if(null!=header.getProxyType() && !"".equals(header.getProxyType())){
				detachedCriteria.add(Property.forName("proxyType").eq(header.getProxyType()));
			}
			if(null!=header.getCustomerCode() && !"".equals(header.getCustomerCode())){
				detachedCriteria.add(Property.forName("customerCode").eq(header.getCustomerCode()));
			}
		}
		if(null != pageInfo.getSortColumn() && !"".equals(pageInfo.getSortColumn())){
			if("DESC".equals(pageInfo.getSortType().toUpperCase()))
				detachedCriteria.addOrder(Order.desc(pageInfo.getSortColumn()));
			else
				detachedCriteria.addOrder(Order.asc(pageInfo.getSortColumn()));
		}else{
			detachedCriteria.addOrder(Order.desc("createTime"));
		}		
		return detachedCriteria;
	}
	
	/**
	 * @description 根据查询条件查询结果
	 * @return List<BusProxyOrderHeader>
	 * @param header
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public List<BusProxyOrderHeader> search(BusProxyOrderHeader header,PageInfo pageInfo,boolean isPage){
		DetachedCriteria detachedCriteria = getSearchCondition(header,pageInfo);
		if(isPage){
			return super.hibernateTemplate.findByCriteria(detachedCriteria, pageInfo.getFirstRecord(), pageInfo.getPageSize());
		}else{
			return super.hibernateTemplate.findByCriteria(detachedCriteria);
		}
	}

	/**
	 * 通过code码删除加工单
	 * TODO
	 * @Title deleteEntry   
	 * @param madeCode
	 * @throws Exception void
	 */
	public void deleteEntry(String code) throws Exception {
		  
		String sql= " DELETE header, detail FROM bus_proxy_order_header header "
				+ " LEFT JOIN bus_proxy_order_detail detail "
				+ " on detail.proxy_code = header.proxy_code "
				+ " where header.proxy_code = '"+ code +"'";
		this.excuteSQL(sql);		
	}

	/**
	 * 生成加工单编号
	 * TODO
	 * @Title getInitCode   
	 * @param sign
	 * @return Long
	 */
	public Long getInitCode(String sign) {
		  
		String hql ="select a.proxyCode from BusProxyOrderHeader a where a.proxyCode like '"+ sign +"%' order by a.proxyCode desc ";
		List<String> list = super.find(hql);
		if(list!=null && list.size()>0){
			return Long.valueOf(list.get(0))+1;
		}else{	
			return Long.valueOf(sign+"00000")+1;
		}
	}

}
