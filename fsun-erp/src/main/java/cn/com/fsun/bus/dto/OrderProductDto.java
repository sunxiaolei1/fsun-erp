package cn.com.fsun.bus.dto;

import java.util.List;

import cn.com.fsun.bus.domain.BusOrderDetail;
import cn.com.fsun.bus.domain.BusProductInfo;
import cn.com.fsun.bus.domain.BusAfterProcess;

public class OrderProductDto {
     
	private BusProductInfo productInfo;
	private BusOrderDetail orderDetail;
	private List<BusAfterProcess> afterProcess;
	private List<BusOrderDetail> orderDetailList;
	
	public OrderProductDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OrderProductDto(BusProductInfo productInfo,
			BusOrderDetail orderDetail, List<BusAfterProcess> afterProcess) {
		super();
		this.productInfo = productInfo;
		this.orderDetail = orderDetail;
		this.setAfterProcess(afterProcess);
	}

	public OrderProductDto(BusProductInfo productInfo,
			BusOrderDetail orderDetail, List<BusAfterProcess> afterProcess,
			List<BusOrderDetail> orderDetailList) {
		super();
		this.productInfo = productInfo;
		this.orderDetail = orderDetail;
		this.afterProcess = afterProcess;
		this.setOrderDetailList(orderDetailList);
	}

	public BusProductInfo getProductInfo() {
		return productInfo;
	}

	public void setProductInfo(BusProductInfo productInfo) {
		this.productInfo = productInfo;
	}

	public BusOrderDetail getOrderDetail() {
		return orderDetail;
	}

	public void setOrderDetail(BusOrderDetail orderDetail) {
		this.orderDetail = orderDetail;
	}

	/**
	 * @param afterProcess the afterProcess to set
	 */
	public void setAfterProcess(List<BusAfterProcess> afterProcess) {
		this.afterProcess = afterProcess;
	}

	/**
	 * @return the afterProcess
	 */
	public List<BusAfterProcess> getAfterProcess() {
		return afterProcess;
	}

	/**
	 * @param orderDetailList the orderDetailList to set
	 */
	public void setOrderDetailList(List<BusOrderDetail> orderDetailList) {
		this.orderDetailList = orderDetailList;
	}

	/**
	 * @return the orderDetailList
	 */
	public List<BusOrderDetail> getOrderDetailList() {
		return orderDetailList;
	}

	
}
