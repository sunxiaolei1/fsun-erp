package cn.com.fsun.sys.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.fsun.common.service.BaseService;
import cn.com.fsun.common.utils.PageInfo;
import cn.com.fsun.sys.dao.MenuDao;
import cn.com.fsun.sys.dao.PowerDao;
import cn.com.fsun.sys.domain.Menu;
import cn.com.fsun.sys.domain.Power;
import cn.com.fsun.sys.dto.PowerDto;


/**
 * @description service主要提供对对象的增删改查功能
 * @author lw
 */
@Service
public class PowerService extends BaseService{

	@Autowired
	private PowerDao powerDao;
	
	@Autowired
	private MenuDao menuDao;
	
	/**
	 * @description 显示列表（无查询条件）
	 * @return List<Power>
	 * @update 2012-8-13 上午9:36:48
	 */
	public List<PowerDto> list() {

		List<Power> powers = powerDao.list();
		List<PowerDto> powerDtos = DomainstoDtos(powers);
		return powerDtos;
	}
	
	
	/**
	 * @description 显示列表（有查询条件）
	 * @return List<Power>
	 * @update 2012-8-13 上午9:36:48
	 */
	public List<PowerDto> search(PowerDto powerDto,PageInfo pageInfo){
		
		Power power = DtotoDomain(powerDto);
		List<Power> powers = powerDao.search(power, pageInfo);
		List<PowerDto> powerDtos = new ArrayList<PowerDto>();
		if (null != powers && powers.size() > 0) {
			for (Power domain : powers) {
				PowerDto dto = DomaintoDto(domain);
				if (null != dto) {
					if(StringUtils.isNotEmpty(dto.getMenuId())){
						Menu menu = menuDao.load(dto.getMenuId());
						if(null!=menu){
							dto.setMenuName(menu.getName());
						}
					}
					powerDtos.add(dto);
				}
			}
		}
		return powerDtos;
	}
	
	/**
	 * @description 用于显示树
	 * @return List<TreeDto>
	 * @param pid
	 * @return
	 * @update 2013-3-11
	 */
	/*public List<TreeDto> listTree(String pid){
		List<TreeDto> treeDtos = new ArrayList<TreeDto>();
		List<Power> powers = powerDao.getChildren(pid);
		if(null!=powers&&powers.size()>0){
			for(Power power : powers){
				if(null!=power){
					TreeDto treeDto = DomaintoTree(power);
					treeDto.setChildren(listTree(power.getId()));
					treeDtos.add(treeDto);
				}
			}
		}
		return treeDtos;
	}*/

	/**
	 * @description 增加或者修改
	 * @return PowerDto
	 * @param powerDto
	 * @return
	 * @update 2013-2-21
	 */
	public PowerDto save(PowerDto powerDto){
		Power power = DtotoDomain(powerDto);
		if(StringUtils.isNotEmpty(power.getId())){
			power.setUpdateManId(super.getCurrentUserID());
			power.setUpdateTime(new Date());
		}else{
			power.setCreateTime(new Date());
			power.setCreateManId(super.getCurrentUserID());
		}
		powerDao.save(power);
		return DomaintoDto(power);
	}
	
	/**
	 * @description 删除一个菜单节点
	 * @return void
	 * @param id
	 * @update 2012-8-13 上午9:37:49
	 */
	public void delete(String id){
		try{
			powerDao.delete(powerDao.load(id));
		}catch (Exception e) {
//			System.out.println(e.getMessage());
		}
	}
	
	/**
	 * @description 加载一个菜单节点
	 * @return Power
	 * @param id
	 * @update 2012-8-13 上午9:38:10
	 */
	public PowerDto load(String id){
		return DomaintoDto(powerDao.load(id));
	}
	
	/**
	 * @description 根据父节点得到子集
	 * @return List<PowerDto>
	 * @param pid
	 * @return
	 * @update 2013-2-21
	 */
	/*public List<PowerDto> getChildren(String pid){
		List<PowerDto> powerDtos = new ArrayList<PowerDto>();
		String hql = "from Power power where power.pid='"+pid+"'";
		List<Power> powers = powerDao.find(hql);
		if(null!=powers&&powers.size()>0){
			for(Power power : powers){
				powerDtos.add(DomaintoDto(power));
			}
		}
		return powerDtos;
	}*/
	
	/**
	 * @description 禁用
	 * @param power
	 * @return Power
	 * @update 2012-9-5
	 */
	public Boolean forbiddenPower(String id){
		try {
			String hql = "update Power power set power.state="+Boolean.FALSE+" where power.id='"+id+"'";
			powerDao.excuteHQL(hql);
			return Boolean.TRUE;
		} catch (Exception e) {
			System.out.print(e.getMessage());
			return Boolean.FALSE;
		}
	}

