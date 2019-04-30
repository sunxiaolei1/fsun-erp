package cn.com.fsun.bus.service.itf;

import java.util.List;

import org.hibernate.exception.ViolatedConstraintNameExtracter;

import cn.com.fsun.bus.dto.MaterielDto;
import cn.com.fsun.common.pageInfo.PageInfo;

public interface MaterielService {

	/**
	 * @description 显示列表（无查询条件）
	 * @return List<ProductDto>
	 * @update 2012-8-13 上午9:36:48
	 */
	public List<MaterielDto> list(MaterielDto materielDto);
	
	
	/**
	 * @description 显示列表（有查询条件）
	 * @return List<MaterielDto>
	 * @update 2012-8-13 上午9:36:48
	 */
	public List<MaterielDto> search(MaterielDto materielDto,PageInfo pageInfo);

	/**
	 * @description 增加或者修改
	 * @return MaterielDto
	 * @param dto
	 * @update 2013-2-21
	 */
	public MaterielDto save(MaterielDto dto);
	
	
	/**
	 * @description 删除一个菜单节点
	 * @return void
	 * @param id
	 * @update 2012-8-13 上午9:37:49
	 */
	public void delete(Long id);
	
	/**
	 * 禁用物料
	 * @param id
	 * @throws Exception 
	 */
	public void disable(Long id) throws Exception;
	
	/**
	 * 启用物料
	 * @param id
	 * @throws Exception 
	 */
	public void enable(Long id) throws Exception;
	
	/**
	 * @description 加载一个菜单节点
	 * @return MaterielDto
	 * @param id
	 * @update 2012-8-13 上午9:38:10
	 */
	public MaterielDto load(Long id);

	/**
	 * 获取被禁用在产品
	 * @return
	 */
	public List<MaterielDto> getDisableMateriel() ;


	public boolean uniqueMaterielName(String name, Long id);

    /**
     * 通过分类id判别是否被物料用过
     * @param classifyId
     * @return
     */
	public boolean classifyUsed(Long classifyId);
	
}
