package cn.com.fsun.sys.dto;

import java.util.Date;

import javax.xml.bind.annotation.XmlRootElement;

import cn.com.fsun.common.dto.BaseDto;

@XmlRootElement(name="menu")
public class MenuDto extends BaseDto{

	private String id;	//ID
	private String code;	//菜单编码
	private String name;	//菜单名称
	private String url;	//链接地址
	private String description;	//备注
	private String createManId;	//创建人ID
	private Date createTime;	//创建时间
	private String updateManId;	//更新人ID
	private Date updateTime;	//最后更新时间
	private Integer priority;	//排序
	private Boolean enabled;	//状态
	private String icon;	//节点图标
	private String iconcls;	//节点图标CSS类名
	private Boolean expanded;	//是否扩展（1-代表扩展，0代表收缩）
	private Boolean isleaf;	//是否有叶子
	private String _parentId;	//父节点


	
	public String getId() {
		return this.id;
	}
	
	public void setId(String value) {
		this.id = value;
	}
	
	public String getCode() {
		return this.code;
	}
	
	public void setCode(String value) {
		this.code = value;
	}
	public String getName() {
		return this.name;
	}
	
	public void setName(String value) {
		this.name = value;
	}
	public String getUrl() {
		return this.url;
	}
	
	public void setUrl(String value) {
		this.url = value;
	}
	public String getCreateManId() {
		return this.createManId;
	}
	
	public void setCreateManId(String value) {
		this.createManId = value;
	}
	public Date getCreateTime() {
		return this.createTime;
	}
	
	public void setCreateTime(Date value) {
		this.createTime = value;
	}
	
	public String getUpdateManId() {
		return this.updateManId;
	}
	
	public void setUpdateManId(String value) {
		this.updateManId = value;
	}
	public Date getUpdateTime() {
		return this.updateTime;
	}
	
	public void setUpdateTime(Date value) {
		this.updateTime = value;
	}
	
	
	public String getIcon() {
		return this.icon;
	}
	
	public void setIcon(String value) {
		this.icon = value;
	}
	public String getIconcls() {
		return this.iconcls;
	}
	
	public void setIconcls(String value) {
		this.iconcls = value;
	}
	public Boolean getExpanded() {
		return this.expanded;
	}
	
	public void setExpanded(Boolean value) {
		this.expanded = value;
	}
	public Boolean getIsleaf() {
		return this.isleaf;
	}
	
	public void setIsleaf(Boolean value) {
		this.isleaf = value;
	}

	public String get_parentId() {
		return _parentId;
	}

	public void set_parentId(String _parentId) {
		this._parentId = _parentId;
	}

	public Integer getPriority() {
		return priority;
	}

	public void setPriority(Integer priority) {
		this.priority = priority;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
}
