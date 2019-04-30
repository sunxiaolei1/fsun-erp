package cn.com.fsun.bus.service.itf;

import java.util.List;

import cn.com.fsun.bus.dto.StoreDto;
import cn.com.fsun.bus.exception.StoreExistException;
import cn.com.fsun.bus.exception.StoreNotFoundException;

/**
 * 集群service接口，ClusterServiceImpl接口需实现此接口
 * 此模块数量不会太多，不需要分页
 * @author lee
 *
 */
public interface StoreService {

	/**
	 * 编辑或者新增
	 * @param clusterDto
	 * @throws StoreExistException
	 */
	void save(StoreDto storeDto) throws StoreExistException;
	
	void delete(int id) throws StoreNotFoundException;
	
	void delete(Integer[] ids) throws StoreNotFoundException;
	
	void disable(int id) throws StoreNotFoundException;
	
	void disable(Integer[] ids) throws StoreNotFoundException;
	
	void enable(int id) throws StoreNotFoundException;
	
	void enable(Integer[] ids) throws StoreNotFoundException;
	
	StoreDto load(int id) throws StoreNotFoundException;
	
	/**
	 * 获取所有cluster，包括disabled
	 * 不需要分页
	 * @return
	 */
	List<StoreDto> list();
	
	
	/**
	 * 获取所有可用状态的cluster
	 * 不需要分页
	 * @return
	 */
	List<StoreDto> listEnabled();
	
	/**
	 * 获取所有不可用状态的cluster
	 * 不需要分页
	 * @return
	 */
	List<StoreDto> listDisabled();
	
}
