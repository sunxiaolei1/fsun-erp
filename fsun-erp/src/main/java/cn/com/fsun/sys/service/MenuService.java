package cn.com.fsun.sys.service;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.fsun.common.dto.TreeAttributeDto;
import cn.com.fsun.common.dto.TreeDto;
import cn.com.fsun.common.service.BaseService;
import cn.com.fsun.common.utils.PageInfo;
import cn.com.fsun.common.utils.PropertiesUtil;
import cn.com.fsun.sys.dao.DictionaryDao;
import cn.com.fsun.sys.dao.MenuDao;
import cn.com.fsun.sys.domain.Dictionary;
import cn.com.fsun.sys.domain.Menu;
import cn.com.fsun.sys.dto.MenuDto;


/**
 * @description service主要提供对对象的增删改查功能
 * @version 1.0
 */
@Service
public class MenuService extends BaseService{

	@Autowired
	private MenuDao menuDao;
	
	@Autowired
	private DictionaryDao dictionaryDao;
	
	/**
	 * @description 显示列表（无查询条件）
	 * @return List<Menu>
	 * @update 2012-8-13 上午9:36:48
	 */
	public List<MenuDto> list() {

		List<Menu> menus = menuDao.list();
		List<MenuDto> menuDtos = DomainstoDtos(menus);
		return menuDtos;
	}
	
	
	/**
	 * @description 显示列表（有查询条件）
	 * @return List<Menu>
	 * @update 2012-8-13 上午9:36:48
	 */
	public List<MenuDto> search(MenuDto menuDto,PageInfo pageInfo){
		
		Menu menu = DtotoDomain(menuDto);
		List<Menu> menus = menuDao.search(menu, pageInfo);
		List<MenuDto> menuDtos = DomainstoDtos(menus);
		return menuDtos;
	}
	
	/**
	 * @description 用于显示树
	 * @return List<TreeDto>
	 * @param pid
	 * @return
	 * @update 2013-3-11
	 */
	public List<TreeDto> listTree(String pid){
		List<TreeDto> treeDtos = new ArrayList<TreeDto>();
		List<Menu> menus = menuDao.getChildren(pid);
		if(null!=menus&&menus.size()>0){
			for(Menu menu : menus){
				if(null!=menu){
					TreeDto treeDto = DomaintoTree(menu);
					treeDto.setChildren(listTree(menu.getId()));
					treeDtos.add(treeDto);
				}
			}
		}
		return treeDtos;
	}
	
	/**
	 * @description 用于显示树
	 * @return List<TreeDto>
	 * @param pid
	 * @return
	 * @update 2013-3-11
	 */
	public List<TreeDto> listMyTree(){
		String userId  = super.getCurrentUserID();
		if(StringUtils.isEmpty(userId)){
			return listTree(null);
		}
		List<Menu> menus = menuDao.listByUserId(userId);
		List<TreeDto> fatherMenus = new ArrayList<TreeDto>();//父级菜单
		List<TreeDto> sonMenus = new ArrayList<TreeDto>();//子级菜单
		
		List<TreeDto> resultMenus = null;
		if(null!=menus&&menus.size()>0){
			for(Menu menu : menus){
				if(null!=menu){
					TreeDto treeDto = DomaintoTree(menu);
					if(null!=treeDto.getAttributes().get_parentId()){
						sonMenus.add(treeDto);
					}else{
						fatherMenus.add(treeDto);
					}
				}
			}
			if(fatherMenus.size()==0){
				List<Menu> list = menuDao.find("from Menu menu where menu.pid is null");
				TreeDto first = DomaintoTree(list.get(0));
				fatherMenus.add(first);
			}
			resultMenus = packageMenu(fatherMenus, sonMenus);
		}
		return resultMenus;
	}
	
	/**
	 * @description 封装Menu
	 * @return List<Menu>
	 * @param fatherMenus
	 * @param sonMenus
	 * @update 2012-8-21
	 */
	public static List<TreeDto> packageMenu(List<TreeDto> fatherMenus,List<TreeDto> sonMenus){
		
		for (TreeDto fatherMenu : fatherMenus) {
			List<TreeDto> children = new ArrayList<TreeDto>();
			//遍历子孙节点集合
			for (int i = 0 ; i < sonMenus.size() ; i ++) {
				TreeDto sonMenu = sonMenus.get(i) ;
				if(fatherMenu.getId().equals(sonMenu.getAttributes().get_parentId())){
					children.add(sonMenu) ;
				}
			}
			//删除 已分配的节点
			for (TreeDto child : children) {
				sonMenus.remove(child) ;
			}
			if(children.size()>0){
				fatherMenu.setChildren(children) ;
				//递归
				packageMenu(fatherMenu.getChildren(), sonMenus) ;
			}
		}
		return fatherMenus;
	}
	

