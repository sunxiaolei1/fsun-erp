package cn.com.fsun.bus.biz.impl;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import cn.com.fsun.bus.biz.itf.ProxyPrintDetailManage;
import cn.com.fsun.bus.dao.ProxyPrintDetailDao;
import cn.com.fsun.bus.domain.BusProxyOrderHeader;
import cn.com.fsun.bus.domain.BusProxyPrintDetail;
import cn.com.fsun.bus.dto.ProxyPrintDetailDto;
import cn.com.fsun.bus.dto.ProxySummaryDto;
import cn.com.fsun.bus.enums.PrintColorsEnum;
import cn.com.fsun.common.utils.PageInfo;

/**
 * 
 * @author sunxiaolei
 *
 */
@Component
public class ProxyPrintDetailManageImpl implements ProxyPrintDetailManage {

	@Autowired
	private ProxyPrintDetailDao proxyPrintDetailDao;
	
	@Override
	public List<ProxyPrintDetailDto> batchSave(List<ProxyPrintDetailDto> detailDtos) {
		List<BusProxyPrintDetail> details = DtostoDomains(detailDtos);
		int lineNo = 1;
		for (BusProxyPrintDetail busProxyPrintDetail : details) {
			busProxyPrintDetail.setId(null);
			busProxyPrintDetail.setLineNo(lineNo++);
		}
		proxyPrintDetailDao.saveAll(details);
		return DomainstoDtos(details);
	}

	@Override
	public List<ProxyPrintDetailDto> loadByCode(String proxyCode) {
		BusProxyPrintDetail busProxyPrintDetail = new BusProxyPrintDetail();
		busProxyPrintDetail.setProxyCode(proxyCode);
		List<BusProxyPrintDetail> list = proxyPrintDetailDao.list(busProxyPrintDetail);
		return DomainstoDtos(list);
	}
	
	
	@Override
	public void deleteByProxyCode(String proxyCode){
		proxyPrintDetailDao.deleteByProxyCode(proxyCode);	
	}

	@Override
	public void batchUpdate(List<ProxyPrintDetailDto> detailDtos) throws RuntimeException {
		if(detailDtos!=null && detailDtos.size()>0){
			String proxyCode = detailDtos.get(0).getProxyCode();
			proxyPrintDetailDao.deleteByProxyCode(proxyCode);		
			this.batchSave(detailDtos);
		} 	
	}


	@Override
	public List<ProxySummaryDto> searchSummary(ProxySummaryDto proxySummaryDto, PageInfo pageInfo, boolean isPage) {
		List<ProxySummaryDto> proxySummaryDtos = new ArrayList<>();
		String hql = getFrom() + getWhere(proxySummaryDto, pageInfo) + getOrderBy(pageInfo); 
		if(isPage){
			proxySummaryDtos = proxyPrintDetailDao.findDetailSummaryForPage(hql, pageInfo);
		}else{
			proxySummaryDtos = proxyPrintDetailDao.findDetailSummary(hql);
		}
		return proxySummaryDtos;
	}

	@Override
	public String createHql(ProxySummaryDto proxySummaryDto, PageInfo pageInfo) {
		String hql = " select header.proxyCode, "
				+ " header.customerName, "
				+ " case header.paid when 1 then '是' else '否' end, "
				+ " header.orderPrice, "
				+ " (select orderDetail.descr from BusProxyOrderDetail orderDetail where orderDetail.proxyCode = header.proxyCode) as remark, "
				+ " header.receiveTime, "
				+ " header.createManName, "
				+ " header.createTime, "
				+ " detail.productName, "
				+ " detail.model, "
				+ " detail.process, "
				+ " detail.psNumber, "
				+ " detail.layout, "
				+ " case when (detail.spotColors is null or detail.spotColors='') then detail.colorsName else CONCAT(detail.colorsName,'(',detail.spotColors,')') end, "
				+ " detail.number, "
				+ " detail.loss, "
				+ " detail.descr ";	
		
		String from  = " from BusProxyPrintDetail detail, BusProxyOrderHeader header "
				+ " where detail.proxyCode = header.proxyCode ";
		hql = hql + from + getWhere(proxySummaryDto, pageInfo) + getOrderBy(pageInfo); 
		return hql;
	}

