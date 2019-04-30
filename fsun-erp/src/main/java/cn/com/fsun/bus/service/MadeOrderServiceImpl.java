/**  
 * Project Name:fsun-erp  
 * File Name:MadeOrderServiceImpl.java  
 * Package Name:cn.com.fsun.bus.service  
 * Date:2017年8月9日 
 * Copyright (c) 2017, WFZ All Rights Reserved.  
 *  
*/  
  
package cn.com.fsun.bus.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.fsun.bus.biz.itf.MadeDetailManage;
import cn.com.fsun.bus.biz.itf.MadeHeaderManage;
import cn.com.fsun.bus.biz.itf.MadePackageManage;
import cn.com.fsun.bus.biz.itf.MadeProcessManage;
import cn.com.fsun.bus.dao.OrderDetailDao;
import cn.com.fsun.bus.dao.ProductDao;
import cn.com.fsun.bus.domain.BusOrderDetail;
import cn.com.fsun.bus.domain.BusProductInfo;
import cn.com.fsun.bus.dto.MadeDetailDto;
import cn.com.fsun.bus.dto.MadeHeaderDto;
import cn.com.fsun.bus.dto.MadeOrderDto;
import cn.com.fsun.bus.dto.MadePackageDto;
import cn.com.fsun.bus.dto.MadePrintDetailDto;
import cn.com.fsun.bus.dto.MadePrintsDto;
import cn.com.fsun.bus.dto.MadeProcessDetailDto;
import cn.com.fsun.bus.dto.MadeProcessDto;
import cn.com.fsun.bus.dto.OrderDetailDto;
import cn.com.fsun.bus.dto.OrderDto;
import cn.com.fsun.bus.dto.ShortcutMadeDetailDto;
import cn.com.fsun.bus.dto.ShortcutOrderDto;
import cn.com.fsun.bus.enums.MadeTypeEnum;
import cn.com.fsun.bus.enums.OrderSourceEnum;
import cn.com.fsun.bus.exception.UnEnoughOrderCodeException;
import cn.com.fsun.bus.service.itf.MadeOrderService;
import cn.com.fsun.common.constants.ExceptionInfoConstants;
import cn.com.fsun.common.service.BaseService;
import cn.com.fsun.common.utils.DateUtil;
import cn.com.fsun.common.utils.PKMapping;
import cn.com.fsun.common.utils.PageInfo;

/**  
 * ClassName:MadeOrderServiceImpl <br/>  
 * Description: 生产单的增删改查操作  
 * @author   lenovo  
 * @version  1.0  
 * @since    JDK 1.7        
 */
@Service
public class MadeOrderServiceImpl extends BaseService implements MadeOrderService {
	
	@Autowired
	private MadeHeaderManage madeHeaderManage;
	
	@Autowired
	private MadeDetailManage madeDetailManage;
	
	@Autowired
	private MadeProcessManage madeProcessManage;
	
	@Autowired
	private MadePackageManage madePackageManage;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private OrderDetailDao orderDetailDao;
	
	@Autowired
	private OrderService orderService;
	
	@Override
	public String getInitCode() throws UnEnoughOrderCodeException {

		String sign = new SimpleDateFormat("yyyyMMdd").format(new Date())+OrderSourceEnum.DELIVERY_ORDER.getValue();		
		Long initCode = madeHeaderManage.getInitCode(sign);
		if(initCode%100000==99999){
			throw new UnEnoughOrderCodeException(ExceptionInfoConstants.UNENOUGH_MADE_CODE);
		}
		return initCode+"";
	}

