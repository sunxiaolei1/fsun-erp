/**  
 * Project Name:fsun-erp  
 * File Name:DeliveryDetailSummaryService.java  
 * Package Name:cn.com.fsun.bus.service.itf  
 * Date:2017年8月27日 
 * Copyright (c) 2017, WFZ All Rights Reserved.  
 *  
*/  
  
package cn.com.fsun.bus.service.itf;

import java.util.List;

import cn.com.fsun.bus.dto.DeliverySummaryDto;
import cn.com.fsun.common.utils.PageInfo;

/**  
 * ClassName:DeliveryDetailSummaryService <br/>  
 * Description: TODO <br/>   
 * @author   lenovo  
 * @version  1.0  
 * @since    JDK 1.7        
 */
public interface DeliveryDetailSummaryService {

	/**
	 * 可带分页查询
	 * TODO
	 * @Title search   
	 * @param deliverySummaryDto
	 * @param pageInfo
	 * @param isPage
	 * @return List<DeliverySummaryDto>
	 */
	List<DeliverySummaryDto> search(DeliverySummaryDto deliverySummaryDto, PageInfo pageInfo, boolean isPage);

	
	/**
	 * 查总数
	 * TODO
	 * @Title searchCount   
	 * @param deliverySummaryDto
	 * @param pageInfo
	 * @return int
	 */
	int searchCount(DeliverySummaryDto deliverySummaryDto, PageInfo pageInfo);
	
	
	/**
	 * 将数据写入excel中
	 * TODO
	 * @Title writeExcel   
	 * @param deliverySummaryDto
	 * @param pageInfo
	 * @param rootPath
	 * @param temp_path
	 * @param fileName
	 * @param titles
	 * @return
	 * @throws Exception String
	 */
	public String writeExcel(DeliverySummaryDto deliverySummaryDto, PageInfo pageInfo, String rootPath, 
			String temp_path, String fileName, String[] titles) throws Exception;
}
  
