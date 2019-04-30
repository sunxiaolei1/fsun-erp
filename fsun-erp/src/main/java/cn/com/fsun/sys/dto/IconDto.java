/**  
 * @title Icon.java
 * @package sanlogic.vdi.sys.dto
 * @description 用一句话描述该文件做什么  
 * @update 2013-6-20 下午7:17:27
 * @version V1.0  
 */
package cn.com.fsun.sys.dto;

import org.codehaus.jackson.annotate.JsonIgnore;

/**
 * @description 这里用一句话描述这个类的作用
 * @version 1.0
 * @update 2013-6-20 下午7:17:27
 */

public class IconDto {
	String name;
	String path;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
}