	@Override
	public void saveEntry(MadeOrderDto madeOrderDto) {
		MadeHeaderDto madeHeaderDto = madeOrderDto.getMadeHeaderDto();
		List<MadeDetailDto> madeDetailDtos = madeOrderDto.getMadeDetailDtos();
		List<MadeProcessDto> madeProcessDtos = madeOrderDto.getMadeProcessDtos();
		List<MadePackageDto> madePackageDtos = madeOrderDto.getMadePackageDtos();
		
		madeHeaderDto.setCreateManId(super.getCurrentUserID());
		madeHeaderDto.setCreateManName(super.getCurrentUserRealName());
	
		madeHeaderManage.save(madeHeaderDto);	
		madeDetailManage.batchAdd(madeDetailDtos);
		madeProcessManage.batchAdd(madeProcessDtos);
		madePackageManage.batchAdd(madePackageDtos);
	}

	@Override
	public void deleteEntry(String madeCode) throws Exception {
		madeProcessManage.delete(null, madeCode);
		madeDetailManage.delete(null, madeCode);
		madePackageManage.delete(null, madeCode);
		madeHeaderManage.deleteByCode(madeCode);
	}

	@Override
	public MadeOrderDto getEntry(String madeCode) {

		MadeOrderDto madeOrderDto = new MadeOrderDto();
		
		//获取生产单头信息
		MadeHeaderDto madeHeaderDto = madeHeaderManage.loadByCode(madeCode);
		madeOrderDto.setMadeHeaderDto(madeHeaderDto);
		
		//获取生产单的明细
		MadeDetailDto madeDetailDto = new MadeDetailDto();
		madeDetailDto.setMadeCode(madeCode);
		List<MadeDetailDto> madeDetailDtos = madeDetailManage.search(madeDetailDto, new PageInfo(), false);
		madeOrderDto.setMadeDetailDtos(madeDetailDtos);
		
		
		//获取明细下的后道工序明细
		MadeProcessDto madeProcessDto = new MadeProcessDto();
		madeProcessDto.setMadeCode(madeCode);
		List<MadeProcessDto> madeProcessDtos = madeProcessManage.search(madeProcessDto, new PageInfo(), false);
		madeOrderDto.setMadeProcessDtos(madeProcessDtos);
		
		
		//获取生产包装的明细
		MadePackageDto madePackageDto = new MadePackageDto();
		madePackageDto.setMadeCode(madeCode);
		List<MadePackageDto> madePackageDtos = madePackageManage.search(madePackageDto, new PageInfo(), false);
		madeOrderDto.setMadePackageDtos(madePackageDtos);
		
		return madeOrderDto;
	}

	@Override
	public void updateEntry(MadeOrderDto madeOrderDto) throws Exception {

		MadeHeaderDto madeHeaderDto = madeOrderDto.getMadeHeaderDto();
		
		String madeCode = madeHeaderDto.getMadeCode();	
		madeProcessManage.delete(null, madeCode);
		madeDetailManage.delete(null, madeCode);
		madePackageManage.delete(null, madeCode);
		
		madeHeaderManage.update(madeHeaderDto);	
		madeDetailManage.batchAdd(madeOrderDto.getMadeDetailDtos());
		madeProcessManage.batchAdd(madeOrderDto.getMadeProcessDtos());
		madePackageManage.batchAdd(madeOrderDto.getMadePackageDtos());
	}
	
	@Override
	public void completeMade(String madeCode) {
		madeHeaderManage.completeMade(madeCode);
	}

