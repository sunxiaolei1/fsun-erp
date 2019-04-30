package cn.com.fsun.bus.biz.itf;

import java.util.List;

import cn.com.fsun.bus.dto.ProxyOrderDetailDto;
import cn.com.fsun.bus.dto.ProxySummaryDto;
import cn.com.fsun.common.utils.PageInfo;

/**
 * 
 * @author sunxiaolei
 *
 */
public interface ProxyOrderDetailManage {

	/**
	 * 增加或者修改
	 * @param detailDto
	 * @return
	 */
	public ProxyOrderDetailDto save(ProxyOrderDetailDto detailDto);
	

	/**
	 * 通过编号获取明细
	 * @param code
	 * @return
	 */
	public ProxyOrderDetailDto loadByCode(String code);


	/**
	 * 更新操作
	 * @param detailDto
	 */
	public void update(ProxyOrderDetailDto detailDto);
	
	
}
