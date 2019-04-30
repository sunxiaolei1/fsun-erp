package cn.com.fsun.bus.domain;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "bus_stock_base")
public class BusStockBase implements java.io.Serializable {

	// Fields
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long id;
	private String name;
	private String artNum; //货号
	private String image; //图片
	private String rackNum; //机架号
	private Integer storeId; //所属仓库
	private String customerCode; //所属客户
	private String description;

	// Constructors

	/** default constructor */
	public BusStockBase() {
	}

	public BusStockBase(Long id, String name, String artNum, String image,
			String rackNum, Integer storeId, String customerCode, String description) {
		super();
		this.id = id;
		this.name = name;
		this.artNum = artNum;
		this.image = image;	
		this.rackNum = rackNum;
		this.storeId = storeId;
		this.customerCode = customerCode;
		this.description = description;
	}


	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Column(name = "name", length = 128)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "image", length = 32)
	public String getImage() {
		return image;
	}

	public void setArtNum(String artNum) {
		this.artNum = artNum;
	}

	@Column(name = "art_num", length = 32)
	public String getArtNum() {
		return artNum;
	}
	
	public void setImage(String image) {
		this.image = image;
	}

	public void setRackNum(String rackNum) {
		this.rackNum = rackNum;
	}

	@Column(name = "rack_num", length = 32)
	public String getRackNum() {
		return rackNum;
	}
	
	@Column(name = "store_id")
	public Integer getStoreId() {
		return this.storeId;
	}

	public void setStoreId(Integer storeId) {
		this.storeId = storeId;
	}
	
	public void setCustomerCode(String customerCode) {
		this.customerCode = customerCode;
	}

	@Column(name = "customer_code", length = 32)
	public String getCustomerCode() {
		return customerCode;
	}

	@Column(name = "description", length = 65535)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	

}