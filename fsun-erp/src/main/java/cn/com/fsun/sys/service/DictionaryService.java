package cn.com.fsun.sys.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.fsun.common.service.BaseService;
import cn.com.fsun.sys.dao.DictionaryDao;
import cn.com.fsun.sys.domain.Dictionary;
import cn.com.fsun.sys.dto.DictionaryDto;

/**
 * @description service主要提供对对象的增删改查功能
 * @author 
 */
@Service
public class DictionaryService extends BaseService{

	@Autowired
	private DictionaryDao dictionaryDao;

	public List<DictionaryDto> getGroupList(DictionaryDto dictionaryDto) {
		
		Dictionary dictionary = dictionaryDao.loadByKey(dictionaryDto.getKey());
		if(dictionary!=null){
			List<Dictionary> dictionaryList=  dictionaryDao.getChildren(dictionary.getId());
			return DomainstoDtos(dictionaryList);
		}
        return null;		
	}
	
	public HashMap<String ,String> getDictionaryMap(String parentKey) {
		
		HashMap<String ,String> map = new HashMap<String ,String>();
		Dictionary dictionary = dictionaryDao.loadByKey(parentKey);
		if(dictionary!=null){
			List<Dictionary> dictionaryList=  dictionaryDao.getChildren(dictionary.getId());
			for (Dictionary dictionary1 : dictionaryList) {
				map.put(dictionary1.getKey(), dictionary1.getValue());
			}
		}
        return map;		
	}
	
//	/**
//	 * @description 显示列表（无查询条件）
//	 * @return List<Dictionary>
//	 * @update 2012-8-13 上午9:36:48
//	 */
//	public List<DictionaryDto> list() {
//
//		List<Dictionary> dictionarys = dictionaryDao.list();
//		List<DictionaryDto> dictionaryDtos = DomainstoDtos(dictionarys);
//		return dictionaryDtos;
//	}
//	
//	
//	/**
//	 * @description 显示列表（有查询条件）
//	 * @return List<Dictionary>
//	 * @update 2012-8-13 上午9:36:48
//	 */
//	public List<DictionaryDto> search(DictionaryDto dictionaryDto,PageInfo pageInfo){
//		
//		Dictionary dictionary = DtotoDomain(dictionaryDto);
//		List<Dictionary> dictionarys = dictionaryDao.search(dictionary, pageInfo);
//		List<DictionaryDto> dictionaryDtos = DomainstoDtos(dictionarys);
//		return dictionaryDtos;
//	}
//	
//	/**
//	 * @description 用于显示树
//	 * @return List<TreeDto>
//	 * @param pid
//	 * @return
//	 * @update 2013-3-11
//	 */
//	public List<TreeDto> listTree(String pid){
//		List<TreeDto> treeDtos = new ArrayList<TreeDto>();
//		List<Dictionary> dictionarys = dictionaryDao.getChildren(pid);
//		if(null!=dictionarys&&dictionarys.size()>0){
//			for(Dictionary dictionary : dictionarys){
//				if(null!=dictionary){
//					TreeDto treeDto = DomaintoTree(dictionary);
//					treeDto.setChildren(listTree(dictionary.getId()));
//					treeDtos.add(treeDto);
//				}
//			}
//		}
//		return treeDtos;
//	}
//
//	/**
//	 * @description 增加或者修改
//	 * @return DictionaryDto
//	 * @param dictionaryDto
//	 * @return
//	 * @update 2013-2-21
//	 */
//	public DictionaryDto save(DictionaryDto dictionaryDto){
//		Dictionary dictionary = DtotoDomain(dictionaryDto);
//		if(StringUtils.isNotEmpty(dictionary.getId())){
//			dictionary.setUpdateManId(super.getCurrentUserID());
//			dictionary.setUpdateTime(new Date());
//		}else{
//			dictionary.setCreateTime(new Date());
//			dictionary.setCreateManId(super.getCurrentUserID());
//			dictionary.setPriority(maxPrioritySamePid(dictionaryDto.get_parentId())+1) ;
//		}
//		dictionaryDao.save(dictionary);
//		return DomaintoDto(dictionary);
//	}
//	
//	
//	public Integer maxPrioritySamePid(String pid ){
//		String hql = "SELECT max(dictionary.priority) FROM Dictionary dictionary where dictionary.pid = '"+pid+"'";
//		if(StringUtils.isEmpty(pid)){
//			hql = "SELECT max(dictionary.priority) FROM Dictionary dictionary where dictionary.pid is null";
//		}
//		Integer maxPriority = 0 ;
//		try {
//			Object obj = dictionaryDao.getSession().createQuery(hql).uniqueResult() ;
//			maxPriority = obj == null ? 0 : (Integer)obj ;
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return maxPriority ;
//	}
//	
//	
//	/**
//	 * @description 删除一个菜单节点
//	 * @return void
//	 * @param id
//	 * @update 2012-8-13 上午9:37:49
//	 */
//	public void delete(String id){
//		try{
//			dictionaryDao.delete(dictionaryDao.load(id));
//		}catch (Exception e) {
////			System.out.println(e.getMessage());
//		}
//	}
//	
//	/**
//	 * @description 加载一个菜单节点
//	 * @return Dictionary
//	 * @param id
//	 * @update 2012-8-13 上午9:38:10
//	 */
//	public DictionaryDto load(String id){
//		return DomaintoDto(dictionaryDao.load(id));
//	}
//	
//	/**
//	 * @description 根据父节点得到子集
//	 * @return List<DictionaryDto>
//	 * @param pid
//	 * @return
//	 * @update 2013-2-21
//	 */
//	public List<DictionaryDto> getChildren(String pid){
//		List<DictionaryDto> dictionaryDtos = new ArrayList<DictionaryDto>();
//		String hql = "from Dictionary dictionary where dictionary.pid='"+pid+"'";
//		List<Dictionary> dictionarys = dictionaryDao.find(hql);
//		if(null!=dictionarys&&dictionarys.size()>0){
//			for(Dictionary dictionary : dictionarys){
//				dictionaryDtos.add(DomaintoDto(dictionary));
//			}
//		}
//		return dictionaryDtos;
//	}
//	
//	/**
//	 * @description 禁用
//	 * @param dictionary
//	 * @return Dictionary
//	 * @update 2012-9-5
//	 */
//	public Boolean forbiddenDictionary(String id){
//		try {
//			String hql = "update Dictionary dictionary set dictionary.enabled="+Boolean.FALSE+" where dictionary.id='"+id+"'";
//			dictionaryDao.excuteHQL(hql);
//			return Boolean.TRUE;
//		} catch (Exception e) {
//			System.out.print(e.getMessage());
//			return Boolean.FALSE;
//		}
//	}
//
//	/**
//	 * @description 启用
//	 * @param dictionary
//	 * @return Dictionary
//	 * @update 2012-9-5
//	 */
//	public Boolean startUpDictionary(String id){
//		try {
//			String hql = "update Dictionary dictionary set dictionary.enabled="+Boolean.TRUE+" where dictionary.id='"+id+"'";
//			dictionaryDao.excuteHQL(hql);
//			return Boolean.TRUE;
//		} catch (Exception e) {
//			System.out.print(e.getMessage());
//			return Boolean.FALSE;
//		}
//	}
//	
//	/**
//	 * @description 获取查询结果数量
//	 * @return int
//	 * @param dictionaryDto
//	 * @param pageInfo
//	 * @return
//	 * @update 2013-3-11
//	 */
//	public int getSearchCount(DictionaryDto dictionaryDto,PageInfo pageInfo){
//		Dictionary dictionary = DtotoDomain(dictionaryDto);
//		List<Dictionary> dictionarys = dictionaryDao.search(dictionary, pageInfo);
//		if(null!=dictionarys && dictionarys.size()>0){
//			return dictionarys.size();
//		}else{
//			return new Integer(0);
//		}
//	}
//	
//	
//	/**
//	 * @description Domian转Tree
//	 * @return DictionaryDto
//	 * @param dictionary
//	 */
//	public TreeDto DomaintoTree(Dictionary dictionary){
//		if(null==dictionary){
//			return null;
//		}
//		TreeDto treeDto = new TreeDto();
//		treeDto.setId(dictionary.getId());
//		treeDto.setText(dictionary.getName());
//		TreeAttributeDto treeAttributeDto = new TreeAttributeDto();
//		treeAttributeDto.set_parentId(dictionary.getPid());
//		treeDto.setAttributes(treeAttributeDto);
//		
//		return treeDto;
//	}
	
	
	/**
	 * @description Domian转Dto
	 * @return Dictionary
	 * @param dictionaryDto
	 */
	public Dictionary DtotoDomain(DictionaryDto dictionaryDto){
		if(null==dictionaryDto){
			return null;
		}
		Dictionary dictionary = new Dictionary();
		dictionary.setId(dictionaryDto.getId());
		dictionary.setKey(dictionaryDto.getKey());
		dictionary.setValue(dictionaryDto.getValue());
		dictionary.setName(dictionaryDto.getName());
		dictionary.setPid(dictionaryDto.getPid());
		dictionary.setEnabled(dictionaryDto.getEnabled());
		dictionary.setSequence(dictionaryDto.getSequence());
		return dictionary;
	}
	
