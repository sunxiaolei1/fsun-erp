package cn.com.fsun.sys.dto;

import cn.com.fsun.common.dto.BaseDto;

public class DictionaryDto extends BaseDto{

	private Integer id;	
	/**
	 * 键  db_column: key
	 */
	private String key;	
	/**
	 * 值  db_column: value
	 */
	private String value;	
	
	private String name;
	 /**
     * 父节点  db_column: pid 
     */ 
	private Integer pid;
	 /**
     * 是否启用   db_column: enabled 
     */ 	
	private Boolean enabled;
	
	private Integer sequence;

	public DictionaryDto() {}

	public DictionaryDto(String key, String value,String name, Integer pid, Boolean enabled, Integer sequence) {
		this.key = key;
		this.value = value;
		this.name = name;
		this.pid = pid;
		this.enabled = enabled;
		this.sequence = sequence;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setSequence(Integer sequence) {
		this.sequence = sequence;
	}

	public Integer getSequence() {
		return sequence;
	}
	
	
}
