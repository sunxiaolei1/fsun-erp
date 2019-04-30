/**  
 * Project Name:fsun-erp  
 * File Name:MadeHeaderServiceImpl.java  
 * Package Name:cn.com.fsun.bus.service  
 * Date:2017年8月9日 
 * Copyright (c) 2017, WFZ All Rights Reserved.  
 *  
*/  
  
package cn.com.fsun.bus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.fsun.bus.biz.itf.MadeHeaderManage;
import cn.com.fsun.bus.dto.MadeHeaderDto;
import cn.com.fsun.bus.service.itf.MadeHeaderService;
import cn.com.fsun.common.service.BaseService;
import cn.com.fsun.common.utils.PageInfo;

/**  
 * ClassName:MadeHeaderServiceImpl <br/>  
 * Description: TODO <br/>   
 * @author   lenovo  
 * @version  1.0  
 * @since    JDK 1.7        
 */
@Service
public class MadeHeaderServiceImpl extends BaseService implements MadeHeaderService {
	
	@Autowired
	private MadeHeaderManage madeHeaderManage;

	@Override
	public List<MadeHeaderDto> search(MadeHeaderDto madeHeaderDto, PageInfo pageInfo, boolean isPage) {
		return madeHeaderManage.search(madeHeaderDto, pageInfo,isPage);
	}
	
	@Override
	public int getSearchCount(MadeHeaderDto madeHeaderDto, PageInfo pageInfo) {
		  
		List<MadeHeaderDto> list = madeHeaderManage.search(madeHeaderDto, pageInfo, false);
		if(list!=null){
			return list.size();
		}
		return 0;
	}

	@Override
	public MadeHeaderDto save(MadeHeaderDto madeHeaderDto) {
		  
		madeHeaderDto.setCreateManId(super.getCurrentUserID());
		madeHeaderDto.setCreateManName(super.getCurrentUserRealName());
		return madeHeaderManage.save(madeHeaderDto);
	}

	@Override
	public void delete(String id) {	  
		madeHeaderManage.delete(id);	
	}
	
	@Override
	public void deleteByCode(String madeCode) throws Exception {
		madeHeaderManage.deleteByCode(madeCode);
	}

	@Override
	public MadeHeaderDto load(String id) {
		return madeHeaderManage.load(id);
	}
	
	@Override
	public MadeHeaderDto loadByCode(String madeCode) {
		return madeHeaderManage.loadByCode(madeCode);
	}

	@Override
	public void update(MadeHeaderDto madeHeaderDto) {	  
		madeHeaderManage.update(madeHeaderDto);
	}
	
}
  
