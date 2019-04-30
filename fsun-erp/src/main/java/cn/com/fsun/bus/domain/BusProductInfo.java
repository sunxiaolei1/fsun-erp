package cn.com.fsun.bus.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;

/**
 * BusProductInfo entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "bus_product_info")
public class BusProductInfo implements java.io.Serializable {

	// Fields

	private String id;
	private String code;//产品编号	
	private String name; //产品名称
	private String style;//产品款号
	private Double price; //单价
	private String icon;//图片
	private Boolean film; //菲林
	private Boolean scotch; //透明纸
		
	private String material;//材质名称
	private String spec;   //规格
	private String openNum;//开数	
	private String openSize;//开料尺寸
	private String openMethod;//开料方法
	
	private String model;//生产机型
	private String process;//工序
	private Boolean outsourc;//外协
	private String layout;//拼版	
	private String impos; //拼数
	private String colors; //色数
	private String description; //备注
			
	private Boolean enabled;
	
	private String q;
	
	/** default constructor */
	public BusProductInfo() {
	}
	
	// Constructors
	public BusProductInfo(String code, String name, String style, Double price,
			String icon, Boolean film, Boolean scotch, String material,
			String spec, String openNum, String openSize, String openMethod,
			String model, String process, Boolean outsourc, String layout,
			String impos, String colors, String description) {
		super();
		this.code = code;
		this.name = name;
		this.style = style;
		this.price = price;
		this.icon = icon;
		this.film = film;
		this.scotch = scotch;
		this.material = material;
		this.spec = spec;
		this.openNum = openNum;
		this.openSize = openSize;
		this.openMethod = openMethod;
		this.model = model;
		this.process = process;
		this.outsourc = outsourc;
		this.layout = layout;
		this.impos = impos;
		this.colors = colors;
		this.description = description;
	}

	/** full constructor */
	
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


	@Column(name = "price", precision = 10, scale = 1)
	public Double getPrice() {
		return this.price;
	}

	public void setPrice(Double price) {
		this.price = price;
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

	@Column(name = "code", length = 32)
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@Column(name = "icon", length = 64)
	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	@Column(name = "film")
	public Boolean getFilm() {
		return film;
	}

	public void setFilm(Boolean film) {
		this.film = film;
	}

	@Column(name = "scotch")
	public Boolean getScotch() {
		return scotch;
	}

	public void setScotch(Boolean scotch) {
		this.scotch = scotch;
	}

	@Column(name = "material", length = 32)
	public String getMaterial() {
		return material;
	}

	public void setMaterial(String material) {
		this.material = material;
	}

	@Column(name = "open_num")
	public String getOpenNum() {
		return openNum;
	}

	public void setOpenNum(String openNum) {
		this.openNum = openNum;
	}
	
	@Column(name = "open_size", length = 32)
	public String getOpenSize() {
		return openSize;
	}

	public void setOpenSize(String openSize) {
		this.openSize = openSize;
	}

	@Column(name = "open_method", length = 65535)
	public String getOpenMethod() {
		return openMethod;
	}

	public void setOpenMethod(String openMethod) {
		this.openMethod = openMethod;
	}

	@Column(name = "layout", length = 32)
	public String getLayout() {
		return layout;
	}

	public void setLayout(String layout) {
		this.layout = layout;
	}

	@Column(name = "model", length = 32)
	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	@Column(name = "outsourc")
	public Boolean getOutsourc() {
		return outsourc;
	}

	public void setOutsourc(Boolean outsourc) {
		this.outsourc = outsourc;
	}

	@Column(name = "process", length = 128)
	public String getProcess() {
		return process;
	}

	public void setProcess(String process) {
		this.process = process;
	}

	public void setStyle(String style) {
		this.style = style;
	}
	
	@Column(name = "style", length = 65535)
	public String getStyle() {
		return style;
	}

	@Column(name = "spec", length = 32)
	public String getSpec() {
		return spec;
	}

	public void setSpec(String spec) {
		this.spec = spec;
	}

	@Column(name = "impos", length = 32)
	public String getImpos() {
		return impos;
	}

	public void setImpos(String impos) {
		this.impos = impos;
	}

	@Column(name = "colors", length = 32)
	public String getColors() {
		return colors;
	}

	public void setColors(String colors) {
		this.colors = colors;
	}
	
	@Transient 
	public String getQ() {
		return q;
	}

	public void setQ(String q) {
		this.q = q;
	}
	
}