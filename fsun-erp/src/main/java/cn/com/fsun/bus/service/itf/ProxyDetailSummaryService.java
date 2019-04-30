package cn.com.fsun.bus.service.itf;

import java.util.List;

import cn.com.fsun.bus.dto.ProxySummaryDto;
import cn.com.fsun.common.utils.PageInfo;

/**  
 * ClassName:ProxyDetailSummaryService <br/>  
 * Description: TODO <br/>   
 * @author   lenovo  
 * @version  1.0  
 * @since    JDK 1.7        
 */
public interface ProxyDetailSummaryService {

	/**
	 * 可带分页查询
	 * TODO
	 * @Title search   
	 * @param proxySummaryDto
	 * @param pageInfo
	 * @param isPage
	 * @return List<ProxySummaryDto>
	 */
	List<ProxySummaryDto> search(ProxySummaryDto proxySummaryDto, PageInfo pageInfo, boolean isPage);

	
	/**
	 * 查总数
	 * TODO
	 * @Title searchCount   
	 * @param proxySummaryDto
	 * @param pageInfo
	 * @return int
	 */
	int searchCount(ProxySummaryDto proxySummaryDto, PageInfo pageInfo);
	
	
	/**
	 * 将数据写入excel中
	 * TODO
	 * @Title writeExcel   
	 * @param proxySummaryDto
	 * @param pageInfo
	 * @param rootPath
	 * @param temp_path
	 * @param fileName
	 * @param titles
	 * @return
	 * @throws Exception String
	 */
	public String writeExcel(ProxySummaryDto proxySummaryDto, PageInfo pageInfo, String rootPath, 
			String temp_path, String fileName, String[] titles) throws Exception;
}
