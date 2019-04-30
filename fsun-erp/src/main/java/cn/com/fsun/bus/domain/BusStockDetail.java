package cn.com.fsun.bus.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "bus_stock_detail")
public class BusStockDetail implements java.io.Serializable {

	// Fields
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private Long stockId; //存储Id
	private String style; //款号
	private Integer num; //数量
	private String unit; //单位	
	private String description;
	
	public BusStockDetail() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public BusStockDetail(String id, Long stockId, String style, Integer num,
			String unit, String description) {
		super();
		this.id = id;
		this.stockId = stockId;
		this.style = style;
		this.num = num;
		this.unit = unit;
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
	
	@Column(name = "stock_id", nullable = false)
	public Long getStockId() {
		return stockId;
	}
	public void setStockId(Long stockId) {
		this.stockId = stockId;
	}
	
	@Column(name = "style", length = 32)
	public String getStyle() {
		return style;
	}
	public void setStyle(String style) {
		this.style = style;
	}
	
	@Column(name = "num")
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	
	@Column(name = "unit", length = 32)
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	
	@Column(name = "description", length = 65535)
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	
}
