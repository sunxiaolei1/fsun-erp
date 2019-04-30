package cn.com.fsun.bus.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.fsun.bus.dao.BuyInfoDao;
import cn.com.fsun.bus.dao.DetailSummaryDao;
import cn.com.fsun.bus.dto.BuyDetailDto;
import cn.com.fsun.bus.dto.BuyInfoDto;
import cn.com.fsun.bus.dto.DetailSummary;
import cn.com.fsun.common.excel.ExcelUtil1;
import cn.com.fsun.common.excel.KCollectionUtil;
import cn.com.fsun.common.excel.KFileUtil;
import cn.com.fsun.common.service.BaseService;
import cn.com.fsun.common.utils.FileOperate;
import cn.com.fsun.common.utils.PageInfo;

@Service
public class DetailSummaryService extends BaseService{

	@Autowired
	private DetailSummaryDao detailSummaryDao;	
	
	@Autowired
	private BuyInfoDao buyInfoDao;
	
	public List<DetailSummary> getDetailSummary(DetailSummary summaryDetail,PageInfo pageInfo, boolean isPage) {
		String hql = "select new cn.com.fsun.bus.dto.DetailSummary"+
			"(a.code,b.productName,b.productCode,b.style,a.customerName,a.receiveTime,b.number,b.realNumber,"+
			"b.unit,b.onePrice,b.allPrice,b.description,b.papers,b.prints) from BusOrderInfo a ,BusOrderDetail b where a.id = b.orderId ";
		hql = addWhere(summaryDetail,pageInfo,hql);
		hql = addOrderBy(pageInfo,hql);
		if(isPage){
			return detailSummaryDao.findDetailSummaryForPage(hql, pageInfo);
		}else{
			return detailSummaryDao.findDetailSummary(hql);
		}		
	}

	public int getSearchCount(DetailSummary summaryDetail, PageInfo pageInfo) {
		String hql = "select count(b.id) from BusOrderInfo a ,BusOrderDetail b where a.id = b.orderId ";
		hql = addWhere(summaryDetail,pageInfo,hql);
		return detailSummaryDao.getCountForInfo(hql);
	}
	
	private String addWhere(DetailSummary summaryDetail,PageInfo pageInfo,String hql){
		if(summaryDetail ==null){
		    return hql;
		}
		if(null!= summaryDetail.getCustomerName() && !"".equals(summaryDetail.getCustomerName())){
			hql += " and a.customerName like '%"+ summaryDetail.getCustomerName() +"%' ";
		}
		if(null!= summaryDetail.getProductName() && !"".equals(summaryDetail.getProductName())){
			hql += " and b.productName like '%"+ summaryDetail.getProductName() +"%' ";
		}
		if (pageInfo.getStartDate()!=null){
			hql += " and a.receiveTime >= '"+ pageInfo.getStartDate() +"' ";
		}
		if(pageInfo.getEndDate()!=null){
			hql += " and a.receiveTime <= '"+ pageInfo.getEndDate() +"' ";
		}
		return hql;
	}
	 

	private String addOrderBy(PageInfo pageInfo,String hql){
		String order =" order by a.receiveTime desc ";		
		if(null != pageInfo.getSortColumn() && !"".equals(pageInfo.getSortColumn())){
			String sortColumn = pageInfo.getSortColumn();
			if("DESC".equals(pageInfo.getSortType().toUpperCase())){
				order = " order by a."+sortColumn+" desc ";
			}else{
				order = " order by a."+sortColumn+" asc ";
			}
		}	
		return hql+order;
	}

	private PageInfo getPageInfo(DetailSummary summaryDetail){
		PageInfo pageInfo = new PageInfo();
		if(null!=summaryDetail){
			if(StringUtils.isNotEmpty(summaryDetail.getSort())){
				pageInfo.setSortColumn(summaryDetail.getSort());
			}
			if(StringUtils.isNotEmpty(summaryDetail.getOrder())){
				pageInfo.setSortType(summaryDetail.getOrder());
			}
			if(summaryDetail.getStartDate() !=null &&!"".equals(summaryDetail.getStartDate())){
				pageInfo.setStartDate(summaryDetail.getStartDate()+" 00:00:00");
			}
			if(summaryDetail.getEndDate() !=null &&!"".equals(summaryDetail.getEndDate())){
				pageInfo.setEndDate(summaryDetail.getEndDate()+" 23:59:59");
			}
		}
		return pageInfo;
	}
	
