package cn.com.fsun.common.rpc.model;

import java.io.Serializable;
import java.util.Date;

/**
 * mq命令的基础类
 * @author lee
 *
 */
public abstract class AbstractModel implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	//目的地名称
	private String destinationName;
	
	//发送时的时间
	private Date time;
	
	//超时时间(单位:秒)
	private Integer timeout = 30;

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public Integer getTimeout() {
		return timeout;
	}

	public void setTimeout(Integer timeout) {
		this.timeout = timeout;
	}

	public String getDestinationName() {
		return destinationName;
	}

	public void setDestinationName(String destinationName) {
		this.destinationName = destinationName;
	}
	
}
