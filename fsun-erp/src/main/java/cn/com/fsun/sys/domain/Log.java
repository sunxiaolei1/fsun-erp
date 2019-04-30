package cn.com.fsun.sys.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

import cn.com.fsun.common.domain.BaseDomain;




/*
 * @author lw
 */

@Entity
@Table(name = "sys_log")
public class Log extends BaseDomain{


    /**
     * id   db_column: id 
     */ 	
	private String id;
    /**
     * 操作用户   db_column: user_id 
     */ 	
	private String userId;
    /**
     * 日志级别   db_column: log_level 
     */ 	
	private Integer logLevel;
    /**
     * 操作时间   db_column: operate_time 
     */ 	
	private Date operateTime;
    /**
     * 操作类别(1登录、2退出、3插入、4删除、5更新、6打印、7上传、8其他')   db_column: operate_type 
     */ 	
	private Integer operateType;
    /**
     * 日志内容   db_column: log_content 
     */ 	
	private String logContent;
    /**
     * 节点   db_column: note 
     */ 	
	private String note;
    /**
     * 浏览器   db_column: broswer 
     */ 	
	private String broswer;


	
	@GenericGenerator(name = "generator", strategy = "uuid")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "id", unique = true, nullable = false, length = 32)
	public String getId() {
		return this.id;
	}
	
	public void setId(String value) {
		this.id = value;
	}
	
	@Column(name = "user_id", length = 32)
	public String getUserId() {
		return this.userId;
	}
	
	public void setUserId(String value) {
		this.userId = value;
	}
	
	@Column(name = "log_level", length = 3)
	public Integer getLogLevel() {
		return this.logLevel;
	}
	
	public void setLogLevel(Integer value) {
		this.logLevel = value;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "operate_time", length = 0)
	public Date getOperateTime() {
		return this.operateTime;
	}
	
	public void setOperateTime(Date value) {
		this.operateTime = value;
	}
	
	@Column(name = "operate_type", length = 3)
	public Integer getOperateType() {
		return this.operateType;
	}
	
	public void setOperateType(Integer value) {
		this.operateType = value;
	}
	
	@Column(name = "log_content", length = 3)
	public String getLogContent() {
		return this.logContent;
	}
	
	public void setLogContent(String value) {
		this.logContent = value;
	}
	
	@Column(name = "note", length = 65535)
	public String getNote() {
		return this.note;
	}
	
	public void setNote(String value) {
		this.note = value;
	}
	
	@Column(name = "broswer", length = 100)
	public String getBroswer() {
		return this.broswer;
	}
	
	public void setBroswer(String value) {
		this.broswer = value;
	}
	
	

}