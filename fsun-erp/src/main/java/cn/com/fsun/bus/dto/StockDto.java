package cn.com.fsun.bus.dto;

import java.util.List;

import cn.com.fsun.bus.domain.BusStockDetail;
import cn.com.fsun.common.dto.BaseDto;

public class StockDto extends BaseDto {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private StockBaseDto stockBaseDto;
	private List<BusStockDetail> stockDetails;
	public StockBaseDto getStockBaseDto() {
		return stockBaseDto;
	}
	public void setStockBaseDto(StockBaseDto stockBaseDto) {
		this.stockBaseDto = stockBaseDto;
	}
	public List<BusStockDetail> getStockDetails() {
		return stockDetails;
	}
	public void setStockDetails(List<BusStockDetail> stockDetails) {
		this.stockDetails = stockDetails;
	}
	
}
