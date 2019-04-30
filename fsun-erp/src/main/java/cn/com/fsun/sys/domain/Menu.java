package cn.com.fsun.sys.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

import cn.com.fsun.common.domain.BaseDomain;



/*
 * @author lw
 */

@Entity
@Table(name = "sys_menu")
public class Menu extends BaseDomain {

	/**
	 * id db_column: id
	 */
	private String id;
	/**
	 * 菜单编码 db_column: code
	 */
	private String code;
	/**
	 * 菜单名称 db_column: name
	 */
	private String name;
	/**
	 * 链接地址 db_column: url
	 */
	private String url;
	/**
	 * 节点图标 db_column: icon
	 */
	private String icon;
	/**
	 * 创建时间 db_column: create_time
	 */
	private Date createTime;
	/**
	 * 创建人 db_column: update_man_id
	 */
	private String updateManId;
	/**
	 * 最后更新时间 db_column: update_time
	 */
	private Date updateTime;
	/**
	 * 节点图标CSS类名 db_column: iconcls
	 */
	private String iconcls;
	/**
	 * 是否有叶子 db_column: isleaf
	 */
	private Boolean isleaf;
	/**
	 * 是否扩展（1-代表扩展，0代表收缩） db_column: expanded
	 */
	private Boolean expanded;
	/**
	 * 是否启用 db_column: enabled
	 */
	private Boolean enabled;
	/**
	 * 菜单描述 db_column: description
	 */
	private String description;
	/**
	 * 父节点 db_column: pid
	 */
	private String pid;
	/**
	 * 排序 db_column: priority
	 */
	private Integer priority;
	/**
	 * 创建人 db_column: create_man_id
	 */
	private String createManId;

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

	@Column(name = "url", length = 100)
	public String getUrl() {
		return this.url;
	}

	public void setUrl(String value) {
		this.url = value;
	}

	@Column(name = "icon", length = 64)
	public String getIcon() {
		return this.icon;
	}

	public void setIcon(String value) {
		this.icon = value;
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

	@Column(name = "iconcls", length = 64)
	public String getIconcls() {
		return this.iconcls;
	}

	public void setIconcls(String value) {
		this.iconcls = value;
	}

	@Column(name = "isleaf", length = 0)
	public Boolean getIsleaf() {
		return this.isleaf;
	}

	public void setIsleaf(Boolean value) {
		this.isleaf = value;
	}

	@Column(name = "expanded", length = 0)
	public Boolean getExpanded() {
		return this.expanded;
	}

	public void setExpanded(Boolean value) {
		this.expanded = value;
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

	@Column(name = "pid", length = 32)
	public String getPid() {
		return this.pid;
	}

	public void setPid(String value) {
		this.pid = value;
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
}