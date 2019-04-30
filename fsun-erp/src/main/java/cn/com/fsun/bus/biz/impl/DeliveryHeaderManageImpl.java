/**  
 * Project Name:fsun-erp  
 * File Name:DeliveryHeaderManageImpl.java  
 * Package Name:cn.com.fsun.bus.biz.impl  
 * Date:2017年8月25日 
 * Copyright (c) 2017, WFZ All Rights Reserved.  
 *  
*/  
  
package cn.com.fsun.bus.biz.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import cn.com.fsun.bus.biz.itf.DeliveryHeaderManage;
import cn.com.fsun.bus.dao.DeliveryDetailDao;
import cn.com.fsun.bus.dao.DeliveryHeaderDao;
import cn.com.fsun.bus.domain.BusDeliveryHeader;
import cn.com.fsun.bus.dto.DeliveryHeaderDto;
import cn.com.fsun.bus.enums.DeliveryTypeEnum;
import cn.com.fsun.common.utils.PageInfo;

/**  
 * ClassName:DeliveryHeaderManageImpl <br/>  
 * Description: TODO <br/>   
 * @author   lenovo  
 * @version  1.0  
 * @since    JDK 1.7        
 */
@Component
public class DeliveryHeaderManageImpl implements DeliveryHeaderManage{

	@Autowired
	private DeliveryHeaderDao deliveryHeaderDao;
	
	@Autowired
	private DeliveryDetailDao deliveryDetailDao;

	@Override
	public List<DeliveryHeaderDto> search(DeliveryHeaderDto deliveryHeaderDto, PageInfo pageInfo, boolean isPage) {
		  
		BusDeliveryHeader busDeliveryHeader = DtotoDomain(deliveryHeaderDto);
		String productCode = deliveryHeaderDto.getProductCode(); 
		if(productCode!=null && !"".equals(productCode)){
			List<String> deliveryCodes = deliveryDetailDao.getDeliveryCodesByProductCode(productCode);
			busDeliveryHeader.setDeliveryCodes(deliveryCodes);
		}
		List<BusDeliveryHeader> deliveryHeaders = deliveryHeaderDao.search(busDeliveryHeader, pageInfo,isPage);
		List<DeliveryHeaderDto> deliveryHeaderDtos = DomainstoDtos(deliveryHeaders);
		return deliveryHeaderDtos;
	}

	@Override
	public DeliveryHeaderDto save(DeliveryHeaderDto deliveryHeaderDto) {
		  
		BusDeliveryHeader busDeliveryHeader = DtotoDomain(deliveryHeaderDto);
		busDeliveryHeader.setCreateTime(new Date());
		busDeliveryHeader.setEnabled(true);
		busDeliveryHeader.setPrintStatus(false);
		busDeliveryHeader.setReceived(false);
		deliveryHeaderDao.create(busDeliveryHeader);
		return DomaintoDto(busDeliveryHeader);
	}

	@Override
	public void delete(String id) {
		  
		deliveryHeaderDao.delete(deliveryHeaderDao.load(id));
	}

	@Override
	public void deleteByCode(String deliveryCode) throws Exception {
		    
		deliveryHeaderDao.deleteByDeliveryCode(deliveryCode);
	}

	@Override
	public DeliveryHeaderDto load(String id) {
		   
		return DomaintoDto(deliveryHeaderDao.load(id));
	}

	@Override
	public DeliveryHeaderDto loadByCode(String deliveryCode) {
		  
		return DomaintoDto(deliveryHeaderDao.loadByAttribute("deliveryCode", deliveryCode));
	}

	@Override
	public void update(DeliveryHeaderDto deliveryHeaderDto) {
		  
		BusDeliveryHeader busMadeHeader = deliveryHeaderDao.load(deliveryHeaderDto.getId());
		busMadeHeader.setAddress(deliveryHeaderDto.getAddress());
		busMadeHeader.setContacts(deliveryHeaderDto.getContacts());
		busMadeHeader.setContract(deliveryHeaderDto.getContract());
		busMadeHeader.setCustomerCode(deliveryHeaderDto.getCustomerCode());
		busMadeHeader.setCustomerName(deliveryHeaderDto.getCustomerName());
		busMadeHeader.setDeliveryDate(deliveryHeaderDto.getDeliveryDate());
		busMadeHeader.setDeliveryType(deliveryHeaderDto.getDeliveryType());
		busMadeHeader.setDescription(deliveryHeaderDto.getDescription());
		busMadeHeader.setExpress(deliveryHeaderDto.getExpress());
		busMadeHeader.setTel(deliveryHeaderDto.getTel());
		busMadeHeader.setOrderCode(deliveryHeaderDto.getOrderCode());
		
		deliveryHeaderDao.update(busMadeHeader);
		
	}

	@Override
	public void signPrint(String deliveryCode) {
		  
		BusDeliveryHeader busDeliveryHeader = deliveryHeaderDao.loadByAttribute("deliveryCode", deliveryCode);
		busDeliveryHeader.setPrintStatus(true);
		deliveryHeaderDao.update(busDeliveryHeader);
	}

	@Override
	public void received(String deliveryCode) {
		  
		BusDeliveryHeader busDeliveryHeader = deliveryHeaderDao.loadByAttribute("deliveryCode", deliveryCode);
		busDeliveryHeader.setReceived(true);
		busDeliveryHeader.setReceiveTime(new Date());
		deliveryHeaderDao.update(busDeliveryHeader);
	}

/******************************************* 内部操作   *******************************************/
	
