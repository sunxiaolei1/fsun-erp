package cn.com.fsun.bus.service.itf;

import java.util.List;
import cn.com.fsun.bus.dto.BuyInfoDto;
import cn.com.fsun.common.pageInfo.PageInfo;

public interface BuyInfoService {
	
	/**
	 * 获取带查询要条件(采购单ID)的进货信息（不分页）
	 * @param buyInfoDto
	 * @return
	 */
	public List<BuyInfoDto> findBuyInfoByRequest(BuyInfoDto buyInfoDto);
	

	/**
	 * @description 增加或者修改(并且修改对应订单下的总价和修改库存)
	 * @return BuyInfoDto
	 * @param buyInfoDto
	 * @throws Exception 
	 * @throws Exception 
	 * @update 2013-2-21
	 */
	public BuyInfoDto save(BuyInfoDto buyInfoDto);
	
	/**
	 * @description 删除一个菜单节点(并且修改对应订单下的总价)
	 * @return void
	 * @param id
	 * @throws Exception 
	 * @update 2012-8-13 上午9:37:49
	 */
	public void delete(Integer id, String purchaseId);
	
	/**
	 * @description 加载一个菜单节点
	 * @return BuyInfoDto
	 * @param id
	 * @update 2012-8-13 上午9:38:10
	 */
	public BuyInfoDto load(Integer id);
	
	/**
	 * @description 通过物料id判别是否已下过单
	 * @return boolean
	 * @param materielId
	 * @update 2012-8-13 上午9:38:10
	 */
	public boolean materielUsed(Long materielId);


	/**
	 * @description 验收多条记录
	 * @return ModelMap
	 * @param id
	 * @update 2012-8-9 下午3:53:10
	 */
	public void accept(String ids) throws Exception ;
	
	/**
	 * 更新供货厂家
	 * @param ids
	 * @throws Exception 
	 */
	public void updateFactory(String ids, String factoryId) throws Exception;

	/**
	 * @description 验证是否已经验收成功了
	 * @return ModelMap
	 * @param id
	 * @update 2012-8-9 下午3:53:10
	 */
	public String acceptSuccess(String ids,String names);
	
	/**
	 * 根据条件导出excel
	 * @param buyInfoDto
	 * @return
	 */
	public List<BuyInfoDto> findBuyInfoByRequestForExcelExport(BuyInfoDto buyInfoDto) ;

}
