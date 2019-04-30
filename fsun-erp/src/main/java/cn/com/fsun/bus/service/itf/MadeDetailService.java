/**  
 * Project Name:fsun-erp  
 * File Name:MadeDetailService.java  
 * Package Name:cn.com.fsun.bus.service.itf  
 * Date:2017年8月3日 
 * Copyright (c) 2017, WFZ All Rights Reserved.  
 *  
*/  
  
package cn.com.fsun.bus.service.itf;

import java.util.List;

import cn.com.fsun.bus.dto.MadeDetailDto;
import cn.com.fsun.common.utils.PageInfo;

/**  
 * ClassName:MadeDetailService <br/>  
 * Description: TODO <br/>   
 * @author   lenovo  
 * @version  1.0  
 * @since    JDK 1.7        
 */
public interface MadeDetailService {

	/**
	 * @description 显示列表（有查询条件）
	 * @return List<MadeDetailDto>
	 * @update 2012-8-13 上午9:36:48
	 */
	public List<MadeDetailDto> search(MadeDetailDto madeDetailDto,PageInfo pageInfo,boolean isPage);
	
	/**
	 * @description 增加或者修改
	 * @return MadeDetailDto
	 * @param madeDetailDto
	 * @return
	 * @update 2013-2-21
	 */
	public MadeDetailDto save(MadeDetailDto madeDetailDto);
	
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
	public void delete(String id, String madeCode) throws Exception;
	
	/**
	 * @description 加载一个菜单节点
	 * @return MadeDetailDto
	 * @param id
	 * @update 2012-8-13 上午9:38:10
	 */
	public MadeDetailDto load(String id);


	/**
	 * 更新操作
	 * TODO
	 * @Title update   
	 * @param madeDetailDto void
	 */
	public void update(MadeDetailDto madeDetailDto);
}
  