	@Override
	public MadePrintsDto getMadePrints(String madeCode) {
		MadePrintsDto madePrintsDto = new MadePrintsDto();
		//获取生产单头信息
		MadeHeaderDto madeHeaderDto = madeHeaderManage.loadByCode(madeCode);
		madePrintsDto.setMadeHeaderDto(madeHeaderDto);
		
		MadePackageDto madePackageDto = new MadePackageDto();
		madePackageDto.setMadeCode(madeCode);
		List<MadePackageDto> madePackageDtos = madePackageManage.search(madePackageDto, new PageInfo(), false);
		Map<String, List<MadePackageDto>> productPackagesMap = new HashMap<>();
		for (MadePackageDto madePackageDto2 : madePackageDtos) {
			String productCode = madePackageDto2.getProductCode();
			if(productPackagesMap.containsKey(productCode)){
				List<MadePackageDto> madePackageDtos1 = productPackagesMap.get(productCode);
				madePackageDtos1.add(madePackageDto2);
			}else{
				List<MadePackageDto> madePackageDtos1 = new ArrayList<>();
				madePackageDtos1.add(madePackageDto2);
				productPackagesMap.put(productCode, madePackageDtos1);
			}
		}
		
		List<MadePrintDetailDto> madePrintDetailDtos = new ArrayList<>();
		
		MadeDetailDto madeDetailDto = new MadeDetailDto();
		madeDetailDto.setMadeCode(madeCode);
		List<MadeDetailDto> madeDetailDtos = madeDetailManage.search(madeDetailDto, new PageInfo(), false);

		MadeProcessDto madeProcessDto = new MadeProcessDto();
		madeProcessDto.setMadeCode(madeCode);
		List<MadeProcessDto> madeProcessDtos = madeProcessManage.search(madeProcessDto, new PageInfo(), false);

		
		for (Entry<String, List<MadePackageDto>> entry : productPackagesMap.entrySet()) {
			
			List<MadePackageDto> madePackageDtos2 = entry.getValue();
			String productCode = entry.getKey();
			MadePrintDetailDto madePrintDetailDto = new MadePrintDetailDto();
			madePrintDetailDto.setProductInfo(productDao.loadByCode(productCode));
			madePrintDetailDto.setMadePackageDtos(madePackageDtos2);
			
			int madePrintDetailLength = 0;
			////创建工艺明细列表
			List<MadeProcessDetailDto> madeProcessDetailDtos = new ArrayList<>();
			for (MadeDetailDto madeDetailDto1 : madeDetailDtos) {
				if(productCode.equals(madeDetailDto1.getProductCode())){
					//创建工艺明细
					MadeProcessDetailDto madeProcessDetailDto = new MadeProcessDetailDto();
					//插入制作、印刷工艺明细
					madeProcessDetailDto.setMadeDetailDto(madeDetailDto1);
					
					madePrintDetailLength ++;
					
					//插入后道工序
					List<MadeProcessDto> madeProcessDtos1 = new ArrayList<>();
					for (MadeProcessDto madeProcessDto1 : madeProcessDtos) {
						if(madeDetailDto1.getProcessCode().equals(madeProcessDto1.getProcessCode())){
							madeProcessDtos1.add(madeProcessDto1);						
						}
					}
					madeProcessDetailDto.setMadeProcessDtos(madeProcessDtos1);
					madePrintDetailLength += madeProcessDtos1.size();
					madeProcessDetailDtos.add(madeProcessDetailDto);
				}
			}
			madePrintDetailDto.setMadeProcessDetailDtos(madeProcessDetailDtos);
			madePrintDetailDto.setMadeProcessDetailLength(madePrintDetailLength);
			//有打包信息没有工艺明细的不添加
			if(madeProcessDetailDtos!=null && madeProcessDetailDtos.size()>0){
				madePrintDetailDtos.add(madePrintDetailDto);
			}	
		}
		madePrintsDto.setMadePrintDetailDtos(madePrintDetailDtos);
		return madePrintsDto;
	}

	@Override
	public void signPrint(String madeCode) {
		madeHeaderManage.signPrint(madeCode);
	}

