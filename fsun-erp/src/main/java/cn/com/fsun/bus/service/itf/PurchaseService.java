package cn.com.fsun.bus.service.itf;

import java.util.List;

import cn.com.fsun.bus.dto.BuyInfoDto;
import cn.com.fsun.bus.dto.PosDto;
import cn.com.fsun.bus.dto.PurchaseDto;
import cn.com.fsun.bus.exception.UnEnoughPurchaseCodeException;
import cn.com.fsun.common.pageInfo.PageInfo;


public interface PurchaseService {
	
	/**
	 * @description 显示列表（无查询条件）
	 * @return List<PurchaseDto>
	 * @update 2012-8-13 上午9:36:48
	 */
	public List<PurchaseDto> list(PurchaseDto purchaseDto);
	
	/**
     * 获取带条件的分页订单信息
     * @param orderDto
     * @param pageInfo
     * @return
     */
	public List<PurchaseDto> getOrderInfoForPage(PurchaseDto purchaseDto, PageInfo pageInfo) ;
	

	/**
	 * @description 增加或者修改
	 * @return OrderDto
	 * @param orderDto
	 * @return
	 * @throws UnEnoughPurchaseCodeException 
	 * @update 2013-2-21
	 */
	public PurchaseDto save(PurchaseDto purchaseDto) throws UnEnoughPurchaseCodeException;
	
	
	/**
	 * @description 加载一个菜单节点
	 * @return OrderDto
	 * @param id
	 * @update 2012-8-13 上午9:38:10
	 */
	public PurchaseDto load(String id);

	/**
	 * 创建采购计划
	 * @param purchaseDto
	 * @param buyInfoDtos
	 * @return
	 */
	public PurchaseDto create(PurchaseDto purchaseDto, List<BuyInfoDto> buyInfoDtos) throws UnEnoughPurchaseCodeException;
	
	/**
	 * @description 删除一个菜单节点
	 * @return void
	 * @param id
	 * @throws Exception 
	 * @update 2012-8-13 上午9:37:49
	 */
	public void delete(String id) throws Exception;

	/**
	 * 获取用来打印的采购单
	 * @param ids
	 * @param buyInfoIds
	 * @param hasOperatePower
	 * @return
	 */
	public List<PosDto> getPosInfo(String ids, String buyInfoIds, boolean hasOperatePower);


//	/**
//	 * @description 获取查询结果数量
//	 * @return int
//	 * @param orderDto
//	 * @param pageInfo
//	 * @return
//	 * @update 2013-3-11
//	 */
//	public int getSearchCount(PurchaseDto purchaseDto,PageInfo pageInfo);
//
//
//	public void hasGoodForOrder(String string, String string2) ;
//
//	public boolean deletefromSaleOrBuyInfo(String[] ids,String property) ;
//
//
//	public boolean changeStatus(PurchaseDto purchaseDto) ;
//   
//	
//
//
//	/**
//	 * 有没操作权限
//	 * @param orderDto
//	 * @return
//	 */
//	public Boolean operatePower(PurchaseDto purchaseDto) ;

}
