package cn.com.fsun.bus.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreInvocationAttribute;
import org.springframework.stereotype.Service;

import cn.com.fsun.bus.dao.BuyInfoDao;
import cn.com.fsun.bus.dao.PurchaseDao;
import cn.com.fsun.bus.domain.BusCustomerInfo;
import cn.com.fsun.bus.domain.BusOrderDetail;
import cn.com.fsun.bus.domain.BusOrderInfo;
import cn.com.fsun.bus.domain.BusPurchaseInfo;
import cn.com.fsun.bus.dto.BuyInfoDto;
import cn.com.fsun.bus.dto.OrderProductDto;
import cn.com.fsun.bus.dto.PosDto;
import cn.com.fsun.bus.dto.ProduceDto;
import cn.com.fsun.bus.dto.PurchaseDto;
import cn.com.fsun.bus.exception.UnEnoughPurchaseCodeException;
import cn.com.fsun.bus.service.itf.PurchaseService;
import cn.com.fsun.common.pageInfo.PageInfo;
import cn.com.fsun.common.service.BaseService;
import cn.com.fsun.common.utils.DateUtil;

@Service
public class PurchaseServiceImpl extends BaseService implements PurchaseService{

	@Autowired
	private PurchaseDao purchaseDao;
	
	@Autowired
	private BuyInfoDao buyInfoDao;	
	
	@Override
	public List<PurchaseDto> list(PurchaseDto purchaseDto) {
		List<PurchaseDto> purchaseDtos = getOrderInfoForPage(purchaseDto, new PageInfo());
		return purchaseDtos;
	}
	
	@Override
	public List<PurchaseDto> getOrderInfoForPage(PurchaseDto purchaseDto, PageInfo pageInfo) {
		
		String hql = "select new cn.com.fsun.bus.dto.PurchaseDto(a.id,a.setWay,a.allPrice,a.carriage, "
				+ " a.description,a.enabled,"
				+ "(select user.realname from User user where user.id = a.createManId),a.createTime,a.expire,a.storeId, " 
				+ "(select storeInfo.name from BusStore storeInfo where storeInfo.id = a.storeId),a.consignee) " 
				+ " from BusPurchaseInfo a ";
		String where = "where 1=1 ";
		if(null!=purchaseDto){						
			//查询条件
			if(null!=purchaseDto.getId() && !"".equals(purchaseDto.getId())){
				where += "and a.id like '%"+purchaseDto.getId()+"%' ";				
			}							
		}
		String orderby = " order by a.id desc ";
		
		hql = hql + where + orderby;
		pageInfo.setTotal(this.getCountForOrderInfo(where));
		return purchaseDao.findPurchase(hql, pageInfo);
	
	}

	private int getCountForOrderInfo(String where){
		String hql = "select count(*) from BusPurchaseInfo a ";
	    return purchaseDao.getCountForInfo(hql + where);		    
    }
	
	@Override
	public List<PosDto> getPosInfo(String ids, String buyInfoIds, boolean hasOperatePower) {
		if(ids==null||"".equals(ids)){
			return new ArrayList<PosDto>();
		}
		List<PosDto> posDtos = new ArrayList<PosDto>();
		String[] idList = ids.split(",");
		for (int i = 0; i < idList.length; i++) {
			PosDto posDto = new PosDto();
			PurchaseDto purchaseDto = purchaseDao.loadToDto(idList[i]);
			List<BuyInfoDto> buyInfoDtos = buyInfoDao.findBuyInfoByRequest(idList[i],buyInfoIds);
			posDto.setPurchaseDto(purchaseDto);
			posDto.setBuyInfoDtos(buyInfoDtos);
			posDtos.add(posDto);
		}
		return posDtos;
	}

