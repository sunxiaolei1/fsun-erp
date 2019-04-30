package cn.com.fsun.bus.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.fsun.bus.dao.StoreDao;
import cn.com.fsun.bus.domain.BusStore;
import cn.com.fsun.bus.dto.StoreDto;
import cn.com.fsun.bus.exception.StoreExistException;
import cn.com.fsun.bus.exception.StoreNotFoundException;
import cn.com.fsun.bus.service.itf.StoreService;

/**
 * 集群service实现类
 * @author lee
 *
 */
@Service
public class StoreServiceImpl implements StoreService {
	
	@Autowired
	private StoreDao storeDao;
	
	@Autowired
	private ServletContext servletContext;

	public void save(StoreDto clusterDto) throws StoreExistException {	
		BusStore cluster =null;
		Integer[] ids = new Integer[1];
		List<StoreDto> list = new ArrayList<StoreDto>(); 
		if(clusterDto.getId()!=null){
			cluster = storeDao.load(clusterDto.getId());
			cluster.setName(clusterDto.getName());
			cluster.setAddress(clusterDto.getAddress());
			cluster.setContacts(clusterDto.getContacts());
			//cluster.setDisable(clusterDto.getDisable());
			cluster.setDescription(clusterDto.getDescription());	
			storeDao.save(cluster);
			ids[0] = clusterDto.getId();				
			list.add(clusterDto);
			this.changeServletStore("update",ids,list);
		}else{
			cluster = DtotoDomain(clusterDto);
			cluster.setDisable(false);
			storeDao.save(cluster);
			ids[0] = cluster.getId();
			list.add(DomaintoDto(cluster));			
			this.changeServletStore("add",ids,list);			
		}	
	}

	public void delete(int id) throws StoreNotFoundException {	
		try{
			storeDao.deleteStore(id);
			Integer[] ids = {id};
			this.changeServletStore("del",ids,null);
		}catch (Exception e) {
			e.printStackTrace();
			throw new StoreNotFoundException();
		}		
	}

	public void delete(Integer[] ids) throws StoreNotFoundException {		
		try{
			storeDao.deleteStores(ids);	
			this.changeServletStore("del",ids,null);
		}catch (Exception e) {
			e.printStackTrace();
			throw new StoreNotFoundException();
		}
	}

	public void disable(int id) throws StoreNotFoundException {
		try{
			storeDao.disableStore(id);	
			Integer[] ids = {id};
			changeServletStore("del",ids,null);
		}catch (Exception e) {
			e.printStackTrace();
			throw new StoreNotFoundException();
		}			
	}

	public void disable(Integer[] ids) throws StoreNotFoundException {	
		try{
			storeDao.disableStores(ids);
			this.changeServletStore("del",ids,null);
		}catch (Exception e) {
			e.printStackTrace();
			throw new StoreNotFoundException();
		}	
	}
	
	public void enable(int id) throws StoreNotFoundException {
		try{
			storeDao.enableStore(id);
			List<StoreDto> list = new ArrayList<StoreDto>();
			list.add(DomaintoDto(storeDao.load(id)));
			Integer[] ids = {id};
			this.changeServletStore("add",ids,list);
		}catch (Exception e) {
			e.printStackTrace();
			throw new StoreNotFoundException();
		}	
	}

	public void enable(Integer[] ids) throws StoreNotFoundException {
		try{
			storeDao.enableStores(ids);	
			List<StoreDto> list = DomainstoDtos(storeDao.getStoresByIds(ids));
			this.changeServletStore("add",ids,list);
		}catch (Exception e) {
			e.printStackTrace();
			throw new StoreNotFoundException();
		}	
	}

	public StoreDto load(int id) throws StoreNotFoundException {
		return DomaintoDto(storeDao.load(id));
	}

	public List<StoreDto> list() {
		return DomainstoDtos(storeDao.list());
	}

	public List<StoreDto> listEnabled() {
		return DomainstoDtos(storeDao.listEnabled());
	}
	
	public List<StoreDto> listDisabled() {
		return DomainstoDtos(storeDao.listDisabled());
	}

	/**
	 * @description Domian转Dto
	 * @return Cluster
	 * @param clusterDto
	 */
	public BusStore DtotoDomain(StoreDto clusterDto){
		if(null==clusterDto){
			return null;
		}
		BusStore cluster = new BusStore();
		cluster.setId(clusterDto.getId());
		cluster.setName(clusterDto.getName());
		cluster.setAddress(clusterDto.getAddress());
		cluster.setContacts(clusterDto.getContacts());
		cluster.setDescription(clusterDto.getDescription());
		cluster.setDisable(clusterDto.getDisable());
		return cluster;
	}
	
	/**
	 * @description Dto转Domian
	 * @return ClusterDto
	 * @param cluster
	 */
	public StoreDto DomaintoDto(BusStore cluster){
		if(null==cluster){
			return null;
		}
		StoreDto clusterDto = new StoreDto();
		clusterDto.setId(cluster.getId());
		clusterDto.setName(cluster.getName());
		clusterDto.setAddress(cluster.getAddress());
		clusterDto.setContacts(cluster.getContacts());
		clusterDto.setDescription(cluster.getDescription());
		clusterDto.setDisable(cluster.getDisable());
		clusterDto.setStatus(cluster.getDisable()?"禁用":"启用");
		return clusterDto;
	}
	
	/**
	 * @description domians转dtos
	 * @return List<ClusterDto>
	 * @param clusters
	 * @return
	 */
	public List<StoreDto> DomainstoDtos(List<BusStore> clusters){
		List<StoreDto> clusterDtos = new ArrayList<StoreDto>();
		if (null != clusters && clusters.size() > 0) {
			for (BusStore cluster : clusters) {
				StoreDto clusterDto = DomaintoDto(cluster);
				if (null != clusterDto) {
					clusterDtos.add(clusterDto);
				}
			}
		}
		return clusterDtos;
	}

	private void changeServletStore(String type,Integer[] clusterIds,List<StoreDto> clusterDtos){
		Map<Integer, String> clusterMap = (Map<Integer, String>) servletContext.getAttribute("stores");
		if("add".equals(type)){	
			for (StoreDto clusterDto : clusterDtos) {
				clusterMap.put(clusterDto.getId(), clusterDto.getName());
			}												
		}else if("update".equals(type)){	
			for (StoreDto clusterDto : clusterDtos) {
				if(clusterMap.get(clusterDto.getId())!=null){
					clusterMap.remove(clusterDto.getId());
					clusterMap.put(clusterDto.getId(), clusterDto.getName());	
				}
			}									
		}else if("del".equals(type)){
			for (int i = 0; i < clusterIds.length; i++) {
				clusterMap.remove(clusterIds[i]);
			}					
		}
	}

}
