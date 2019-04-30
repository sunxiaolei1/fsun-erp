package cn.com.fsun.bus.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.fsun.bus.dao.BuyInfoDao;
import cn.com.fsun.bus.dao.MaterielDao;
import cn.com.fsun.bus.dao.PurchaseDao;
import cn.com.fsun.bus.domain.BusBuyInfo;
import cn.com.fsun.bus.domain.BusMaterielInfo;
import cn.com.fsun.bus.domain.BusPurchaseInfo;
import cn.com.fsun.bus.dto.BuyInfoDto;
import cn.com.fsun.bus.service.itf.BuyInfoService;
import cn.com.fsun.common.service.BaseService;

@Service
public class BuyInfoServiceImpl extends BaseService implements BuyInfoService  {

	@Autowired
	private BuyInfoDao buyInfoDao;

	@Autowired
	private PurchaseDao purchaseDao;
	
	@Autowired
	private MaterielDao materielDao;

	@Override
	public List<BuyInfoDto> findBuyInfoByRequest(BuyInfoDto buyInfoDto) {
		if(buyInfoDto!=null){
			return buyInfoDao.findBuyInfoByRequest(buyInfoDto.getPurchaseId(),null);	
		}
		return new ArrayList<BuyInfoDto>();
	}

	@Override
	public BuyInfoDto save(BuyInfoDto buyInfoDto) {
		BusBuyInfo buyInfo = null;
		BusPurchaseInfo purchaseInfo = null;
		if(buyInfoDto.getId()!=null){
			buyInfo = buyInfoDao.load(buyInfoDto.getId());
			buyInfo.setPurchaseId(buyInfoDto.getPurchaseId());
			buyInfo.setFactoryId(buyInfoDto.getFactoryId());
			buyInfo.setClassifyId(buyInfoDto.getClassifyId());
			buyInfo.setMaterielId(buyInfoDto.getMaterielId());
			buyInfo.setNumber(buyInfoDto.getNumber());
			buyInfo.setUnit(buyInfoDto.getUnit());
			buyInfo.setOnePrice(buyInfoDto.getOnePrice());
			buyInfo.setDescription(buyInfoDto.getDescription());
			buyInfo.setSpec(buyInfoDto.getSpec());
			
			if (buyInfo.getOnePrice() != null && buyInfo.getNumber() != null) {
				Double oldAllPrice = buyInfo.getAllPrice();
				buyInfo.setAllPrice(Math.floor(buyInfo.getOnePrice() * buyInfo.getNumber() * 10) / 10);
				if(oldAllPrice!=buyInfo.getAllPrice()){
					purchaseInfo = purchaseDao.load(buyInfo.getPurchaseId());
					purchaseInfo.setAllPrice(purchaseInfo.getAllPrice()+ buyInfo.getAllPrice()-oldAllPrice);
				}
			}else{
				purchaseInfo = purchaseDao.load(buyInfo.getPurchaseId());
				purchaseInfo.setAllPrice(purchaseInfo.getAllPrice() - buyInfo.getAllPrice());
			}	
		}else{
			
			if(buyInfoDto.getMaterielName()!=null && !"".equals(buyInfoDto.getMaterielName())){
				BusMaterielInfo materielInfo = new BusMaterielInfo();
				materielInfo.setClassifyId(buyInfoDto.getClassifyId());
				materielInfo.setEnabled(true);
				materielInfo.setName(buyInfoDto.getMaterielName());
				materielInfo.setPrice(buyInfoDto.getOnePrice());
				materielInfo.setSpec(buyInfoDto.getSpec());
				materielDao.create(materielInfo);
				buyInfoDto.setMaterielId(materielInfo.getId());
			}
			buyInfo = DtotoDomain(buyInfoDto);
			buyInfo.setEnabled(true);
			buyInfo.setCreateTime(new Date());
			buyInfo.setCreateManId(super.getCurrentUserID());
			if (buyInfo.getOnePrice() != null && buyInfo.getNumber() != null) {
				purchaseInfo = purchaseDao.load(buyInfo.getPurchaseId());
				purchaseInfo.setAllPrice(purchaseInfo.getAllPrice()+ buyInfo.getAllPrice());	
			}	
		}
		buyInfoDao.save(buyInfo);
		if(purchaseInfo!=null){
			purchaseDao.save(purchaseInfo);
		}
		return DomaintoDto(buyInfo);

	}

	@Override
	public void delete(Integer id, String purchaseId) {
		BusBuyInfo buyInfo = buyInfoDao.load(id);
		Double allPrice = buyInfo.getAllPrice();
		buyInfoDao.delete(buyInfo);
		BusPurchaseInfo purchaseInfo = purchaseDao.load(buyInfo.getPurchaseId());
		purchaseInfo.setAllPrice(purchaseInfo.getAllPrice() - allPrice);	
		purchaseDao.save(purchaseInfo);	
	}

	@Override
	public BuyInfoDto load(Integer id) {
		return DomaintoDto(buyInfoDao.load(id));
	}
	
	@Override
	public boolean materielUsed(Long materielId){
		return buyInfoDao.materielUsed(materielId);
	}

