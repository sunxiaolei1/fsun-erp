package cn.com.fsun.common.dao;

import java.io.Serializable;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Property;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.SessionFactoryUtils;
import org.springframework.stereotype.Repository;

import cn.com.fsun.common.utils.PageInfo;

/**
 * DAO基类，其它DAO可以直接继承这个DAO，不但可以复用共用的方法，还可以获得泛型的好处。
 */
@Repository
public class BaseDao<T>{

	private final Class<T> clazz;

	@Autowired
	protected HibernateTemplate hibernateTemplate;

	
	/**
	 * sunxiaolei 添加
	 * @param clazz
	 */
	public BaseDao(Class<T> clazz) {
		this.clazz = clazz;
	}
	
	/**
	 * 通过反射获取子类确定的泛型类
	 */
	public BaseDao() {
		Type genType = getClass().getGenericSuperclass();
		Type[] params = ((ParameterizedType) genType).getActualTypeArguments();
		clazz = (Class) params[0];
	}

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
    public  Session getSession() {
        return SessionFactoryUtils.getSession(hibernateTemplate.getSessionFactory(),true);
    }
    
	/**
	 * @description 根据ID查找对象
	 * @return T
	 * @param id
	 * @update 2012-8-9 下午4:12:13
	 */
	public T load(Serializable id) {
		if(null==id){
			return null;
		}
		T t = (T) hibernateTemplate.get(clazz, id);
		if (t == null) {
			return null;
		}
		return t;
	}
	
	/**
	 * @description 根据代码查找对象
	 * @return T
	 * @param code
	 * @update 2012-8-9 下午4:11:45
	 */
	public T loadByCode(String code) {
		DetachedCriteria dc = DetachedCriteria.forClass(clazz);
		if (null != code && !"".equals(code)) {
			dc.add(Property.forName("code").eq(code));
		}
		List<T> list = hibernateTemplate.findByCriteria(dc);
		if (null != list && list.size() == 1)
			return list.get(0);
		else
			return null;
	}
	
	/**
	 * @description 根据代码查找对象
	 * @return T
	 * @param code
	 * @update 2012-8-9 下午4:11:45
	 */
	public T loadByKey(String key) {
		DetachedCriteria dc = DetachedCriteria.forClass(clazz);
		if (null != key && !"".equals(key)) {
			dc.add(Property.forName("key").eq(key));
		}
		List<T> list = hibernateTemplate.findByCriteria(dc);
		if (null != list && list.size() == 1)
			return list.get(0);
		else
			return null;
	}
	
	public T loadByAttribute(String property,Object value) {
		DetachedCriteria dc = DetachedCriteria.forClass(clazz);
		if (null != property && !"".equals(property.trim())) {
			dc.add(Property.forName(property).eq(value));
		}
		@SuppressWarnings("unchecked")
		List<T> list = (List<T>) hibernateTemplate.findByCriteria(dc);
		if (null != list && list.size() == 1)
			return list.get(0);
		else
			return null;
	}
	
	public T loadByAttributes(Map<String, Object> properties) {
		if(properties==null||properties.isEmpty()){
			return null;
		}
		
		DetachedCriteria dc = DetachedCriteria.forClass(clazz);
		for(Iterator<Map.Entry<String, Object>> iter = 
			properties.entrySet().iterator();iter.hasNext();){
			Map.Entry<String, Object> me = iter.next();
			String property = me.getKey();
			if (null != property && !"".equals(property.trim())) {
				dc.add(Property.forName(property).eq(me.getValue()));
			}
		}
		
		@SuppressWarnings("unchecked")
		List<T> list = (List<T>) hibernateTemplate.findByCriteria(dc);
		if (null != list && list.size() == 1)
			return list.get(0);
		else
			return null;
	}
	
	
	//settingDao中使用
	public boolean forbid(String id) {
		T t = load(id);
		if (null != t) {
			try {
				Method method = t.getClass().getDeclaredMethod("setInuse",
						boolean.class);
				method.invoke(t, false);
				update(t);
				return true;
			} catch (Exception e) {
				// TODO: handle exception
				return false;
			}
		} else {
			return false;
		}
	}

	//settingDao中使用
	public boolean startup(String id) {
		T t = load(id);
		if (null != t) {
			try {
				Method method = t.getClass().getDeclaredMethod("setInuse",
						boolean.class);
				method.invoke(t, true);
				update(t);
				return true;
			} catch (Exception e) {
				// TODO: handle exception
				return false;
			}
		} else {
			return false;
		}
	}
	
	public List<T> listByIds(String[] ids) {
		if (null == ids)
			return null;
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(clazz);
		detachedCriteria.add(Property.forName("id").in(ids));
		return hibernateTemplate.findByCriteria(detachedCriteria);
	}
	
	public List<T> listByIds(Long[] ids) {
		if (null == ids)
			return null;
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(clazz);
		detachedCriteria.add(Property.forName("id").in(ids));
		return hibernateTemplate.findByCriteria(detachedCriteria);
	}

	public void deleteByIds(String[] ids) {
		if (null != ids) {
			List<T> list = listByIds(ids);
			hibernateTemplate.deleteAll(list);
		}
	}
	
	/**
	 * @description 记录条数
	 * @return int
	 * @param detachedCriteria
	 * @update 2012-8-9 下午4:11:23
	 */
	public int count(DetachedCriteria detachedCriteria){
		return ((Long)hibernateTemplate.findByCriteria(detachedCriteria.setProjection(Projections.rowCount())).get(0)).intValue();
	}

	/**
	 * @description 创建对象
	 * @return void
	 * @param t
	 * @update 2012-8-9 下午4:12:44
	 */
	public void create(T t) {
		hibernateTemplate.save(t);
	}

