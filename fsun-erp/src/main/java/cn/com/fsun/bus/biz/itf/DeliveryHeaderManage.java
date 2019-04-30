/**  
 * Project Name:fsun-erp  
 * File Name:DeliveryHeaderManage.java  
 * Package Name:cn.com.fsun.bus.biz.itf  
 * Date:2017年8月25日 
 * Copyright (c) 2017, WFZ All Rights Reserved.  
 *  
*/  
  
package cn.com.fsun.bus.biz.itf;

import java.util.List;

import cn.com.fsun.bus.dto.DeliveryHeaderDto;
import cn.com.fsun.common.utils.PageInfo;

/**  
 * ClassName:DeliveryHeaderManage <br/>  
 * Description: TODO <br/>   
 * @author   lenovo  
 * @version  1.0  
 * @since    JDK 1.7        
 */
public interface DeliveryHeaderManage {

	/**
	 * @description 显示列表（有查询条件）
	 * @return List<madeHeaderDto>
	 * @update 2012-8-13 上午9:36:48
	 */
	public List<DeliveryHeaderDto> search(DeliveryHeaderDto deliveryHeaderDto, PageInfo pageInfo,boolean isPage);
	
	/**
	 * @description 增加或者修改
	 * @return MadeHeaderDto
	 * @param madeHeaderDto
	 * @return
	 * @update 2013-2-21
	 */
	public DeliveryHeaderDto save(DeliveryHeaderDto deliveryHeaderDto);
	
	/**
	 * @description 删除一个菜单节点
	 * @return void
	 * @param id
	 * @update 2012-8-13 上午9:37:49
	 */
	public void delete(String id);
	
	/**
	 * 
	 * TODO
	 * @Title delete   
	 * @param madeCode
	 * @throws Exception void
	 */
	public void deleteByCode(String deliveryCode) throws Exception;
	
	/**
	 * @description 加载一个菜单节点
	 * @return MadeHeaderDto
	 * @param id
	 * @update 2012-8-13 上午9:38:10
	 */
	public DeliveryHeaderDto load(String id);
	
	/**
	 * 通过code码获取信息
	 * TODO
	 * @Title loadByCode   
	 * @param madeCode
	 * @return MadeHeaderDto
	 */
	public DeliveryHeaderDto loadByCode(String deliveryCode);
	/**
	 * 更新操作
	 * TODO
	 * @Title update   
	 * @param madeHeaderDto void
	 */
	public void update(DeliveryHeaderDto deliveryHeaderDto);

	/**
	 * 标记打印
	 * TODO
	 * @Title signPrint   
	 * @param madeCode void
	 */
	public void signPrint(String deliveryCode);

	/**
	 * 确认收货
	 * TODO
	 * @Title completeMade   
	 * @param madeCode void
	 */
	public void received(String deliveryCode);

	/**
	 * 生成送货单编号
	 * TODO
	 * @Title getInitCode   
	 * @param sign
	 * @return Long
	 */
	public Long getInitCode(String sign);
	
}
  
