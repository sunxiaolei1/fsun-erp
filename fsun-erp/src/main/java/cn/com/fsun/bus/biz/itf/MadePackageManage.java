/**  
 * Project Name:fsun-erp  
 * File Name:MadePackageManage.java  
 * Package Name:cn.com.fsun.bus.biz.itf  
 * Date:2017年8月17日 
 * Copyright (c) 2017, WFZ All Rights Reserved.  
 *  
*/  
  
package cn.com.fsun.bus.biz.itf;

import java.util.List;

import cn.com.fsun.bus.dto.MadePackageDto;
import cn.com.fsun.common.utils.PageInfo;

/**  
 * ClassName:MadePackageManage <br/>  
 * Description: TODO <br/>   
 * @author   lenovo  
 * @version  1.0  
 * @since    JDK 1.7        
 */
public interface MadePackageManage {


	/**
	 * @description 显示列表（有查询条件）
	 * @return List<MadePackageDto>
	 * @update 2012-8-13 上午9:36:48
	 */
	public List<MadePackageDto> search(MadePackageDto madePackageDto,PageInfo pageInfo,boolean isPage);
	
	/**
	 * @description 增加
	 * @return MadePackageDto
	 * @param madePackageDtos
	 * @return
	 * @update 2013-2-21
	 */
	public MadePackageDto add(MadePackageDto madePackageDto);
	
	/**
	 * @description 批量增加
	 * @return MadePackageDto
	 * @param madePackageDtos
	 * @return
	 * @update 2013-2-21
	 */
	public void batchAdd(List<MadePackageDto> madePackageDtos);
	
	/**
	 * @description 删除一个菜单节点
	 * @return void
	 * @param id
	 * @update 2012-8-13 上午9:37:49
	 */
	public void delete(String id);
	
	/**
	 * 根据包装单编号和明细id删除明细
	 * TODO
	 * @Title delete   
	 * @param id
	 * @param madeCode void
	 */
	public void delete(String id, String madeCode) throws Exception;

	/**
	 * 
	 * TODO
	 * @Title update   
	 * @param madePackageDto void
	 */
	public void update(MadePackageDto madePackageDto);
	
}
  
