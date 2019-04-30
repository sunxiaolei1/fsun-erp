package cn.com.fsun.bus.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import cn.com.fsun.common.domain.BaseDomain;


/*
 * @author lw
 */

@Entity
@Table(name = "bus_store")
public class BusStore extends BaseDomain {

	/**
	 * id db_column: id
	 */
	private Integer id;
	/**
	 * 权限名称 db_column: name
	 */
	private String name;
	/**
	 * 地址 db_column: address
	 */
	private String address;
	
	/**
	 * 联系人
	 */
	private String contacts;
	
	/**
	 * 权限描述 db_column: description
	 */
	private String description;
	
	/**
	 * 是否启用 db_column: disable
	 */
	private Boolean disable;

	@Id
	@GeneratedValue(strategy  = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false, length = 10)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "name", length = 32, nullable = false)
	public String getName() {
		return this.name;
	}

	public void setName(String value) {
		this.name = value;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "address", length = 128)
	public String getAddress() {
		return address;
	}

	@Column(name = "description", length = 512)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setDisable(Boolean disable) {
		this.disable = disable;
	}

	@Column(name = "disable", length = 0)
	public Boolean getDisable() {
		return disable;
	}

	/**
	 * @param contacts the contacts to set
	 */
	public void setContacts(String contacts) {
		this.contacts = contacts;
	}

	/**
	 * @return the contacts
	 */
	@Column(name = "contacts", length = 16)
	public String getContacts() {
		return contacts;
	}

	
}