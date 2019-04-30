/**  
 * Project Name:fsun-erp  
 * File Name:DeliveryDetailManage.java  
 * Package Name:cn.com.fsun.bus.biz.itf  
 * Date:2017年8月25日 
 * Copyright (c) 2017, WFZ All Rights Reserved.  
 *  
*/  
  
package cn.com.fsun.bus.biz.itf;

import java.util.List;

import cn.com.fsun.bus.dto.DeliveryDetailDto;
import cn.com.fsun.bus.dto.DeliverySummaryDto;
import cn.com.fsun.common.utils.PageInfo;

/**  
 * ClassName:DeliveryDetailManage <br/>  
 * Description: TODO <br/>   
 * @author   lenovo  
 * @version  1.0  
 * @since    JDK 1.7        
 */
public interface DeliveryDetailManage {
	
	/**
	 * @description 显示列表（有查询条件）
	 * @return List<MadeDetailDto>
	 * @update 2012-8-13 上午9:36:48
	 */
	public List<DeliveryDetailDto> list(DeliveryDetailDto deliveryDetailDto);

	/**
	 * @description 显示列表（有查询条件）
	 * @return List<MadeDetailDto>
	 * @update 2012-8-13 上午9:36:48
	 */
	public List<DeliveryDetailDto> search(DeliveryDetailDto deliveryDetailDto,PageInfo pageInfo,boolean isPage);
	
	/**
	 * @description 增加或者修改
	 * @return MadeDetailDto
	 * @param madeDetailDto
	 * @return
	 * @update 2013-2-21
	 */
	public DeliveryDetailDto save(DeliveryDetailDto deliveryDetailDto);
	
	/**
	 * @description 增加或者修改
	 * @return MadeDetailDto
	 * @param madeDetailDto
	 * @return
	 * @update 2013-2-21
	 */
	public void batchAdd(List<DeliveryDetailDto> deliveryDetailDtos);
	
	/**
	 * @description 删除一个菜单节点
	 * @return void
	 * @param id
	 * @update 2012-8-13 上午9:37:49
	 */
	public void delete(String id);
	
	/**
	 * 根据生产单编号和明细id删除明细
	 * TODO
	 * @Title delete   
	 * @param id
	 * @param madeCode void
	 */
	public void delete(String id, String deliveryCode) throws Exception;
	
	/**
	 * @description 加载一个菜单节点
	 * @return MadeDetailDto
	 * @param id
	 * @update 2012-8-13 上午9:38:10
	 */
	public DeliveryDetailDto load(String id);


	/**
	 * 更新操作
	 * TODO
	 * @Title update   
	 * @param madeDetailDto void
	 */
	public void update(DeliveryDetailDto deliveryDetailDto);
	
	
	/***********************************************            汇总使用                   *************************************************/

	/**
	 * 查询列表(可带分页)
	 * TODO
	 * @Title searchSummary   
	 * @param deliverySummaryDto
	 * @param pageInfo
	 * @param isPage
	 * @return List<DeliverySummaryDto>
	 */
	public List<DeliverySummaryDto> searchSummary(DeliverySummaryDto deliverySummaryDto, 
			PageInfo pageInfo, boolean isPage);

	/**
	 * 创建hql
	 * TODO
	 * @Title String   
	 * @param deliverySummaryDto
	 * @param pageInfo
	 * @return String
	 */
	public String createHql(DeliverySummaryDto deliverySummaryDto, PageInfo pageInfo);

	/**
	 * 获取数据
	 * TODO
	 * @Title getData   
	 * @param hql
	 * @param limit
	 * @param start
	 * @return List<List<Object>>
	 */
	public List<List<Object>> getData(String hql, int limit, int start);
	
	
	
}
  
