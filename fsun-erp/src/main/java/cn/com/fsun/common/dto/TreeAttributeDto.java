/**  
 * @title TreeAttributesDto.java
 * @package sanlogic.vdi.common.domain
 * @description 可以添加一些个人的属性
 * @update 2013-2-21 下午12:42:44
 * @version V1.0  
 */
package cn.com.fsun.common.dto;

/**
 * @description 这里用一句话描述这个类的作用
 * @version 1.0
 * @update 2013-2-21 下午12:42:44
 */

public class TreeAttributeDto {
	public String url;
	public String _parentId;

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String get_parentId() {
		return _parentId;
	}

	public void set_parentId(String _parentId) {
		this._parentId = _parentId;
	}
}
