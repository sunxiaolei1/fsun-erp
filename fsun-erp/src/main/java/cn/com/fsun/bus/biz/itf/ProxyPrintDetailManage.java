package cn.com.fsun.bus.biz.itf;

import java.util.List;

import cn.com.fsun.bus.dto.ProxyPrintDetailDto;
import cn.com.fsun.bus.dto.ProxySummaryDto;
import cn.com.fsun.common.utils.PageInfo;

/**
 * 
 * @author sunxiaolei
 *
 */
public interface ProxyPrintDetailManage {

	/**
	 * 增加或者修改
	 * @param detailDto
	 * @return
	 */
	public List<ProxyPrintDetailDto> batchSave(List<ProxyPrintDetailDto> detailDtos);
	

	/**
	 * 通过编号获取明细
	 * @param code
	 * @return
	 */
	public List<ProxyPrintDetailDto> loadByCode(String code);
	
	/**
	 * 通过编号删除明细
	 * @param proxyCode
	 * @return
	 */
	public void deleteByProxyCode(String proxyCode);


	/**
	 * 更新操作
	 * @param detailDto
	 */
	public void batchUpdate(List<ProxyPrintDetailDto> detailDtos);
	
	
	/**
     * 
     * @param proxySummaryDto
     * @param pageInfo
     * @param isPage
     * @return
     */
	public List<ProxySummaryDto> searchSummary(ProxySummaryDto proxySummaryDto,
		PageInfo pageInfo, boolean isPage);


	/**
	 * 
	 * @param proxySummaryDto
	 * @param pageInfo
	 * @return
	 */
	public String createHql(ProxySummaryDto proxySummaryDto, PageInfo pageInfo);


	/**
	 * 
	 * @param hql
	 * @param limit
	 * @param start
	 * @return
	 */
	public List<List<Object>> getData(String hql, int limit, int start);

}
