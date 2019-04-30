package cn.com.fsun.sys.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Property;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.BeanPropertyRowMapper;

import cn.com.fsun.common.dao.BaseDao;
import cn.com.fsun.common.utils.PageInfo;
import cn.com.fsun.sys.domain.Power;

import java.sql.PreparedStatement;


 

/*
 * @author lw
 */

@Repository
public class PowerDao extends BaseDao<Power> {
    
	private JdbcTemplate jdbcTemplate;
	
	/**
	 * @description 根据父亲节点查找子集
	 * @return List<Power>
	 * @param power
	 * @update 2012-9-4
	 */
	public List<Power> getChildren(String pid){
		Criteria criteria = this.getSession().createCriteria(Power.class);
		if(StringUtils.isNotEmpty(pid)){
			criteria.add(Property.forName("pid").eq(pid));
		}else{
			criteria.add(Property.forName("pid").isNull());
		}
		return criteria.list();
	}
	
	/**
	 * @description 组装查询条件
	 * @return DetachedCriteria
	 * @param admin
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public DetachedCriteria getSearchCondition(Power power,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Power.class);
		if(null!=power){
			//查询条件
			if(null!=power.getMenuId() && !"".equals(power.getMenuId())){
				detachedCriteria.add(Property.forName("menuId").eq(
						power.getMenuId()));	
			}
			
			if(null!=power.getName()&& !"".equals(power.getName())){
				detachedCriteria.add(Property.forName("name").like(
						power.getName(),MatchMode.ANYWHERE));
			}
			if(null != power.getCode() && !"".equals(power.getCode())){
				detachedCriteria.add(Property.forName("code").like(
						power.getCode(),MatchMode.ANYWHERE));
			} 
		}
		if(null != pageInfo.getSortColumn() && !"".equals(pageInfo.getSortColumn())){
			if("DESC".equals(pageInfo.getSortType().toUpperCase()))
				detachedCriteria.addOrder(Order.desc(pageInfo.getSortColumn()));
			else
				detachedCriteria.addOrder(Order.asc(pageInfo.getSortColumn()));
		}
		detachedCriteria.addOrder(Order.desc("createTime"));
		return detachedCriteria;
	}
	
	/**
	 * @description 根据查询条件查询结果
	 * @return List<Power>
	 * @param power
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public List<Power> search(Power power,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = getSearchCondition(power,pageInfo);
		List<Power> list = super.hibernateTemplate.findByCriteria(detachedCriteria, pageInfo.getFirstRecord(), pageInfo.getPageSize());
		return list;
	}
	/**
	 * @description 根据查询条件得到总记录
	 * @return List<Power>
	 * @param power
	 * @param pageInfo
	 * @return
	 * @update 2013-6-25
	 */
	public List<Power> getSearchCount(Power power,PageInfo pageInfo){
		DetachedCriteria detachedCriteria = getSearchCondition(power,pageInfo);
		List<Power> list = super.hibernateTemplate.findByCriteria(detachedCriteria);
		return list;
	}
	
	
	  //报表的导出
    public List<Power> getPower() {  
        String sql = "SELECT * FROM sys_power";  
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Power>());  
   
    }  
	
	
    //报表的插入
    public int[] insertPower(final List<Power> list) {  
        String sql = "INSERT INTO sys_power (id,name) VALUES(null,?)"; 
        return jdbcTemplate.batchUpdate(sql, new BatchPreparedStatementSetter() {
            public void setValues(PreparedStatement ps, int index) throws SQLException {
                Power power = list.get(index);
                ps.setString(1,power.getId());
                ps.setString(2,power.getName());
               
            }
            public int getBatchSize() {
                return list.size();
            }
        });
    }

	
 
}

 
		 
		
	

