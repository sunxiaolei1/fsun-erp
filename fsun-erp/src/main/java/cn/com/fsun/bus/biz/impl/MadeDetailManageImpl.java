/**  
 * Project Name:fsun-erp  
 * File Name:MadeDetailService.java  
 * Package Name:cn.com.fsun.bus.service  
 * Date:2017年8月3日 
 * Copyright (c) 2017, WFZ All Rights Reserved.  
 *  
*/  
  
package cn.com.fsun.bus.biz.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import cn.com.fsun.bus.biz.itf.MadeDetailManage;
import cn.com.fsun.bus.dao.MadeDetailDao;
import cn.com.fsun.bus.domain.BusMadeDetail;
import cn.com.fsun.bus.dto.MadeDetailDto;
import cn.com.fsun.common.utils.PageInfo;

/**  
 * ClassName:MadeDetailManageImpl <br/>  
 * Description: TODO <br/>   
 * @author   lenovo  
 * @version  1.0  
 * @since    JDK 1.7        
 */
@Component
public class MadeDetailManageImpl implements MadeDetailManage{
	
	@Autowired
	private MadeDetailDao madeDetailDao;

	@Override
	public List<MadeDetailDto> search(MadeDetailDto madeDetailDto,PageInfo pageInfo,boolean isPage){
		
		BusMadeDetail busMadeDetail = DtotoDomain(madeDetailDto);
		List<BusMadeDetail> madeDetails = madeDetailDao.search(busMadeDetail, pageInfo,isPage);
		List<MadeDetailDto> madeDetailDtos = DomainstoDtos(madeDetails);
		return madeDetailDtos;
	}
	
	
	@Override
	public MadeDetailDto save(MadeDetailDto madeDetailDto){
			
		BusMadeDetail busMadeDetail = DtotoDomain(madeDetailDto);
		madeDetailDao.create(busMadeDetail);
		return DomaintoDto(busMadeDetail);
		
	}
	
	@Override
	public void batchAdd(List<MadeDetailDto> madeDetailDtos) {
		for (MadeDetailDto madeDetailDto : madeDetailDtos) {
			this.save(madeDetailDto);
		}
	}
	

	@Override
	public void delete(String id){
		madeDetailDao.delete(madeDetailDao.load(id));
	}
	
	@Override
	public void delete(String id, String madeCode) throws Exception{
		
		if(madeCode!=null && !"".equals(madeCode)){
			madeDetailDao.deleteByMadeCode(madeCode);
		}else{
			this.delete(id);
		}
	}
	
	@Override
	public MadeDetailDto load(String id){
		return DomaintoDto(madeDetailDao.load(id));
	}

	@Override
	public void update(MadeDetailDto madeDetailDto) {
		BusMadeDetail busMadeDetail = madeDetailDao.load(madeDetailDto.getId());
	
		busMadeDetail.setProductCode(madeDetailDto.getProductCode());
		
		busMadeDetail.setStyle(madeDetailDto.getStyle());
		busMadeDetail.setLayout(madeDetailDto.getLayout());
		busMadeDetail.setMaterial(madeDetailDto.getMaterial());
		busMadeDetail.setOpenMethod(madeDetailDto.getOpenMethod());
		busMadeDetail.setSpec(madeDetailDto.getSpec());
		busMadeDetail.setOpenNum(madeDetailDto.getOpenNum());
		busMadeDetail.setOpenSize(madeDetailDto.getOpenSize());
		busMadeDetail.setPapers(madeDetailDto.getPapers());
		busMadeDetail.setPrints(madeDetailDto.getPrints());
		
		busMadeDetail.setModel(madeDetailDto.getModel());
		busMadeDetail.setColors(madeDetailDto.getColors());
		busMadeDetail.setImpos(madeDetailDto.getImpos());
		busMadeDetail.setProcess(madeDetailDto.getProcess());
		busMadeDetail.setActuals(madeDetailDto.getActuals());
		busMadeDetail.setExpects(madeDetailDto.getExpects());
		busMadeDetail.setLoss(madeDetailDto.getLoss());
		busMadeDetail.setDescription(madeDetailDto.getDescription());
		
		madeDetailDao.update(busMadeDetail);
	}
	
	
	/******************************************* 内部操作   *******************************************/
	
