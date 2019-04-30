/**  
 * Project Name:fsun-erp  
 * File Name:DeliveryDetailManageImpl.java  
 * Package Name:cn.com.fsun.bus.biz.impl  
 * Date:2017年8月25日 
 * Copyright (c) 2017, WFZ All Rights Reserved.  
 *  
*/  
  
package cn.com.fsun.bus.biz.impl;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import cn.com.fsun.bus.biz.itf.DeliveryDetailManage;
import cn.com.fsun.bus.dao.DeliveryDetailDao;
import cn.com.fsun.bus.domain.BusDeliveryDetail;
import cn.com.fsun.bus.domain.BusDeliveryHeader;
import cn.com.fsun.bus.dto.DeliveryDetailDto;
import cn.com.fsun.bus.dto.DeliveryExportDto;
import cn.com.fsun.bus.dto.DeliverySummaryDto;
import cn.com.fsun.bus.enums.DeliveryTypeEnum;
import cn.com.fsun.common.utils.PageInfo;

/**  
 * ClassName:DeliveryDetailManageImpl <br/>  
 * Description: TODO <br/>   
 * @author   lenovo  
 * @version  1.0  
 * @since    JDK 1.7        
 */
@Component
public class DeliveryDetailManageImpl implements DeliveryDetailManage {

	@Autowired
	private DeliveryDetailDao deliveryDetailDao;
	
	@Override
	public List<DeliveryDetailDto> list(DeliveryDetailDto deliveryDetailDto){
		BusDeliveryDetail busDeliveryDetail = DtotoDomain(deliveryDetailDto);
		List<BusDeliveryDetail> busDeliveryDetails = deliveryDetailDao.search(busDeliveryDetail, new PageInfo(), false);
		List<DeliveryDetailDto> deliveryDetailDtos = DomainstoDtos(busDeliveryDetails);
		return deliveryDetailDtos;
	}
	
	@Override
	public List<DeliveryDetailDto> search(DeliveryDetailDto deliveryDetailDto, PageInfo pageInfo, boolean isPage) {
		  
		BusDeliveryDetail busDeliveryDetail = DtotoDomain(deliveryDetailDto);
		List<BusDeliveryDetail> busDeliveryDetails = deliveryDetailDao.search(busDeliveryDetail, pageInfo,isPage);
		List<DeliveryDetailDto> deliveryDetailDtos = DomainstoDtos(busDeliveryDetails);
		return deliveryDetailDtos;
	}

	@Override
	public DeliveryDetailDto save(DeliveryDetailDto deliveryDetailDto) {
		  
		BusDeliveryDetail busDeliveryDetail = DtotoDomain(deliveryDetailDto);
		deliveryDetailDao.create(busDeliveryDetail);
		return DomaintoDto(busDeliveryDetail);
	}

	@Override
	public void batchAdd(List<DeliveryDetailDto> deliveryDetailDtos) {	  
		for (DeliveryDetailDto deliveryDetailDto : deliveryDetailDtos) {
			this.save(deliveryDetailDto);
		}	
	}

	@Override
	public void delete(String id) {
		  
		deliveryDetailDao.delete(deliveryDetailDao.load(id));
	}

	@Override
	public void delete(String id, String deliveryCode) throws Exception {
		  
		if(deliveryCode!=null && !"".equals(deliveryCode)){
			deliveryDetailDao.deleteByDeliveryCode(deliveryCode);
		}else{
			this.delete(id);
		}
	}

	@Override
	public DeliveryDetailDto load(String id) {
		  
		return DomaintoDto(deliveryDetailDao.load(id));
	}

	@Override
	public void update(DeliveryDetailDto deliveryDetailDto) {
		  
		BusDeliveryDetail busDeliveryDetail = deliveryDetailDao.load(deliveryDetailDto.getId());
		
		//busDeliveryDetail.setProductCode(deliveryDetailDto.getProductCode());
		//busDeliveryDetail.setProductName(deliveryDetailDto.getProductName());
		//busDeliveryDetail.setStyle(deliveryDetailDto.getStyle());
		busDeliveryDetail.setNumber(deliveryDetailDto.getNumber());
		//busDeliveryDetail.setUnit(deliveryDetailDto.getUnit());
		busDeliveryDetail.setOnePrice(deliveryDetailDto.getOnePrice());
		busDeliveryDetail.setAllPrice(deliveryDetailDto.getAllPrice());
		busDeliveryDetail.setDescription(deliveryDetailDto.getDescription());	
		deliveryDetailDao.update(busDeliveryDetail);
	}
	
	
	@Override
	public List<DeliverySummaryDto> searchSummary(DeliverySummaryDto deliverySummaryDto, PageInfo pageInfo,
			boolean isPage) {
		List<DeliverySummaryDto> deliverySummaryDtos = new ArrayList<>();
		String hql = getFrom() + getWhere(deliverySummaryDto, pageInfo) + getOrderBy(pageInfo); 
		if(isPage){
			deliverySummaryDtos = deliveryDetailDao.findDetailSummaryForPage(hql, pageInfo);
		}else{
			deliverySummaryDtos = deliveryDetailDao.findDetailSummary(hql);
		}
		return deliverySummaryDtos;
	}
	