	/**
	 * @description 启用
	 * @param power
	 * @return Power
	 * @update 2012-9-5
	 */
	public Boolean startUpPower(String id){
		try {
			String hql = "update Power power set power.state="+Boolean.TRUE+" where power.id='"+id+"'";
			powerDao.excuteHQL(hql);
			return Boolean.TRUE;
		} catch (Exception e) {
			System.out.print(e.getMessage());
			return Boolean.FALSE;
		}
	}
	
	/**
	 * @description 交换节点
	 * @param power
	 * @return Power
	 * @update 2012-9-5
	 */
	public Boolean exchange(String id,String brotherId,String parentNodeId){
		Power current = powerDao.load(id);
		Power brother = powerDao.load(brotherId);
		
		try {
			if(null!=brother && null!=current){
				String hql_current = "update Power power set power.sort='"+brother.getPriority()+"' where power.id = '"+id+"'";
				powerDao.excuteHQL(hql_current);
				
				String hql_brother = "update Power power set power.sort='"+current.getPriority()+"' where power.id = '"+brotherId+"'";
				powerDao.excuteHQL(hql_brother);
				
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
	 * @param powerDto
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public int getSearchCount(PowerDto powerDto,PageInfo pageInfo){
		Power power = DtotoDomain(powerDto);
		List<Power> powers = powerDao.getSearchCount(power, pageInfo);
		if(null!=powers && powers.size()>0){
			return powers.size();
		}else{
			return new Integer(0);
		}
	}
	
	
	/**
	 * @description Domian转Dto
	 * @return Power
	 * @param powerDto
	 */
	public Power DtotoDomain(PowerDto powerDto){
		if(null==powerDto){
			return null;
		}
		Power power = new Power();
		power.setId(powerDto.getId());
		power.setName(powerDto.getName());
		power.setCode(powerDto.getCode());
		power.setMenuId(powerDto.getMenuId());
		power.setPriority(powerDto.getPriority());
		power.setDescription(powerDto.getDescription());
		power.setUrl(powerDto.getUrl());
		power.setEnabled(powerDto.getEnabled());
		power.setCreateTime(powerDto.getCreateTime());
		power.setCreateManId(powerDto.getCreateManId());
		power.setUpdateManId(powerDto.getUpdateManId());
		power.setUpdateTime(powerDto.getUpdateTime());
		return power;
	}
	
	/**
	 * @description Dto转Domian
	 * @return PowerDto
	 * @param power
	 */
	public static PowerDto DomaintoDto(Power power){
		if(null==power){
			return null;
		}
		PowerDto powerDto = new PowerDto();
		powerDto.setId(power.getId());
		powerDto.setName(power.getName());
		powerDto.setCode(power.getCode());
		powerDto.setMenuId(power.getMenuId());
		powerDto.setPriority(power.getPriority());
		powerDto.setDescription(power.getDescription());
		powerDto.setUrl(power.getUrl());
		powerDto.setEnabled(power.getEnabled());
		powerDto.setCreateTime(power.getCreateTime());
		powerDto.setCreateManId(power.getCreateManId());
		powerDto.setUpdateManId(power.getUpdateManId());
		powerDto.setUpdateTime(power.getUpdateTime());
		return powerDto;
	}
	
	/**
	 * @description Domian转Tree
	 * @return PowerDto
	 * @param power
	 */
	/*public TreeDto DomaintoTree(Power power){
		if(null==power){
			return null;
		}
		TreeDto treeDto = new TreeDto();
		treeDto.setId(power.getId());
		treeDto.setText(power.getName());
		treeDto.setIconCls(power.getIconcls());
		TreeAttributeDto treeAttributeDto = new TreeAttributeDto();
		treeAttributeDto.setUrl(power.getUrl());
		treeAttributeDto.set_parentId(power.getPid());
		treeDto.setAttributes(treeAttributeDto);
		
		return treeDto;
	}*/
	
	/**
	 * @description domians转dtos
	 * @return List<PowerDto>
	 * @param powers
	 * @return
	 */
	public static List<PowerDto> DomainstoDtos(List<Power> powers){
		List<PowerDto> powerDtos = new ArrayList<PowerDto>();

		if (null != powers && powers.size() > 0) {
			for (Power power : powers) {
				PowerDto powerDto = DomaintoDto(power);
				if (null != powerDto) {
					powerDtos.add(powerDto);
				}
			}
		}
		return powerDtos;
	}
	
	/**
	 * 判断是否有查看权限
	 * @param userId
	 * @param code
	 * @return
	 */
	public Boolean hasLookPower(String userId ,String code){
		String hql = "SELECT roleId FROM RoleUser roleUser WHERE roleUser.userId ='"+ userId +"'";
		hql = "SELECT DISTINCT powerId FROM RolePower rolePower WHERE rolePower.roleId IN ("+ hql +")";
		hql = "SELECT code FROM Power power WHERE power.code ='"+ code +"' AND  power.id  IN ("+ hql +")";
		List<String> list = menuDao.find(hql);
		if(list!=null && list.size()>0){
			return true;
		}
		return false;		
	}
	
}
