package cn.com.fsun.sys.service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.fsun.common.service.BaseService;
import cn.com.fsun.common.utils.BrowserUtils;
import cn.com.fsun.common.utils.ContextHolderUtils;
import cn.com.fsun.common.utils.PageInfo;
import cn.com.fsun.common.utils.oConvertUtils;
import cn.com.fsun.constants.CommonConstant;
import cn.com.fsun.sys.dao.LogDao;
import cn.com.fsun.sys.dao.UserDao;
import cn.com.fsun.sys.domain.Log;
import cn.com.fsun.sys.domain.User;
import cn.com.fsun.sys.dto.LogDto;

/**
 * @description service主要提供对对象的增删改查功能
 * @author lw
 */
@Service
public class LogService extends BaseService {

	@Autowired
	private LogDao logDao;

	@Autowired
	private UserDao userDao;

	/**
	 * @description 显示列表（无查询条件）
	 * @return List<Log>
	 * @update 2012-8-13 上午9:36:48
	 */
	public List<LogDto> list() {
		List<Log> logs = logDao.list();
		List<LogDto> logDtos = DomainstoDtos(logs);
		return logDtos;
	}

	/**
	 * @description 显示列表（有查询条件）
	 * @return List<Log>
	 * @update 2012-8-13 上午9:36:48
	 */
	public List<LogDto> search(LogDto logDto, PageInfo pageInfo) {
		Log log = DtotoDomain(logDto);
		List<Log> logs = logDao.search(log, pageInfo);
		List<LogDto> logDtos = new ArrayList<LogDto>();
		if (null != logs && logs.size() > 0) {
			for (Log domain : logs) {
				LogDto dto = DomaintoDto(domain);
				if (null != dto) {
					if (StringUtils.isNotEmpty(dto.getUserId())) {
						User user = userDao.load(dto.getUserId());
						if (user != null) {
							dto.setUserName(user.getUsername());
							dto.setRealName(user.getRealname());
						}
					}
					logDtos.add(dto);
				}
			}
		}
		return logDtos;
	}

	/**
	 * 添加日志
	 */
	public void addLog(String logcontent, Integer operatetype, Integer loglevel) {
		HttpServletRequest request = ContextHolderUtils.getRequest();
		String broswer = BrowserUtils.checkBrowse(request);
		Log log = new Log();
		log.setLogContent(logcontent);
		log.setLogLevel(loglevel);
		log.setOperateType(operatetype);
		log.setNote(oConvertUtils.getIp());
		log.setBroswer(broswer);
		log.setOperateTime(new Date());
		log.setUserId(super.getCurrentUserID());
		logDao.save(log);
	}

	/**
	 * @description 增加或者修改
	 * @return LogDto
	 * @param logDto
	 * @return
	 * @update 2013-2-21
	 */
	public LogDto save(LogDto logDto) {
		Log log = DtotoDomain(logDto);
		logDao.save(log);
		return DomaintoDto(log);
	}

	/**
	 * @description 删除一个菜单节点
	 * @return void
	 * @param id
	 * @update 2012-8-13 上午9:37:49
	 */
	public void delete(String id) {
		try {
			logDao.delete(logDao.load(id));
		} catch (Exception e) {
			// System.out.println(e.getMessage());
		}
	}
     
	
	/**
	 * @description 创建饼状图
	 * @return void
	 * @param id
	 * @update 2012-8-13 上午9:37:49
	 */
	public List typeCount() {
		class tmep implements Serializable{
			private String name;
			private Integer y;
			public String getName() {
				return name;
			}
			public void setName(String name) {
				this.name = name;
			}
			public Integer getY() {
				return y;
			}
			public void setY(Integer y) {
				this.y = y;
			}
		}
		String hql = "select log.operateType as a,count(*) as b from Log log group by log.operateType";
		Query query = logDao.getSession().createQuery(hql);
		List list = query.list();
		Object[] o = list.toArray();
		List<tmep> templist = new ArrayList<tmep>();
		for (int i = 0; i < o.length; i++) {
			tmep t = new tmep();
			Object[] o2 = (Object[]) o[i];
			String name = o2[0].toString();
			String  header = CommonConstant.getNameByLgType(name);
			t.name = header;
			String aa = o2[1].toString();
			t.y = Integer.parseInt(aa);
			templist.add(t);
		}
		// int a = Integer.parseInt((String)object[0]);
		// int b = (Integer) object[1];

		return templist;
	}
    