	/**
	 * 获取from字符串
	 * TODO
	 * @Title getFrom   
	 * @return String
	 */
	private String getFrom(){
		String hql = " select new cn.com.fsun.bus.dto.DeliverySummaryDto(detail.id, detail.productCode, "
				+ " detail.productName, detail.style, detail.number, detail.unit, detail.onePrice, detail.allPrice,"
				+ " detail.description, detail.orderCode, detail.deliveryCode, header.deliveryType, "
				+ " header.customerCode, header.customerName, header.receiveTime, "
				+ " header.received, header.createManName, header.createTime) ";	
		String from  = " from BusDeliveryDetail detail, BusDeliveryHeader header "
				+ " where detail.deliveryCode = header.deliveryCode ";
		return hql+from;
	}
	
	private String getWhere(DeliverySummaryDto deliverySummaryDto, PageInfo pageInfo){
		String where = "";
		if(deliverySummaryDto ==null){
		    return where;
		}	
		if(null!= deliverySummaryDto.getOrderCode() && !"".equals(deliverySummaryDto.getOrderCode())){
			where += " and detail.orderCode like '%"+ deliverySummaryDto.getOrderCode() +"%' ";
		}
		if(null!= deliverySummaryDto.getDeliveryCode() && !"".equals(deliverySummaryDto.getDeliveryCode())){
			where += " and detail.deliveryCode like '%"+ deliverySummaryDto.getDeliveryCode() +"%' ";
		}
		if(null!= deliverySummaryDto.getProductCode() && !"".equals(deliverySummaryDto.getProductCode())){
			where += " and detail.productCode = '"+ deliverySummaryDto.getProductCode() +"' ";
		}
		if(null!= deliverySummaryDto.getCustomerCode() && !"".equals(deliverySummaryDto.getCustomerCode())){
			where += " and header.customerCode = '"+ deliverySummaryDto.getCustomerCode() +"' ";
		}
		if(null!= deliverySummaryDto.getDeliveryType()){
			where += " and header.deliveryType = "+ deliverySummaryDto.getDeliveryType() +" ";
		}
		if(null!= deliverySummaryDto.isReceived()){
			where += " and header.received = "+ deliverySummaryDto.isReceived() +" ";
		}
		if (pageInfo.getStartDate()!=null){
			where += " and header.createTime >= '"+ pageInfo.getStartDate() +"' ";
		}
		if(pageInfo.getEndDate()!=null){
			where += " and header.createTime <= '"+ pageInfo.getEndDate() +"' ";
		}
		return where;
	}
	
	/**
	 * 组装分组
	 * TODO
	 * @Title getOrderBy   
	 * @param pageInfo
	 * @return String
	 */
	private String getOrderBy(PageInfo pageInfo){
		String orderBy = " order by header.createTime desc ";		
		if(null != pageInfo.getSortColumn() && !"".equals(pageInfo.getSortColumn())){
			String sortColumn = pageInfo.getSortColumn();
			if(this.objectToFiled(sortColumn, new BusDeliveryHeader())){
				if("DESC".equals(pageInfo.getSortType().toUpperCase())){
					orderBy = " order by header."+sortColumn+" desc ";
				}else{
					orderBy = " order by header."+sortColumn+" asc ";
				}
			}else{
				if("DESC".equals(pageInfo.getSortType().toUpperCase())){
					orderBy = " order by detail."+sortColumn+" desc ";
				}else{
					orderBy = " order by detail."+sortColumn+" asc ";
				}
			}
			
		}	
		return orderBy;
	}
	
	
	/**
	 * 判别字段是否是类中的属性
	 * TODO
	 * @Title objectToFiled   
	 * @param sortColumn
	 * @param objboolean
	 */
	private  boolean objectToFiled(String sortColumn, Object obj) {
		
		Field[] fields= obj.getClass().getDeclaredFields();  
        for(int i=0;i<fields.length;i++){  
	        if(fields[i].getName().equals(sortColumn)){
	        	return true;
	        }   
	    } 
		return false;
	}


	@Override
	public String createHql(DeliverySummaryDto deliverySummaryDto, PageInfo pageInfo) {	 
		
		String hql = " select detail.deliveryCode, "
				+ " case header.deliveryType "
				+ " when " + DeliveryTypeEnum.SIMPLE.getValue() + " then '" + DeliveryTypeEnum.SIMPLE.getComment() + "' "
				+ " when " + DeliveryTypeEnum.MERGE.getValue() + " then '" + DeliveryTypeEnum.MERGE.getComment() + "' "
				+ " when " + DeliveryTypeEnum.SPLIT.getValue() + " then '" + DeliveryTypeEnum.SPLIT.getComment() + "' "
				+ " else '" + DeliveryTypeEnum.UNKNOW.getComment() + "' end, "
				+ " header.customerName, "
				+ " detail.productName, "
				+ " detail.style, "
				+ " case when (detail.style is null or  detail.style='') then detail.productName "
				+ "	  when find_in_set(detail.productName, detail.style)=1 then detail.style "
				+ "	  when find_in_set(detail.productName, detail.style)!=1 then CONCAT(detail.productName,'(',detail.style,')') end, "
				+ " detail.number, detail.unit, "
				+ " header.receiveTime, "
				+ " case header.received when 1 then '已收货' else '未收货' end, "
				+ " detail.orderCode, header.createManName, "
				+ " header.createTime, detail.onePrice, detail.allPrice, detail.description ";	
		
		String from  = " from BusDeliveryDetail detail, BusDeliveryHeader header "
				+ " where detail.deliveryCode = header.deliveryCode ";
		hql = hql + from + getWhere(deliverySummaryDto, pageInfo) + getOrderBy(pageInfo); 
		return hql;
	}
	
