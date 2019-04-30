/**  
 * Project Name:fsun-erp  
 * File Name:MadeProcessService.java  
 * Package Name:cn.com.fsun.bus.service.itf  
 * Date:2017年8月9日 
 * Copyright (c) 2017, WFZ All Rights Reserved.  
 *  
*/  
  
package cn.com.fsun.bus.biz.itf;

import java.util.List;

import cn.com.fsun.bus.dto.MadeProcessDto;
import cn.com.fsun.common.utils.PageInfo;

/**  
 * ClassName:MadeProcessService <br/>  
 * Description: TODO <br/>   
 * @author   lenovo  
 * @version  1.0  
 * @since    JDK 1.7        
 */
public interface MadeProcessManage {

	/**
	 * @description 显示列表（有查询条件）
	 * @return List<MadeProcessDto>
	 * @update 2012-8-13 上午9:36:48
	 */
	public List<MadeProcessDto> search(MadeProcessDto madeProcessDto,PageInfo pageInfo,boolean isPage);
	
	/**
	 * @description 增加或者修改
	 * @return MadeProcessDto
	 * @param madeProcessDto
	 * @return
	 * @update 2013-2-21
	 */
	public MadeProcessDto save(MadeProcessDto madeProcessDto);
	
	/**
	 * 批量新增
	 * TODO
	 * @Title batchAdd   
	 * @param madeProcessDtos void
	 */
	public void batchAdd(List<MadeProcessDto> madeProcessDtos);
	
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
	 * @return MadeProcessDto
	 * @param id
	 * @update 2012-8-13 上午9:38:10
	 */
	public MadeProcessDto load(String id);


	/**
	 * 更新操作
	 * TODO
	 * @Title update   
	 * @param madeProcessDto void
	 */
	public void update(MadeProcessDto madeProcessDto);

	


}
  
