/**  
 * Project Name:fsun-erp  
 * File Name:MadePackageManageImpl.java  
 * Package Name:cn.com.fsun.bus.biz.impl  
 * Date:2017年8月17日 
 * Copyright (c) 2017, WFZ All Rights Reserved.  
 *  
*/  
  
package cn.com.fsun.bus.biz.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import cn.com.fsun.bus.biz.itf.MadePackageManage;
import cn.com.fsun.bus.dao.MadePackageDao;
import cn.com.fsun.bus.domain.BusMadePackage;
import cn.com.fsun.bus.dto.MadePackageDto;
import cn.com.fsun.common.utils.PageInfo;

/**  
 * ClassName:MadePackageManageImpl <br/>  
 * Description: TODO <br/>   
 * @author   lenovo  
 * @version  1.0  
 * @since    JDK 1.7        
 */
@Component
public class MadePackageManageImpl implements MadePackageManage {
	
	@Autowired
	private MadePackageDao madePackageDao;

	@Override
	public List<MadePackageDto> search(MadePackageDto madePackageDto, PageInfo pageInfo, boolean isPage) {

		BusMadePackage busMadePackage = DtotoDomain(madePackageDto);
		List<BusMadePackage> madePackages = madePackageDao.search(busMadePackage, pageInfo,isPage);
		List<MadePackageDto> madePackageDtos = DomainstoDtos(madePackages);
		return madePackageDtos;
	}

	@Override
	public MadePackageDto add(MadePackageDto madePackageDto) {

		BusMadePackage busMadePackage = DtotoDomain(madePackageDto);
		madePackageDao.create(busMadePackage);
		return DomaintoDto(busMadePackage);
	}

	@Override
	public void batchAdd(List<MadePackageDto> madePackageDtos) {
		if(madePackageDtos!=null && madePackageDtos.size()>0){
			for (MadePackageDto madePackageDto : madePackageDtos) {
				this.add(madePackageDto);
			}
		} 
	}

	@Override
	public void delete(String id) {
		madePackageDao.delete(madePackageDao.load(id));

	}

	@Override
	public void delete(String id, String madeCode) throws Exception {
		if(madeCode!=null && !"".equals(madeCode)){
			madePackageDao.deleteByMadeCode(madeCode);
		}else{
			this.delete(id);
		}  
	}
	
	@Override
	public void update(MadePackageDto madePackageDto) {
		
		BusMadePackage busMadePackage = madePackageDao.load(madePackageDto.getId());
		if(busMadePackage!=null){
			busMadePackage.setRealNumber(madePackageDto.getRealNumber());
			madePackageDao.update(busMadePackage);
		}
	}
	
/******************************************* 内部操作   *******************************************/
	
	/**
	 * @description Domian转Dto
	 * @return BusMadePackage
	 * @param madePackageDto
	 */
	public static BusMadePackage DtotoDomain(MadePackageDto madePackageDto){
		if(null==madePackageDto){
			return null;
		}		
		BusMadePackage busMadePackage = new BusMadePackage();
		
		busMadePackage.setDescription(madePackageDto.getDescription());
		busMadePackage.setExpectNumber(madePackageDto.getExpectNumber());
		busMadePackage.setId(madePackageDto.getId());
		busMadePackage.setMadeCode(madePackageDto.getMadeCode());
		busMadePackage.setOrderCode(madePackageDto.getOrderCode());
		busMadePackage.setOrderDetailId(madePackageDto.getOrderDetailId());
		busMadePackage.setOrderId(madePackageDto.getOrderId());
		busMadePackage.setOrderNumber(madePackageDto.getOrderNumber());
		busMadePackage.setProductCode(madePackageDto.getProductCode());
		busMadePackage.setProductName(madePackageDto.getProductName());
		busMadePackage.setRealNumber(madePackageDto.getRealNumber());
		busMadePackage.setStyle(madePackageDto.getStyle());
		busMadePackage.setUnit(madePackageDto.getUnit());
		return busMadePackage;
	}
	
	/**
	 * @description Dto转Domian
	 * @return MadePackageDto
	 * @param busMadePackage
	 */
	public MadePackageDto DomaintoDto(BusMadePackage busMadePackage){
		if(null==busMadePackage){
			return null;
		}
		MadePackageDto madePackageDto = new MadePackageDto();
		
		madePackageDto.setDescription(busMadePackage.getDescription());
		madePackageDto.setExpectNumber(busMadePackage.getExpectNumber());
		madePackageDto.setId(busMadePackage.getId());
		madePackageDto.setMadeCode(busMadePackage.getMadeCode());
		madePackageDto.setOrderCode(busMadePackage.getOrderCode());
		madePackageDto.setOrderDetailId(busMadePackage.getOrderDetailId());
		madePackageDto.setOrderId(busMadePackage.getOrderId());
		madePackageDto.setOrderNumber(busMadePackage.getOrderNumber());
		madePackageDto.setProductCode(busMadePackage.getProductCode());
		madePackageDto.setProductName(busMadePackage.getProductName());
		madePackageDto.setRealNumber(busMadePackage.getRealNumber());
		madePackageDto.setStyle(busMadePackage.getStyle());
		madePackageDto.setUnit(busMadePackage.getUnit());
		return madePackageDto;
	}
	
	/**
	 * @description domians转dtos
	 * @return List<MadePackageDto>
	 * @param busMadePackages
	 * @return
	 */
	public List<MadePackageDto> DomainstoDtos(List<BusMadePackage> busMadePackages){
		
		List<MadePackageDto> madePackageDtos = new ArrayList<>();
		if (null != busMadePackages && busMadePackages.size() > 0) {
			for (BusMadePackage busMadePackage : busMadePackages) {
				MadePackageDto madePackageDto = DomaintoDto(busMadePackage);
				if (null != madePackageDto) {
					madePackageDtos.add(madePackageDto);
				}
			}
		}
		return madePackageDtos;
	}
	

}
  
