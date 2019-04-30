package cn.com.fsun.bus.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "bus_after_process")
public class BusAfterProcess implements java.io.Serializable {

	private String id;
	private String productId;   //产品ID
	private String name; //工序名称
	private String isOutsourc; //是否外协
	private Integer number;//产品数量
	private String demand;//工序要求
	private String description; //备注
	
	
	public BusAfterProcess() {
		super();
		// TODO Auto-generated constructor stub
	}	
	
	public BusAfterProcess(String productId,String name,String isOutsourc,
			Integer number, String demand, String description) {
		super();
		this.productId = productId;
		this.name = name;
		this.setIsOutsourc(isOutsourc);
		this.number = number;
		this.demand = demand;
		this.description = description;
	}

	@GenericGenerator(name = "generator", strategy = "uuid.hex")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "id", unique = true, nullable = false, length = 32)
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	@Column(name = "name", length = 32)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name = "number")
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	
	@Column(name = "demand", length = 65535)
	public String getDemand() {
		return demand;
	}
	public void setDemand(String demand) {
		this.demand = demand;
	}
	
	@Column(name = "description", length = 65535)
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "product_id", length = 32)
	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public void setIsOutsourc(String isOutsourc) {
		this.isOutsourc = isOutsourc;
	}

	@Column(name = "is_outsourc", length = 32)
	public String getIsOutsourc() {
		return isOutsourc;
	}
	
	
}
