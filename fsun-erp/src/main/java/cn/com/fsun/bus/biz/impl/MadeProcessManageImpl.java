/**  
 * Project Name:fsun-erp  
 * File Name:MadeProcessServiceImpl.java  
 * Package Name:cn.com.fsun.bus.service  
 * Date:2017年8月9日 
 * Copyright (c) 2017, WFZ All Rights Reserved.  
 *  
*/  
  
package cn.com.fsun.bus.biz.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import cn.com.fsun.bus.biz.itf.MadeProcessManage;
import cn.com.fsun.bus.dao.MadeProcessDao;
import cn.com.fsun.bus.domain.BusMadeProcess;
import cn.com.fsun.bus.dto.MadeProcessDto;
import cn.com.fsun.common.utils.PageInfo;

/**  
 * ClassName:MadeProcessManageImpl <br/>  
 * Description: TODO <br/>   
 * @author   lenovo  
 * @version  1.0  
 * @since    JDK 1.7        
 */
@Component
public class MadeProcessManageImpl implements MadeProcessManage {
	
	@Autowired
	private MadeProcessDao madeProcessDao;

	@Override
	public List<MadeProcessDto> search(MadeProcessDto madeProcessDto, PageInfo pageInfo, boolean isPage) {

		BusMadeProcess busMadeProcess = DtotoDomain(madeProcessDto);
		List<BusMadeProcess> madeProcesses = madeProcessDao.search(busMadeProcess, pageInfo,isPage);
		List<MadeProcessDto> madeProcessDtos = DomainstoDtos(madeProcesses);
		return madeProcessDtos;
	}

	@Override
	public MadeProcessDto save(MadeProcessDto madeProcessDto) {

		BusMadeProcess busMadeProcess = DtotoDomain(madeProcessDto);
		madeProcessDao.create(busMadeProcess);
		return DomaintoDto(busMadeProcess);
	}

	@Override
	public void batchAdd(List<MadeProcessDto> madeProcessDtos) { 
		for (MadeProcessDto madeProcessDto : madeProcessDtos) {
			this.save(madeProcessDto);
		}	
	}
	
	@Override
	public void delete(String id) {
		madeProcessDao.delete(madeProcessDao.load(id));
	}

	@Override
	public void delete(String id, String madeCode) throws Exception {
		if(madeCode!=null && !"".equals(madeCode)){
			madeProcessDao.deleteByMadeCode(madeCode);
		}else{
			madeProcessDao.delete(madeProcessDao.load(id));
		}
	}

	@Override
	public MadeProcessDto load(String id) {
		return DomaintoDto(madeProcessDao.load(id));
	}

	@Override
	public void update(MadeProcessDto madeProcessDto) {
		BusMadeProcess busMadeProcess = madeProcessDao.load(madeProcessDto.getId());
		busMadeProcess.setDemand(madeProcessDto.getDemand());
		busMadeProcess.setName(madeProcessDto.getName());
		busMadeProcess.setNumber(madeProcessDto.getNumber());
		busMadeProcess.setOutsourcer(madeProcessDto.getOutsourcer());
		madeProcessDao.update(busMadeProcess);
	}

/******************************************* 内部操作   *******************************************/
	
	/**
	 * @description Domian转Dto
	 * @return BusMadeProcess
	 * @param madeProcessDto
	 */
	public static BusMadeProcess DtotoDomain(MadeProcessDto madeProcessDto){
		if(null==madeProcessDto){
			return null;
		}		
		BusMadeProcess busMadeProcess = new BusMadeProcess();
		
		busMadeProcess.setDemand(madeProcessDto.getDemand());
		busMadeProcess.setId(madeProcessDto.getId());
		busMadeProcess.setMadeCode(madeProcessDto.getMadeCode());
		busMadeProcess.setName(madeProcessDto.getName());
		busMadeProcess.setNumber(madeProcessDto.getNumber());
		busMadeProcess.setOrderCode(madeProcessDto.getOrderCode());
		busMadeProcess.setOutsourcer(madeProcessDto.getOutsourcer());
		busMadeProcess.setProcessCode(madeProcessDto.getProcessCode());
		return busMadeProcess;	
	}
	
	/**
	 * @description Dto转Domian
	 * @return MadeProcessDto
	 * @param busMadeProcess
	 */
	public MadeProcessDto DomaintoDto(BusMadeProcess busMadeProcess){
		if(null==busMadeProcess){
			return null;
		}
		MadeProcessDto madeProcessDto = new MadeProcessDto();
		
		madeProcessDto.setDemand(busMadeProcess.getDemand());
		madeProcessDto.setId(busMadeProcess.getId());
		madeProcessDto.setMadeCode(busMadeProcess.getMadeCode());
		madeProcessDto.setName(busMadeProcess.getName());
		madeProcessDto.setNumber(busMadeProcess.getNumber());
		madeProcessDto.setOrderCode(busMadeProcess.getOrderCode());
		madeProcessDto.setOutsourcer(busMadeProcess.getOutsourcer());
		madeProcessDto.setProcessCode(busMadeProcess.getProcessCode());
		return madeProcessDto;
	}
	
	/**
	 * @description domians转dtos
	 * @return List<MadeProcessDto>
	 * @param busMadeProcesses
	 * @return
	 */
	public List<MadeProcessDto> DomainstoDtos(List<BusMadeProcess> busMadeProcesses){
		
		List<MadeProcessDto> madeProcessDtos = new ArrayList<MadeProcessDto>();
		if (null != busMadeProcesses && busMadeProcesses.size() > 0) {
			for (BusMadeProcess busMadeProcess : busMadeProcesses) {
				MadeProcessDto madeProcessDto = DomaintoDto(busMadeProcess);
				if (null != madeProcessDto) {
					madeProcessDtos.add(madeProcessDto);
				}
			}
		}
		return madeProcessDtos;
	}
	
}
  