	/**
	 * @description Domian转Dto
	 * @return BusMadeDetail
	 * @param madeDetailDto
	 */
	public static BusMadeDetail DtotoDomain(MadeDetailDto madeDetailDto){
		if(null==madeDetailDto){
			return null;
		}		
		BusMadeDetail busMadeDetail = new BusMadeDetail();
		
		busMadeDetail.setActuals(madeDetailDto.getActuals());
		busMadeDetail.setColors(madeDetailDto.getColors());
		busMadeDetail.setDescription(madeDetailDto.getDescription());
		busMadeDetail.setExpects(madeDetailDto.getExpects());
		busMadeDetail.setId(madeDetailDto.getId());
		busMadeDetail.setImpos(madeDetailDto.getImpos());
		busMadeDetail.setLayout(madeDetailDto.getLayout());
		busMadeDetail.setLoss(madeDetailDto.getLoss());
		busMadeDetail.setMadeCode(madeDetailDto.getMadeCode());
		busMadeDetail.setMaterial(madeDetailDto.getMaterial());
		busMadeDetail.setModel(madeDetailDto.getModel());
		busMadeDetail.setOpenMethod(madeDetailDto.getOpenMethod());
		busMadeDetail.setOpenNum(madeDetailDto.getOpenNum());
		busMadeDetail.setOpenSize(madeDetailDto.getOpenSize());
		busMadeDetail.setOrderCode(madeDetailDto.getOrderCode());
		busMadeDetail.setPapers(madeDetailDto.getPapers());
		busMadeDetail.setPrints(madeDetailDto.getPrints());
		busMadeDetail.setProcess(madeDetailDto.getProcess());
		busMadeDetail.setProcessCode(madeDetailDto.getProcessCode());
		busMadeDetail.setProductCode(madeDetailDto.getProductCode());
		busMadeDetail.setSpec(madeDetailDto.getSpec());
		busMadeDetail.setStyle(madeDetailDto.getStyle());
		return busMadeDetail;
	}
	
	/**
	 * @description Dto转Domian
	 * @return MadeDetailDto
	 * @param busMadeDetail
	 */
	public MadeDetailDto DomaintoDto(BusMadeDetail busMadeDetail){
		if(null==busMadeDetail){
			return null;
		}
		MadeDetailDto madeDetailDto = new MadeDetailDto();
		
		madeDetailDto.setActuals(busMadeDetail.getActuals());
		madeDetailDto.setColors(busMadeDetail.getColors());
		madeDetailDto.setDescription(busMadeDetail.getDescription());
		madeDetailDto.setExpects(busMadeDetail.getExpects());
		madeDetailDto.setId(busMadeDetail.getId());
		madeDetailDto.setImpos(busMadeDetail.getImpos());
		madeDetailDto.setLayout(busMadeDetail.getLayout());
		madeDetailDto.setLoss(busMadeDetail.getLoss());
		madeDetailDto.setMadeCode(busMadeDetail.getMadeCode());
		madeDetailDto.setMaterial(busMadeDetail.getMaterial());
		madeDetailDto.setModel(busMadeDetail.getModel());
		madeDetailDto.setOpenMethod(busMadeDetail.getOpenMethod());
		madeDetailDto.setOpenNum(busMadeDetail.getOpenNum());
		madeDetailDto.setOpenSize(busMadeDetail.getOpenSize());
		madeDetailDto.setOrderCode(busMadeDetail.getOrderCode());
		madeDetailDto.setPapers(busMadeDetail.getPapers());
		madeDetailDto.setPrints(busMadeDetail.getPrints());
		madeDetailDto.setProcess(busMadeDetail.getProcess());
		madeDetailDto.setProcessCode(busMadeDetail.getProcessCode());
		madeDetailDto.setProductCode(busMadeDetail.getProductCode());
		madeDetailDto.setSpec(busMadeDetail.getSpec());
		madeDetailDto.setStyle(busMadeDetail.getStyle());
		return madeDetailDto;
	}
	
	/**
	 * @description domians转dtos
	 * @return List<MadeDetailDto>
	 * @param busMadeDetails
	 * @return
	 */
	public List<MadeDetailDto> DomainstoDtos(List<BusMadeDetail> busMadeDetails){
		
		List<MadeDetailDto> madeDetailDtos = new ArrayList<MadeDetailDto>();
		if (null != busMadeDetails && busMadeDetails.size() > 0) {
			for (BusMadeDetail busMadeDetail : busMadeDetails) {
				MadeDetailDto madeDetailDto = DomaintoDto(busMadeDetail);
				if (null != madeDetailDto) {
					madeDetailDtos.add(madeDetailDto);
				}
			}
		}
		return madeDetailDtos;
	}
	
}
  
