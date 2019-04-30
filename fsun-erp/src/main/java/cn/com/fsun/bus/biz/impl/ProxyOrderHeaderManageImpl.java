package cn.com.fsun.bus.biz.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import cn.com.fsun.bus.biz.itf.ProxyOrderHeaderManage;
import cn.com.fsun.bus.dao.ProxyOrderDetailDao;
import cn.com.fsun.bus.dao.ProxyOrderHeaderDao;
import cn.com.fsun.bus.domain.BusProxyOrderDetail;
import cn.com.fsun.bus.domain.BusProxyOrderHeader;
import cn.com.fsun.bus.dto.ProxyOrderHeaderDto;
import cn.com.fsun.common.utils.PageInfo;
import cn.com.fsun.sys.domain.User;

@Component
public class ProxyOrderHeaderManageImpl implements ProxyOrderHeaderManage{

	@Autowired
	private ProxyOrderHeaderDao proxyOrderHeaderDao;
	
	@Autowired
	private ProxyOrderDetailDao proxyOrderDetailDao;

	@Override
	public List<ProxyOrderHeaderDto> search(ProxyOrderHeaderDto headerDto, PageInfo pageInfo, boolean isPage) {
		  
		BusProxyOrderHeader header = DtotoDomain(headerDto);
		List<BusProxyOrderHeader> headers = proxyOrderHeaderDao.search(header, pageInfo,isPage);
		List<ProxyOrderHeaderDto> headerDtos = DomainstoDtos(headers);
		List<BusProxyOrderDetail> proxyOrderDetails = proxyOrderDetailDao.list();
		HashMap<String, String> map = new HashMap<String, String>();
		for (BusProxyOrderDetail detail : proxyOrderDetails) {
			map.put(detail.getProxyCode(), detail.getDescr()!=null?detail.getDescr():"");
		}
		for (ProxyOrderHeaderDto proxyOrderHeaderDto : headerDtos) {
			proxyOrderHeaderDto.setRemark(map.get(proxyOrderHeaderDto.getProxyCode()));
		}
		return headerDtos;
	}

	@Override
	public ProxyOrderHeaderDto save(ProxyOrderHeaderDto headerDto) {
		  
		BusProxyOrderHeader header = DtotoDomain(headerDto);
		
		header.setCreateManId(headerDto.getCreateManId());
		header.setCreateManName(headerDto.getCreateManName());
		header.setCreateTime(new Date());
		header.setEnabled(true);
		header.setPrintStatus(false);
		proxyOrderHeaderDao.create(header);
		return DomaintoDto(header);
	}
	
	@Override
	public void deleteEntry(String proxyCode) throws Exception {
		proxyOrderHeaderDao.deleteEntry(proxyCode);
	}

	@Override
	public ProxyOrderHeaderDto load(String id) {
		return DomaintoDto(proxyOrderHeaderDao.load(id));
	}
	
	@Override
	public ProxyOrderHeaderDto loadByCode(String proxyCode) {
		return DomaintoDto(proxyOrderHeaderDao.loadByAttribute("proxyCode", proxyCode));
	}

	@Override
	public void update(ProxyOrderHeaderDto headerDto, User currUser) {
		  
		BusProxyOrderHeader header = proxyOrderHeaderDao.loadByAttribute("proxyCode", headerDto.getProxyCode());
	
		header.setContract(headerDto.getContract());
		header.setCustomerCode(headerDto.getCustomerCode());
		header.setCustomerName(headerDto.getCustomerName());
		header.setDescr(headerDto.getDescr());
		header.setTotalVersions(headerDto.getTotalVersions());
		header.setNumber(headerDto.getNumber());
		header.setOrderPrice(headerDto.getOrderPrice());
		header.setPaid(headerDto.isPaid());
		header.setReceiveTime(headerDto.getReceiveTime());
		header.setTelephone(headerDto.getTelephone());
		
		//header.setPrintStatus(headerDto.isPrintStatus());
		//header.setEnabled(headerDto.isEnabled());
		header.setUpdateManId(currUser.getId());
		header.setUpdateManName(currUser.getRealname());
		header.setUpdateTime(new Date());
		proxyOrderHeaderDao.update(header);
	}

	@Override
	public void signPrint(String proxyCode, User currUser) {	  
		BusProxyOrderHeader header = proxyOrderHeaderDao.loadByAttribute("proxyCode", proxyCode);
		header.setPrintStatus(true);
		header.setUpdateManId(currUser.getId());
		header.setUpdateManName(currUser.getRealname());
		header.setUpdateTime(new Date());
		proxyOrderHeaderDao.update(header);
	}
	
