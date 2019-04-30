/**  
 * Project Name:fsun-erp  
 * File Name:DeliveryOrderServiceImpl.java  
 * Package Name:cn.com.fsun.bus.service  
 * Date:2017年8月25日 
 * Copyright (c) 2017, WFZ All Rights Reserved.  
 *  
*/  
  
package cn.com.fsun.bus.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.fsun.bus.biz.itf.DeliveryDetailManage;
import cn.com.fsun.bus.biz.itf.DeliveryHeaderManage;
import cn.com.fsun.bus.dto.DeliveryDetailDto;
import cn.com.fsun.bus.dto.DeliveryHeaderDto;
import cn.com.fsun.bus.dto.DeliveryOrderDto;
import cn.com.fsun.bus.dto.DeliveryPrintsDto;
import cn.com.fsun.bus.enums.OrderSourceEnum;
import cn.com.fsun.bus.exception.UnEnoughOrderCodeException;
import cn.com.fsun.bus.service.itf.DeliveryOrderService;
import cn.com.fsun.common.constants.ExceptionInfoConstants;
import cn.com.fsun.common.service.BaseService;
import cn.com.fsun.common.utils.PageInfo;
import cn.com.fsun.init.SettingsServletContextListener;

/**  
 * ClassName:DeliveryOrderServiceImpl <br/>  
 * Description: TODO <br/>   
 * @author   lenovo  
 * @version  1.0  
 * @since    JDK 1.7        
 */
@Service
public class DeliveryOrderServiceImpl extends BaseService implements DeliveryOrderService {
 

	@Autowired
	private DeliveryHeaderManage deliveryHeaderManage;
	
	@Autowired
	private DeliveryDetailManage deliveryDetailManage;
	
	
	@Override
	public String getInitDeliveryCode() throws UnEnoughOrderCodeException {

		String deliveryCodeFormat = SettingsServletContextListener.getDELIVERY_CODE_FORMAT();
		String sign = new SimpleDateFormat(deliveryCodeFormat).format(new Date())+OrderSourceEnum.DELIVERY_ORDER.getValue();
		System.out.println(sign);
		Long initCode = deliveryHeaderManage.getInitCode(sign);
		if(initCode%100000==99999){
			throw new UnEnoughOrderCodeException(ExceptionInfoConstants.UNENOUGH_DELIVERY_CODE);
		}
		return initCode+"";
	}

	@Override
	public void saveEntry(DeliveryOrderDto deliveryOrderDto) {

		DeliveryHeaderDto deliveryHeaderDto = deliveryOrderDto.getDeliveryHeaderDto();
		List<DeliveryDetailDto> deliveryDetailDtos = deliveryOrderDto.getDeliveryDetailDtos();
		deliveryHeaderDto.setCreateManName(super.getCurrentUserRealName());
		
		deliveryHeaderManage.save(deliveryHeaderDto);	
		deliveryDetailManage.batchAdd(deliveryDetailDtos);
	}

	@Override
	public void deleteEntry(String deliveryCode) throws Exception {

		deliveryDetailManage.delete(null, deliveryCode);
		deliveryHeaderManage.deleteByCode(deliveryCode);
	}

	@Override
	public DeliveryOrderDto getEntry(String deliveryCode) {
		
		DeliveryOrderDto deliveryOrderDto = new DeliveryOrderDto();
		
		//获取单头信息
		DeliveryHeaderDto deliveryHeaderDto = deliveryHeaderManage.loadByCode(deliveryCode);
		deliveryOrderDto.setDeliveryHeaderDto(deliveryHeaderDto);
		
		//获取单的明细
		DeliveryDetailDto deliveryDetailDto = new DeliveryDetailDto();
		deliveryDetailDto.setDeliveryCode(deliveryCode);
		List<DeliveryDetailDto> deliveryDetailDtos = deliveryDetailManage.search(deliveryDetailDto, new PageInfo(), false);
		deliveryOrderDto.setDeliveryDetailDtos(deliveryDetailDtos);
		return deliveryOrderDto;
	}

	@Override
	public void updateEntry(DeliveryOrderDto deliveryOrderDto) throws Exception {

		DeliveryHeaderDto deliveryHeaderDto = deliveryOrderDto.getDeliveryHeaderDto();
		
		String deliveryCode = deliveryHeaderDto.getDeliveryCode();	
		deliveryDetailManage.delete(null, deliveryCode);
		
		deliveryHeaderManage.update(deliveryHeaderDto);	
		deliveryDetailManage.batchAdd(deliveryOrderDto.getDeliveryDetailDtos());
	}

	@Override
	public DeliveryPrintsDto getDeliveryPrints(String deliveryCode) {

		DeliveryPrintsDto deliveryPrintsDto = new DeliveryPrintsDto();
		//获取单头信息
		DeliveryHeaderDto deliveryHeaderDto = deliveryHeaderManage.loadByCode(deliveryCode);
		deliveryPrintsDto.setDeliveryHeaderDto(deliveryHeaderDto);
		
		DeliveryDetailDto deliveryDetailDto = new DeliveryDetailDto();
		deliveryDetailDto.setDeliveryCode(deliveryCode);
		List<DeliveryDetailDto> deliveryDetailDtos = deliveryDetailManage.search(deliveryDetailDto, new PageInfo(), false);
		deliveryPrintsDto.setDeliveryDetailDtos(deliveryDetailDtos);
		return deliveryPrintsDto;
	}

	@Override
	public void signPrint(String deliveryCode) {

		deliveryHeaderManage.signPrint(deliveryCode);
	}

	@Override
	public void received(String deliveryCode) {

		deliveryHeaderManage.received(deliveryCode);
	}

}
  