	/**
	 * @description 增加或者修改
	 * @return MenuDto
	 * @param menuDto
	 * @return
	 * @update 2013-2-21
	 */
	public MenuDto save(MenuDto menuDto){
		Menu menu = DtotoDomain(menuDto);
		if(StringUtils.isNotEmpty(menu.getId())){
			menu.setUpdateManId(super.getCurrentUserID());
			menu.setUpdateTime(new Date());
		}else{
			menu.setCreateTime(new Date());
			menu.setCreateManId(super.getCurrentUserID());
			menu.setExpanded(true) ;
			menu.setPriority(maxPrioritySamePid(menuDto.get_parentId())+1) ;
		}
		menuDao.save(menu);
		return DomaintoDto(menu);
	}
	
	
	public Integer maxPrioritySamePid(String pid ){
		return menuDao.maxPrioritySamePid(pid) ;
	}
	
	/**
	 * @description 删除一个菜单节点
	 * @return void
	 * @param id
	 * @update 2012-8-13 上午9:37:49
	 */
	public void delete(String id){
		try{
			menuDao.delete(menuDao.load(id));
		}catch (Exception e) {
//			System.out.println(e.getMessage());
		}
	}
	
	/**
	 * @description 加载一个菜单节点
	 * @return Menu
	 * @param id
	 * @update 2012-8-13 上午9:38:10
	 */
	public MenuDto load(String id){
		return DomaintoDto(menuDao.load(id));
	}
	
	/**
	 * @description 根据父节点得到子集
	 * @return List<MenuDto>
	 * @param pid
	 * @return
	 * @update 2013-2-21
	 */
	public List<MenuDto> getChildren(String pid){
		List<MenuDto> menuDtos = new ArrayList<MenuDto>();
		String hql = "from Menu menu where menu.pid='"+pid+"'";
		List<Menu> menus = menuDao.find(hql);
		if(null!=menus&&menus.size()>0){
			for(Menu menu : menus){
				menuDtos.add(DomaintoDto(menu));
			}
		}
		return menuDtos;
	}
	
	/**
	 * @description 禁用
	 * @param menu
	 * @return Menu
	 * @update 2012-9-5
	 */
	public Boolean forbiddenMenu(String id){
		try {
			String hql = "update Menu menu set menu.state="+Boolean.FALSE+" where menu.id='"+id+"'";
			menuDao.excuteHQL(hql);
			return Boolean.TRUE;
		} catch (Exception e) {
			System.out.print(e.getMessage());
			return Boolean.FALSE;
		}
	}

	/**
	 * @description 启用
	 * @param menu
	 * @return Menu
	 * @update 2012-9-5
	 */
	public Boolean startUpMenu(String id){
		try {
			String hql = "update Menu menu set menu.state="+Boolean.TRUE+" where menu.id='"+id+"'";
			menuDao.excuteHQL(hql);
			return Boolean.TRUE;
		} catch (Exception e) {
			System.out.print(e.getMessage());
			return Boolean.FALSE;
		}
	}
	
	/**
	 * @description 交换节点
	 * @param menu
	 * @return Menu
	 * @update 2012-9-5
	 */
	public Boolean exchange(String id,String brotherId){
		Menu current = menuDao.load(id);
		Menu brother = menuDao.load(brotherId);
		
		try {
			if(null!=brother && null!=current){
				String hql_current = "update Menu menu set menu.priority='"+brother.getPriority()+"' where menu.id = '"+id+"'";
				menuDao.excuteHQL(hql_current);
				
				String hql_brother = "update Menu menu set menu.priority='"+current.getPriority()+"' where menu.id = '"+brotherId+"'";
				menuDao.excuteHQL(hql_brother);
				
				return Boolean.TRUE;
			}else{
				return Boolean.FALSE;
			}
		} catch (Exception e) {
			System.out.print(e.getMessage());
			return Boolean.FALSE;
		}
	}
	
	/**
	 * @description 获取查询结果数量
	 * @return int
	 * @param menuDto
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public int getSearchCount(MenuDto menuDto,PageInfo pageInfo){
		Menu menu = DtotoDomain(menuDto);
		List<Menu> menus = menuDao.search(menu, pageInfo);
		if(null!=menus && menus.size()>0){
			return menus.size();
		}else{
			return new Integer(0);
		}
	}
	
	
	/**
	 * @description Domian转Dto
	 * @return Menu
	 * @param menuDto
	 */
	public Menu DtotoDomain(MenuDto menuDto){
		if(null==menuDto){
			return null;
		}
		Menu menu = new Menu();
		menu.setId(menuDto.getId());
		menu.setCode(menuDto.getCode());
		menu.setName(menuDto.getName());
		menu.setUrl(menuDto.getUrl());
		menu.setDescription(menuDto.getDescription());
		menu.setCreateManId(menuDto.getCreateManId());
		menu.setCreateTime(menuDto.getCreateTime());
		menu.setUpdateManId(menuDto.getUpdateManId());
		menu.setUpdateTime(menuDto.getUpdateTime());
		menu.setEnabled(menuDto.getEnabled());
		menu.setPriority(menuDto.getPriority());
		menu.setIcon(menuDto.getIcon());
		menu.setIconcls(menuDto.getIconcls());
		menu.setPid(menuDto.get_parentId());
		
		return menu;
	}
	