	@Override
	public void createShortcut(ShortcutOrderDto shortcutOrderDto) 
			throws UnEnoughOrderCodeException {		
		
		String createManId =  super.getCurrentUserID();
	    String createManName = super.getCurrentUserRealName();
	    String madeCode = shortcutOrderDto.getMadeCode();
	    String orderCode = shortcutOrderDto.getOrderCode();
	    
	    //创建订单头信息
		OrderDto orderDto = shortcutOrderDto.getOrderDto();
		orderDto.setCode(orderCode);
		orderDto.setMerchandTime(DateUtil.formateDate(new Date(), "yyyy-MM-dd HH:mm:ss"));
		orderDto = orderService.create(orderDto);
		String orderId = orderDto.getId();
		
		//创建生产单头信息
		MadeHeaderDto madeHeaderDto = new MadeHeaderDto();
		madeHeaderDto.setCreateManId(createManId);
		madeHeaderDto.setCreateManName(createManName);
		/*madeHeaderDto.setCreateTime(createTime);
		madeHeaderDto.setEnabled(true);
		madeHeaderDto.setPrintStatus(printStatus);*/
		madeHeaderDto.setMadeCode(madeCode);
		madeHeaderDto.setMadeType(MadeTypeEnum.SIMPLE.getValue());
		madeHeaderDto.setOrderCode(orderCode);
		madeHeaderManage.save(madeHeaderDto);	
		
		List<MadePackageDto> madePackageDtos = shortcutOrderDto.getMadePackageDtos();
		for (MadePackageDto madePackageDto : madePackageDtos) {
			//产品信息(款号)同步
			OrderDetailDto orderDetailDto = new OrderDetailDto();
			orderDetailDto.setProductCode(madePackageDto.getProductCode());
			orderDetailDto.setStyle(madePackageDto.getStyle());
			BusProductInfo productInfo = productService.initProductForNoCode(orderDetailDto);
			
			//创建订单明细
			BusOrderDetail orderDetail = new BusOrderDetail();
			orderDetail.setOrderCode(orderCode);
			orderDetail.setOrderId(orderId);
			orderDetail.setProductCode(productInfo.getCode());
			orderDetail.setProductName(productInfo.getName());
			orderDetail.setStyle(madePackageDto.getStyle());
			orderDetail.setUnit(madePackageDto.getUnit());	
			
			Integer orderNumber = madePackageDto.getOrderNumber();
			Double onePrice = madePackageDto.getOnePrice();
			orderDetail.setNumber(orderNumber);
			orderDetail.setOnePrice(onePrice);
			if(orderNumber!=null && onePrice!=null){
				orderDetail.setAllPrice(orderNumber * onePrice);
			}
			orderDetail.setPapers(0);
			orderDetail.setPrints(0);
			orderDetail.setRealNumber(madePackageDto.getRealNumber()!=null?madePackageDto.getRealNumber():0);
			orderDetail.setDescription(madePackageDto.getDescription());
			orderDetail.setEnabled(true);
			orderDetailDao.create(orderDetail);
			
			//创建生产打包信息
			madePackageDto.setMadeCode(madeCode);
			madePackageDto.setOrderCode(orderCode);
			madePackageDto.setOrderDetailId(orderDetail.getId());
			madePackageDto.setOrderId(orderId);
			madePackageDto.setProductCode(productInfo.getCode());
			madePackageDto.setProductName(productInfo.getName());
			madePackageManage.add(madePackageDto);
		}
		
		List<ShortcutMadeDetailDto> scmDetailDtos = shortcutOrderDto.getShortcutMadeDetailDtos();
		for (ShortcutMadeDetailDto scmDetailDto : scmDetailDtos) {
			String uuid = PKMapping.GUUID(PKMapping.bus_made_order_details_process);
			
			//创建生产工艺明细信息
			scmDetailDto.setProcessCode(uuid);
			scmDetailDto.setMadeCode(madeCode);
			scmDetailDto.setOrderCode(orderCode);
			madeDetailManage.save(scmDetailDto);	
			
			//创建生产工艺后道工序明细信息
			for (MadeProcessDto madeProcessDto : scmDetailDto.getMadeProcessDtos()) {
				madeProcessDto.setProcessCode(uuid);
				madeProcessDto.setMadeCode(madeCode);
				madeProcessDto.setOrderCode(orderCode);
				madeProcessManage.save(madeProcessDto);
			}			
		}
		
	}

}
  
