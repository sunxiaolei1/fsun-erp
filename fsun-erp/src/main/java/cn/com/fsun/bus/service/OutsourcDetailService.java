package cn.com.fsun.bus.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.fsun.bus.dao.OutsourcDetailDao;
import cn.com.fsun.bus.domain.BusOrderInfo;
import cn.com.fsun.bus.domain.BusOutsourcDetail;
import cn.com.fsun.bus.dto.OrderDto;
import cn.com.fsun.bus.dto.OutsourcDetailDto;
import cn.com.fsun.common.service.BaseService;
import cn.com.fsun.common.utils.DateUtil;
import cn.com.fsun.common.utils.PageInfo;
import cn.com.fsun.common.utils.StringUtil;

@Service
public class OutsourcDetailService extends BaseService {
	
	@Autowired
	private OutsourcDetailDao outsourcDetailDao;	
	
	
	/**
	 * @description 显示列表（有查询条件）
	 * @return List<OutsourcDetailDto>
	 * @update 2012-8-13 上午9:36:48
	 */
	public List<OutsourcDetailDto> search(OutsourcDetailDto outsourcDetailDto,PageInfo pageInfo,boolean isPage){
		
		BusOutsourcDetail outsourcDetail = DtotoDomain(outsourcDetailDto);
		List<BusOutsourcDetail> outsourcDetails = outsourcDetailDao.search(outsourcDetail, pageInfo,isPage);
		List<OutsourcDetailDto> outsourcDetailDtos = DomainstoDtos(outsourcDetails);
		return outsourcDetailDtos;
	}
	
	/**
	 * @description 获取查询结果数量
	 * @return int
	 * @param outsourcDetailDto
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public int getSearchCount(OutsourcDetailDto outsourcDetailDto,PageInfo pageInfo){
		BusOutsourcDetail outsourcDetail = DtotoDomain(outsourcDetailDto);
		List<BusOutsourcDetail> outsourcDetails = outsourcDetailDao.search(outsourcDetail, pageInfo,false);
		if(null!=outsourcDetails && outsourcDetails.size()>0){
			return outsourcDetails.size();
		}else{
			return new Integer(0);
		}
	}
	
	/**
	 * @description Domian转Dto
	 * @return BusOutsourcDetail
	 * @param outsourcDetailDto
	 */
	public BusOutsourcDetail DtotoDomain(OutsourcDetailDto outsourcDetailDto){
		if(null==outsourcDetailDto){
			return null;
		}		
		BusOutsourcDetail outsourcDetail = new BusOutsourcDetail();
		outsourcDetail.setId(outsourcDetailDto.getId());
		outsourcDetail.setOrderCode(outsourcDetailDto.getOrderCode());
		outsourcDetail.setOutsourcName(outsourcDetailDto.getOutsourcName());
		outsourcDetail.setProcess(outsourcDetailDto.getProcess());		
		if(outsourcDetailDto.getAllPrice()!=null){
			outsourcDetail.setAllPrice(Math.round(outsourcDetailDto.getAllPrice()*10)/10D);
		}else{		
			outsourcDetail.setAllPrice(0D);							
		}
		outsourcDetail.setPictures(outsourcDetailDto.getPictures());
		if(outsourcDetailDto.getCompleteTime()!=null && !"".equals(outsourcDetailDto.getCompleteTime())){			
			outsourcDetail.setCompleteTime(DateUtil.parse(outsourcDetailDto.getCompleteTime(), "yyyy-MM-dd"));
		}
		
		outsourcDetail.setCreateManId(outsourcDetailDto.getCreateManId());
		outsourcDetail.setCreateManName(outsourcDetailDto.getCreateManName());
		outsourcDetail.setCreateTime(outsourcDetailDto.getCreateTime());
		outsourcDetail.setDescription(outsourcDetailDto.getDescription());			
		
		return outsourcDetail;
	}
	
