package cn.com.fsun.bus.dto;

import cn.com.fsun.common.dto.BaseDto;

public class CustomerDto extends BaseDto {
  
	private String id; 
	private String code; //客户编号
	private String type; // 客户类型(0:非加工客户，1:加工类客户)
	private String name; //客户名称
	private String contacts; //联系人
	private String address; //地址
	private String tel; //电话
	private String fax; //传真
	private String description;//备注
	private Boolean enabled;
	
	private String q;

	public CustomerDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CustomerDto(String id, String code, String name, String contacts,
			String address, String tel, String fax, String description,
			Boolean enabled) {
		super();
		this.id = id;
		this.setCode(code);
		this.name = name;
		this.contacts = contacts;
		this.address = address;
		this.tel = tel;
		this.fax = fax;
		this.description = description;
		this.enabled = enabled;
	}
	
	public CustomerDto(String id, String code, String name, String contacts,
			String address, String tel, String fax, String description) {
		super();
		this.id = id;
		this.setCode(code);
		this.name = name;
		this.contacts = contacts;
		this.address = address;
		this.tel = tel;
		this.fax = fax;
		this.description = description;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContacts() {
		return contacts;
	}

	public void setContacts(String contacts) {
		this.contacts = contacts;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getCode() {
		return code;
	}

	public String getQ() {
		return q;
	}

	public void setQ(String q) {
		this.q = q;
	}

	/**
	 * @return the type
	 */
	public String getType() {
		return type;
	}

	/**
	 * @param type the type to set
	 */
	public void setType(String type) {
		this.type = type;
	}

	
}