	/**
	 * @description 创建柱状图
	 * @return void
	 * @param id
	 * @update 2012-8-13 上午9:37:49
	 */
	public List broswerCount() {
		String hql = "select log.broswer as a,count(*) as b from Log log group by log.broswer";
		Query query = logDao.getSession().createQuery(hql);
		List list = query.list();
		return list;
	}

	
	
	/**
	 * @description 加载一个菜单节点
	 * @return Log
	 * @param id
	 * @update 2012-8-13 上午9:38:10
	 */
	public LogDto load(String id) {
		return DomaintoDto(logDao.load(id));
	}

	/**
	 * @description 根据父节点得到子集
	 * @return List<LogDto>
	 * @param pid
	 * @return
	 * @update 2013-2-21
	 */
	/*
	 * public List<LogDto> getChildren(String pid){ List<LogDto> logDtos = new
	 * ArrayList<LogDto>(); String hql = "from Log log where log.pid='"+pid+"'";
	 * List<Log> logs = logDao.find(hql); if(null!=logs&&logs.size()>0){ for(Log
	 * log : logs){ logDtos.add(DomaintoDto(log)); } } return logDtos; }
	 */

	/**
	 * @description 获取查询结果数量
	 * @return int
	 * @param logDto
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public int getSearchCount(LogDto logDto, PageInfo pageInfo) {
		Log log = DtotoDomain(logDto);
		List<Log> logs = logDao.getSearchCount(log, pageInfo);
		if (null != logs && logs.size() > 0) {
			return logs.size();
		} else {
			return new Integer(0);
		}
	}

	/**
	 * @description Domian转Dto
	 * @return Log
	 * @param logDto
	 */
	public Log DtotoDomain(LogDto logDto) {
		if (null == logDto) {
			return null;
		}
		Log log = new Log();
		log.setId(logDto.getId());
		log.setUserId(logDto.getUserId());
		log.setLogLevel(logDto.getLogLevel());
		log.setOperateTime(logDto.getOperateTime());
		log.setOperateType(logDto.getOperateType());
		log.setLogContent(logDto.getLogContent());
		log.setNote(logDto.getNote());
		log.setBroswer(logDto.getBroswer());
		return log;
	}

	/**
	 * @description Dto转Domian
	 * @return LogDto
	 * @param log
	 */
	public LogDto DomaintoDto(Log log) {
		if (null == log) {
			return null;
		}
		LogDto logDto = new LogDto();
		logDto.setId(log.getId());
		logDto.setUserId(log.getUserId());
		logDto.setLogLevel(log.getLogLevel());
		logDto.setOperateTime(log.getOperateTime());
		logDto.setOperateType(log.getOperateType());
		logDto.setLogContent(log.getLogContent());
		logDto.setNote(log.getNote());
		logDto.setBroswer(log.getBroswer());
		return logDto;
	}

	/**
	 * @description Domian转Tree
	 * @return LogDto
	 * @param log
	 */
	/*
	 * public TreeDto DomaintoTree(Log log){ if(null==log){ return null; }
	 * TreeDto treeDto = new TreeDto(); treeDto.setId(log.getId());
	 * treeDto.setText(log.getName()); treeDto.setIconCls(log.getIconcls());
	 * TreeAttributeDto treeAttributeDto = new TreeAttributeDto();
	 * treeAttributeDto.setUrl(log.getUrl());
	 * treeAttributeDto.set_parentId(log.getPid());
	 * treeDto.setAttributes(treeAttributeDto);
	 * 
	 * return treeDto; }
	 */

	/**
	 * @description domians转dtos
	 * @return List<LogDto>
	 * @param logs
	 * @return
	 */
	public List<LogDto> DomainstoDtos(List<Log> logs) {
		List<LogDto> logDtos = new ArrayList<LogDto>();

		if (null != logs && logs.size() > 0) {
			for (Log log : logs) {
				LogDto logDto = DomaintoDto(log);
				if (null != logDto) {
					logDtos.add(logDto);
				}
			}
		}
		return logDtos;
	}

}