	/**
	 * @description 更新对象
	 * @return void
	 * @param t
	 * @update 2012-8-9 下午4:13:04
	 */
	public void update(T t) {
		hibernateTemplate.update(t);
	}
	
	/**
	 * @description 新增或者更新一个对象
	 * @return void
	 * @param entity
	 * @update 2012-8-16
	 */
	public void saveOrUpdate(T entity) {
		if (entity == null) {
			return;
		}
		this.getHibernateTemplate().saveOrUpdate(entity);
	}

	/**
	 * @description 保存对象
	 * @return void
	 * @param t
	 * @update 2012-8-9 下午4:13:20
	 */
	public void save(T t) {
		hibernateTemplate.saveOrUpdate(t);
	}
	
	
	public void saveAll(List<T> ts) {
		hibernateTemplate.saveOrUpdateAll(ts);
	}

	/**
	 * @description 删除单个对象
	 * @return void
	 * @param t
	 * @update 2012-8-9 下午4:13:39
	 */
	public void delete(T t) {
		hibernateTemplate.delete(t);
	}
	
	/**
	 * @description 删除多个对象
	 * @return void
	 * @param entities
	 * @update 2012-8-9 下午4:53:21
	 */
	public void deleteAll(Collection<T> entities) {
		this.getHibernateTemplate().deleteAll(entities);
	}

	/**
	 * @description 显示列表
	 * @return List<T>
	 * @return
	 * @update 2012-8-9 下午4:13:54
	 */
	public List<T> list() {
		return hibernateTemplate.loadAll(clazz);
	}
	
	/**
	 * @description 根据对象属性显示列表
	 * @return List<T>
	 * @param t
	 * @update 2012-8-9 下午4:17:26
	 */
	public List<T> list(T t) {
		List<T> ts = (List<T>) hibernateTemplate.findByExample(t);
		if (ts == null) {
			return null;
		}
		return ts;
	}
	
	/**
	 * 执行HQL查询
	 * 
	 * @param sql
	 * @return 查询结果
	 */
	public List find(String hql) {
		return this.getHibernateTemplate().find(hql);
	}
	
	/**
	 * 执行带参的HQL查询
	 * 
	 * @param sql
	 * @param params
	 * @return 查询结果
	 * 调用方式如下：
	 * <pre>
	 *        dao.createQuery(hql)
	 *        dao.createQuery(hql,arg0);
	 *        dao.createQuery(hql,arg0,arg1);
	 *        dao.createQuery(hql,new Object[arg0,arg1,arg2])
	 * </pre>
	 */
	public List find(String hql, Object... params) {
		return this.getHibernateTemplate().find(hql,params);
	}
	
	/**
	 * 执行一段HQL
	 * @param HQL
	 * @return
	 */
	public int excuteHQL(String HQL) throws Exception {
		int processResult = 0;
		Session session = null;
		if(null!=HQL && !HQL.trim().equals("")){
			try{
				session =  hibernateTemplate.getSessionFactory().openSession();
				processResult = session.createQuery(HQL).executeUpdate();
				session.close();
			}catch (Exception e) {
				e.printStackTrace();
				session.close();
			}		
		}
		return processResult;
	}
	
	/**
	 * 执行一段SQL
	 * @param SQL
	 * @return
	 */
	public int excuteSQL(String SQL) throws Exception {
		int processResult = 0;
		Session session =null;
		if(null!=SQL && !SQL.trim().equals("")){
			try{
				session = hibernateTemplate.getSessionFactory().openSession();
				processResult = session.createSQLQuery(SQL).executeUpdate();
				session.close();
			}catch (Exception e) {
				e.printStackTrace();
				session.close();
			}			
		}
		return processResult;
	}
	
	/**
	 * 执行一段hql,可以使用集合
	 * @param hql
	 * @return
	 */
	public int excuteHQLForSet(String hql,String property, Object[] set) throws Exception {
		int processResult = 0;
		Session session = null;
		if(null!=hql && !hql.trim().equals("") && null!=set && set.length>0){
			try{
				session = hibernateTemplate.getSessionFactory().openSession();
				Query query = session.createQuery(hql);
					query.setParameterList(property,set);
				processResult = query.executeUpdate();
				session.close();
			}catch (Exception e) {
				e.printStackTrace();
				session.close();
			}
			
		}
		return processResult;
	}
	
	/**
	 * 查询列表数量
	 * @param orderId
	 * @return
	 */
	public int getCountForInfo(String hql) {
		int count = 0 ;
		if(hql==null || "".equals(hql)){
			return count;
		}
		Session session = null;
		try {	
			session = hibernateTemplate.getSessionFactory().openSession();
			Object obj = session.createQuery(hql).uniqueResult() ;
			count = obj == null ? 0 : ((Long)obj).intValue() ;
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			session.close();
		}
		return count ;
	}
	
	/*
	public int countByExample(final CustomExample<T> example) {
		return (Integer) getHibernateTemplate().execute(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException {
						Criteria executableCriteria = session
								.createCriteria(example.getEntityClass());

						executableCriteria.add(example);

						example.appendCondition(executableCriteria);

						int totalCount = ((Integer) executableCriteria
								.setProjection(Projections.rowCount())
								.uniqueResult()).intValue();
						return totalCount;
					}
				});
	}*/
	
	/**
	 * 格式化数字为字符串
	 * @return
	 */
	public Integer formatFromStringToInt(String number) {
		if(number==null || "".equals(number)){
			return 0;
		}
		while(number.startsWith("0")){
			number = number.substring(1, number.length());
		}	
		return Integer.valueOf(number);
	}

}
