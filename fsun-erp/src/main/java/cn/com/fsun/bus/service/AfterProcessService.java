package cn.com.fsun.bus.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.fsun.bus.dao.AfterProcessDao;
import cn.com.fsun.bus.domain.BusAfterProcess;
import cn.com.fsun.bus.dto.AfterProcessDto;

@Service
public class AfterProcessService {

	@Autowired
	private AfterProcessDao afterProcessDao;	
	
	/**
	 * @description Domian转Dto
	 * @return BusAfterProcess
	 * @param afterProcessDto
	 */
	public static BusAfterProcess DtotoDomain(AfterProcessDto afterProcessDto){
		if(null==afterProcessDto){
			return null;
		}		
		BusAfterProcess busAfterProcess = new BusAfterProcess();
		busAfterProcess.setId(afterProcessDto.getId());
		busAfterProcess.setName(afterProcessDto.getName());
		busAfterProcess.setIsOutsourc(afterProcessDto.getIsOutsourc());
		busAfterProcess.setProductId(afterProcessDto.getProductId());
		busAfterProcess.setNumber(afterProcessDto.getNumber()!=null?afterProcessDto.getNumber():0);
		busAfterProcess.setDemand(afterProcessDto.getDemand());
		busAfterProcess.setDescription(afterProcessDto.getDescription());
		
		return busAfterProcess;
	}
	
	/**
	 * @description Dto转Domian
	 * @return AfterProcessDto
	 * @param busAfterProcess
	 */
	public static AfterProcessDto DomaintoDto(BusAfterProcess busAfterProcess){
		if(null==busAfterProcess){
			return null;
		}
		AfterProcessDto afterProcessDto = new AfterProcessDto();
		afterProcessDto.setId(busAfterProcess.getId());
		afterProcessDto.setName(busAfterProcess.getName());
		afterProcessDto.setIsOutsourc(busAfterProcess.getIsOutsourc());
		afterProcessDto.setProductId(busAfterProcess.getProductId());
		afterProcessDto.setNumber(busAfterProcess.getNumber());
		afterProcessDto.setDemand(busAfterProcess.getDemand());
		afterProcessDto.setDescription(busAfterProcess.getDescription());
		
		return afterProcessDto;
	}
	
	/**
	 * @description domians转dtos
	 * @return List<AfterProcessDto>
	 * @param afterProcessList
	 * @return
	 */
	public static List<AfterProcessDto> DomainstoDtos(List<BusAfterProcess> afterProcessList){
		
		List<AfterProcessDto> afterProcessDtos = new ArrayList<AfterProcessDto>();
		if (null != afterProcessList && afterProcessList.size() > 0) {
			for (BusAfterProcess busAfterProcess : afterProcessList) {
				AfterProcessDto afterProcessDto = DomaintoDto(busAfterProcess);
				if (null != afterProcessDto) {
					afterProcessDtos.add(afterProcessDto);
				}
			}
		}
		return afterProcessDtos;
	}
	
	/**
	 * @description 增加
	 * @return AfterProcessDto
	 * @param afterProcessDto
	 * @return
	 * @update 2013-2-21
	 */
	public AfterProcessDto save(AfterProcessDto afterProcessDto){
		BusAfterProcess busAfterProcess = DtotoDomain(afterProcessDto); 
		busAfterProcess.setId("");
		afterProcessDao.save(busAfterProcess);
		return DomaintoDto(busAfterProcess);
		
	}
	
	/**
	 * @description 删除一个菜单节点
	 * @return void
	 * @param id
	 * @update 2012-8-13 上午9:37:49
	 */
	public void delete(Integer id){		
		afterProcessDao.delete(afterProcessDao.load(id));		
	}
	
	
	/**
	 * @description 加载一个菜单节点
	 * @return AfterProcessDto
	 * @param id
	 * @update 2012-8-13 上午9:38:10
	 */
	public AfterProcessDto load(Integer id){
		return DomaintoDto(afterProcessDao.load(id));
	}

	public List<AfterProcessDto> getProcessByProductId(String productId) {
		return DomainstoDtos(afterProcessDao.getProcessByProductId(productId));
	}

	
}
