/**  
 * Project Name:fsun-erp  
 * File Name:MadeHeaderServiceImpl.java  
 * Package Name:cn.com.fsun.bus.service  
 * Date:2017年8月9日 
 * Copyright (c) 2017, WFZ All Rights Reserved.  
 *  
*/  
  
package cn.com.fsun.bus.biz.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import cn.com.fsun.bus.biz.itf.MadeHeaderManage;
import cn.com.fsun.bus.dao.MadeHeaderDao;
import cn.com.fsun.bus.dao.MadePackageDao;
import cn.com.fsun.bus.domain.BusMadeHeader;
import cn.com.fsun.bus.dto.MadeHeaderDto;
import cn.com.fsun.bus.enums.MadeTypeEnum;
import cn.com.fsun.common.utils.PageInfo;

/**  
 * ClassName:MadeHeaderManageImpl <br/>  
 * Description: TODO <br/>   
 * @author   lenovo  
 * @version  1.0  
 * @since    JDK 1.7        
 */
@Component
public class MadeHeaderManageImpl implements MadeHeaderManage {
	
	@Autowired
	private MadeHeaderDao madeHeaderDao;
	
	@Autowired
	private MadePackageDao madePackageDao;


	@Override
	public List<MadeHeaderDto> search(MadeHeaderDto madeHeaderDto, PageInfo pageInfo, boolean isPage) {
		  
		BusMadeHeader busMadeHeader = DtotoDomain(madeHeaderDto);
		String productCode = madeHeaderDto.getProductCode(); 
		if(productCode!=null && !"".equals(productCode)){
			List<String> madeCodes = madePackageDao.getMadeCodesByProductCode(productCode);
			busMadeHeader.setMadeCodes(madeCodes);
		}
		List<BusMadeHeader> madeHeaders = madeHeaderDao.search(busMadeHeader, pageInfo,isPage);
		List<MadeHeaderDto> madeDetailDtos = DomainstoDtos(madeHeaders);
		return madeDetailDtos;
	}

	@Override
	public MadeHeaderDto save(MadeHeaderDto madeHeaderDto) {
		  
		BusMadeHeader busMadeHeader = DtotoDomain(madeHeaderDto);
		busMadeHeader.setCreateManId(madeHeaderDto.getCreateManId());
		busMadeHeader.setCreateManName(madeHeaderDto.getCreateManName());
		busMadeHeader.setCreateTime(new Date());
		busMadeHeader.setEnabled(true);
		busMadeHeader.setPrintStatus(false);
		madeHeaderDao.create(busMadeHeader);
		return DomaintoDto(busMadeHeader);
	}

	@Override
	public void delete(String id) {	  
		madeHeaderDao.delete(madeHeaderDao.load(id));	
	}
	
	@Override
	public void deleteByCode(String madeCode) throws Exception {
		madeHeaderDao.deleteByMadeCode(madeCode);
	}

	@Override
	public MadeHeaderDto load(String id) {
		return DomaintoDto(madeHeaderDao.load(id));
	}
	
	@Override
	public MadeHeaderDto loadByCode(String madeCode) {
		return DomaintoDto(madeHeaderDao.loadByAttribute("madeCode", madeCode));
	}

	@Override
	public void update(MadeHeaderDto madeHeaderDto) {
		  
		BusMadeHeader busMadeHeader = madeHeaderDao.load(madeHeaderDto.getId());
		busMadeHeader.setPrintStatus(madeHeaderDto.isPrintStatus());
		busMadeHeader.setEnabled(madeHeaderDto.isEnabled());
		madeHeaderDao.update(busMadeHeader);
	}

	@Override
	public void signPrint(String madeCode) {	  
		BusMadeHeader busMadeHeader = madeHeaderDao.loadByAttribute("madeCode", madeCode);
		busMadeHeader.setPrintStatus(true);
		madeHeaderDao.update(busMadeHeader);
	}
	
