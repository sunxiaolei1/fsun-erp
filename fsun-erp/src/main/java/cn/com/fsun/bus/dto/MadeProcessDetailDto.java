/**  
 * Project Name:fsun-erp  
 * File Name:MadeProcessDetailDto.java  
 * Package Name:cn.com.fsun.bus.dto  
 * Date:2017年8月21日 
 * Copyright (c) 2017, WFZ All Rights Reserved.  
 *  
*/  
  
package cn.com.fsun.bus.dto;

import java.util.List;

/**  
 * ClassName:MadeProcessDetailDto <br/>  
 * Description: 生产工艺明细
 * @author   lenovo  
 * @version  1.0  
 * @since    JDK 1.7        
 */
public class MadeProcessDetailDto {

	/**
	 * 制作、印刷工艺明细
	 */
	private MadeDetailDto madeDetailDto;
	
	/**
	 * 后道工序明细
	 */
	private List<MadeProcessDto> madeProcessDtos;

	public MadeDetailDto getMadeDetailDto() {
		return madeDetailDto;
	}

	public void setMadeDetailDto(MadeDetailDto madeDetailDto) {
		this.madeDetailDto = madeDetailDto;
	}

	public List<MadeProcessDto> getMadeProcessDtos() {
		return madeProcessDtos;
	}

	public void setMadeProcessDtos(List<MadeProcessDto> madeProcessDtos) {
		this.madeProcessDtos = madeProcessDtos;
	}
	

}
  
