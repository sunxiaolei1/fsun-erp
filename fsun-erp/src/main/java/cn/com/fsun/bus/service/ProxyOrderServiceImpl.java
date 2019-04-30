package cn.com.fsun.bus.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.fsun.bus.biz.itf.ProxyOrderDetailManage;
import cn.com.fsun.bus.biz.itf.ProxyOrderHeaderManage;
import cn.com.fsun.bus.biz.itf.ProxyPrintDetailManage;
import cn.com.fsun.bus.dto.ProxyOrderDetailDto;
import cn.com.fsun.bus.dto.ProxyOrderDto;
import cn.com.fsun.bus.dto.ProxyOrderHeaderDto;
import cn.com.fsun.bus.dto.ProxyPrintDetailDto;
import cn.com.fsun.bus.enums.OrderSourceEnum;
import cn.com.fsun.bus.exception.MyException;
import cn.com.fsun.bus.exception.UnEnoughOrderCodeException;
import cn.com.fsun.bus.service.itf.ProxyOrderService;
import cn.com.fsun.common.constants.ExceptionInfoConstants;
import cn.com.fsun.common.service.BaseService;
import cn.com.fsun.common.utils.PageInfo;

/**
 * 加工单管理接口
 * @author sunxiaolei
 *
 */
@Service
public class ProxyOrderServiceImpl extends BaseService implements ProxyOrderService {

	@Autowired
	private ProxyOrderDetailManage  proxyOrderDetailManage;
	
	@Autowired
	private ProxyOrderHeaderManage  proxyOrderHeaderManage;
	
	@Autowired
	private ProxyPrintDetailManage proxyPrintDetailManage;

	@Override
	public List<ProxyOrderHeaderDto> search(ProxyOrderHeaderDto headerDto, PageInfo pageInfo, boolean isPage) {
		return proxyOrderHeaderManage.search(headerDto, pageInfo, isPage);
	}

	@Override
	public int getSearchCount(ProxyOrderHeaderDto headerDto, PageInfo pageInfo) {
		List<ProxyOrderHeaderDto> list = proxyOrderHeaderManage.search(headerDto, pageInfo, false);
		if(list!=null){
			return list.size();
		}
		return 0;
	}

	@Override
	public ProxyOrderDto getEntry(String proxyCode) {
		ProxyOrderDto proxyOrderDto = new ProxyOrderDto();
		proxyOrderDto.setProxyOrderHeader(proxyOrderHeaderManage.loadByCode(proxyCode));
		proxyOrderDto.setProxyOrderDetail(proxyOrderDetailManage.loadByCode(proxyCode));
		proxyOrderDto.setProxyPrintDetails(proxyPrintDetailManage.loadByCode(proxyCode));
		return proxyOrderDto;
	}

	@Override
	public ProxyOrderDto saveEntry(ProxyOrderDto proxyOrderDto) throws MyException {
		ProxyOrderDto proxyOrderDto0 = new ProxyOrderDto();
		ProxyOrderHeaderDto proxyOrderHeader = proxyOrderDto.getProxyOrderHeader();
		ProxyOrderDetailDto proxyOrderDetail = proxyOrderDto.getProxyOrderDetail();
		List<ProxyPrintDetailDto> proxyPrintDetails = proxyOrderDto.getProxyPrintDetails();		
		if(proxyPrintDetails!=null && proxyPrintDetails.size()>5){
			throw new MyException("数量不能超过5条!");
		}
		
		proxyOrderHeader.setCreateManId(super.getCurrentUserID()); 
		proxyOrderHeader.setCreateManName(super.getCurrentUserRealName());	
		ProxyOrderHeaderDto headerDto = proxyOrderHeaderManage.save(proxyOrderHeader);
		ProxyOrderDetailDto detailDto = proxyOrderDetailManage.save(proxyOrderDetail);
		List<ProxyPrintDetailDto> printDetailDtos = proxyPrintDetailManage.batchSave(proxyPrintDetails);
		proxyOrderDto0.setProxyOrderHeader(headerDto);
		proxyOrderDto0.setProxyOrderDetail(detailDto);
		proxyOrderDto0.setProxyPrintDetails(printDetailDtos);
		return proxyOrderDto0;
	}

	@Override
	public void updateEntry(ProxyOrderDto proxyOrderDto) throws MyException {
		List<ProxyPrintDetailDto> proxyPrintDetails = proxyOrderDto.getProxyPrintDetails();	
		if(proxyPrintDetails!=null && proxyPrintDetails.size()>5){
			throw new MyException("数量不能超过5条!");
		}
		proxyOrderHeaderManage.update(proxyOrderDto.getProxyOrderHeader(), super.getCurrentUser());
		proxyOrderDetailManage.update(proxyOrderDto.getProxyOrderDetail());
		proxyPrintDetailManage.batchUpdate(proxyPrintDetails);
	}

	@Override
	public void deleteEntry(String proxyCode) throws Exception {
		proxyOrderHeaderManage.deleteEntry(proxyCode);
		proxyPrintDetailManage.deleteByProxyCode(proxyCode);
	}

	@Override
	public String getInitCode() throws UnEnoughOrderCodeException {
		
		String sign = new SimpleDateFormat("yyyyMMdd").format(new Date())+OrderSourceEnum.PROXY_ORDER.getValue();
		Long initCode = proxyOrderHeaderManage.getInitCode(sign);
		if(initCode%100000==99999){
			throw new UnEnoughOrderCodeException(ExceptionInfoConstants.UNENOUGH_MADE_CODE);
		}
		return initCode+"";
	}

	@Override
	public ProxyOrderDto getProxyPrints(String proxyCode) {
		ProxyOrderDto proxyOrderDto = this.getEntry(proxyCode);
		List<ProxyPrintDetailDto> list = proxyOrderDto.getProxyPrintDetails();		
		for (ProxyPrintDetailDto proxyPrintDetailDto : list) {
			String colorsName = proxyPrintDetailDto.getColorsName();
			String spotColors = proxyPrintDetailDto.getSpotColors();
			if(spotColors!=null && !spotColors.equals("")){
				proxyPrintDetailDto.setColorsName(colorsName+"("+ spotColors +")");
			}
		}
		int length = list.size();
		ProxyPrintDetailDto proxyPrintDetail = new ProxyPrintDetailDto();
		for (int i = length; i < 5; i++) {						
			list.add(proxyPrintDetail);
		}
		return proxyOrderDto;
	}

	@Override
	public void signPrint(String proxyCode) {
		proxyOrderHeaderManage.signPrint(proxyCode, super.getCurrentUser());
	}

	@Override
	public void completeProxy(String proxyCode) {
		
		proxyOrderHeaderManage.completeProxy(proxyCode, super.getCurrentUser());
	}
	
	
}
