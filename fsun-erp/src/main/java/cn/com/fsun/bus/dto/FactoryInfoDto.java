package cn.com.fsun.bus.dto;

import cn.com.fsun.common.dto.BaseDto;

public class FactoryInfoDto extends BaseDto{

	private String id;
	private String name;
	private String type;
	private String legalPerson; //联系人
	private String technology; //工艺
	private String telephone;//电话号码
	private String mobileTelephone;  //手机号码
	private String address; //地址
	private String description; //备注
	private Boolean enabled;

	
	public FactoryInfoDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	public FactoryInfoDto(String id, String name) {
		super();
		this.id = id;
		this.name = name;
	}


	public FactoryInfoDto(String id, String name, String legalPerson,
			String technology, String telephone, String mobileTelephone,
			String address, String description) {
		super();
		this.id = id;
		this.name = name;
		this.legalPerson = legalPerson;
		this.technology = technology;
		this.telephone = telephone;
		this.mobileTelephone = mobileTelephone;
		this.address = address;
		this.description = description;
	}
	
	public FactoryInfoDto(String id, String name, String type, String legalPerson,
			String technology, String telephone, String mobileTelephone,
			String address, String description) {
		super();
		this.id = id;
		this.name = name;
		this.type = type;
		this.legalPerson = legalPerson;
		this.technology = technology;
		this.telephone = telephone;
		this.mobileTelephone = mobileTelephone;
		this.address = address;
		this.description = description;
	}



	//full
	public FactoryInfoDto(String id, String name, String type, String legalPerson,
			String technology, String telephone, String mobileTelephone,
			String address, String description, Boolean enabled) {
		super();
		this.id = id;
		this.name = name;
		this.type = type;
		this.legalPerson = legalPerson;
		this.technology = technology;
		this.telephone = telephone;
		this.mobileTelephone = mobileTelephone;
		this.address = address;
		this.description = description;
		this.enabled = enabled;
	}


	public String getTechnology() {
		return technology;
	}

	public void setTechnology(String technology) {
		this.technology = technology;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getMobileTelephone() {
		return mobileTelephone;
	}

	public void setMobileTelephone(String mobileTelephone) {
		this.mobileTelephone = mobileTelephone;
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
	public String getLegalPerson() {
		return legalPerson;
	}
	public void setLegalPerson(String legalPerson) {
		this.legalPerson = legalPerson;
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
	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}
	public Boolean getEnabled() {
		return enabled;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}	
	
}
