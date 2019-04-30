package cn.com.fsun.bus.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.com.fsun.bus.dao.StockBaseDao;
import cn.com.fsun.bus.dao.StockDetailDao;
import cn.com.fsun.bus.domain.BusStockBase;
import cn.com.fsun.bus.domain.BusStockDetail;
import cn.com.fsun.bus.dto.StockBaseDto;
import cn.com.fsun.bus.dto.StockDto;
import cn.com.fsun.bus.service.itf.StockService;
import cn.com.fsun.common.service.BaseService;
import cn.com.fsun.common.utils.FileOperate;
import cn.com.fsun.common.utils.PageInfo;

@Service
public class StockServiceImpl extends BaseService implements StockService {
	
	@Autowired
	private StockBaseDao stockBaseDao;
	
	@Autowired
	private StockDetailDao stockDetailDao;

	@Override
	public StockDto load(Long id) {
		StockDto stockDto = new StockDto();
		stockDto.setStockBaseDto(DomaintoDto(stockBaseDao.load(id)));
		BusStockDetail stockDetail = new BusStockDetail();
		stockDetail.setStockId(id);
		stockDto.setStockDetails(stockDetailDao.getDetials(stockDetail,null));
		return stockDto;
	}

	@Override
	public List<StockBaseDto> search(StockBaseDto stockDto, PageInfo pageInfo) {
		return DomainstoDtos(stockBaseDao.search(DtotoDomain(stockDto), pageInfo));
	}
	
	@Override
	public void save(StockBaseDto stockDto, List<BusStockDetail> stockDetailList) {		
		BusStockBase busStock = DtotoDomain(stockDto);
		stockBaseDao.save(busStock);
		for (BusStockDetail busStockDetail : stockDetailList) {
			busStockDetail.setStockId(busStock.getId());
		}
		stockDetailDao.saveAll(stockDetailList);	
	}

	@Override
	public void update(StockBaseDto stockDto,List<BusStockDetail> stockDetailList,Boolean imageChanged,String imageRootPath) throws Exception {
		BusStockBase busStock = stockBaseDao.load(stockDto.getId());	
		busStock.setName(stockDto.getName());
		if(imageChanged){
			if(busStock.getImage()!=null && !"".equals(busStock.getImage())){
				FileOperate fileOperate = new FileOperate();
				fileOperate.delFile(imageRootPath+busStock.getImage());
			}
			busStock.setImage(stockDto.getImage());
		}
		
		busStock.setArtNum(stockDto.getArtNum());
		busStock.setRackNum(stockDto.getRackNum());
		busStock.setCustomerCode(stockDto.getCustomerCode());
		busStock.setStoreId(stockDto.getStoreId());
		busStock.setDescription(stockDto.getDescription());		
		stockBaseDao.update(busStock);
		
		for (BusStockDetail busStockDetail : stockDetailList) {
			busStockDetail.setId(null);
			busStockDetail.setStockId(busStock.getId());
		}
		stockDetailDao.deleteByStockId(busStock.getId());
		stockDetailDao.saveAll(stockDetailList);
	}

	@Override
	public void delete(String ids,String imageRootPath) throws Exception {
		List<BusStockBase> list = stockBaseDao.findByIds(ids);
		FileOperate fileOperate = new FileOperate();
		for (BusStockBase busStockBase : list) {
			if(busStockBase.getImage()!=null && !"".equals(busStockBase.getImage())){
				fileOperate.delFile(imageRootPath + busStockBase.getImage());
			}
		}
		stockBaseDao.deleteStocks(ids);
		stockDetailDao.deleteByStockIds(ids);
	}
	
	

	@Override
	public int getSearchCount(StockBaseDto stockDto, PageInfo pageInfo) {
		return stockBaseDao.getSearchCount(DtotoDomain(stockDto), pageInfo);
	}
	

	/**
	 * @description Domian转Dto
	 * @return BusStockBase
	 * @param stockDto
	 */
	public BusStockBase DtotoDomain(StockBaseDto stockDto){
		if(null==stockDto){
			return null;
		}	
		BusStockBase busStockInfo = new BusStockBase();
		busStockInfo.setId(stockDto.getId());
		busStockInfo.setName(stockDto.getName());
		busStockInfo.setArtNum(stockDto.getArtNum());
		busStockInfo.setImage(stockDto.getImage());
		busStockInfo.setRackNum(stockDto.getRackNum());
		busStockInfo.setStoreId(stockDto.getStoreId());
		busStockInfo.setCustomerCode(stockDto.getCustomerCode());
		busStockInfo.setDescription(stockDto.getDescription());
		
		return busStockInfo;
	}
	
	/**
	 * @description Dto转Domian
	 * @return StockBaseDto
	 * @param busStockInfo
	 */
	public StockBaseDto DomaintoDto(BusStockBase busStockInfo){
		if(null==busStockInfo){
			return null;
		}
		StockBaseDto stockDto = new StockBaseDto();
		stockDto.setId(busStockInfo.getId());
		stockDto.setName(busStockInfo.getName());
		stockDto.setArtNum(busStockInfo.getArtNum());
		stockDto.setImage(busStockInfo.getImage());
		stockDto.setRackNum(busStockInfo.getRackNum());
		stockDto.setStoreId(busStockInfo.getStoreId());
		stockDto.setCustomerCode(busStockInfo.getCustomerCode());
		stockDto.setDescription(busStockInfo.getDescription());
		
		Map<Integer,String> map = super.getStoreMap();
		stockDto.setStoreName(map.get(busStockInfo.getStoreId()));
		return stockDto;
	}
	
	/**
	 * @description domians转dtos
	 * @return List<StockBaseDto>
	 * @param busStockInfoList
	 * @return
	 */
	public List<StockBaseDto> DomainstoDtos(List<BusStockBase> busStockInfoList){
		
		List<StockBaseDto> stockDtos = new ArrayList<StockBaseDto>();
		if (null != busStockInfoList && busStockInfoList.size() > 0) {
			for (BusStockBase busStockInfo : busStockInfoList) {
				StockBaseDto stockDto = DomaintoDto(busStockInfo);
				if (null != stockDto) {
					stockDtos.add(stockDto);
				}
			}
		}
		return stockDtos;
	}

	@Override
	public List<StockBaseDto> getStockBaseInfo(PageInfo pageInfo) {
		return stockBaseDao.getStockBaseInfo(pageInfo);
	}

}
