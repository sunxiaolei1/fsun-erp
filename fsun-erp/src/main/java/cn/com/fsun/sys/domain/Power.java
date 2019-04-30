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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import cn.com.fsun.common.domain.BaseDomain;


/*
 * @author lw
 */

@Entity
@Table(name = "sys_power")
public class Power extends BaseDomain {

	/**
	 * id db_column: id
	 */
	private String id;
	/**
	 * 权限编码 db_column: code
	 */
	private String code;
	/**
	 * 权限名称 db_column: name
	 */
	private String name;
	/**
	 * menuId db_column: menu_id
	 */
	private String menuId;
	/**
	 * 是否启用 db_column: enabled
	 */
	private Boolean enabled;
	/**
	 * 权限描述 db_column: description
	 */
	private String description;
	/**
	 * 链接地址 db_column: url
	 */
	private String url;
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

	@Column(name = "name", length = 64)
	public String getName() {
		return this.name;
	}

	public void setName(String value) {
		this.name = value;
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

	@Column(name = "url", length = 100)
	public String getUrl() {
		return this.url;
	}

	public void setUrl(String value) {
		this.url = value;
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

	@Column(name = "menu_id", length = 32)
	public String getMenuId() {
		return menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}

}