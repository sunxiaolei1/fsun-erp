package cn.com.fsun.common.dto;

public class CommonDto {
	
	private String code;
	private String name;
	
	public CommonDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CommonDto(String code, String name) {
		super();
		this.code = code;
		this.name = name;
	}
	
	public CommonDto(String code) {
		super();
		this.code = code;
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
	
	
	
}
