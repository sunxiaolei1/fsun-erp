/**  
 * Project Name:fsun-erp  
 * File Name:MadePrintsDto.java  
 * Package Name:cn.com.fsun.bus.dto  
 * Date:2017年8月21日 
 * Copyright (c) 2017, WFZ All Rights Reserved.  
 *  
*/  
  
package cn.com.fsun.bus.dto;

import java.util.List;

/**  
 * ClassName:MadePrintsDto <br/>  
 * Description: 生产单打印对象   
 * @author   lenovo  
 * @version  1.0  
 * @since    JDK 1.7        
 */
public class MadePrintsDto {

	/**
	 * 生产单打印头信息
	 */
	private MadeHeaderDto madeHeaderDto;
	
	/**
	 * 生产单打印明细
	 */
	private List<MadePrintDetailDto> madePrintDetailDtos;

	public MadeHeaderDto getMadeHeaderDto() {
		return madeHeaderDto;
	}

	public void setMadeHeaderDto(MadeHeaderDto madeHeaderDto) {
		this.madeHeaderDto = madeHeaderDto;
	}

	public List<MadePrintDetailDto> getMadePrintDetailDtos() {
		return madePrintDetailDtos;
	}

	public void setMadePrintDetailDtos(List<MadePrintDetailDto> madePrintDetailDtos) {
		this.madePrintDetailDtos = madePrintDetailDtos;
	}

}
  
