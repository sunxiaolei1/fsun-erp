package cn.com.fsun.bus.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.fsun.bus.biz.itf.ProxyPrintDetailManage;
import cn.com.fsun.bus.dto.ProxySummaryDto;
import cn.com.fsun.bus.service.itf.ProxyDetailSummaryService;
import cn.com.fsun.common.excel.ExcelUtil1;
import cn.com.fsun.common.excel.KCollectionUtil;
import cn.com.fsun.common.excel.KFileUtil;
import cn.com.fsun.common.utils.FileOperate;
import cn.com.fsun.common.utils.PageInfo;

@Service
public class ProxyDetailSummaryServiceImpl implements ProxyDetailSummaryService {

	@Autowired
	private ProxyPrintDetailManage printDetailManage;
	
	@Override
	public List<ProxySummaryDto> search(ProxySummaryDto proxySummaryDto, PageInfo pageInfo, boolean isPage) {
		List<ProxySummaryDto> proxySummaryDtos = printDetailManage.searchSummary(
				proxySummaryDto, pageInfo, isPage);
		return proxySummaryDtos;
	}

	@Override
	public int searchCount(ProxySummaryDto proxySummaryDto, PageInfo pageInfo) {
		List<ProxySummaryDto> proxySummaryDtos = printDetailManage.searchSummary(
				proxySummaryDto, pageInfo, false);
		if(proxySummaryDtos!=null){
			return proxySummaryDtos.size();
		}
		return 0;
	}

	@Override
	public String writeExcel(ProxySummaryDto proxySummaryDto, PageInfo pageInfo, String rootPath, String temp_path,
			String fileName, String[] titles) throws Exception {
		FileOperate.deleteFile(rootPath + temp_path, ".xlsx");		
		List<String> files = new ArrayList<String>();
		String tempFileName = KFileUtil.getExcelFile("prefix_");	
		int limit = 10000;
		int start = 0;		
		String hql = printDetailManage.createHql(proxySummaryDto, pageInfo);
		List<List<Object>> data = printDetailManage.getData(hql,limit,start);
		while (KCollectionUtil.isNotNullAndEmpty(data)) {
			files.add(rootPath + temp_path +tempFileName);			
			ExcelUtil1.writeData(null, data, rootPath + temp_path +tempFileName);		
			if(data.size()<limit){
				data = null;				
				break;
			}else{
				tempFileName = KFileUtil.getExcelFile("prefix_");
				start += limit;
				data = printDetailManage.getData(hql,limit,start);
			}	
		}		
		ExcelUtil1.mergeExcel(titles,files,rootPath + temp_path + fileName);				
		return fileName;
	}

}
