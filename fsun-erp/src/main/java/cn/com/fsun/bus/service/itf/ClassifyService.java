package cn.com.fsun.bus.service.itf;

import java.util.List;

import cn.com.fsun.bus.dto.ClassifyDto;
import cn.com.fsun.common.pageInfo.PageInfo;

public interface ClassifyService {

	/**
	 * @description 显示列表（无查询条件）
	 * @return List<BuyInfoDto>
	 * @update 2012-8-13 上午9:36:48
	 */
	public List<ClassifyDto> list() ;
	
	
	/**
	 * @description 显示列表（不分页的有查询条件）
	 * @return List<ProductTypeDto>
	 * @update 2012-8-13 上午9:36:48
	 */
	public List<ClassifyDto> search(ClassifyDto classifyDto,PageInfo pageInfo);

	/**
	 * @description 增加或者修改
	 * @return ProductTypeDto
	 * @param productTypeDto
	 * @update 2013-2-21
	 */
	public ClassifyDto save(ClassifyDto classifyDto);
	
	
	/**
	 * @description 删除一个菜单节点
	 * @return void
	 * @param id
	 * @update 2012-8-13 上午9:37:49
	 */
	public void delete(Long id);
	
	/**
	 * @description 加载一个菜单节点
	 * @return ClassifyDto
	 * @param id
	 * @update 2012-8-13 上午9:38:10
	 */
	public ClassifyDto load(Long id);
	
	
	/**
	 * 分类禁用
	 * @param productId
	 * @return
	 */
	public void disable(Long id);
	
	/**
	 * 分类启用
	 * @param productId
	 * @return
	 */
	public void enable(Long id);

	/**
	 * 获取被禁用在分类
	 * @return
	 */
	public List<ClassifyDto> getDisableClassify() ;

	
    /**
     * 判别是否有重名
     * @param name
     * @param id
     * @return
     */
	public boolean uniqueClassifyName(String name, Long id) ;
}
