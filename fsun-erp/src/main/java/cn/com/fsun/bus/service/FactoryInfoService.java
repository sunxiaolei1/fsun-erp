package cn.com.fsun.bus.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.fsun.bus.dao.BuyInfoDao;
import cn.com.fsun.bus.dao.FactoryInfoDao;
import cn.com.fsun.bus.dao.OutsideImagesDao;
import cn.com.fsun.bus.dao.OutsourcDetailDao;
import cn.com.fsun.bus.domain.BusFactoryInfo;
import cn.com.fsun.bus.domain.BusOutsourcDetail;
import cn.com.fsun.bus.dto.FactoryInfoDto;
import cn.com.fsun.bus.exception.DisableDeleteException;
import cn.com.fsun.common.service.BaseService;
import cn.com.fsun.common.utils.PageInfo;
import cn.com.fsun.common.utils.StringUtils;

@Service
public class FactoryInfoService extends BaseService{

	@Autowired
	private FactoryInfoDao factoryInfoDao;
	
	@Autowired
	private OutsourcDetailDao outsourcDetailDao;
	
	@Autowired
	private OutsideImagesDao OutsideImagesDao;
	
	@Autowired
	private BuyInfoDao buyInfoDao;
	
	/**
	 * @description 显示列表（无查询条件）
	 * @return List<BuyInfoDto>
	 * @update 2012-8-13 上午9:36:48
	 */
	public List<FactoryInfoDto> list() {

		List<BusFactoryInfo> factoryInfos = factoryInfoDao.list();
		List<FactoryInfoDto> factoryInfoDtos = DomainstoDtos(factoryInfos);
		return factoryInfoDtos;
	}
	
	public List<FactoryInfoDto> getFactorylistByTechnology(String technology) {
		String hql ="";
		if(null==technology || "".equals(technology)){
			hql = "select new cn.com.fsun.bus.dto.FactoryInfoDto(id,name) from BusFactoryInfo where enabled = true ";	
		}else{
			hql = "select new cn.com.fsun.bus.dto.FactoryInfoDto(id,name) from BusFactoryInfo where enabled = true and technology like '%"+ technology +"%'";	
		}		
		List<FactoryInfoDto> list = factoryInfoDao.find(hql);
		return list;
	}
	
	public List<FactoryInfoDto> saleList() {
		String hql = "select new cn.com.fsun.bus.dto.FactoryInfoDto(id,name) from BusFactoryInfo "
				+ " where enabled = true and  type = '销售类' ";	
		List<FactoryInfoDto> list = factoryInfoDao.find(hql);
		return list;
	}
	
	public List<FactoryInfoDto> factoryList() {
		String hql = "select new cn.com.fsun.bus.dto.FactoryInfoDto(id,name) from BusFactoryInfo "
				+ " where enabled = true and  type != '销售类' ";	
		List<FactoryInfoDto> list = factoryInfoDao.find(hql);
		return list;
	}
	
	/**
	 * 获取被启用在厂家
	 * @return
	 */
	public List<FactoryInfoDto> getEnableList() {
		String hql = "from BusFactoryInfo where enabled = true ";		
		return factoryInfoDao.find(hql);
	}
	
	/**
	 * @description 显示列表（被启用的）
	 * @return List<BuyInfoDto>
	 * @update 2012-8-13 上午9:36:48
	 */
	public List<FactoryInfoDto> getEnabledList(FactoryInfoDto factoryInfoDto) {

		BusFactoryInfo factoryInfo = DtotoDomain(factoryInfoDto);
		List<BusFactoryInfo> factoryInfos = factoryInfoDao.search(factoryInfo,new PageInfo());
		List<FactoryInfoDto> factoryInfoDtos = DomainstoDtos(factoryInfos);
		return factoryInfoDtos;
	}
	
	
	/**
	 * @description 显示列表（有查询条件）
	 * @return List<BuyInfoDto>
	 * @update 2012-8-13 上午9:36:48
	 */
	public List<FactoryInfoDto> search(FactoryInfoDto factoryInfoDto,PageInfo pageInfo){
		
		BusFactoryInfo factoryInfo = DtotoDomain(factoryInfoDto);
		List<BusFactoryInfo> factoryInfos = factoryInfoDao.search(factoryInfo, pageInfo);
		List<FactoryInfoDto> factoryDtos = DomainstoDtos(factoryInfos);
		return factoryDtos;
	}
	
