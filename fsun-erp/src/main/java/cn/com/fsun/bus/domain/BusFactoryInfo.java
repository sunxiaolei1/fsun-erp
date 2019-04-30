package cn.com.fsun.bus.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;

/**
 * BusFactoryInfo entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "bus_factory_info")
public class BusFactoryInfo implements java.io.Serializable {

	// Fields

	private String id;
	private String name;//名称
	private String type;//厂商类型
	private String legalPerson; //联系人
	private String technology; //工艺
	private String telephone;//电话号码
	private String mobileTelephone;  //手机号码
	private String address; //地址
	private String description; //备注

	private Boolean enabled;
	
	// Constructors

	/** default constructor */
	public BusFactoryInfo() {
	}

	/** full constructor */
	public BusFactoryInfo(String id,String name,String type, String legalPerson, String technology,
			String telephone, String mobileTelephone,
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

	@Column(name = "name", length = 64)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name = "type", length = 32, nullable = false)
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Column(name = "legal_person", length = 64)
	public String getLegalPerson() {
		return this.legalPerson;
	}

	public void setLegalPerson(String legalPerson) {
		this.legalPerson = legalPerson;
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

	@Column(name = "technology", length = 256)
	public String getTechnology() {
		return technology;
	}

	public void setTechnology(String technology) {
		this.technology = technology;
	}

	@Column(name = "telephone", length = 32)
	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	@Column(name = "mobile_telephone", length = 32)
	public String getMobileTelephone() {
		return mobileTelephone;
	}

	public void setMobileTelephone(String mobileTelephone) {
		this.mobileTelephone = mobileTelephone;
	}

}