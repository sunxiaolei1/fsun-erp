/**  
 * Project Name:fsun-erp  
 * File Name:MadeDetailService.java  
 * Package Name:cn.com.fsun.bus.service  
 * Date:2017年8月3日 
 * Copyright (c) 2017, WFZ All Rights Reserved.  
 *  
*/  
  
package cn.com.fsun.bus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.fsun.bus.biz.itf.MadeDetailManage;
import cn.com.fsun.bus.dto.MadeDetailDto;
import cn.com.fsun.bus.service.itf.MadeDetailService;
import cn.com.fsun.common.service.BaseService;
import cn.com.fsun.common.utils.PageInfo;

/**  
 * ClassName:MadeDetailService <br/>  
 * Description: TODO <br/>   
 * @author   lenovo  
 * @version  1.0  
 * @since    JDK 1.7        
 */
@Service
public class MadeDetailServiceImpl extends BaseService implements MadeDetailService{
	
	@Autowired
	private MadeDetailManage madeDetailManage;

	@Override
	public List<MadeDetailDto> search(MadeDetailDto madeDetailDto,PageInfo pageInfo,boolean isPage){
		return madeDetailManage.search(madeDetailDto, pageInfo,isPage);
	}
	
	
	@Override
	public MadeDetailDto save(MadeDetailDto madeDetailDto){
		return madeDetailManage.save(madeDetailDto);
	}
	

	@Override
	public void delete(String id){
		madeDetailManage.delete(id);
	}
	
	@Override
	public void delete(String id, String madeCode) throws Exception{
		madeDetailManage.delete(id, madeCode);
	}
	
	@Override
	public MadeDetailDto load(String id){
		return madeDetailManage.load(id);
	}

	@Override
	public void update(MadeDetailDto madeDetailDto) {
		madeDetailManage.update(madeDetailDto);
	}
	
}
  
