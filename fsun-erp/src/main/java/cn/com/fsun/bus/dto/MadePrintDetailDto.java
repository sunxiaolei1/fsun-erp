/**  
 * Project Name:fsun-erp  
 * File Name:MadePrintDetailDto.java  
 * Package Name:cn.com.fsun.bus.dto  
 * Date:2017年8月21日 
 * Copyright (c) 2017, WFZ All Rights Reserved.  
 *  
*/  
  
package cn.com.fsun.bus.dto;

import java.util.List;

import cn.com.fsun.bus.domain.BusProductInfo;

/**  
 * ClassName:MadePrintDetailDto <br/>  
 * Description: 打印明细  
 * @author   lenovo  
 * @version  1.0  
 * @since    JDK 1.7        
 */
public class MadePrintDetailDto {

	/**
	 * 产品基本信息
	 */
	private BusProductInfo productInfo;
	
	/**
	 * 工艺明细的条目长度
	 */
	private int madeProcessDetailLength;
	
	/**
	 * 生产单工艺明细列表
	 */
	private List<MadeProcessDetailDto> madeProcessDetailDtos;
	
	/**
	 * 包装单
	 */
	private List<MadePackageDto> madePackageDtos;

	public BusProductInfo getProductInfo() {
		return productInfo;
	}

	public void setProductInfo(BusProductInfo productInfo) {
		this.productInfo = productInfo;
	}

	public List<MadeProcessDetailDto> getMadeProcessDetailDtos() {
		return madeProcessDetailDtos;
	}

	public void setMadeProcessDetailDtos(List<MadeProcessDetailDto> madeProcessDetailDtos) {
		this.madeProcessDetailDtos = madeProcessDetailDtos;
	}

	public List<MadePackageDto> getMadePackageDtos() {
		return madePackageDtos;
	}

	public void setMadePackageDtos(List<MadePackageDto> madePackageDtos) {
		this.madePackageDtos = madePackageDtos;
	}

	public int getMadeProcessDetailLength() {
		return madeProcessDetailLength;
	}

	public void setMadeProcessDetailLength(int madeProcessDetailLength) {
		this.madeProcessDetailLength = madeProcessDetailLength;
	}
	
}
  
