package cn.com.fsun.bus.dto;

import cn.com.fsun.common.dto.BaseDto;

public class OutsideImagesDto extends BaseDto {

	private Integer id;	
	private byte[] images; //图片
	private String name; //图片名称	
	private String outSideId; //图片所属回执单	（实际存入数据库的值是订单编号orderCode）
	
	public OutsideImagesDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OutsideImagesDto(Integer id, byte[] images, String name,String outSideId) {
		super();
		this.id = id;
		this.images = images;
		this.name = name;
		this.outSideId = outSideId;
	}

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public byte[] getImages() {
		return images;
	}
	public void setImages(byte[] images) {
		this.images = images;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public void setOutSideId(String outSideId) {
		this.outSideId = outSideId;
	}

	public String getOutSideId() {
		return outSideId;
	}
	
}