	/**
	 * @description Dto转Domian
	 * @return OutsourcDetailDto
	 * @param outsourcDetail
	 */
	public OutsourcDetailDto DomaintoDto(BusOutsourcDetail outsourcDetail){
		if(null==outsourcDetail){
			return null;
		}
		OutsourcDetailDto outsourcDetailDto = new OutsourcDetailDto();
		outsourcDetailDto.setId(outsourcDetail.getId());
		outsourcDetailDto.setOrderCode(outsourcDetail.getOrderCode());
		outsourcDetailDto.setOutsourcName(outsourcDetail.getOutsourcName());
		outsourcDetailDto.setProcess(outsourcDetail.getProcess());		
		if(outsourcDetail.getAllPrice()!=null){
			outsourcDetailDto.setAllPrice(Math.round(outsourcDetail.getAllPrice()*10)/10D);
		}else{		
			outsourcDetailDto.setAllPrice(0D);							
		}
		outsourcDetailDto.setPictures(outsourcDetail.getPictures());
		if(outsourcDetail.getCompleteTime() != null){			
			outsourcDetailDto.setCompleteTime(DateUtil.formateDate(outsourcDetail.getCompleteTime(), "yyyy-MM-dd"));
		}
		outsourcDetailDto.setCreateManId(outsourcDetail.getCreateManId());
		outsourcDetailDto.setCreateManName(outsourcDetail.getCreateManName());
		outsourcDetailDto.setCreateTime(outsourcDetail.getCreateTime());
		outsourcDetailDto.setDescription(outsourcDetail.getDescription());
		return outsourcDetailDto;
	}
	
	/**
	 * @description domians转dtos
	 * @return List<OutsourcDetailDto>
	 * @param outsourcDetails
	 * @return
	 */
	public List<OutsourcDetailDto> DomainstoDtos(List<BusOutsourcDetail> outsourcDetails){
		
		List<OutsourcDetailDto> outsourcDetailDtos = new ArrayList<OutsourcDetailDto>();
		if (null != outsourcDetails && outsourcDetails.size() > 0) {
			for (BusOutsourcDetail outsourcDetail : outsourcDetails) {
				OutsourcDetailDto outsourcDetailDto = DomaintoDto(outsourcDetail);
				if (null != outsourcDetailDto) {
					outsourcDetailDtos.add(outsourcDetailDto);
				}
			}
		}
		return outsourcDetailDtos;
	}
	
	/**
	 * @description 增加或者修改
	 * @return OutsourcDetailDto
	 * @param outsourcDetailDto
	 * @return
	 * @update 2013-2-21
	 */
	public OutsourcDetailDto save(OutsourcDetailDto outsourcDetailDto){
		BusOutsourcDetail outsourcDetail = null;
		if(!StringUtil.isNotEmpty(outsourcDetailDto.getId())){			
			outsourcDetail = DtotoDomain(outsourcDetailDto); 
			outsourcDetail.setCreateTime(new Date());
			outsourcDetail.setCreateManId(super.getCurrentUserID());
			outsourcDetail.setCreateManName(super.getCurrentUserRealName());
		}else{
			outsourcDetail = outsourcDetailDao.load(outsourcDetailDto.getId());
			outsourcDetail.setOrderCode(outsourcDetailDto.getOrderCode());
			outsourcDetail.setProcess(outsourcDetailDto.getProcess());		
			if(outsourcDetailDto.getAllPrice()!=null){
				outsourcDetail.setAllPrice(Math.round(outsourcDetailDto.getAllPrice()*10)/10D);
			}else{		
				outsourcDetail.setAllPrice(0D);							
			}
			outsourcDetail.setPictures(outsourcDetailDto.getPictures());
			if(outsourcDetailDto.getCompleteTime()!=null && !"".equals(outsourcDetailDto.getCompleteTime())){			
				outsourcDetail.setCompleteTime(DateUtil.parse(outsourcDetailDto.getCompleteTime(), "yyyy-MM-dd"));
			}
			outsourcDetail.setDescription(outsourcDetailDto.getDescription());		
		}
		outsourcDetailDao.save(outsourcDetail);
		return DomaintoDto(outsourcDetail);
		
	}
	
	/**
	 * @description 删除一个菜单节点
	 * @return void
	 * @param id
	 * @update 2012-8-13 上午9:37:49
	 */
	public void delete(String id){
		try{
			outsourcDetailDao.delete(outsourcDetailDao.load(id));
		}catch (Exception e) {
//			System.out.println(e.getMessage());
		}
	}
	
	
	/**
	 * @description 加载一个菜单节点
	 * @return OrderDetailDto
	 * @param id
	 * @update 2012-8-13 上午9:38:10
	 */
	public OutsourcDetailDto load(String id){
		return DomaintoDto(outsourcDetailDao.load(id));
	}

	
	public List<OutsourcDetailDto> getDataForExcelExport(OutsourcDetailDto outsourcDetailDto) {
		BusOutsourcDetail outsourcDetail = DtotoDomain(outsourcDetailDto);
	    PageInfo pageInfo = new PageInfo();
	    List<BusOutsourcDetail> outsourcDetails = outsourcDetailDao.search(outsourcDetail, pageInfo,false);
		return DomainstoDtos(outsourcDetails);
	}

	
}