	/**
	 * @description 增加或者修改
	 * @return FactoryInfoDto
	 * @param factoryInfoDto
	 * @update 2013-2-21
	 */
	public FactoryInfoDto save(FactoryInfoDto factoryInfoDto){
		BusFactoryInfo factoryInfo = null;
		if(StringUtils.isNotEmpty(factoryInfoDto.getId())){
			factoryInfo = factoryInfoDao.load(factoryInfoDto.getId());
			factoryInfo.setType(factoryInfoDto.getType());
			factoryInfo.setTechnology(factoryInfoDto.getTechnology());
			factoryInfo.setMobileTelephone(factoryInfoDto.getMobileTelephone());
			factoryInfo.setTelephone(factoryInfoDto.getTelephone());
			factoryInfo.setLegalPerson(factoryInfoDto.getLegalPerson());
			factoryInfo.setAddress(factoryInfoDto.getAddress());
			factoryInfo.setDescription(factoryInfoDto.getDescription());
		}else{
		    factoryInfo = DtotoDomain(factoryInfoDto);
		    factoryInfo.setEnabled(true);
		}
		factoryInfoDao.save(factoryInfo);
		return DomaintoDto(factoryInfo);
		
	}
	
	
	/**
	 * @description 删除一个菜单节点
	 * @return void
	 * @param id
	 * @throws Exception 
	 * @update 2012-8-13 上午9:37:49
	 */
	public void delete(String id) throws Exception{
		BusFactoryInfo factoryInfo = factoryInfoDao.load(id);
		if(factoryInfo!=null && factoryInfo.getName()!=null && !"".equals(factoryInfo.getName())){
			if(!"加工类".equals(factoryInfo.getType())){
				if(buyInfoDao.factoryUsed(id)){
					throw new DisableDeleteException();
				}
			}
			List<String> ids = outsourcDetailDao.getIdsByOutsourcName(factoryInfo.getName());
			if(ids!=null && ids.size()>0){
				OutsideImagesDao.deleteByOutSideIds(ids);
				outsourcDetailDao.deleteByIds(ids.toArray(new String[ids.size()]));
			}	
		}
		factoryInfoDao.delete(factoryInfo);	
	}
	
	/**
	 * @description 加载一个菜单节点
	 * @return FactoryInfoDto
	 * @param id
	 * @update 2012-8-13 上午9:38:10
	 */
	public FactoryInfoDto load(String id){
		return DomaintoDto(factoryInfoDao.load(id));
	}

	/**
	 * @description 获取查询结果数量
	 * @return int
	 * @param factoryInfoDto
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public int getSearchCount(FactoryInfoDto factoryInfoDto,PageInfo pageInfo){
		BusFactoryInfo factoryInfo = DtotoDomain(factoryInfoDto);
		List<BusFactoryInfo> factoryInfos = factoryInfoDao.getSearchCount(factoryInfo, pageInfo);
		if(null!=factoryInfos && factoryInfos.size()>0){
			return factoryInfos.size();
		}else{
			return new Integer(0);
		}
	}
	
	
	/**
	 * @description Domian转Dto
	 * @return BusFactoryInfo
	 * @param factoryInfoDto
	 */
	public BusFactoryInfo DtotoDomain(FactoryInfoDto factoryInfoDto){
		if(null==factoryInfoDto){
			return null;
		}		
		BusFactoryInfo factoryInfo = new BusFactoryInfo();
		factoryInfo.setId(factoryInfoDto.getId());
		factoryInfo.setName(factoryInfoDto.getName());
		factoryInfo.setType(factoryInfoDto.getType());
		factoryInfo.setLegalPerson(factoryInfoDto.getLegalPerson());
		factoryInfo.setTechnology(factoryInfoDto.getTechnology());
		factoryInfo.setTelephone(factoryInfoDto.getTelephone());
		factoryInfo.setMobileTelephone(factoryInfoDto.getMobileTelephone());
		factoryInfo.setAddress(factoryInfoDto.getAddress());
		factoryInfo.setDescription(factoryInfoDto.getDescription());
		factoryInfo.setEnabled(factoryInfoDto.getEnabled());
		return factoryInfo;
	}
	