	@Override
	public void completeProxy(String proxyCode, User currUser) {	  
		BusProxyOrderHeader header = proxyOrderHeaderDao.loadByAttribute("proxyCode", proxyCode);
		header.setEnabled(false);
		header.setUpdateManId(currUser.getId());
		header.setUpdateManName(currUser.getRealname());
		header.setUpdateTime(new Date());
		proxyOrderHeaderDao.update(header);
	}
	
	@Override
	public Long getInitCode(String sign) {
		   
		return proxyOrderHeaderDao.getInitCode(sign);
	}
	
	
	/******************************************* 内部操作   *******************************************/
	
	/**
	 * @description Domian转Dto
	 * @return BusProxyOrderHeader
	 * @param headerDto
	 */
	public static BusProxyOrderHeader DtotoDomain(ProxyOrderHeaderDto headerDto){
		if(null==headerDto){
			return null;
		}		
		BusProxyOrderHeader header = new BusProxyOrderHeader();
		header.setContract(headerDto.getContract());
		header.setCreateManId(headerDto.getCreateManId());
		header.setCreateManName(headerDto.getCreateManName());
		header.setCreateTime(headerDto.getCreateTime());
		header.setCustomerCode(headerDto.getCustomerCode());
		header.setCustomerName(headerDto.getCustomerName());
		header.setDescr(headerDto.getDescr());
		header.setEnabled(headerDto.isEnabled());
		header.setId(headerDto.getId());
		header.setTotalVersions(headerDto.getTotalVersions());
		header.setNumber(headerDto.getNumber());
		header.setOrderPrice(headerDto.getOrderPrice());
		header.setPaid(headerDto.isPaid());
		header.setPrintStatus(headerDto.isPrintStatus());
		header.setProxyCode(headerDto.getProxyCode());
		header.setProxyType(headerDto.getProxyType());
		header.setReceiveTime(headerDto.getReceiveTime());
		header.setStatus(headerDto.getStatus());
		header.setTelephone(headerDto.getTelephone());
		header.setUpdateManId(headerDto.getUpdateManId());
		header.setUpdateManName(headerDto.getUpdateManName());
		header.setUpdateTime(headerDto.getUpdateTime());		
		return header;	
	}
	
	/**
	 * @description Dto转Domian
	 * @return ProxyOrderHeaderDto
	 * @param header
	 */
	public ProxyOrderHeaderDto DomaintoDto(BusProxyOrderHeader header){
		if(null==header){
			return null;
		}
		ProxyOrderHeaderDto headerDto = new ProxyOrderHeaderDto();		
		headerDto.setContract(header.getContract());
		headerDto.setCreateManId(header.getCreateManId());
		headerDto.setCreateManName(header.getCreateManName());
		headerDto.setCreateTime(header.getCreateTime());
		headerDto.setCustomerCode(header.getCustomerCode());
		headerDto.setCustomerName(header.getCustomerName());
		headerDto.setDescr(header.getDescr());
		headerDto.setEnabled(header.isEnabled());
		headerDto.setId(header.getId());
		headerDto.setTotalVersions(header.getTotalVersions());
		headerDto.setNumber(header.getNumber());
		headerDto.setOrderPrice(header.getOrderPrice());
		headerDto.setPaid(header.isPaid());
		headerDto.setPrintStatus(header.isPrintStatus());
		headerDto.setProxyCode(header.getProxyCode());
		headerDto.setProxyType(header.getProxyType());
		headerDto.setReceiveTime(header.getReceiveTime());
		headerDto.setStatus(header.getStatus());
		headerDto.setTelephone(header.getTelephone());
		headerDto.setUpdateManId(header.getUpdateManId());
		headerDto.setUpdateManName(header.getUpdateManName());
		headerDto.setUpdateTime(header.getUpdateTime());
		return headerDto;	
	}
	
	/**
	 * @description domians转dtos
	 * @return List<ProxyOrderHeaderDto>
	 * @param headers
	 * @return
	 */
	public List<ProxyOrderHeaderDto> DomainstoDtos(List<BusProxyOrderHeader> headers){
		
		List<ProxyOrderHeaderDto> headerDtos = new ArrayList<>();
		if (null != headers && headers.size() > 0) {
			for (BusProxyOrderHeader header : headers) {
				ProxyOrderHeaderDto headerDto = DomaintoDto(header);
				if (null != headerDto) {
					headerDtos.add(headerDto);
				}
			}
		}
		return headerDtos;
	}
	
}
