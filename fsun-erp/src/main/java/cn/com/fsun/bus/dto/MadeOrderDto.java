/**  
 * Project Name:fsun-erp  
 * File Name:MadeOrderDto.java  
 * Package Name:cn.com.fsun.bus.dto  
 * Date:2017年8月9日 
 * Copyright (c) 2017, WFZ All Rights Reserved.  
 *  
*/  
  
package cn.com.fsun.bus.dto;

import java.util.List;

/**  
 * ClassName:MadeOrderDto <br/>  
 * Description: 生产单对象  
 * @author   lenovo  
 * @version  1.0  
 * @since    JDK 1.7        
 */
public class MadeOrderDto {

	/**
	 * 生产单头信息
	 */
	private MadeHeaderDto madeHeaderDto;
	
	/**
	 * 生产单明细
	 */
	private List<MadeDetailDto> madeDetailDtos;
	
	/**
	 * 生产单后道工序明细
	 */
	private List<MadeProcessDto> madeProcessDtos;
	
	/**
	 * 包装单
	 */
	private List<MadePackageDto> madePackageDtos;

	public MadeHeaderDto getMadeHeaderDto() {
		return madeHeaderDto;
	}

	public void setMadeHeaderDto(MadeHeaderDto madeHeaderDto) {
		this.madeHeaderDto = madeHeaderDto;
	}

	public List<MadeDetailDto> getMadeDetailDtos() {
		return madeDetailDtos;
	}

	public void setMadeDetailDtos(List<MadeDetailDto> madeDetailDtos) {
		this.madeDetailDtos = madeDetailDtos;
	}

	public List<MadeProcessDto> getMadeProcessDtos() {
		return madeProcessDtos;
	}

	public void setMadeProcessDtos(List<MadeProcessDto> madeProcessDtos) {
		this.madeProcessDtos = madeProcessDtos;
	}

	public List<MadePackageDto> getMadePackageDtos() {
		return madePackageDtos;
	}

	public void setMadePackageDtos(List<MadePackageDto> madePackageDtos) {
		this.madePackageDtos = madePackageDtos;
	}
	
}
  
