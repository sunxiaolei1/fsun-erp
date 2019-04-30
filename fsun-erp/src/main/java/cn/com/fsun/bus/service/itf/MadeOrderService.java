/**  
 * Project Name:fsun-erp  
 * File Name:MadeOrderService.java  
 * Package Name:cn.com.fsun.bus.service.itf  
 * Date:2017年8月9日 
 * Copyright (c) 2017, WFZ All Rights Reserved.  
 *  
*/  
  
package cn.com.fsun.bus.service.itf;

import cn.com.fsun.bus.dto.MadeOrderDto;
import cn.com.fsun.bus.dto.MadePrintsDto;
import cn.com.fsun.bus.dto.ShortcutOrderDto;
import cn.com.fsun.bus.exception.UnEnoughOrderCodeException;

/**  
 * ClassName:MadeOrderService <br/>  
 * Description: TODO <br/>   
 * @author   lenovo  
 * @version  1.0  
 * @since    JDK 1.7        
 */
public interface MadeOrderService {
	
	/**
	 * 
	 * TODO
	 * @Title getInitCode   
	 * @return
	 * @throws UnEnoughOrderCodeException String
	 */
	public String getInitCode() throws UnEnoughOrderCodeException;

	/**
	 * @description 增加或者修改
	 * @return MadeOrderDto
	 * @return
	 * @update 2013-2-21
	 */
	public void saveEntry(MadeOrderDto madeOrderDto);
	
	/**
	 * @description 删除一个菜单节点
	 * @return void
	 * @param madeCode
	 * @update 2012-8-13 上午9:37:49
	 */
	public void deleteEntry(String madeCode) throws Exception;
	
	/**
	 * @description 加载一个菜单节点
	 * @return MadeOrderDto
	 * @param madeCode
	 * @update 2012-8-13 上午9:38:10
	 */
	public MadeOrderDto getEntry(String madeCode);

	/**
	 * 更新操作
	 * TODO
	 * @Title update   
	 * @param madeOrderDto void
	 * @throws Exception 
	 */
	public void updateEntry(MadeOrderDto madeOrderDto) throws Exception;

	/**
	 * 获取打印对象
	 * TODO
	 * @Title getMadePrints   
	 * @param madeCode
	 * @return MadePrintsDto
	 */
	public MadePrintsDto getMadePrints(String madeCode);

	/**
	 * 标记打印
	 * TODO
	 * @Title signPrint   
	 * @param madeCode void
	 */
	public void signPrint(String madeCode);

	/**
	 * 结单
	 * TODO
	 * @Title completeMade   
	 * @param madeCode void
	 */
	public void completeMade(String madeCode);

	/**
	 * 
	 * @param shortcutOrderDto
	 * @return
	 * @throws UnEnoughOrderCodeException 
	 */
	public void createShortcut(ShortcutOrderDto shortcutOrderDto)
		throws UnEnoughOrderCodeException;
	
}
  
