package cn.com.fsun.bus.dto;

import java.util.List;

import cn.com.fsun.common.dto.BaseDto;

public class ProductDto extends BaseDto{

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
	
	private String isFilm; //是否菲林
	private String isScotch; //是否透明纸
	private String isOutsourc;//是否外协
	
	private List<AfterProcessDto> afterProcess;//后道工序
	
	private String q;

	public ProductDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProductDto(String id, String code, String name, String style,
			Double price, String icon, Boolean film, Boolean scotch,
			String material, String spec, String openNum, String openSize,
			String openMethod, String model, String process, Boolean outsourc,
			String layout, String impos, String colors, String description) {
		super();
		this.id = id;
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

	public ProductDto(String id, String code, String name, Double price,
			String icon, String description) {
		super();
		this.id = id;
		this.code = code;
		this.name = name;
		this.price = price;
		this.icon = icon;
		this.description = description;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public Boolean getFilm() {
		return film;
	}

	public void setFilm(Boolean film) {
		this.film = film;
	}

	public Boolean getScotch() {
		return scotch;
	}

	public void setScotch(Boolean scotch) {
		this.scotch = scotch;
	}

	public String getMaterial() {
		return material;
	}

	public void setMaterial(String material) {
		this.material = material;
	}

	public String getSpec() {
		return spec;
	}

	public void setSpec(String spec) {
		this.spec = spec;
	}

	public String getOpenNum() {
		return openNum;
	}

	public void setOpenNum(String openNum) {
		this.openNum = openNum;
	}

	public String getOpenSize() {
		return openSize;
	}

	public void setOpenSize(String openSize) {
		this.openSize = openSize;
	}

	public String getOpenMethod() {
		return openMethod;
	}

	public void setOpenMethod(String openMethod) {
		this.openMethod = openMethod;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getProcess() {
		return process;
	}

	public void setProcess(String process) {
		this.process = process;
	}

	public Boolean getOutsourc() {
		return outsourc;
	}

	public void setOutsourc(Boolean outsourc) {
		this.outsourc = outsourc;
	}

	public String getLayout() {
		return layout;
	}

	public void setLayout(String layout) {
		this.layout = layout;
	}

	public String getImpos() {
		return impos;
	}

	public void setImpos(String impos) {
		this.impos = impos;
	}

	public String getColors() {
		return colors;
	}

	public void setColors(String colors) {
		this.colors = colors;
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

	public String getIsFilm() {
		return isFilm;
	}

	public void setIsFilm(String isFilm) {
		this.isFilm = isFilm;
	}

	public String getIsScotch() {
		return isScotch;
	}

	public void setIsScotch(String isScotch) {
		this.isScotch = isScotch;
	}

	public String getIsOutsourc() {
		return isOutsourc;
	}

	public void setIsOutsourc(String isOutsourc) {
		this.isOutsourc = isOutsourc;
	}

	public List<AfterProcessDto> getAfterProcess() {
		return afterProcess;
	}

	public void setAfterProcess(List<AfterProcessDto> afterProcess) {
		this.afterProcess = afterProcess;
	}

	public String getQ() {
		return q;
	}

	public void setQ(String q) {
		this.q = q;
	}
	
	
}
