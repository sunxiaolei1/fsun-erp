package cn.com.fsun.bus.dao;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import cn.com.fsun.bus.domain.BusOutsideImages;
import cn.com.fsun.common.dao.BaseDao;

@Repository
public class OutsideImagesDao extends BaseDao<BusOutsideImages>{

	public void deleteByOutSideIds(List<String> idList) throws Exception {
		if(idList!=null && idList.size()>0){
			String outSideIds = "'"+StringUtils.collectionToDelimitedString(idList, "','")+"'";
			String hql = " delete from BusOutsideImages where outSideId in (" + outSideIds + ")";
			super.excuteHQL(hql);	
		}
	}

	
}
