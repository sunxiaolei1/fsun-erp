package cn.com.fsun.bus.dto;

import cn.com.fsun.bus.domain.BusProductInfo;

/**
 * 产品新增对象(用于快捷下单)
 * @author sunxiaolei
 *
 */
public class ProductDetailDto {

	/**
	 * 产品基本信息
	 */
	private BusProductInfo productInfo;
	
	/**
	 * 后道工序集合(逗号分隔)
	 */
	private String afterProcess;

	public BusProductInfo getProductInfo() {
		return productInfo;
	}

	public void setProductInfo(BusProductInfo productInfo) {
		this.productInfo = productInfo;
	}

	public String getAfterProcess() {
		return afterProcess;
	}

	public void setAfterProcess(String afterProcess) {
		this.afterProcess = afterProcess;
	}
	
	
}
