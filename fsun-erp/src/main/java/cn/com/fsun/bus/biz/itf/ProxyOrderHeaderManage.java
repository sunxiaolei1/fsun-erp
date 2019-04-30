package cn.com.fsun.bus.biz.itf;

import java.util.List;

import cn.com.fsun.bus.dto.ProxyOrderHeaderDto;
import cn.com.fsun.common.utils.PageInfo;
import cn.com.fsun.sys.domain.User;

/**
 * 
 * @author sunxiaolei
 *
 */
public interface ProxyOrderHeaderManage {

	/**
	 * 查询列表
	 * @param headerDto
	 * @param pageInfo
	 * @param isPage
	 * @return
	 */
	public List<ProxyOrderHeaderDto> search(ProxyOrderHeaderDto headerDto, PageInfo pageInfo, boolean isPage);
	
	/**
	 * 保存单据头
	 * @param headerDto
	 * @return
	 */
	public ProxyOrderHeaderDto save(ProxyOrderHeaderDto headerDto);
	
	
	/**
	 * 通过加工单号删除单据
	 * @param proxyCode
	 * @throws Exception
	 */
	public void deleteEntry(String proxyCode) throws Exception;
	
	/**
	 * 通过主键获取加工单头
	 * @param id
	 * @return
	 */
	public ProxyOrderHeaderDto load(String id);
	
	/**
	 * 通过编号获取加工单头
	 * @param proxyCode
	 * @return
	 */
	public ProxyOrderHeaderDto loadByCode(String proxyCode) ;
	
	/**
	 * 更新单据头
	 * @param headerDto
	 */
	public void update(ProxyOrderHeaderDto headerDto, User currUser);
	
	/**
	 * 打印标记
	 * @param proxyCode
	 */
	public void signPrint(String proxyCode, User currUser) ;
	
	/**
	 * 结束单据
	 * @param proxyCode
	 */
	public void completeProxy(String proxyCode, User currUser);
	
	/**
	 * 获取加工单号
	 * @param sign
	 * @return
	 */
	public Long getInitCode(String sign);
}