	@Override
	public PurchaseDto save(PurchaseDto purchaseDto) throws UnEnoughPurchaseCodeException{
		BusPurchaseInfo purchaseInfo = null;
		if(StringUtils.isNotEmpty(purchaseDto.getId())){
			purchaseInfo = purchaseDao.load(purchaseDto.getId());
			purchaseInfo.setSetWay(purchaseDto.getSetWay());
			purchaseInfo.setStoreId(purchaseDto.getStoreId());
			purchaseInfo.setCarriage(purchaseDto.getCarriage());
			purchaseInfo.setConsignee(purchaseDto.getConsignee());
			if(purchaseDto.getExpire()!=null && !"".equals(purchaseDto.getExpire())){			
				purchaseInfo.setExpire(DateUtil.parse(purchaseDto.getExpire(), "yyyy-MM-dd"));
			}
			purchaseInfo.setDescription(purchaseDto.getDescription());
		}else{
			purchaseInfo = DtotoDomain(purchaseDto);
			purchaseInfo.setId(this.initPurchaseId());
			purchaseInfo.setCreateTime(new Date());
			purchaseInfo.setCreateManId(super.getCurrentUserID());
		}
		purchaseDao.save(purchaseInfo);
		return DomaintoDto(purchaseInfo);
		
	}
	
	private String initPurchaseId() throws UnEnoughPurchaseCodeException{	
		String currDate = new SimpleDateFormat("yyyyMM").format(Calendar.getInstance().getTime());
		Long initCode = purchaseDao.getInitId(currDate);
		if(initCode%1000==999){
			throw new UnEnoughPurchaseCodeException();
		}
		return initCode+"";
	}
	
	@Override
	public PurchaseDto load(String id){
		return DomaintoDto(purchaseDao.load(id));
	}
	
