package cn.com.fsun.bus.dto;

import java.util.List;

/**
 * 快捷下单对象
 * @author sunxiaolei
 *
 */
public class ShortcutOrderDto {
	
	/**
	 * 生产单号
	 */
	private String madeCode;
	
	/**
	 * 订单编号
	 */
	private String orderCode;

	/**
	 * 单据头信息
	 */
	private OrderDto orderDto;
	
	/**
	 * 打包明细列表
	 */
	private List<MadePackageDto> madePackageDtos;
	
	/**
	 * 快捷下单生产明细列表
	 */
	private List<ShortcutMadeDetailDto> shortcutMadeDetailDtos;

	public OrderDto getOrderDto() {
		return orderDto;
	}

	public void setOrderDto(OrderDto orderDto) {
		this.orderDto = orderDto;
	}

	public List<MadePackageDto> getMadePackageDtos() {
		return madePackageDtos;
	}

	public void setMadePackageDtos(List<MadePackageDto> madePackageDtos) {
		this.madePackageDtos = madePackageDtos;
	}

	public List<ShortcutMadeDetailDto> getShortcutMadeDetailDtos() {
		return shortcutMadeDetailDtos;
	}

	public void setShortcutMadeDetailDtos(List<ShortcutMadeDetailDto> shortcutMadeDetailDtos) {
		this.shortcutMadeDetailDtos = shortcutMadeDetailDtos;
	}

	public String getMadeCode() {
		return madeCode;
	}

	public void setMadeCode(String madeCode) {
		this.madeCode = madeCode;
	}

	public String getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}
	
}
