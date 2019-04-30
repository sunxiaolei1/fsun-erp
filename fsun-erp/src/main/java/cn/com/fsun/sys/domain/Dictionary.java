package cn.com.fsun.sys.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import cn.com.fsun.common.domain.BaseDomain;


/**
 * BusStoreInfo entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "sys_dictionary")
public class Dictionary extends BaseDomain {

	// Fields
	private Integer id;	
	/**
	 * 键  db_column: key
	 */
	private String key;	
	/**
	 * 值  db_column: value
	 */
	private String value;
	/**
	 * 值  db_column: name
	 */
	private String name;
	 /**
     * 父节点  db_column: pid 
     */ 
	private Integer pid;
	 /**
     * 是否启用   db_column: enabled 
     */ 	
	private Boolean enabled;
	//排序
	private Integer sequence;

	// Constructors

	/** default constructor */
	public Dictionary() {
	}

	/** full constructor */
	public Dictionary(String key, String value,String name, Integer pid, Boolean enabled, Integer sequence) {
		this.key = key;
		this.value = value;
		this.name = name;
		this.pid = pid;
		this.enabled = enabled;
		this.sequence = sequence;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy  = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false, length = 10)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "key", length = 64)
	public String getKey() {
		return this.key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	@Column(name = "value", length = 64)
	public String getValue() {
		return this.value;
	}

	public void setValue(String value) {
		this.value = value;
	}
	
	@Column(name = "name", length = 32)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name = "pid", length = 10)
	public Integer getPid() {
		return this.pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}
	
	@Column(name = "enabled", length = 0)
	public Boolean getEnabled() {
		return this.enabled;
	}
	
	public void setEnabled(Boolean value) {
		this.enabled = value;
	}

	@Column(name = "sequence", length = 10)
	public void setSequence(Integer sequence) {
		this.sequence = sequence;
	}

	public Integer getSequence() {
		return sequence;
	}

}