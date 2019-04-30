package cn.com.fsun.bus.dto;

public class AfterProcessDto {

	private String id;
	private String productId;   //产品ID
	private String name; //工序名称
	private String isOutsourc; //是否外协
	private Integer number;//产品数量
	private String demand;//工序要求
	private String description; //备注
	
	public AfterProcessDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public AfterProcessDto(String id, String productId, String name, 
			String isOutsourc,Integer number, String demand, String description) {
		super();
		this.id = id;
		this.productId = productId;
		this.name = name;
		this.isOutsourc = isOutsourc;
		this.number = number;
		this.demand = demand;
		this.description = description;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	public String getDemand() {
		return demand;
	}
	public void setDemand(String demand) {
		this.demand = demand;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

	public void setIsOutsourc(String isOutsourc) {
		this.isOutsourc = isOutsourc;
	}

	public String getIsOutsourc() {
		return isOutsourc;
	}
	
}
