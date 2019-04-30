package cn.com.fsun.bus.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.com.fsun.bus.domain.BusStore;
import cn.com.fsun.common.dao.BaseDao;
import cn.com.fsun.common.utils.StringUtils;

/*
 * @author sunxl
 */

@Repository
public class StoreDao extends BaseDao<BusStore> {

	public List<BusStore> listEnabled() {

		String hql = " from BusStore where disable = false ";
		return super.find(hql);
	}
	
	public List<BusStore> listDisabled() {
		String hql = " from BusStore where disable = true ";
		return super.find(hql);
	}

	public void deleteStore(int id) throws Exception {
		String hql = "delete from BusStore where id = "+id;
		super.excuteHQL(hql);
	}
	
	public void deleteStores(Integer[] ids) throws Exception {		
		if(ids.length>0){
			String hql = " delete from BusStore where id in ("+StringUtils.arrayToString(ids, ",")+")";			
			super.excuteHQL(hql);		
		}	
	}

	public void disableStore(int id) throws Exception {
		storeChangeStatus(id,true);
	}

	public void disableStores(Integer[] ids) throws Exception {
		this.storesChangeStatus(ids,true);
	}

	public void enableStore(int id) throws Exception {
		storeChangeStatus(id,false);
	}

	public void enableStores(Integer[] ids) throws Exception {
		this.storesChangeStatus(ids,false);
	}
	
	/**
	 * 修改单个集群的状态
	 * @param id
	 * @param disabled
	 * @throws Exception 
	 */
	private void storeChangeStatus(int id,boolean disabled) throws Exception{
		String hql = "update BusStore set disable = " + disabled + " where id = "+id;
		super.excuteHQL(hql);
	}	
	
	/**
	 * 修改多个集群的状态
	 * @param id
	 * @param disabled
	 * @throws Exception 
	 */
	private void storesChangeStatus(Integer[] ids,boolean disabled) throws Exception{
		if(ids.length>0){
			String hql = "update BusStore set disable = " + disabled + " where id in ("+StringUtils.arrayToString(ids, ",")+")";			
			super.excuteHQL(hql);		
		};
	}

	public List<BusStore> getStoresByIds(Integer[] ids) {
		String hql = "from BusStore where id in ("+StringUtils.arrayToString(ids, ",")+")";
		return super.find(hql);
	}
	
}