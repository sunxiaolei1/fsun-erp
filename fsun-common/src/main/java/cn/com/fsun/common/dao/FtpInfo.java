package cn.com.fsun.common.dao;

import java.io.Serializable;

public class FtpInfo implements Serializable {
	
	private static final long serialVersionUID = 1L;
	private String ip;
	private int port;
	private String username;
	private String password;
	
	public FtpInfo(String ip, int port, String username, String password) {
		super();
		this.ip = ip;
		this.port = port;
		this.username = username;
		this.password = password;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public int getPort() {
		return port;
	}
	public void setPort(int port) {
		this.port = port;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