	public List<DetailSummary> getDataForExcelExport(DetailSummary summaryDetail) {
		PageInfo pageInfo = getPageInfo(summaryDetail);
		List<DetailSummary> list = getDetailSummary(summaryDetail,pageInfo,false);	
		return list;
	}

	public List<Object> getDataForExcelExport1(DetailSummary summaryDetail) {
		PageInfo pageInfo = getPageInfo(summaryDetail);
		List<Object> list = getDetailSummary1(summaryDetail,pageInfo);	
		return list;
	}
	
	public List<Object> getDetailSummary1(DetailSummary summaryDetail,PageInfo pageInfo) {
		String hql = "select a.code,b.productName,b.productCode,b.style,a.customerName,a.receiveTime,b.number,b.realNumber,"+
			"b.unit,b.onePrice,b.allPrice,b.description,b.papers,b.prints from BusOrderInfo a ,BusOrderDetail b where a.id = b.orderId ";
		hql = addWhere(summaryDetail,pageInfo,hql);
		hql = addOrderBy(pageInfo,hql);		
		return detailSummaryDao.findExcelExport(hql);
				
	}

	public List<List<Object>> getData(String hql, int limit,
			int start) {
		PageInfo pageInfo = new PageInfo();
		pageInfo.setFirstRecord(start);
		pageInfo.setPageSize(limit);
		return detailSummaryDao.findForPage(hql, pageInfo);
	}
	
	private String createHql(DetailSummary summaryDetail){
		PageInfo pageInfo = getPageInfo(summaryDetail);
		String hql = "select a.code,b.productCode,b.productName,b.style,b.number,b.realNumber,b.unit,a.customerName,a.receiveTime,"+
			"b.onePrice,b.allPrice,b.papers,b.prints,b.description from BusOrderInfo a ,BusOrderDetail b where a.id = b.orderId ";
	    hql = addWhere(summaryDetail,pageInfo,hql);
	    hql = addOrderBy(pageInfo,hql);	
	    return hql;
	}
	
	public String writeExcel(DetailSummary summaryDetail,String rootPath,String temp_path,String fileName,String[] titles) throws Exception{
		
		FileOperate.deleteFile(rootPath + temp_path, ".xlsx");		
		List<String> files = new ArrayList<String>();
		String tempFileName = KFileUtil.getExcelFile("prefix_");	
		int limit = 10000;
		int start = 0;		
		String hql = this.createHql(summaryDetail);
		List<List<Object>> data = this.getData(hql,limit,start);
		while (KCollectionUtil.isNotNullAndEmpty(data)) {
			files.add(rootPath + temp_path +tempFileName);			
			ExcelUtil1.writeData(null, data, rootPath + temp_path +tempFileName);		
			if(data.size()<limit){
				data = null;				
				break;
			}else{
				tempFileName = KFileUtil.getExcelFile("prefix_");
				start += limit;
				data = this.getData(hql,limit,start);
			}	
		}		
		ExcelUtil1.mergeExcel(titles,files,rootPath + temp_path + fileName);				
		return fileName;
	}

	/***************************************************        采购模块           ********************************************/
	
	private String addWhere(BuyInfoDto buyInfoDto, String hql) {
		String where = " where buyInfo.purchaseId = purchaseInfo.id and buyInfo.materielId = materielInfo.id ";
		if (buyInfoDto.getPurchaseId() != null && !"".equals(buyInfoDto.getPurchaseId())) {
			where += "  and buyInfo.purchaseId like '%" + buyInfoDto.getPurchaseId() + "%'";	
		}
		if (buyInfoDto.getMaterielId() != null) {
			where += " and buyInfo.materielId = " + buyInfoDto.getMaterielId() ;
		}
		if (buyInfoDto.getFactoryId() != null && !"".equals(buyInfoDto.getFactoryId())) {
			where += " and buyInfo.factoryId = factoryInfo.id and buyInfo.factoryId = '" + buyInfoDto.getFactoryId() + "'";
		}
		if (buyInfoDto.getStoreId() != null && !"".equals(buyInfoDto.getStoreId())) {
 			where += " and storeInfo.id = purchaseInfo.storeId and purchaseInfo.storeId = " + buyInfoDto.getStoreId();
		}
		hql += where;
		return hql;
	}
	
