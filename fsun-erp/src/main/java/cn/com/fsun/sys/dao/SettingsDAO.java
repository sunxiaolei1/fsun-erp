package cn.com.fsun.sys.dao;

import java.util.List;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Property;
import org.springframework.stereotype.Repository;

import cn.com.fsun.common.dao.BaseDao;
import cn.com.fsun.common.utils.PageInfo;
import cn.com.fsun.sys.domain.Settings;


@Repository
public class SettingsDAO extends BaseDao<Settings> {

	private static SettingsDAO settingsDao = null; 
	
	public static SettingsDAO getInstance(){
		if(settingsDao!=null){
			return settingsDao;
		}else{
			return new SettingsDAO();
		}
	}
	
	public SettingsDAO(){
		super(Settings.class);
	}
	
	public List<Settings> search(Settings settings,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = getSearchCondition(settings, pageInfo);
		List<Settings> list = super.hibernateTemplate.findByCriteria(detachedCriteria,pageInfo.getFirstRecord(),pageInfo.getPageSize());
		return list;
	}
	
	public DetachedCriteria getSearchCondition(Settings settings,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Settings.class);
		if(null!=settings){
			//查询条件
//			if(null!=settings.getName()&& !"".equals(settings.getName())){
//				detachedCriteria.add(Property.forName("name").like(
//						settings.getName(),MatchMode.ANYWHERE));
//			}
//			if(null != settings.getCode() && !"".equals(settings.getCode())){
//				detachedCriteria.add(Property.forName("code").like(
//						settings.getCode(),MatchMode.ANYWHERE));
//			}
		}
		if(null != pageInfo.getSortColumn() && !"".equals(pageInfo.getSortColumn())){
			if("DESC".equals(pageInfo.getSortType().toUpperCase()))
				detachedCriteria.addOrder(Order.desc(pageInfo.getSortColumn()));
			else
				detachedCriteria.addOrder(Order.asc(pageInfo.getSortColumn()));
		}
		return detachedCriteria;
	}
	
	public int searchCount(Settings settings,PageInfo pageInfo){
		return count(getSearchCondition(settings, pageInfo));
	}
	
	public List<Settings> list(){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Settings.class);
		List<Settings> list = super.hibernateTemplate.findByCriteria(detachedCriteria);
		return list;
	}
	
	public Settings loadByCode(String code){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Settings.class);
		detachedCriteria.add(Property.forName("code").eq(code));
		List<Settings> list = super.hibernateTemplate.findByCriteria(detachedCriteria);
		if(null != list && 1== list.size()){
			return list.get(0);
		}
		else
		return null;
	}
	
	public String getValueByCode(String code){
		Settings settings = loadByCode(code);
		if(settings == null)
			return null;
		else {
			return settings.getValue();
		}
	}
	
}
