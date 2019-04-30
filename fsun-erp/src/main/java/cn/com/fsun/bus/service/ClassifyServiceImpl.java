package cn.com.fsun.bus.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.fsun.bus.dao.ClassifyDao;
import cn.com.fsun.bus.domain.BusClassifyInfo;
import cn.com.fsun.bus.dto.ClassifyDto;
import cn.com.fsun.bus.service.itf.ClassifyService;
import cn.com.fsun.common.pageInfo.PageInfo;
import cn.com.fsun.common.service.BaseService;

@Service
public class ClassifyServiceImpl extends BaseService implements ClassifyService {

	@Autowired
	private ClassifyDao classifyDao;
	
	@Override
	public List<ClassifyDto> list() {

		List<BusClassifyInfo> info = classifyDao.search(null, null);
		List<ClassifyDto> dtos = DomainstoDtos(info);
		return dtos;
	}
	
	
	@Override
	public List<ClassifyDto> search(ClassifyDto classifyDto,PageInfo pageInfo){
		
		BusClassifyInfo productTypeInfo = DtotoDomain(classifyDto);
		List<BusClassifyInfo> ProductTypeInfos = classifyDao.search(productTypeInfo, pageInfo);	
		List<ClassifyDto> dtos = DomainstoDtos(ProductTypeInfos);
		return dtos;
	}

	@Override
	public ClassifyDto save(ClassifyDto classifyDto){
		BusClassifyInfo info = null;
		if(classifyDto.getId()!=null){
			info = classifyDao.load(classifyDto.getId());
			info.setDescription(classifyDto.getDescription());
			info.setName(classifyDto.getName());
			info.setUnit(classifyDto.getUnit());
		}else{
			info = DtotoDomain(classifyDto);
			info.setEnabled(true);	
		}
		classifyDao.save(info);
		return DomaintoDto(info);
		
	}
	
	
	@Override
	public void delete(Long id){
		classifyDao.delete(classifyDao.load(id));
	}
	
	@Override
	public ClassifyDto load(Long id){
		return DomaintoDto(classifyDao.load(id));
	}
	
	
	@Override
	public void disable(Long id) {
		BusClassifyInfo info = classifyDao.load(id);
		info.setEnabled(false);
		classifyDao.save(info);
	}
	
	@Override
	public void enable(Long id) {
		BusClassifyInfo info = classifyDao.load(id);
		info.setEnabled(true);
		classifyDao.save(info);
	}

	@Override
	public List<ClassifyDto> getDisableClassify() {
		String hql = " from BusClassifyInfo where enabled = false ";		
		return DomainstoDtos(classifyDao.find(hql));
	}

	@Override
	public boolean uniqueClassifyName(String name, Long id) {
		
		String hql = "select count(*) from BusClassifyInfo ";
		String where = "where name = '"+ name +"' ";
		if(id!=null){		
			where += " and id != "+ id; 
		}
		return classifyDao.getCountForInfo(hql+where)==0;		 
	}
	
	
	/**
	 * @description Domian转Dto
	 * @return BusClassifyInfo
	 * @param dto
	 */
	private BusClassifyInfo DtotoDomain(ClassifyDto dto){
		if(null==dto){
			return null;
		}		
		BusClassifyInfo info = new BusClassifyInfo();
		info.setId(dto.getId());
		info.setName(dto.getName());	
		info.setUnit(dto.getUnit());
		info.setDescription(dto.getDescription());
		info.setEnabled(dto.getEnabled());
		return info;
	}
	
	/**
	 * @description Dto转Domian
	 * @return ClassifyDto
	 * @param info
	 */
	private ClassifyDto DomaintoDto(BusClassifyInfo info){
		if(null==info){
			return null;
		}
		ClassifyDto dto = new ClassifyDto();
		dto.setId(info.getId());
		dto.setName(info.getName());	
		dto.setUnit(info.getUnit());
		dto.setDescription(info.getDescription());
		dto.setEnabled(info.getEnabled());
		return dto;
	}
	
	/**
	 * @description domians转dtos
	 * @return List<ClassifyDto>
	 * @param infos
	 * @return
	 */
	private List<ClassifyDto> DomainstoDtos(List<BusClassifyInfo> infos){
		
		List<ClassifyDto> dtos = new ArrayList<ClassifyDto>();
		if (null != infos && infos.size() > 0) {
			for (BusClassifyInfo info : infos) {
				ClassifyDto dto = DomaintoDto(info);
				if (null != dto) {
					dtos.add(dto);
				}
			}
		}
		return dtos;
	}

}