	@Override
	public void completeMade(String madeCode) {	  
		BusMadeHeader busMadeHeader = madeHeaderDao.loadByAttribute("madeCode", madeCode);
		busMadeHeader.setEnabled(false);
		madeHeaderDao.update(busMadeHeader);
	}
	
	@Override
	public Long getInitCode(String sign) {
		   
		return madeHeaderDao.getInitCode(sign);
	}
	
	
/******************************************* 内部操作   *******************************************/
	
	/**
	 * @description Domian转Dto
	 * @return BusMadeHeader
	 * @param madeHeaderDto
	 */
	public static BusMadeHeader DtotoDomain(MadeHeaderDto madeHeaderDto){
		if(null==madeHeaderDto){
			return null;
		}		
		BusMadeHeader busMadeHeader = new BusMadeHeader();
		
		busMadeHeader.setCreateManId(madeHeaderDto.getCreateManId());
		busMadeHeader.setCreateManName(madeHeaderDto.getCreateManName());
		busMadeHeader.setCreateTime(madeHeaderDto.getCreateTime());
		busMadeHeader.setEnabled(madeHeaderDto.isEnabled());
		busMadeHeader.setId(madeHeaderDto.getId());
		busMadeHeader.setMadeCode(madeHeaderDto.getMadeCode());
		busMadeHeader.setMadeType(madeHeaderDto.getMadeType());
		busMadeHeader.setName(madeHeaderDto.getName());
		busMadeHeader.setOrderCode(madeHeaderDto.getOrderCode());
		busMadeHeader.setPrintStatus(madeHeaderDto.isPrintStatus());
		return busMadeHeader;	
	}
	
	/**
	 * @description Dto转Domian
	 * @return MadeHeaderDto
	 * @param busMadeHeader
	 */
	public MadeHeaderDto DomaintoDto(BusMadeHeader busMadeHeader){
		if(null==busMadeHeader){
			return null;
		}
		MadeHeaderDto madeHeaderDto = new MadeHeaderDto();
		
		madeHeaderDto.setCreateManId(busMadeHeader.getCreateManId());
		madeHeaderDto.setCreateManName(busMadeHeader.getCreateManName());
		madeHeaderDto.setCreateTime(busMadeHeader.getCreateTime());
		madeHeaderDto.setEnabled(busMadeHeader.getEnabled());
		madeHeaderDto.setId(busMadeHeader.getId());
		madeHeaderDto.setMadeCode(busMadeHeader.getMadeCode());
		madeHeaderDto.setMadeType(busMadeHeader.getMadeType());
		madeHeaderDto.setMadeTypeName(MadeTypeEnum.getByValue(busMadeHeader.getMadeType()).getComment());
		madeHeaderDto.setMadeStatus(busMadeHeader.getEnabled()?"生产中":"完成");
		madeHeaderDto.setName(busMadeHeader.getName());
		madeHeaderDto.setOrderCode(busMadeHeader.getOrderCode());
		madeHeaderDto.setPrintStatus(busMadeHeader.getPrintStatus());
		return madeHeaderDto;	
	}
	
	/**
	 * @description domians转dtos
	 * @return List<MadeHeaderDto>
	 * @param busMadeHeaders
	 * @return
	 */
	public List<MadeHeaderDto> DomainstoDtos(List<BusMadeHeader> busMadeHeaders){
		
		List<MadeHeaderDto> madeHeaderDtos = new ArrayList<MadeHeaderDto>();
		if (null != busMadeHeaders && busMadeHeaders.size() > 0) {
			for (BusMadeHeader busMadeHeader : busMadeHeaders) {
				MadeHeaderDto madeHeaderDto = DomaintoDto(busMadeHeader);
				if (null != madeHeaderDto) {
					madeHeaderDtos.add(madeHeaderDto);
				}
			}
		}
		return madeHeaderDtos;
	}

	
	
}
  