	@Override
	public List<List<Object>> getData(String hql, int limit, int start) {
		PageInfo pageInfo = new PageInfo();
		pageInfo.setFirstRecord(start);
		pageInfo.setPageSize(limit);
		List list = proxyPrintDetailDao.findDetailSummaryForPage(hql, pageInfo);
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
	
	
	
	/************************************ 内部操作   ***************************************/
	
	/**
	 * @description Domian转Dto
	 * @return BusProxyPrintDetail
	 * @param detailDto
	 */
	public static BusProxyPrintDetail DtotoDomain(ProxyPrintDetailDto detailDto){
		if(null==detailDto){
			return null;
		}		
		BusProxyPrintDetail detail = new BusProxyPrintDetail();
		
		detail.setId(detailDto.getId());
		detail.setLineNo(detailDto.getLineNo());
		detail.setProxyCode(detailDto.getProxyCode());
		detail.setProductName(detailDto.getProductName());	
		detail.setLayout(detailDto.getLayout());	
		detail.setModel(detailDto.getModel());
		detail.setColors(detailDto.getColors());
		if(detailDto.getColors()!=null){
			detail.setColorsName(PrintColorsEnum.getByCode(detailDto.getColors()).getName());
		}	
		detail.setProcess(detailDto.getProcess());
		detail.setPsNumber(detailDto.getPsNumber());
		detail.setNumber(detailDto.getNumber());
		detail.setLoss(detailDto.getLoss());	
		detail.setTotalPrice(detailDto.getTotalPrice());
		detail.setPrice(detailDto.getPrice());	
		detail.setDescr(detailDto.getDescr());
		detail.setSpotColors(detailDto.getSpotColors());
		return detail;
	}
	
	/**
	 * @description Dto转Domian
	 * @return ProxyPrintDetailDto
	 * @param detail
	 */
	public ProxyPrintDetailDto DomaintoDto(BusProxyPrintDetail detail){
		if(null==detail){
			return null;
		}
		ProxyPrintDetailDto detailDto = new ProxyPrintDetailDto();
		
		detailDto.setId(detail.getId());
		detailDto.setLineNo(detail.getLineNo());
		detailDto.setProxyCode(detail.getProxyCode());
		detailDto.setProductName(detail.getProductName());		
		detailDto.setLayout(detail.getLayout());
		detailDto.setModel(detail.getModel());
		detailDto.setColors(detail.getColors());
	    detailDto.setColorsName(detail.getColorsName());    
		detailDto.setProcess(detail.getProcess());
		detailDto.setPsNumber(detail.getPsNumber());
		detailDto.setNumber(detail.getNumber());
		detailDto.setLoss(detail.getLoss());
		detailDto.setPrice(detail.getPrice());
		detailDto.setTotalPrice(detail.getTotalPrice());
		detailDto.setDescr(detail.getDescr());
		detailDto.setSpotColors(detail.getSpotColors());
		return detailDto;
	}
	
	/**
	 * @description domians转dtos
	 * @return List<ProxyPrintDetailDto>
	 * @param details
	 * @return
	 */
	public List<ProxyPrintDetailDto> DomainstoDtos(List<BusProxyPrintDetail> details){
		
		List<ProxyPrintDetailDto> madeDetailDtos = new ArrayList<ProxyPrintDetailDto>();
		if (null != details && details.size() > 0) {
			for (BusProxyPrintDetail detail : details) {
				ProxyPrintDetailDto detailDto = DomaintoDto(detail);
				if (null != detailDto) {
					madeDetailDtos.add(detailDto);
				}
			}
		}
		return madeDetailDtos;
	}

	/**
	 * @description dtos转domians
	 * @return List<BusProxyPrintDetail>
	 * @param detailDtos
	 * @return
	 */
	public List<BusProxyPrintDetail> DtostoDomains(List<ProxyPrintDetailDto> detailDtos){
		
		List<BusProxyPrintDetail> details = new ArrayList<BusProxyPrintDetail>();
		if (null != detailDtos && detailDtos.size() > 0) {
			for (ProxyPrintDetailDto detailDto : detailDtos) {
				BusProxyPrintDetail detail = DtotoDomain(detailDto);
				if (null != detail) {
					details.add(detail);
				}
			}
		}
		return details;
	}
	
	
	/**
	 * 获取from字符串
	 * TODO
	 * @Title getFrom   
	 * @return String
	 */
	private String getFrom(){
		String hql = " select new cn.com.fsun.bus.dto.ProxySummaryDto(header.proxyCode, header.customerName, header.customerCode,"
			+ " header.paid, header.orderPrice, header.receiveTime, header.createManName, header.createTime, "
			+ " (select orderDetail.descr from BusProxyOrderDetail orderDetail where orderDetail.proxyCode = header.proxyCode) as remark, "
			+ " detail.productName, detail.model, "
			+ " detail.process, detail.psNumber, detail.layout, detail.colorsName, detail.number, detail.loss, detail.descr, detail.spotColors) ";	
		String from  = " from BusProxyPrintDetail detail, BusProxyOrderHeader header "
				+ " where detail.proxyCode = header.proxyCode ";
		return hql + from;
	}
	
	/**
	 * 
	 * @param proxySummaryDto
	 * @param pageInfo
	 * @return
	 */
	private String getWhere(ProxySummaryDto proxySummaryDto, PageInfo pageInfo){
		String where = "";
		if(proxySummaryDto ==null){
		    return where;
		}			
		if(null!= proxySummaryDto.getProxyCode() && !"".equals(proxySummaryDto.getProxyCode())){
			where += " and detail.proxyCode like '%"+ proxySummaryDto.getProxyCode() +"%' ";
		}
		if(null!= proxySummaryDto.getProductName() && !"".equals(proxySummaryDto.getProductName())){
			where += " and detail.productName like '%"+ proxySummaryDto.getProductName() +"%' ";
		}
		if(null!= proxySummaryDto.getCustomerCode() && !"".equals(proxySummaryDto.getCustomerCode())){
			where += " and header.customerCode = '"+ proxySummaryDto.getCustomerCode() +"' ";
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
			if(this.objectToFiled(sortColumn, new BusProxyOrderHeader())){
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


}