	/**
	 * @description Dto转Domian
	 * @return MenuDto
	 * @param menu
	 */
	public static MenuDto DomaintoDto(Menu menu){
		if(null==menu){
			return null;
		}
		MenuDto menuDto = new MenuDto();
		menuDto.setId(menu.getId());
		menuDto.setCode(menu.getCode());
		menuDto.setName(menu.getName());
		menuDto.setUrl(menu.getUrl());
		menuDto.setDescription(menu.getDescription());
		menuDto.setCreateManId(menu.getCreateManId());
		menuDto.setCreateTime(menu.getCreateTime());
		menuDto.setUpdateManId(menu.getUpdateManId());
		menuDto.setUpdateTime(menu.getUpdateTime());
		menuDto.setEnabled(menu.getEnabled());
		menuDto.setPriority(menu.getPriority());
		menuDto.setIcon(menu.getIcon());
		menuDto.setIconcls(menu.getIconcls());
		menuDto.set_parentId(menu.getPid());
		return menuDto;
	}
	
	/**
	 * @description Domian转Tree
	 * @return MenuDto
	 * @param menu
	 */
	public TreeDto DomaintoTree(Menu menu){
		if(null==menu){
			return null;
		}
		TreeDto treeDto = new TreeDto();
		treeDto.setId(menu.getId());
		treeDto.setText(menu.getName());
		treeDto.setIconCls(menu.getIconcls());
		treeDto.setIcon(menu.getIcon());
		TreeAttributeDto treeAttributeDto = new TreeAttributeDto();
		treeAttributeDto.setUrl(menu.getUrl());
		treeAttributeDto.set_parentId(menu.getPid());
		treeDto.setAttributes(treeAttributeDto);
		
		return treeDto;
	}
	
	/**
	 * @description domians转dtos
	 * @return List<MenuDto>
	 * @param menus
	 * @return
	 */
	public static List<MenuDto> DomainstoDtos(List<Menu> menus){
		List<MenuDto> menuDtos = new ArrayList<MenuDto>();

		if (null != menus && menus.size() > 0) {
			for (Menu menu : menus) {
				MenuDto menuDto = DomaintoDto(menu);
				if (null != menuDto) {
					menuDtos.add(menuDto);
				}
			}
		}
		return menuDtos;
	}

	
	/**
	 * 根据条件获取操作权限
	 * getOperatePower时间间隔==0
	 * @param userId
	 * @return
	 */
	public boolean hasOperatePower(String userId) {
		
		List<String> list = getPowerCodesForConditions(userId);	
		Iterator<String> ite = orderOperMap.keySet().iterator();
		while (ite.hasNext()) {
			String operPower = ite.next();
			for (String code : list) {
				if (operPower.equals(code)) {
					return true;
				}
			}
		}	
		return false;
	}
	
	
	/**
	 * 根据条件获取权限(Power中的code字段)
	 * @param userId
	 * @return
	 */
	public List<String> getPowerCodesForConditions(String userId) {
		
		String hql = null;							
		String roleIds = "SELECT roleId FROM RoleUser roleUser WHERE roleUser.userId ='"+ userId +"'";
		String powerIds = "SELECT DISTINCT powerId FROM RolePower rolePower WHERE rolePower.roleId IN ("+ roleIds +")";		
		hql = "SELECT code FROM Power power WHERE  power.id  IN ("+ powerIds +")";			
		if(hql!=null){
			return menuDao.find(hql);
		}else{
			return new ArrayList<String>();
		}		
	}
	
	
	//REST SYSTEM PATH
	public static HashMap<String, String> orderOperMap = null;
	
	static {  
		orderOperMap  = new HashMap<String, String>();
		PropertiesUtil p = new PropertiesUtil("orderDetail-oper.properties");
		Properties ps = p.getProperties();
		Object[] keys = ps.keySet().toArray();
		for (int i = 0; i < keys.length; i++) {
			String key = keys[i]+"";
			String name = "";
			try {
				name = new String(ps.getProperty(key).getBytes("ISO-8859-1"),"UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			orderOperMap.put(key, name);
		}
	} 
	
}
