package cn.com.fsun.sys.dto;

import java.util.Date;

import cn.com.fsun.common.dto.BaseDto;


/*
 * @author lw
 */

public class LogDto extends BaseDto{

	private String id;	//id
	private String userId;	//操作用户
	private String userName;
	private String realName;
	private Integer logLevel;	//日志级别
	private Date operateTime;	//操作时间
	private Integer operateType;	//操作类别(1登录、2退出、3插入、4删除、5更新、6打印、7上传、8其他')
	private String logContent;	//日志内容
	private String note;	//节点
	private String broswer;	//浏览器
	
	private String startDate_str;
	private String endDate_str;


	
	public String getId() {
		return this.id;
	}
	
	public void setId(String value) {
		this.id = value;
	}
	
	public String getUserId() {
		return this.userId;
	}
	
	public void setUserId(String value) {
		this.userId = value;
	}
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}
	public Integer getLogLevel() {
		return this.logLevel;
	}
	
	public void setLogLevel(Integer value) {
		this.logLevel = value;
	}
	public Date getOperateTime() {
		return this.operateTime;
	}
	
	public void setOperateTime(Date value) {
		this.operateTime = value;
	}
	
	public Integer getOperateType() {
		return this.operateType;
	}
	
	public void setOperateType(Integer value) {
		this.operateType = value;
	}
	public String getLogContent() {
		return this.logContent;
	}
	
	public void setLogContent(String value) {
		this.logContent = value;
	}
	public String getNote() {
		return this.note;
	}
	
	public void setNote(String value) {
		this.note = value;
	}
	public String getBroswer() {
		return this.broswer;
	}
	
	public void setBroswer(String value) {
		this.broswer = value;
	}

	public String getStartDate_str() {
		return startDate_str;
	}

	public void setStartDate_str(String startDate_str) {
		this.startDate_str = startDate_str;
	}

	public String getEndDate_str() {
		return endDate_str;
	}

	public void setEndDate_str(String endDate_str) {
		this.endDate_str = endDate_str;
	}
	
}