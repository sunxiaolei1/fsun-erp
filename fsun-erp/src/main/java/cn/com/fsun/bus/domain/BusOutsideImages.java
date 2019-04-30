package cn.com.fsun.bus.domain;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

import cn.com.fsun.common.domain.BaseDomain;

@Entity
@Table(name = "bus_outside_images")
public class BusOutsideImages extends BaseDomain{

	private Integer id;	
	private byte[] images; //图片
	private String name; //图片名称
	private String outSideId; //图片所属回执单（实际存入数据库的值是订单编号orderCode）
		
	public BusOutsideImages() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BusOutsideImages(byte[] images, String name,String outSideId) {
		super();
		this.images = images;
		this.name = name;
		this.outSideId = outSideId;
	}

	@Id
	@GeneratedValue(strategy  = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false, length = 10)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Lob
	@Basic(fetch=FetchType.LAZY)
	@Column(name = "images", columnDefinition="BLOB",nullable=true)
	public byte[] getImages() {
		return images;
	}

	public void setImages(byte[] images) {
		this.images = images;
	}

	@Column(name = "name", length = 64)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name = "outside_id", length = 32)
	public String getOutSideId() {
		return outSideId;
	}

	public void setOutSideId(String outSideId) {
		this.outSideId = outSideId;
	}
	
}
