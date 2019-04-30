package cn.com.fsun.common.dao;

import java.io.Serializable;

public class File implements Serializable {
	
	private static final long serialVersionUID = 1L;
	private String directory;
	private String name;
	private String path;
	
	public File(String name, String directory, String path) {
		super();
		this.directory = directory;
		this.name = name;
		this.path = path;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getDirectory() {
		return directory;
	}
	public void setDirectory(String directory) {
		this.directory = directory;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
