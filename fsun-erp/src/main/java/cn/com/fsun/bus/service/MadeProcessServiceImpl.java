/**  
 * Project Name:fsun-erp  
 * File Name:MadeProcessServiceImpl.java  
 * Package Name:cn.com.fsun.bus.service  
 * Date:2017年8月9日 
 * Copyright (c) 2017, WFZ All Rights Reserved.  
 *  
*/  
  
package cn.com.fsun.bus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.fsun.bus.biz.itf.MadeProcessManage;
import cn.com.fsun.bus.dto.MadeProcessDto;
import cn.com.fsun.bus.service.itf.MadeProcessService;
import cn.com.fsun.common.service.BaseService;
import cn.com.fsun.common.utils.PageInfo;

/**  
 * ClassName:MadeProcessServiceImpl <br/>  
 * Description: TODO <br/>   
 * @author   lenovo  
 * @version  1.0  
 * @since    JDK 1.7        
 */
@Service
public class MadeProcessServiceImpl extends BaseService implements MadeProcessService {
	
	@Autowired
	private MadeProcessManage madeProcessManage;

	@Override
	public List<MadeProcessDto> search(MadeProcessDto madeProcessDto, PageInfo pageInfo, boolean isPage) {
		return madeProcessManage.search(madeProcessDto, pageInfo,isPage);	
	}

	@Override
	public MadeProcessDto save(MadeProcessDto madeProcessDto) {
		return madeProcessManage.save(madeProcessDto);
	}

	@Override
	public void delete(String id) {
		madeProcessManage.delete(id);
	}

	@Override
	public void delete(String id, String madeCode) throws Exception {
		madeProcessManage.delete(id, madeCode);
	}

	@Override
	public MadeProcessDto load(String id) {
		return madeProcessManage.load(id);
	}

	@Override
	public void update(MadeProcessDto madeProcessDto) {
		madeProcessManage.update(madeProcessDto);
	}

}
  