	@Override
	public PurchaseDto create(PurchaseDto purchaseDto, List<BuyInfoDto> buyInfoDtos) throws UnEnoughPurchaseCodeException {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public void delete(String id) throws Exception{
		BusPurchaseInfo purchaseInfo = purchaseDao.load(id);
		String hql = "delete BusBuyInfo buyInfo where buyInfo.purchaseId = '"+ id +"'";
		buyInfoDao.excuteHQL(hql);
		purchaseDao.delete(purchaseInfo);	
	}
	

//
//	@Override
//	public int getSearchCount(PurchaseDto purchaseDto,PageInfo pageInfo){
//		BusPurchaseInfo purchaseInfo = DtotoDomain(purchaseDto);
//		List<BusPurchaseInfo> purchaseInfos = purchaseDao.getSearchCount(purchaseInfo, pageInfo);
//		if(null!=purchaseInfos && purchaseInfos.size()>0){
//			return purchaseInfos.size();
//		}else{
//			return new Integer(0);
//		}
//	}
//	

//	@Override
//	public void hasGoodForOrder(String string, String string2) {
//		// TODO Auto-generated method stub
//		
//	}
//
//	@Override
//	public boolean deletefromSaleOrBuyInfo(String[] ids,String property) {	
//		if(property!=null && !"".equals(property) && ids!=null && ids.length>0){
//			String hql_buy = "delete BusBuyInfo a where a.orderId in (:"+property+")";	
//			try {
//				buyInfoDao.excuteHQLForSet(hql_buy,property,ids);
//			} catch (Exception e) {
//				e.printStackTrace();
//				return false;
//			}
//		}
//		return true;
//	}
//
//	@Override
//	public boolean changeStatus(PurchaseDto purchaseDto) {
//		if("待发货".equals(purchaseDto.getStatus())){
//			purchaseDto.setStatus("已发货");
//		}else if("已发货".equals(purchaseDto.getStatus())){
//			purchaseDto.setStatus("已收货");
//		}
//		purchaseDto.setUpdateManId(super.getCurrentUserID());
//		purchaseDto.setUpdateTime(new Date());		
//		purchaseDao.save(DtotoDomain(purchaseDto));
//		return true;
//	}
//
//
//	@Override
//	public Boolean operatePower(PurchaseDto purchaseDto) {
//		if(purchaseDto!=null && "已收货".equals(purchaseDto.getStatus())){
//			return false;
//		}else{
//			return true;
//		}		
//	}
	
	
	/**
	 * @description Domian转Dto
	 * @return BusPurchaseInfo
	 * @param purchaseDto
	 */
	private BusPurchaseInfo DtotoDomain(PurchaseDto purchaseDto){
		if(null==purchaseDto){
			return null;
		}
		BusPurchaseInfo purchaseInfo = new BusPurchaseInfo();
		purchaseInfo.setId(purchaseDto.getId());
		purchaseInfo.setSetWay(purchaseDto.getSetWay());
		purchaseInfo.setAllPrice(purchaseDto.getAllPrice()==null ? 0:purchaseDto.getAllPrice());
		purchaseInfo.setCarriage(purchaseDto.getCarriage()==null ? 0:purchaseDto.getCarriage());
		purchaseInfo.setDescription(purchaseDto.getDescription());	
		purchaseInfo.setEnabled(purchaseDto.getEnabled());
		purchaseInfo.setCreateManId(purchaseDto.getCreateManId());
		purchaseInfo.setCreateTime(purchaseDto.getCreateTime()!=null?DateUtil.parse(purchaseDto.getCreateTime(), "yyyy-MM-dd"):null);
		if(purchaseDto.getExpire()!=null && !"".equals(purchaseDto.getExpire())){			
			purchaseInfo.setExpire(purchaseDto.getExpire()!=null?DateUtil.parse(purchaseDto.getExpire(), "yyyy-MM-dd"):null);
		}
		
		//进货信息
		purchaseInfo.setStoreId(purchaseDto.getStoreId());
		purchaseInfo.setConsignee(purchaseDto.getConsignee());	
		
		return purchaseInfo;
	}
	
	/**
	 * @description Dto转Domian
	 * @return OrderDto
	 * @param orderInfo
	 */
	private PurchaseDto DomaintoDto(BusPurchaseInfo purchaseInfo){
		if(null==purchaseInfo){
			return null;
		}
		PurchaseDto purchaseDto = new PurchaseDto();
		purchaseDto.setId(purchaseInfo.getId());
		purchaseDto.setSetWay(purchaseInfo.getSetWay());
		purchaseDto.setAllPrice(purchaseInfo.getAllPrice());
		purchaseDto.setCarriage(purchaseInfo.getCarriage());
		purchaseDto.setDescription(purchaseInfo.getDescription());	
		purchaseDto.setEnabled(purchaseInfo.getEnabled());
		purchaseDto.setCreateManId(purchaseInfo.getCreateManId());
		purchaseDto.setCreateTime((purchaseInfo.getCreateTime()!=null?DateUtil.formateDate(purchaseInfo.getCreateTime(), "yyyy-MM-dd"):""));		
	    purchaseDto.setExpire(purchaseInfo.getExpire()!=null?DateUtil.formateDate(purchaseInfo.getExpire(), "yyyy-MM-dd"):"");
		
		//进货信息
		purchaseDto.setStoreId(purchaseInfo.getStoreId());
		purchaseDto.setConsignee(purchaseInfo.getConsignee());
		return purchaseDto;
	}
	
	/**
	 * @description domians转dtos
	 * @return List<PurchaseDto>
	 * @param purchaseInfos
	 * @return
	 */
	private List<PurchaseDto> DomainstoDtos(List<BusPurchaseInfo> purchaseInfos){
		List<PurchaseDto> purchaseDtos = new ArrayList<PurchaseDto>();

		if (null != purchaseInfos && purchaseInfos.size() > 0) {
			for (BusPurchaseInfo purchaseInfo : purchaseInfos) {
				PurchaseDto purchaseDto = DomaintoDto(purchaseInfo);
				if (null != purchaseDto) {
					purchaseDtos.add(purchaseDto);
				}
			}
		}
		return purchaseDtos;
	}

}
