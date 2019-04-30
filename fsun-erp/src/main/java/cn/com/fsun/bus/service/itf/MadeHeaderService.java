/**  
 * Project Name:fsun-erp  
 * File Name:MadeHeaderService.java  
 * Package Name:cn.com.fsun.bus.service.itf  
 * Date:2017年8月9日 
 * Copyright (c) 2017, WFZ All Rights Reserved.  
 *  
*/  
  
package cn.com.fsun.bus.service.itf;

import java.util.List;

import cn.com.fsun.bus.dto.MadeHeaderDto;
import cn.com.fsun.common.utils.PageInfo;

/**  
 * ClassName:MadeHeaderService <br/>  
 * Description: TODO <br/>   
 * @author   lenovo  
 * @version  1.0  
 * @since    JDK 1.7        
 */
public interface MadeHeaderService {

	/**
	 * @description 显示列表（有查询条件）
	 * @return List<madeHeaderDto>
	 * @update 2012-8-13 上午9:36:48
	 */
	public List<MadeHeaderDto> search(MadeHeaderDto madeHeaderDto, PageInfo pageInfo,boolean isPage);
	
	/**
	 * @description 增加或者修改
	 * @return MadeHeaderDto
	 * @param madeHeaderDto
	 * @return
	 * @update 2013-2-21
	 */
	public MadeHeaderDto save(MadeHeaderDto madeHeaderDto);
	
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
	public void deleteByCode(String madeCode) throws Exception;
	
	/**
	 * @description 加载一个菜单节点
	 * @return MadeHeaderDto
	 * @param id
	 * @update 2012-8-13 上午9:38:10
	 */
	public MadeHeaderDto load(String id);
	
	/**
	 * 通过code码获取信息
	 * TODO
	 * @Title loadByCode   
	 * @param madeCode
	 * @return MadeHeaderDto
	 */
	public MadeHeaderDto loadByCode(String madeCode);
	/**
	 * 更新操作
	 * TODO
	 * @Title update   
	 * @param madeHeaderDto void
	 */
	public void update(MadeHeaderDto madeHeaderDto);

	/**
	 * 获取查询总数
	 * TODO
	 * @Title getSearchCount   
	 * @param madeHeaderDto
	 * @param pageInfo
	 * @return int
	 */
	public int getSearchCount(MadeHeaderDto madeHeaderDto, PageInfo pageInfo);
	
}
  