	/**
	 * @description Domian转Dto
	 * @return BusBuyInfo
	 * @param buyInfoDto
	 */
	private BusBuyInfo DtotoDomain(BuyInfoDto buyInfoDto) {
		if (null == buyInfoDto) {
			return null;
		}
		BusBuyInfo buyInfo = new BusBuyInfo();
		buyInfo.setId(buyInfoDto.getId());
		buyInfo.setPurchaseId(buyInfoDto.getPurchaseId());
		buyInfo.setFactoryId(buyInfoDto.getFactoryId());
		buyInfo.setClassifyId(buyInfoDto.getClassifyId());
		buyInfo.setMaterielId(buyInfoDto.getMaterielId());
		buyInfo.setNumber(buyInfoDto.getNumber());
		buyInfo.setUnit(buyInfoDto.getUnit());
		buyInfo.setOnePrice(buyInfoDto.getOnePrice());
		if (buyInfo.getOnePrice() != null && buyInfo.getNumber() != null) {
			buyInfo.setAllPrice(Math.floor(buyInfo.getOnePrice() * buyInfo.getNumber() * 10) / 10);
		}
		buyInfo.setDescription(buyInfoDto.getDescription());
		buyInfo.setCreateManId(buyInfoDto.getCreateManId());
		buyInfo.setCreateTime(buyInfoDto.getCreateTime());
		buyInfo.setEnabled(buyInfoDto.getEnabled());
        buyInfo.setSpec(buyInfoDto.getSpec());
        
		return buyInfo;
	}

	/**
	 * @description Dto转Domian
	 * @return BuyInfoDto
	 * @param buyInfo
	 */
	private BuyInfoDto DomaintoDto(BusBuyInfo buyInfo) {
		if (null == buyInfo) {
			return null;
		}
		BuyInfoDto buyInfoDto = new BuyInfoDto();
		buyInfoDto.setId(buyInfo.getId());
		buyInfoDto.setPurchaseId(buyInfo.getPurchaseId());
		buyInfoDto.setFactoryId(buyInfo.getFactoryId());
		buyInfoDto.setClassifyId(buyInfo.getClassifyId());
		buyInfoDto.setMaterielId(buyInfo.getMaterielId());
		buyInfoDto.setNumber(buyInfo.getNumber());
		buyInfoDto.setUnit(buyInfo.getUnit());
		buyInfoDto.setOnePrice(buyInfo.getOnePrice());
		buyInfoDto.setAllPrice(buyInfo.getAllPrice());
		buyInfoDto.setDescription(buyInfo.getDescription());
	
		buyInfoDto.setCreateManId(buyInfo.getCreateManId());
		buyInfoDto.setCreateTime(buyInfo.getCreateTime());
		buyInfoDto.setEnabled(buyInfo.getEnabled());
		buyInfoDto.setSpec(buyInfo.getSpec());
		
		return buyInfoDto;
	}

	@Override
	public List<BuyInfoDto> findBuyInfoByRequestForExcelExport(BuyInfoDto buyInfoDto) {

		String hql = " select new cn.com.fsun.bus.dto.BuyInfoDto(buyInfo.purchaseId, "
			+ " (select factoryInfo.name from BusFactoryInfo factoryInfo where buyInfo.factoryId = factoryInfo.id), "
			+ " (select classifyInfo.name from BusClassifyInfo classifyInfo where buyInfo.classifyId = classifyInfo.id), "
			+ " (select materielInfo.name from BusMaterielInfo materielInfo where buyInfo.materielId = materielInfo.id), "
			+ " buyInfo.number, buyInfo.unit, buyInfo.onePrice, buyInfo.allPrice, buyInfo.description, buyInfo.enabled, "
			+ " (select storeInfo.name from BusStore storeInfo where purchaseInfo.storeId = storeInfo.id), "
			+ " purchaseInfo.consignee, buyInfo.spec) "
            + " from BusBuyInfo buyInfo, BusPurchaseInfo purchaseInfo ";
		String where = " where buyInfo.purchaseId = purchaseInfo.id ";
		if (buyInfoDto.getPurchaseId() != null && !"".equals(buyInfoDto.getPurchaseId())) {
			where += " and buyInfo.purchaseId = '" + buyInfoDto.getPurchaseId() + "'";
		}
		if (buyInfoDto.getClassifyId() != null && !"".equals(buyInfoDto.getClassifyId())) {
			where += " and buyInfo.classifyId = " + buyInfoDto.getClassifyId() ;
		}
		if (buyInfoDto.getFactoryId() != null && !"".equals(buyInfoDto.getFactoryId())) {
			where += " and buyInfo.factoryId = '" + buyInfoDto.getFactoryId() + "'";
		}
		hql += where;
		return buyInfoDao.findBuyInfo(hql);
	}

	@Override
	public void accept(String ids) throws Exception{
		String hql = "update BusBuyInfo set enabled = false where id in ("+ ids +")";	
		buyInfoDao.excuteHQL(hql);
	}
	
	@Override
	public void updateFactory(String ids, String factoryId) throws Exception {
		String hql = "update BusBuyInfo set factoryId = '"+ factoryId +"' where enabled = true and id in ("+ ids +")";	
		buyInfoDao.excuteHQL(hql);
	}

	@Override
	public String acceptSuccess(String ids, String names) {
		String[] idStr = ids.split(",");
		String[] nameStr = names.split(",");
		HashMap<String, Object> properties = new HashMap<String, Object>();
		properties.put("enabled", false);
		for (int i = 0; i < idStr.length; i++) {
			properties.put("id", Integer.valueOf(idStr[i]));
			BusBuyInfo buyInfo = buyInfoDao.loadByAttributes(properties);
			if (buyInfo!=null) {
				return "物料：" + nameStr[i] + "已验收,不可此操作!";
			}
		}
		return null;
	}

}