	@Override
	public List<List<Object>> getData(String hql, int limit, int start) {
		  
		PageInfo pageInfo = new PageInfo();
		pageInfo.setFirstRecord(start);
		pageInfo.setPageSize(limit);
		List list = deliveryDetailDao.findDetailSummaryForPage(hql, pageInfo);
		List<List<Object>> ddd = new ArrayList<List<Object>>(); 
		List<Object> ll = null;
		Object[] obj = null;
		if(list!=null){
			for (int i = 0; i < list.size(); i++) {
				obj = (Object[])list.get(i);
				ll = new ArrayList<Object>();
				for (int j = 0; j < obj.length; j++) {
					ll.add(obj[j]!=null?obj[j] : "");
				}
				ddd.add(ll);			
			}
		}
		return ddd;
	}
	
	
/******************************************* 内部操作   *******************************************/
	
	/**
	 * @description Domian转Dto
	 * @return BusMadeDetail
	 * @param madeDetailDto
	 */
	public static BusDeliveryDetail DtotoDomain(DeliveryDetailDto deliveryDetailDto){
		if(null==deliveryDetailDto){
			return null;
		}		
		BusDeliveryDetail busDeliveryDetail = new BusDeliveryDetail();
		busDeliveryDetail.setId(deliveryDetailDto.getId());
		busDeliveryDetail.setOrderCode(deliveryDetailDto.getOrderCode());
		busDeliveryDetail.setDeliveryCode(deliveryDetailDto.getDeliveryCode());
		busDeliveryDetail.setProductCode(deliveryDetailDto.getProductCode());
		busDeliveryDetail.setProductName(deliveryDetailDto.getProductName());
		busDeliveryDetail.setStyle(deliveryDetailDto.getStyle());
		busDeliveryDetail.setNumber(deliveryDetailDto.getNumber());
		busDeliveryDetail.setUnit(deliveryDetailDto.getUnit());
		busDeliveryDetail.setOnePrice(deliveryDetailDto.getOnePrice());
		busDeliveryDetail.setAllPrice(deliveryDetailDto.getAllPrice());
		busDeliveryDetail.setDescription(deliveryDetailDto.getDescription());
		
		return busDeliveryDetail;
	}
	
	/**
	 * @description Dto转Domian
	 * @return MadeDetailDto
	 * @param busMadeDetail
	 */
	public DeliveryDetailDto DomaintoDto(BusDeliveryDetail busDeliveryDetail){
		if(null==busDeliveryDetail){
			return null;
		}
		DeliveryDetailDto deliveryDetailDto = new DeliveryDetailDto();
	
		deliveryDetailDto.setId(busDeliveryDetail.getId());
		deliveryDetailDto.setOrderCode(busDeliveryDetail.getOrderCode());
		deliveryDetailDto.setDeliveryCode(busDeliveryDetail.getDeliveryCode());
		deliveryDetailDto.setProductCode(busDeliveryDetail.getProductCode());
		deliveryDetailDto.setProductName(busDeliveryDetail.getProductName());
		deliveryDetailDto.setStyle(busDeliveryDetail.getStyle());
		deliveryDetailDto.setNumber(busDeliveryDetail.getNumber());
		deliveryDetailDto.setUnit(busDeliveryDetail.getUnit());
		deliveryDetailDto.setOnePrice(busDeliveryDetail.getOnePrice());
		deliveryDetailDto.setAllPrice(busDeliveryDetail.getAllPrice());
		deliveryDetailDto.setDescription(busDeliveryDetail.getDescription());
		return deliveryDetailDto;
	}
	
	/**
	 * @description domians转dtos
	 * @return List<MadeDetailDto>
	 * @param busMadeDetails
	 * @return
	 */
	public List<DeliveryDetailDto> DomainstoDtos(List<BusDeliveryDetail> busDeliveryDetails){
		
		List<DeliveryDetailDto> deliveryDetailDtos = new ArrayList<DeliveryDetailDto>();
		if (null != busDeliveryDetails && busDeliveryDetails.size() > 0) {
			for (BusDeliveryDetail busDeliveryDetail : busDeliveryDetails) {
				DeliveryDetailDto deliveryDetailDto = DomaintoDto(busDeliveryDetail);
				if (null != deliveryDetailDto) {
					deliveryDetailDtos.add(deliveryDetailDto);
				}
			}
		}
		return deliveryDetailDtos;
	}
	

}
  
