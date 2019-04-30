package cn.com.fsun.sys.dto;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.xml.bind.annotation.XmlRootElement;

import org.codehaus.jackson.annotate.JsonIgnore;

import cn.com.fsun.common.dto.BaseDto;

import cn.com.fsun.sys.dto.RoleDto;

/*
 * @author lw
 */
@XmlRootElement(name="user")
public class UserDto extends BaseDto {

	private String id; // 用户ID
	private String code; // 用户编码
	private String username; // 用户帐号
	private String password; // 用户密码
	private String realname; // 用户中文名称
	private String email; // 电子邮件
	private String telphone; // 手机号码
	private String description; // 备注
	private Boolean issys; // 是否是系统管理员
	private Boolean enabled; // 状态
	private Integer priority; // 排序
	private String createManId; // 创建人
	private Date createTime; // 创建时间
	private String updateManId; // 最后更新人
	private Date updateTime; // 最后更新时间
	private String roleNames; //所属角色

	private Set<RoleDto> roleDtos = new HashSet<RoleDto>();
	
	public UserDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UserDto(String id, String username, String realname, String email,
			String telphone, String description) {
		super();
		this.id = id;
		this.username = username;
		this.realname = realname;
		this.email = email;
		this.telphone = telphone;
		this.description = description;
	}

	@JsonIgnore
	public Set<RoleDto> getRoleDtos() {
		return roleDtos;
	}

	public void setRoleDtos(Set<RoleDto> roleDtos) {
		this.roleDtos = roleDtos;
	}

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

	

	public String getRoleNames() {
		return roleNames;
	}

	public void setRoleNames(String roleNames) {
		this.roleNames = roleNames;
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

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelphone() {
		return telphone;
	}

	public void setTelphone(String telphone) {
		this.telphone = telphone;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Boolean getIssys() {
		return issys;
	}

	public void setIssys(Boolean issys) {
		this.issys = issys;
	}

}