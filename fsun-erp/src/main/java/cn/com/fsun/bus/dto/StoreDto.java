package cn.com.fsun.bus.dto;

import cn.com.fsun.common.dto.BaseDto;


/**
 * 
 * @author lee
 *
 */
public class StoreDto extends BaseDto{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

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
	
	private String status;

	public StoreDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public StoreDto(Integer id, String name, String address,String contacts,
			String description, Boolean disable) {
		super();
		this.id = id;
		this.name = name;
		this.address = address;
		this.contacts = contacts;
		this.description = description;
		this.setDisable(disable);
		this.status = disable?"禁用":"启用";
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * @param disable the disable to set
	 */
	public void setDisable(Boolean disable) {
		this.disable = disable;
	}

	/**
	 * @return the disable
	 */
	public Boolean getDisable() {
		return disable;
	}

	/**
	 * @param status the status to set
	 */
	public void setStatus(String status) {
		this.status = status;
	}

	/**
	 * @return the status
	 */
	public String getStatus() {
		return status;
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
	public String getContacts() {
		return contacts;
	}

	
	
	
}
