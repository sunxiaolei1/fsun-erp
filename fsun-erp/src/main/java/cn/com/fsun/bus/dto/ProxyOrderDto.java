package cn.com.fsun.bus.dto;

import java.util.List;

/**
 * 加工单对象
 * @author sunxiaolei
 *
 */
public class ProxyOrderDto {

	private ProxyOrderHeaderDto proxyOrderHeader;
	
	private ProxyOrderDetailDto proxyOrderDetail;
	
	private List<ProxyPrintDetailDto> proxyPrintDetails;

	public ProxyOrderDetailDto getProxyOrderDetail() {
		return proxyOrderDetail;
	}

	public void setProxyOrderDetail(ProxyOrderDetailDto proxyOrderDetail) {
		this.proxyOrderDetail = proxyOrderDetail;
	}

	public ProxyOrderHeaderDto getProxyOrderHeader() {
		return proxyOrderHeader;
	}

	public void setProxyOrderHeader(ProxyOrderHeaderDto proxyOrderHeader) {
		this.proxyOrderHeader = proxyOrderHeader;
	}

	/**
	 * @return the proxyPrintDetails
	 */
	public List<ProxyPrintDetailDto> getProxyPrintDetails() {
		return proxyPrintDetails;
	}

	/**
	 * @param proxyPrintDetails the proxyPrintDetails to set
	 */
	public void setProxyPrintDetails(List<ProxyPrintDetailDto> proxyPrintDetails) {
		this.proxyPrintDetails = proxyPrintDetails;
	}
	
	
}