	/**
	 * @description Dto转Domian
	 * @return DictionaryDto
	 * @param dictionary
	 */
	public DictionaryDto DomaintoDto(Dictionary dictionary){
		if(null==dictionary){
			return null;
		}
		DictionaryDto dictionaryDto = new DictionaryDto();
		dictionaryDto.setId(dictionary.getId());
		dictionaryDto.setKey(dictionary.getKey());
		dictionaryDto.setValue(dictionary.getValue());
		dictionaryDto.setName(dictionary.getName());
		dictionaryDto.setPid(dictionary.getPid());
		dictionaryDto.setEnabled(dictionary.getEnabled());
		dictionaryDto.setSequence(dictionary.getSequence());
		return dictionaryDto;
	}
	
	
	/**
	 * @description domians转dtos
	 * @return List<DictionaryDto>
	 * @param dictionarys
	 * @return
	 */
	public List<DictionaryDto> DomainstoDtos(List<Dictionary> dictionarys){
		List<DictionaryDto> dictionaryDtos = new ArrayList<DictionaryDto>();

		if (null != dictionarys && dictionarys.size() > 0) {
			for (Dictionary dictionary : dictionarys) {
				DictionaryDto dictionaryDto = DomaintoDto(dictionary);
				if (null != dictionaryDto) {
					dictionaryDtos.add(dictionaryDto);
				}
			}
		}
		return dictionaryDtos;
	}
	
}
