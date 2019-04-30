package cn.com.fsun.sys.dto;

import java.util.Date;

import cn.com.fsun.common.dto.BaseDto;

public class PowerDto extends BaseDto{

	private String id;	//ID
	private String name;	//名称
	private String code;	//编码
	private String menuId;	//所属模块
	private String menuName;
	private Integer priority;	//排序
	private String description;	//备注
	private String url;	//链接地址
	private Boolean enabled;	//状态
	private Date createTime;	//创建时间
	private String createManId;	//创建人
	private String updateManId;	//更新人
	private Date updateTime;	//更新时间

	public String getId() {
		return this.id;
	}
	
	public void setId(String value) {
		this.id = value;
	}
	
	public String getName() {
		return this.name;
	}
	
	public void setName(String value) {
		this.name = value;
	}
	public String getCode() {
		return this.code;
	}
	
	public void setCode(String value) {
		this.code = value;
	}
	public String getMenuId() {
		return this.menuId;
	}
	
	public void setMenuId(String value) {
		this.menuId = value;
	}
	public Integer getPriority() {
		return this.priority;
	}
	
	public void setPriority(Integer value) {
		this.priority = value;
	}
	public Boolean getEnabled() {
		return this.enabled;
	}
	
	public void setEnabled(Boolean value) {
		this.enabled = value;
	}
	public Date getCreateTime() {
		return this.createTime;
	}
	
	public void setCreateTime(Date value) {
		this.createTime = value;
	}
	
	public String getCreateManId() {
		return this.createManId;
	}
	
	public void setCreateManId(String value) {
		this.createManId = value;
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

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getUrl() {
		return url;
	}
	
	
}
