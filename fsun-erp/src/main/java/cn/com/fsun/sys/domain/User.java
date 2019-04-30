package cn.com.fsun.sys.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.GenericGenerator;

import cn.com.fsun.common.domain.BaseDomain;



/*
 * @author lw
 */

@Entity
@Table(name = "sys_user")
public class User extends BaseDomain {

	/**
	 * 用户id db_column: id
	 */
	private String id;
	/**
	 * 用户编码 db_column: code
	 */
	private String code;
	/**
	 * 用户帐号 db_column: username
	 */
	private String username;
	/**
	 * 用户密码 db_column: password
	 */
	private String password;
	/**
	 * 用户姓名 db_column: realname
	 */
	private String realname;
	private String email; // 电子邮件
	private String telphone; // 手机号码
	/**
	 * 是否是系统管理员 db_column: issys
	 */
	private Boolean issys;
	/**
	 * 是否启用 db_column: enabled
	 */
	private Boolean enabled;
	/**
	 * 用户描述 db_column: description
	 */
	private String description;
	/**
	 * 排序 db_column: priority
	 */
	private Integer priority;
	/**
	 * 创建人 db_column: create_man_id
	 */
	private String createManId;
	/**
	 * 创建时间 db_column: create_time
	 */
	private Date createTime;
	/**
	 * 最后更新人 db_column: update_man_id
	 */
	private String updateManId;
	/**
	 * 最后更新时间 db_column: update_time
	 */
	private Date updateTime;

	@GenericGenerator(name = "generator", strategy = "uuid")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "id", unique = true, nullable = false, length = 32)
	public String getId() {
		return this.id;
	}

	public void setId(String value) {
		this.id = value;
	}

	@Column(name = "code", length = 64)
	public String getCode() {
		return this.code;
	}

	public void setCode(String value) {
		this.code = value;
	}

	@Column(name = "username", length = 32)
	public String getUsername() {
		return this.username;
	}

	public void setUsername(String value) {
		this.username = value;
	}

	@Column(name = "password", length = 64)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String value) {
		this.password = value;
	}

	@Column(name = "realname", length = 64)
	public String getRealname() {
		return this.realname;
	}

	public void setRealname(String value) {
		this.realname = value;
	}

	@Column(name = "issys", length = 0)
	public Boolean getIssys() {
		return this.issys;
	}

	public void setIssys(Boolean value) {
		this.issys = value;
	}

	@Column(name = "enabled", length = 0)
	public Boolean getEnabled() {
		return this.enabled;
	}

	public void setEnabled(Boolean value) {
		this.enabled = value;
	}

	@Column(name = "description", length = 65535)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String value) {
		this.description = value;
	}

	@Column(name = "priority", length = 10)
	public Integer getPriority() {
		return this.priority;
	}

	public void setPriority(Integer value) {
		this.priority = value;
	}

	@Column(name = "create_man_id", length = 32)
	public String getCreateManId() {
		return this.createManId;
	}

	public void setCreateManId(String value) {
		this.createManId = value;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "create_time", length = 0)
	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date value) {
		this.createTime = value;
	}

	@Column(name = "update_man_id", length = 32)
	public String getUpdateManId() {
		return this.updateManId;
	}

	public void setUpdateManId(String value) {
		this.updateManId = value;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "update_time", length = 0)
	public Date getUpdateTime() {
		return this.updateTime;
	}

	public void setUpdateTime(Date value) {
		this.updateTime = value;
	}

	@Column(name = "email", length = 64)
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "telphone", length = 32)
	public String getTelphone() {
		return telphone;
	}

	public void setTelphone(String telphone) {
		this.telphone = telphone;
	}

}