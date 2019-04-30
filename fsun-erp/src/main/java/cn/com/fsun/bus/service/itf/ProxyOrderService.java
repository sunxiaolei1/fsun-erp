package cn.com.fsun.bus.service.itf;

import java.util.List;

import cn.com.fsun.bus.dto.ProxyOrderDto;
import cn.com.fsun.bus.dto.ProxyOrderHeaderDto;
import cn.com.fsun.bus.exception.MyException;
import cn.com.fsun.bus.exception.UnEnoughOrderCodeException;
import cn.com.fsun.common.utils.PageInfo;

/**
 * 
 * @author sunxiaolei
 *
 */
public interface ProxyOrderService {

	
	/**
	 * @description 显示列表（有查询条件）
	 * @return List<ProxyOrderHeaderDto>
	 * @update 2012-8-13 上午9:36:48
	 */
	public List<ProxyOrderHeaderDto> search(ProxyOrderHeaderDto headerDto, PageInfo pageInfo,boolean isPage);
	
	/**
	 * 获取查询总数
	 * TODO
	 * @Title getSearchCount   
	 * @param headerDto
	 * @param pageInfo
	 * @return int
	 */
	public int getSearchCount(ProxyOrderHeaderDto headerDto, PageInfo pageInfo);
	
	
	/**
	 * 通过code码获取信息
	 * TODO
	 * @Title loadByCode   
	 * @param proxyCode
	 * @return ProxyOrderDto
	 */
	public ProxyOrderDto getEntry(String proxyCode);
	
	
	/**
	 * @description 增加或者修改
	 * @return ProxyOrderDto
	 * @param proxyOrderDto
	 * @return
	 * @throws MyException 
	 * @update 2013-2-21
	 */
	public ProxyOrderDto saveEntry(ProxyOrderDto proxyOrderDto) throws MyException;
	
	
	/**
	 * 更新操作
	 * TODO
	 * @Title update   
	 * @param madeHeaderDto void
	 * @throws MyException 
	 */
	public void updateEntry(ProxyOrderDto proxyOrderDto) throws MyException;
	
	
	/**
	 * 
	 * TODO
	 * @Title delete   
	 * @param proxyCode
	 * @throws Exception void
	 */
	public void deleteEntry(String proxyCode) throws Exception;
	
	
	/**
	 * 
	 * TODO
	 * @Title getInitCode   
	 * @return
	 * @throws UnEnoughOrderCodeException String
	 */
	public String getInitCode() throws UnEnoughOrderCodeException;
	
	/**
	 * 获取打印对象
	 * TODO
	 * @Title getProxyPrints   
	 * @param proxyCode
	 * @return ProxyOrderDto
	 */
	public ProxyOrderDto getProxyPrints(String proxyCode);

	/**
	 * 标记打印
	 * TODO
	 * @Title signPrint   
	 * @param madeCode void
	 */
	public void signPrint(String proxyCode);

	/**
	 * 结单
	 * TODO
	 * @Title completeProxy   
	 * @param proxyCode
	 */
	public void completeProxy(String proxyCode);
}