	private String createHql(BuyInfoDto buyInfoDto) {
		String hql = "";
		if (buyInfoDto.getStoreId() != null) {
			if(buyInfoDto.getFactoryId()!= null && !"".equals(buyInfoDto.getFactoryId())){
				hql = " select buyInfo.purchaseId, "
					+ " materielInfo.name, buyInfo.spec, "
					+ " factoryInfo.name, buyInfo.enabled, "
					+ " buyInfo.number, buyInfo.unit, buyInfo.onePrice, buyInfo.allPrice, purchaseInfo.expire, "
					+ " storeInfo.name, purchaseInfo.consignee,"
					+ " (select user.realname from User user where user.id = purchaseInfo.createManId), buyInfo.description "
		            + " from BusBuyInfo buyInfo, BusPurchaseInfo purchaseInfo, BusStore storeInfo, BusMaterielInfo materielInfo,BusFactoryInfo factoryInfo ";
			}else{
				hql = " select buyInfo.purchaseId, "
					+ " materielInfo.name, buyInfo.spec, "
					+ " (select factoryInfo.name from BusFactoryInfo factoryInfo where buyInfo.factoryId = factoryInfo.id), buyInfo.enabled, "
					+ " buyInfo.number, buyInfo.unit, buyInfo.onePrice, buyInfo.allPrice, purchaseInfo.expire, "
					+ " storeInfo.name, purchaseInfo.consignee,"
					+ " (select user.realname from User user where user.id = purchaseInfo.createManId), buyInfo.description "
		            + " from BusBuyInfo buyInfo, BusPurchaseInfo purchaseInfo, BusStore storeInfo, BusMaterielInfo materielInfo ";
			}	
		}else{
			if(buyInfoDto.getFactoryId()!= null && !"".equals(buyInfoDto.getFactoryId())){
				hql = " select buyInfo.purchaseId, "
					+ " materielInfo.name, buyInfo.spec, "
					+ " factoryInfo.name, buyInfo.enabled, "
					+ " buyInfo.number, buyInfo.unit, buyInfo.onePrice, buyInfo.allPrice, purchaseInfo.expire, "
					+ " (select storeInfo.name from BusStore storeInfo where purchaseInfo.storeId = storeInfo.id), "
					+ " purchaseInfo.consignee,"
					+ " (select user.realname from User user where user.id = purchaseInfo.createManId), buyInfo.description "
		            + " from BusBuyInfo buyInfo, BusPurchaseInfo purchaseInfo, BusMaterielInfo materielInfo,BusFactoryInfo factoryInfo  ";
			}else{
				hql = " select buyInfo.purchaseId, "
					+ " materielInfo.name, buyInfo.spec, "
					+ " (select factoryInfo.name from BusFactoryInfo factoryInfo where buyInfo.factoryId = factoryInfo.id), buyInfo.enabled, "
					+ " buyInfo.number, buyInfo.unit, buyInfo.onePrice, buyInfo.allPrice, purchaseInfo.expire, "
					+ " (select storeInfo.name from BusStore storeInfo where purchaseInfo.storeId = storeInfo.id), "
					+ " purchaseInfo.consignee,"
					+ " (select user.realname from User user where user.id = purchaseInfo.createManId), buyInfo.description "
		            + " from BusBuyInfo buyInfo, BusPurchaseInfo purchaseInfo, BusMaterielInfo materielInfo ";
			}
		}
		hql = addWhere(buyInfoDto,hql);
		return hql;
	}
	
	public String writeExcel(BuyInfoDto buyInfoDto, String rootPath, String temp_path, String fileName, String[] titles) throws Exception{
	
		FileOperate.deleteFile(rootPath + temp_path, ".xlsx");		
		List<String> files = new ArrayList<String>();
		String tempFileName = KFileUtil.getExcelFile("prefix_");	
		int limit = 10000;
		int start = 0;		
		String hql = this.createHql(buyInfoDto);
		List<List<Object>> data = this.getData(hql,limit,start);
		while (KCollectionUtil.isNotNullAndEmpty(data)) {
			files.add(rootPath + temp_path +tempFileName);			
			ExcelUtil1.writeData(null, data, rootPath + temp_path +tempFileName);		
			if(data.size()<limit){
				data = null;				
				break;
			}else{
				tempFileName = KFileUtil.getExcelFile("prefix_");
				start += limit;
				data = this.getData(hql,limit,start);
			}	
		}		
		ExcelUtil1.mergeExcel(titles,files,rootPath + temp_path + fileName);				
		return fileName;
	}

