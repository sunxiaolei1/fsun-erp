package cn.com.fsun.bus.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.fsun.bus.dao.ClassifyDao;
import cn.com.fsun.bus.dao.MaterielDao;
import cn.com.fsun.bus.domain.BusMaterielInfo;
import cn.com.fsun.bus.dto.MaterielDto;
import cn.com.fsun.bus.service.itf.MaterielService;
import cn.com.fsun.common.pageInfo.PageInfo;
import cn.com.fsun.common.service.BaseService;

@Service
public class MaterielServiceImpl extends BaseService implements MaterielService {

	@Autowired
	private MaterielDao materielDao;
	
	@Autowired
	private ClassifyDao classifyDao;
	
	@Override
	public List<MaterielDto> list(MaterielDto materielDto) {
		List<BusMaterielInfo> infos = materielDao.search(this.DtotoDomain(materielDto), null);
		List<MaterielDto> dtos = DomainstoDtos(infos);
		return dtos;
	}
	
	
	@Override
	public List<MaterielDto> search(MaterielDto materielDto,PageInfo pageInfo){
		BusMaterielInfo info = DtotoDomain(materielDto);
		List<BusMaterielInfo> infos = materielDao.search(info, pageInfo);
		pageInfo.setTotal(materielDao.getSearchCount(info, pageInfo));
		classifyDao.createClassifyMap(classifyMap);
		return DomainstoDtos(infos);
	}

	@Override
	public MaterielDto save(MaterielDto dto){
		BusMaterielInfo info = null;
		if(dto.getId()!=null){
			info = materielDao.load(dto.getId());
			info.setDescription(dto.getDescription());
			info.setImagePath(dto.getImagePath());
			info.setName(dto.getName());
			info.setPrice(dto.getPrice());
			info.setSpec(dto.getSpec());
			info.setClassifyId(dto.getClassifyId());	
		}else{
			info = DtotoDomain(dto);
			info.setEnabled(true);
		}
		materielDao.save(info);
		return DomaintoDto(info);
		
	}
	
	@Override
	public void delete(Long id){
		materielDao.delete(materielDao.load(id));
	}
	
	@Override
	public void disable(Long id) throws Exception {
		materielDao.materielChangeStatus(id, false);
	}

	@Override
	public void enable(Long id) throws Exception {
		materielDao.materielChangeStatus(id, true);
	}
	
	@Override
	public MaterielDto load(Long id){
		return DomaintoDto(materielDao.load(id));
	}

	@Override
	public List<MaterielDto> getDisableMateriel() {
		String hql = "select new cn.com.fsun.bus.dto.MaterielDto(id,name,spec,price,description) " +
				"from BusMaterielInfo where enabled = false ";		
		return materielDao.find(hql);
	}

	@Override
	public boolean uniqueMaterielName(String name, Long id) {
		String hql = "select count(*) from BusMaterielInfo  ";
		String where = "where 1=1 ";
		if(id!=null){
			where += "and name = '"+ name +"' and id != "+ id ;
		}else{
			where += "and name = '"+ name +"' ";
		}
		return materielDao.getCountForInfo(hql+where)==0;
	}
	
	@Override
	public boolean classifyUsed(Long classifyId) {
		return materielDao.classifyUsed(classifyId);		
	}
	
	/**
	 * @description Domian转Dto
	 * @return BusMaterielInfo
	 * @param dto
	 */
	private BusMaterielInfo DtotoDomain(MaterielDto dto){
		if(null==dto){
			return null;
		}		
		BusMaterielInfo info = new BusMaterielInfo();
		info.setDescription(dto.getDescription());
		info.setImagePath(dto.getImagePath());
		info.setName(dto.getName());
		info.setPrice(dto.getPrice());
		info.setSpec(dto.getSpec());
		info.setClassifyId(dto.getClassifyId());
		info.setId(dto.getId());
		info.setEnabled(dto.getEnabled());
		return info;
	}
	
	private static HashMap<Long, String> classifyMap  = new HashMap<Long, String>();
	
	/**
	 * @description Dto转Domian
	 * @return MaterielDto
	 * @param info
	 */
	private MaterielDto DomaintoDto(BusMaterielInfo info){
		if(null==info){
			return null;
		}
		MaterielDto dto = new MaterielDto();
		dto.setDescription(info.getDescription());
		dto.setImagePath(info.getImagePath());
		dto.setName(info.getName());
		dto.setPrice(info.getPrice());
		dto.setSpec(info.getSpec());
		dto.setClassifyId(info.getClassifyId());
		dto.setClassifyName(classifyMap.get(info.getClassifyId()));
		dto.setId(info.getId());
		dto.setEnabled(info.getEnabled());
		return dto;
	}
	
	/**
	 * @description domians转dtos
	 * @return List<MaterielDto>
	 * @param MaterielDto
	 * @return
	 */
	private List<MaterielDto> DomainstoDtos(List<BusMaterielInfo> infos){
		
		List<MaterielDto> dtos = new ArrayList<MaterielDto>();
		if (null != infos && infos.size() > 0) {
			for (BusMaterielInfo info : infos) {
				MaterielDto dto = DomaintoDto(info);
				if (null != dto) {
					dtos.add(dto);
				}
			}
		}
		return dtos;
	}
	
}
