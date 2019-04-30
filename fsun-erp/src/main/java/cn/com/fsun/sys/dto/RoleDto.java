package cn.com.fsun.sys.dto;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.codehaus.jackson.annotate.JsonIgnore;

import cn.com.fsun.common.dto.BaseDto;
import cn.com.fsun.sys.dto.MenuDto;
import cn.com.fsun.sys.dto.PowerDto;

public class RoleDto extends BaseDto{

	private String id;	//角色ID
	private String code;	//角色编码
	private String name;	//角色名称
	private String description;	//备注
	private Boolean issys;	//是否是系统管理员
	private Boolean enabled;	//状态
	private Integer priority;	//排序
	private String createManId;	//创建人
	private Date createTime;	//创建时间
	private String updateManId;	//最后更新人
	private Date updateTime;	//最后更新时间
	
	private String menuIds;		//菜单集合
	private String powerIds;	//按钮权限集合
	
	private Set<PowerDto> powerDtos = new HashSet<PowerDto>();
	private Set<MenuDto> menuDtos = new HashSet<MenuDto>();


	
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
	public Boolean getIssys() {
		return this.issys;
	}
	
	public void setIssys(Boolean value) {
		this.issys = value;
	}
	public Boolean getEnabled() {
		return this.enabled;
	}
	
	public void setEnabled(Boolean value) {
		this.enabled = value;
	}
	public Integer getPriority() {
		return this.priority;
	}
	
	public void setPriority(Integer value) {
		this.priority = value;
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

	public String getMenuIds() {
		return menuIds;
	}

	public void setMenuIds(String menuIds) {
		this.menuIds = menuIds;
	}

	public String getPowerIds() {
		return powerIds;
	}

	public void setPowerIds(String powerIds) {
		this.powerIds = powerIds;
	}

	@JsonIgnore
	public Set<PowerDto> getPowerDtos() {
		return powerDtos;
	}

	public void setPowerDtos(Set<PowerDto> powerDtos) {
		this.powerDtos = powerDtos;
	}

	@JsonIgnore
	public Set<MenuDto> getMenuDtos() {
		return menuDtos;
	}

	public void setMenuDtos(Set<MenuDto> menuDtos) {
		this.menuDtos = menuDtos;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	
}
