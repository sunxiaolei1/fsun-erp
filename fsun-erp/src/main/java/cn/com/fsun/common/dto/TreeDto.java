/**  
 * @title TreeDto.java
 * @package sanlogic.vdi.common.domain
 * @description 用一句话描述该文件做什么  
 * @update 2013-2-21 下午12:34:19
 * @version V1.0  
 */
package cn.com.fsun.common.dto;

import java.util.List;

/**
 * @description 这里用一句话描述这个类的作用
 * @version 1.0
 * @update 2013-2-21 下午12:34:19
 */

public class TreeDto {
	public String id;
	public String text;
	public String iconCls;
	public String icon;
//	public String state;
//	public Boolean checked;
	public TreeAttributeDto attributes;

	public List<TreeDto> children;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getIconCls() {
		return iconCls;
	}

	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}

//	public String getState() {
//		return state;
//	}
//
//	public void setState(String state) {
//		this.state = state;
//	}
//
//	public Boolean getChecked() {
//		return checked;
//	}
//
//	public void setChecked(Boolean checked) {
//		this.checked = checked;
//	}

	public TreeAttributeDto getAttributes() {
		return attributes;
	}

	public void setAttributes(TreeAttributeDto attributes) {
		this.attributes = attributes;
	}

	public List<TreeDto> getChildren() {
		return children;
	}

	public void setChildren(List<TreeDto> children) {
		this.children = children;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}


}
