package cn.com.fsun.bus.service.itf;

import java.util.List;

import cn.com.fsun.bus.domain.BusStockDetail;
import cn.com.fsun.bus.dto.StockBaseDto;
import cn.com.fsun.bus.dto.StockDto;
import cn.com.fsun.common.utils.PageInfo;

public interface StockService {

	List<StockBaseDto> search(StockBaseDto stockDto, PageInfo pageInfo);

	StockDto load(Long id);

	void delete(String ids,String imageRootPath) throws Exception;

	void update(StockBaseDto stockDto,List<BusStockDetail> stockDetailList,Boolean imageChanged,String imageRootPath) throws Exception ;

	void save(StockBaseDto stockDto,List<BusStockDetail> stockDetailList);

	int getSearchCount(StockBaseDto stockDto, PageInfo pageInfo);

	List<StockBaseDto> getStockBaseInfo(PageInfo pageInfo);
}