	/**
	 * @description Domian转Dto
	 * @return BusMadeHeader
	 * @param madeHeaderDto
	 */
	public static BusDeliveryHeader DtotoDomain(DeliveryHeaderDto deliveryHeaderDto){
		if(null==deliveryHeaderDto){
			return null;
		}		
		BusDeliveryHeader busDeliveryHeader = new BusDeliveryHeader();
		
		busDeliveryHeader.setCreateManName(deliveryHeaderDto.getCreateManName());
		busDeliveryHeader.setCreateTime(deliveryHeaderDto.getCreateTime());
		busDeliveryHeader.setEnabled(deliveryHeaderDto.isEnabled());
		busDeliveryHeader.setId(deliveryHeaderDto.getId());
		busDeliveryHeader.setDeliveryCode(deliveryHeaderDto.getDeliveryCode());
		busDeliveryHeader.setDeliveryType(deliveryHeaderDto.getDeliveryType());
		busDeliveryHeader.setReceived(deliveryHeaderDto.isReceived());
		busDeliveryHeader.setOrderCode(deliveryHeaderDto.getOrderCode());
		
		busDeliveryHeader.setPrintStatus(deliveryHeaderDto.isPrintStatus());
		busDeliveryHeader.setCustomerCode(deliveryHeaderDto.getCustomerCode());
		busDeliveryHeader.setCustomerName(deliveryHeaderDto.getCustomerName());
		busDeliveryHeader.setAddress(deliveryHeaderDto.getAddress());
		busDeliveryHeader.setTel(deliveryHeaderDto.getTel());
		busDeliveryHeader.setContacts(deliveryHeaderDto.getContacts());
		busDeliveryHeader.setContract(deliveryHeaderDto.getContract());
		busDeliveryHeader.setDeliveryDate(deliveryHeaderDto.getDeliveryDate());
		busDeliveryHeader.setExpress(deliveryHeaderDto.getExpress());
		busDeliveryHeader.setDescription(deliveryHeaderDto.getDescription());
		busDeliveryHeader.setReceiveTime(deliveryHeaderDto.getReceiveTime());
		
		return busDeliveryHeader;	
	}
	
	/**
	 * @description Dto转Domian
	 * @return MadeHeaderDto
	 * @param busMadeHeader
	 */
	public DeliveryHeaderDto DomaintoDto(BusDeliveryHeader busDeliveryHeader){
		if(null==busDeliveryHeader){
			return null;
		}
		DeliveryHeaderDto deliveryHeaderDto = new DeliveryHeaderDto();
		
		
		deliveryHeaderDto.setCreateManName(busDeliveryHeader.getCreateManName());
		deliveryHeaderDto.setCreateTime(busDeliveryHeader.getCreateTime());
		deliveryHeaderDto.setEnabled(busDeliveryHeader.isEnabled());
		deliveryHeaderDto.setId(busDeliveryHeader.getId());
		deliveryHeaderDto.setDeliveryCode(busDeliveryHeader.getDeliveryCode());
		deliveryHeaderDto.setDeliveryType(busDeliveryHeader.getDeliveryType());
		deliveryHeaderDto.setDeliveryTypeName(DeliveryTypeEnum.getByValue(busDeliveryHeader.getDeliveryType()).getComment());
		deliveryHeaderDto.setReceived(busDeliveryHeader.isReceived());
		deliveryHeaderDto.setReceiveStatus(busDeliveryHeader.isReceived()?"已收货":"未收货");
		deliveryHeaderDto.setOrderCode(busDeliveryHeader.getOrderCode());
		
		deliveryHeaderDto.setPrintStatus(busDeliveryHeader.isPrintStatus());
		deliveryHeaderDto.setCustomerCode(busDeliveryHeader.getCustomerCode());
		deliveryHeaderDto.setCustomerName(busDeliveryHeader.getCustomerName());
		deliveryHeaderDto.setAddress(busDeliveryHeader.getAddress());
		deliveryHeaderDto.setTel(busDeliveryHeader.getTel());
		deliveryHeaderDto.setContacts(busDeliveryHeader.getContacts());
		deliveryHeaderDto.setContract(busDeliveryHeader.getContract());
		deliveryHeaderDto.setDeliveryDate(busDeliveryHeader.getDeliveryDate());
		deliveryHeaderDto.setExpress(busDeliveryHeader.getExpress());
		deliveryHeaderDto.setDescription(busDeliveryHeader.getDescription());
		deliveryHeaderDto.setReceiveTime(busDeliveryHeader.getReceiveTime());
		
		return deliveryHeaderDto;	
	}
	
	/**
	 * @description domians转dtos
	 * @return List<MadeHeaderDto>
	 * @param busMadeHeaders
	 * @return
	 */
	public List<DeliveryHeaderDto> DomainstoDtos(List<BusDeliveryHeader> busDeliveryHeaders){
		
		List<DeliveryHeaderDto> deliveryHeaderDtos = new ArrayList<>();
		if (null != busDeliveryHeaders && busDeliveryHeaders.size() > 0) {
			for (BusDeliveryHeader busDeliveryHeader : busDeliveryHeaders) {
				DeliveryHeaderDto deliveryHeaderDto = DomaintoDto(busDeliveryHeader);
				if (null != deliveryHeaderDtos) {
					deliveryHeaderDtos.add(deliveryHeaderDto);
				}
			}
		}
		return deliveryHeaderDtos;
	}

	@Override
	public Long getInitCode(String sign) {
		  
		return deliveryHeaderDao.getInitCode(sign);
	}

	
	
}
  