	public List<BuyDetailDto> buyDetailSummary(BuyInfoDto buyInfoDto, cn.com.fsun.common.pageInfo.PageInfo pageInfo) {
		String hql = "";
		String select = " ";
		String from = "";
		
		if (buyInfoDto.getStoreId() != null) {
			if(buyInfoDto.getFactoryId()!= null && !"".equals(buyInfoDto.getFactoryId())){
				select = " select new cn.com.fsun.bus.dto.BuyDetailDto(buyInfo.id, buyInfo.purchaseId, "
					+ " materielInfo.name, buyInfo.spec, "
					+ " factoryInfo.name, buyInfo.enabled, "
					+ " buyInfo.number, buyInfo.unit, buyInfo.onePrice, buyInfo.allPrice, purchaseInfo.expire, "
					+ " storeInfo.name, purchaseInfo.consignee,"
					+ " (select user.realname from User user where user.id = purchaseInfo.createManId), buyInfo.description) ";
		        from = " from BusBuyInfo buyInfo, BusPurchaseInfo purchaseInfo, BusStore storeInfo, BusMaterielInfo materielInfo,BusFactoryInfo factoryInfo ";
			}else{
				select = " select new cn.com.fsun.bus.dto.BuyDetailDto(buyInfo.id, buyInfo.purchaseId, "
					+ " materielInfo.name, buyInfo.spec, "
					+ " (select factoryInfo.name from BusFactoryInfo factoryInfo where buyInfo.factoryId = factoryInfo.id), buyInfo.enabled, "
					+ " buyInfo.number, buyInfo.unit, buyInfo.onePrice, buyInfo.allPrice, purchaseInfo.expire, "
					+ " storeInfo.name, purchaseInfo.consignee,"
					+ " (select user.realname from User user where user.id = purchaseInfo.createManId), buyInfo.description) ";
		        from = " from BusBuyInfo buyInfo, BusPurchaseInfo purchaseInfo, BusStore storeInfo, BusMaterielInfo materielInfo ";
			}	
		}else{
			if(buyInfoDto.getFactoryId()!= null && !"".equals(buyInfoDto.getFactoryId())){
				select = " select new cn.com.fsun.bus.dto.BuyDetailDto(buyInfo.id, buyInfo.purchaseId, "
					+ " materielInfo.name, buyInfo.spec, "
					+ " factoryInfo.name, buyInfo.enabled, "
					+ " buyInfo.number, buyInfo.unit, buyInfo.onePrice, buyInfo.allPrice, purchaseInfo.expire, "
					+ " (select storeInfo.name from BusStore storeInfo where purchaseInfo.storeId = storeInfo.id), "
					+ " purchaseInfo.consignee,"
					+ " (select user.realname from User user where user.id = purchaseInfo.createManId), buyInfo.description) ";
		        from = " from BusBuyInfo buyInfo, BusPurchaseInfo purchaseInfo, BusMaterielInfo materielInfo,BusFactoryInfo factoryInfo  ";
			}else{
				select = " select new cn.com.fsun.bus.dto.BuyDetailDto(buyInfo.id, buyInfo.purchaseId, "
					+ " materielInfo.name, buyInfo.spec, "
					+ " (select factoryInfo.name from BusFactoryInfo factoryInfo where buyInfo.factoryId = factoryInfo.id), buyInfo.enabled, "
					+ " buyInfo.number, buyInfo.unit, buyInfo.onePrice, buyInfo.allPrice, purchaseInfo.expire, "
					+ " (select storeInfo.name from BusStore storeInfo where purchaseInfo.storeId = storeInfo.id), "
					+ " purchaseInfo.consignee,"
					+ " (select user.realname from User user where user.id = purchaseInfo.createManId), buyInfo.description) ";
		        from = " from BusBuyInfo buyInfo, BusPurchaseInfo purchaseInfo, BusMaterielInfo materielInfo ";
			}
		}
		hql = addWhere(buyInfoDto,from); 
		List<BuyDetailDto> buyDetailDtos = buyInfoDao.findBuyInfoForPage(select + hql, pageInfo);
		int count = buyInfoDao.getCountForInfo(" select count(buyInfo.id) " + hql);
		pageInfo.setTotal(count);
		return buyDetailDtos;
	}

	
	
}