	/**
	 * @description Dto转Domian
	 * @return FactoryInfoDto
	 * @param factoryInfo
	 */
	public FactoryInfoDto DomaintoDto(BusFactoryInfo factoryInfo){
		if(null==factoryInfo){
			return null;
		}
		FactoryInfoDto factoryInfoDto = new FactoryInfoDto();
		factoryInfoDto.setId(factoryInfo.getId());
		factoryInfoDto.setName(factoryInfo.getName());
		factoryInfoDto.setType(factoryInfo.getType());
		factoryInfoDto.setLegalPerson(factoryInfo.getLegalPerson());
		factoryInfoDto.setTechnology(factoryInfo.getTechnology());
		factoryInfoDto.setTelephone(factoryInfo.getTelephone());
		factoryInfoDto.setMobileTelephone(factoryInfo.getMobileTelephone());
		factoryInfoDto.setAddress(factoryInfo.getAddress());
		factoryInfoDto.setDescription(factoryInfo.getDescription());
		factoryInfoDto.setEnabled(factoryInfo.getEnabled());
		return factoryInfoDto;
	}
	
	/**
	 * @description domians转dtos
	 * @return List<FactoryInfoDto>
	 * @param factoryInfos
	 * @return
	 */
	public List<FactoryInfoDto> DomainstoDtos(List<BusFactoryInfo> factoryInfos){
		
		List<FactoryInfoDto> factoryInfoDtos = new ArrayList<FactoryInfoDto>();
		if (null != factoryInfos && factoryInfos.size() > 0) {
			for (BusFactoryInfo factoryInfo : factoryInfos) {
				FactoryInfoDto factoryInfoDto = DomaintoDto(factoryInfo);
				if (null != factoryInfoDto) {
					factoryInfoDtos.add(factoryInfoDto);
				}
			}
		}
		return factoryInfoDtos;
	}
	
	
	/**
	 * 厂商禁用
	 * @param factoryId
	 * @return
	 */
	public Boolean disable(String factoryId) {
		try{
			String hql = "update BusFactoryInfo set enabled = false where id = '"+ factoryId+"' ";
			factoryInfoDao.excuteHQL(hql);
		}catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
	
	/**
	 * 厂商启用
	 * @param factoryId
	 * @return
	 */
	public Boolean enable(String factoryId) {
		try{
			String hql = "update BusFactoryInfo set enabled = true where id = '"+ factoryId+"' ";
			factoryInfoDao.excuteHQL(hql);
		}catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}

	/**
	 * 获取被禁用在厂商
	 * @return
	 */
	public List<FactoryInfoDto> getDisableFactory() {
		String hql = "select new cn.com.fsun.bus.dto.FactoryInfoDto " +
				"(id,name,type,legalPerson,technology,telephone,mobileTelephone,address,description) " +
				"from BusFactoryInfo where enabled = false ";		
		return factoryInfoDao.findFactory(hql);
	}

	/**
	 * 判别修改的厂家的名称是否唯一值
	 * @param name 厂家名称
	 * @param id 厂家编号
	 * @return
	 */
	public boolean uniqueName(String name, String id) {
		String hql = "select count(*) from BusFactoryInfo ";
		String where = "where 1=1 ";
		if(id!=null && !"".equals(id)){
			
			where += "and name = '"+ name +"' and id != '"+ id +"' ";
		}else{
			where += "and name = '"+ name +"' ";
		}
		return factoryInfoDao.getCountForInfo(hql+where)==0;
	}

}
