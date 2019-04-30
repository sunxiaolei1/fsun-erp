package cn.com.fsun.bus.dto;

import java.util.List;

import cn.com.fsun.common.dto.BaseDto;

/**
 * 采购单
 * @author sunxl
 *
 */
public class PosDto extends BaseDto {
	
	private PurchaseDto purchaseDto;
	private List<BuyInfoDto> buyInfoDtos;
	
	public PurchaseDto getPurchaseDto() {
		return purchaseDto;
	}
	public void setPurchaseDto(PurchaseDto purchaseDto) {
		this.purchaseDto = purchaseDto;
	}
	public List<BuyInfoDto> getBuyInfoDtos() {
		return buyInfoDtos;
	}
	public void setBuyInfoDtos(List<BuyInfoDto> buyInfoDtos) {
		this.buyInfoDtos = buyInfoDtos;
	}
	
	
	
}
