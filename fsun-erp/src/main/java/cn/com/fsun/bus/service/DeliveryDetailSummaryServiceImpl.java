/**  
 * Project Name:fsun-erp  
 * File Name:DeliveryDetailSummaryServiceImpl.java  
 * Package Name:cn.com.fsun.bus.service  
 * Date:2017年8月27日 
 * Copyright (c) 2017, WFZ All Rights Reserved.  
 *  
*/  
  
package cn.com.fsun.bus.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.fsun.bus.biz.itf.DeliveryDetailManage;
import cn.com.fsun.bus.dto.DeliverySummaryDto;
import cn.com.fsun.bus.service.itf.DeliveryDetailSummaryService;
import cn.com.fsun.common.excel.ExcelUtil1;
import cn.com.fsun.common.excel.KCollectionUtil;
import cn.com.fsun.common.excel.KFileUtil;
import cn.com.fsun.common.service.BaseService;
import cn.com.fsun.common.utils.FileOperate;
import cn.com.fsun.common.utils.PageInfo;

/**  
 * ClassName:DeliveryDetailSummaryServiceImpl <br/>  
 * Description: TODO <br/>   
 * @author   lenovo  
 * @version  1.0  
 * @since    JDK 1.7        
 */
@Service
public class DeliveryDetailSummaryServiceImpl extends BaseService implements DeliveryDetailSummaryService {
	
	@Autowired
	private DeliveryDetailManage deliveryDetailManage;

	@Override
	public List<DeliverySummaryDto> search(DeliverySummaryDto deliverySummaryDto, PageInfo pageInfo, boolean isPage) {
		  
		List<DeliverySummaryDto>  deliverySummaryDtos = deliveryDetailManage.searchSummary(deliverySummaryDto,pageInfo,isPage);
		return deliverySummaryDtos;
	}


	@Override
	public int searchCount(DeliverySummaryDto deliverySummaryDto, PageInfo pageInfo) {
		  
		List<DeliverySummaryDto> deliverySummaryDtos = deliveryDetailManage.searchSummary(deliverySummaryDto,pageInfo,false);
		if(deliverySummaryDtos!=null){
			return deliverySummaryDtos.size();
		}
		return 0;
	}


	@Override
	public String writeExcel(DeliverySummaryDto deliverySummaryDto, PageInfo pageInfo, String rootPath, 
		String temp_path, String fileName, String[] titles) throws Exception{
		
		FileOperate.deleteFile(rootPath + temp_path, ".xlsx");		
		List<String> files = new ArrayList<String>();
		String tempFileName = KFileUtil.getExcelFile("prefix_");	
		int limit = 10000;
		int start = 0;		
		String hql = deliveryDetailManage.createHql(deliverySummaryDto, pageInfo);
		List<List<Object>> data = deliveryDetailManage.getData(hql,limit,start);
		while (KCollectionUtil.isNotNullAndEmpty(data)) {
			files.add(rootPath + temp_path +tempFileName);			
			ExcelUtil1.writeData(null, data, rootPath + temp_path +tempFileName);		
			if(data.size()<limit){
				data = null;				
				break;
			}else{
				tempFileName = KFileUtil.getExcelFile("prefix_");
				start += limit;
				data = deliveryDetailManage.getData(hql,limit,start);
			}	
		}		
		ExcelUtil1.mergeExcel(titles,files,rootPath + temp_path + fileName);				
		return fileName;
	}

}
  
