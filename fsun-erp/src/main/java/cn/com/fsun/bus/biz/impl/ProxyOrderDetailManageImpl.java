package cn.com.fsun.bus.biz.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import cn.com.fsun.bus.biz.itf.ProxyOrderDetailManage;
import cn.com.fsun.bus.dao.ProxyOrderDetailDao;
import cn.com.fsun.bus.domain.BusProxyOrderDetail;
import cn.com.fsun.bus.dto.ProxyOrderDetailDto;

@Component
public class ProxyOrderDetailManageImpl implements ProxyOrderDetailManage {

	@Autowired
	private ProxyOrderDetailDao proxyOrderDetailDao;

	
	@Override
	public ProxyOrderDetailDto save(ProxyOrderDetailDto detailDto) {
		BusProxyOrderDetail detail = DtotoDomain(detailDto);
		proxyOrderDetailDao.create(detail);
		return DomaintoDto(detail);
	}

	@Override
	public ProxyOrderDetailDto loadByCode(String proxyCode) {
		return DomaintoDto(proxyOrderDetailDao.loadByAttribute("proxyCode", proxyCode));
	}

	@Override
	public void update(ProxyOrderDetailDto detailDto) {
		
		BusProxyOrderDetail detail = proxyOrderDetailDao.loadByAttribute("proxyCode", detailDto.getProxyCode());
		
		detail.setProductName(detailDto.getProductName());
		detail.setStyle(detailDto.getStyle());
		detail.setLayout(detailDto.getLayout());
		detail.setMaterial(detailDto.getMaterial());
		detail.setOpenMethod(detailDto.getOpenMethod());
		detail.setSpec(detailDto.getSpec());
		detail.setOpenNum(detailDto.getOpenNum());
		detail.setOpenSize(detailDto.getOpenSize());
		detail.setPapers(detailDto.getPapers());
		detail.setPrints(detailDto.getPrints());
		
		detail.setModel(detailDto.getModel());
		detail.setColors(detailDto.getColors());
		detail.setImpos(detailDto.getImpos());
		detail.setProcess(detailDto.getProcess());
		detail.setActuals(detailDto.getActuals());
		detail.setExpects(detailDto.getExpects());
		detail.setLoss(detailDto.getLoss());
		
		detail.setImageUrl(detailDto.getImageUrl());
		detail.setTotalPrice(detailDto.getTotalPrice());
		detail.setPrice(detailDto.getPrice());
		detail.setViewed(detailDto.isViewed());
		detail.setDescr(detailDto.getDescr());
		detail.setLooked(detailDto.isLooked());
		detail.setFilmed(detailDto.isFilmed());
		detail.setPolished(detailDto.isPolished());
		proxyOrderDetailDao.update(detail);
	}
	
	
	/******************************************* 内部操作   *******************************************/
	
	/**
	 * @description Domian转Dto
	 * @return BusProxyOrderDetail
	 * @param detailDto
	 */
	public static BusProxyOrderDetail DtotoDomain(ProxyOrderDetailDto detailDto){
		if(null==detailDto){
			return null;
		}		
		BusProxyOrderDetail detail = new BusProxyOrderDetail();
		
		detail.setId(detailDto.getId());
		detail.setProxyCode(detailDto.getProxyCode());
		detail.setProductName(detailDto.getProductName());
		detail.setStyle(detailDto.getStyle());
		detail.setLayout(detailDto.getLayout());
		detail.setMaterial(detailDto.getMaterial());
		detail.setOpenMethod(detailDto.getOpenMethod());
		detail.setSpec(detailDto.getSpec());
		detail.setOpenNum(detailDto.getOpenNum());
		detail.setOpenSize(detailDto.getOpenSize());
		detail.setPapers(detailDto.getPapers());
		detail.setPrints(detailDto.getPrints());
		
		detail.setModel(detailDto.getModel());
		detail.setColors(detailDto.getColors());
		detail.setImpos(detailDto.getImpos());
		detail.setProcess(detailDto.getProcess());
		detail.setActuals(detailDto.getActuals());
		detail.setExpects(detailDto.getExpects());
		detail.setLoss(detailDto.getLoss());
		
		detail.setImageUrl(detailDto.getImageUrl());
		detail.setTotalPrice(detailDto.getTotalPrice());
		detail.setPrice(detailDto.getPrice());
		detail.setViewed(detailDto.isViewed());
		detail.setDescr(detailDto.getDescr());
		detail.setLooked(detailDto.isLooked());
		
		detail.setFilmed(detailDto.isFilmed());
		detail.setPolished(detailDto.isPolished());
		
		return detail;
	}
	
	/**
	 * @description Dto转Domian
	 * @return ProxyOrderDetailDto
	 * @param detail
	 */
	public ProxyOrderDetailDto DomaintoDto(BusProxyOrderDetail detail){
		if(null==detail){
			return null;
		}
		ProxyOrderDetailDto detailDto = new ProxyOrderDetailDto();
		
		detailDto.setId(detail.getId());
		detailDto.setProxyCode(detail.getProxyCode());
		detailDto.setProductName(detail.getProductName());
		detailDto.setStyle(detail.getStyle());
		detailDto.setLayout(detail.getLayout());
		detailDto.setMaterial(detail.getMaterial());
		detailDto.setOpenMethod(detail.getOpenMethod());
		detailDto.setSpec(detail.getSpec());
		detailDto.setOpenNum(detail.getOpenNum());
		detailDto.setOpenSize(detail.getOpenSize());
		detailDto.setPapers(detail.getPapers());
		detailDto.setPrints(detail.getPrints());
		
		detailDto.setModel(detail.getModel());
		detailDto.setColors(detail.getColors());
		detailDto.setImpos(detail.getImpos());
		detailDto.setProcess(detail.getProcess());
		detailDto.setActuals(detail.getActuals());
		detailDto.setExpects(detail.getExpects());
		detailDto.setLoss(detail.getLoss());
		
		detailDto.setImageUrl(detail.getImageUrl());
		detailDto.setTotalPrice(detail.getTotalPrice());
		detailDto.setPrice(detail.getPrice());
		detailDto.setViewed(detail.isViewed());
		detailDto.setDescr(detail.getDescr());
		detailDto.setLooked(detail.isLooked());
		
		detailDto.setFilmed(detail.isFilmed());
		detailDto.setPolished(detail.isPolished());
		return detailDto;
	}
	
	/**
	 * @description domians转dtos
	 * @return List<ProxyOrderDetailDto>
	 * @param details
	 * @return
	 */
	public List<ProxyOrderDetailDto> DomainstoDtos(List<BusProxyOrderDetail> details){
		
		List<ProxyOrderDetailDto> madeDetailDtos = new ArrayList<ProxyOrderDetailDto>();
		if (null != details && details.size() > 0) {
			for (BusProxyOrderDetail detail : details) {
				ProxyOrderDetailDto detailDto = DomaintoDto(detail);
				if (null != detailDto) {
					madeDetailDtos.add(detailDto);
				}
			}
		}
		return madeDetailDtos;
	}

}
