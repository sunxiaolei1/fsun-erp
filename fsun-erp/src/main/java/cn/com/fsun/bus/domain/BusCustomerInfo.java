package cn.com.fsun.bus.domain;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;

/**
 * BusFactoryInfo entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "bus_customer_info")
public class BusCustomerInfo implements java.io.Serializable {

	// Fields

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
	
	// Constructors

	/** default constructor */
	public BusCustomerInfo() {
	}

	
	public BusCustomerInfo(String code, String name, String contacts, String address, 
			String tel, String fax, String description,Boolean enabled) {
		this.code = code;
		this.name = name;
		this.contacts = contacts;
		this.address = address;
		this.tel = tel;
		this.fax = fax;	
		this.description = description;
		this.enabled = enabled;
	}

	/** full constructor */
	public BusCustomerInfo(String id, String code, String type, String name, String contacts, String address,
			String tel, String fax, String description, Boolean enabled, String q) {
		super();
		this.id = id;
		this.code = code;
		this.type = type;
		this.name = name;
		this.contacts = contacts;
		this.address = address;
		this.tel = tel;
		this.fax = fax;
		this.description = description;
		this.enabled = enabled;
		this.q = q;
	}

	// Property accessors
	@GenericGenerator(name = "generator", strategy = "uuid.hex")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "id", unique = true, nullable = false, length = 32)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	public void setCode(String code) {
		this.code = code;
	}

	@Column(name = "code", length = 32)
	public String getCode() {
		return code;
	}

	@Column(name = "name", length = 64)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name = "contacts", length = 32)
	public String getContacts() {
		return contacts;
	}

	public void setContacts(String contacts) {
		this.contacts = contacts;
	}

	@Column(name = "tel", length = 32)
	public String getTel() {
		return tel;
	}
	
	public void setTel(String tel) {
		this.tel = tel;
	}

	@Column(name = "fax", length = 32)
	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	@Column(name = "address", length = 65535)
	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "description", length = 65535)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "enabled")
	public Boolean getEnabled() {
		return this.enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	@Transient 
	public String getQ() {
		return q;
	}

	public void setQ(String q) {
		this.q = q;
	}

	/**
	 * @return the type
	 */
	@Column(name = "type", length = 32)
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