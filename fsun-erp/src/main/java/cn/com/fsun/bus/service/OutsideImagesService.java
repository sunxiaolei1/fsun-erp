package cn.com.fsun.bus.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.fsun.bus.dao.OutsideImagesDao;
import cn.com.fsun.bus.domain.BusOutsideImages;
import cn.com.fsun.bus.dto.OutsideImagesDto;
import cn.com.fsun.common.service.BaseService;
import cn.com.fsun.common.utils.StringUtil;

@Service
public class OutsideImagesService extends BaseService {
	
	@Autowired
	private OutsideImagesDao outsideImagesDao;	
	
	/**
	 * @description Domian转Dto
	 * @return BusOutsideImages
	 * @param outsideImagesDto
	 */
	public BusOutsideImages DtotoDomain(OutsideImagesDto outsideImagesDto){
		if(null==outsideImagesDto){
			return null;
		}		
		BusOutsideImages busOutsideImages = new BusOutsideImages();
		busOutsideImages.setId(outsideImagesDto.getId());
		busOutsideImages.setImages(outsideImagesDto.getImages());
		busOutsideImages.setName(outsideImagesDto.getName());
		busOutsideImages.setOutSideId(outsideImagesDto.getOutSideId());
		return busOutsideImages;
	}
	
	/**
	 * @description Dto转Domian
	 * @return OutsideImagesDto
	 * @param busOutsideImages
	 */
	public OutsideImagesDto DomaintoDto(BusOutsideImages busOutsideImages){
		if(null==busOutsideImages){
			return null;
		}
		OutsideImagesDto outsideImagesDto = new OutsideImagesDto();
		outsideImagesDto.setId(busOutsideImages.getId());
		outsideImagesDto.setImages(busOutsideImages.getImages());
		outsideImagesDto.setName(busOutsideImages.getName());
		outsideImagesDto.setOutSideId(busOutsideImages.getOutSideId());
		return outsideImagesDto;
	}
	
	/**
	 * @description domians转dtos
	 * @return List<OutsideImagesDto>
	 * @param outsideImagesList
	 * @return
	 */
	public List<OutsideImagesDto> DomainstoDtos(List<BusOutsideImages> outsideImagesList){
		
		List<OutsideImagesDto> outsideImagesDtos = new ArrayList<OutsideImagesDto>();
		if (null != outsideImagesList && outsideImagesList.size() > 0) {
			for (BusOutsideImages busOutsideImages : outsideImagesList) {
				OutsideImagesDto outsideImagesDto = DomaintoDto(busOutsideImages);
				if (null != outsideImagesDto) {
					outsideImagesDtos.add(outsideImagesDto);
				}
			}
		}
		return outsideImagesDtos;
	}
	
	/**
	 * @description 增加或者修改
	 * @return OutsideImagesDto
	 * @param outsideImagesDto
	 * @return
	 * @update 2013-2-21
	 */
	public OutsideImagesDto save(OutsideImagesDto outsideImagesDto){
		BusOutsideImages busOutsideImages = null;
		if(!StringUtil.isNotEmpty(outsideImagesDto.getId())){			
			busOutsideImages = DtotoDomain(outsideImagesDto); 
		}else{
			busOutsideImages = outsideImagesDao.load(outsideImagesDto.getId());
			busOutsideImages.setName(outsideImagesDto.getName());
			busOutsideImages.setImages(outsideImagesDto.getImages());
		}
		outsideImagesDao.save(busOutsideImages);
		return DomaintoDto(busOutsideImages);
		
	}
	
	/**
	 * @description 删除一个菜单节点
	 * @return void
	 * @param id
	 * @update 2012-8-13 上午9:37:49
	 */
	public void delete(Integer id){		
		outsideImagesDao.delete(outsideImagesDao.load(id));		
	}
	
	
	/**
	 * @description 加载一个菜单节点
	 * @return OutsideImagesDto
	 * @param id
	 * @update 2012-8-13 上午9:38:10
	 */
	public OutsideImagesDto load(Integer id){
		return DomaintoDto(outsideImagesDao.load(id));
	}

	
	public List<Integer> getPictrueIds(String outSideId) {
		String hql = "select id from BusOutsideImages where outSideId ='"+ outSideId +"'";
		List<Integer> list = outsideImagesDao.find(hql);
		return list;
	}

	
}

