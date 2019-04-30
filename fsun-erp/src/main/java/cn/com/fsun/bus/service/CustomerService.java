package cn.com.fsun.bus.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.fsun.bus.dao.CustomerDao;
import cn.com.fsun.bus.domain.BusCustomerInfo;
import cn.com.fsun.bus.dto.CustomerDto;
import cn.com.fsun.common.dto.CommonDto;
import cn.com.fsun.common.service.BaseService;
import cn.com.fsun.common.utils.PageInfo;
import cn.com.fsun.common.utils.StringUtil;
import cn.com.fsun.init.SettingsServletContextListener;

@Service
public class CustomerService extends BaseService{

	@Autowired
	private CustomerDao customerDao;
	
	/**
	 * @description 显示列表（无查询条件）
	 * @return List<BuyInfoDto>
	 * @update 2012-8-13 上午9:36:48
	 */
	public List<CustomerDto> list() {

		List<BusCustomerInfo> customerInfos = customerDao.list();
		List<CustomerDto> customerDtos = DomainstoDtos(customerInfos);
		return customerDtos;
	}
	
	/**
	 * @description 显示列表（被启用的）
	 * @return List<CustomerDto>
	 * @update 2012-8-13 上午9:36:48
	 */
	public List<CustomerDto> getEnabledList(CustomerDto customerDto) {

		BusCustomerInfo customerInfo = DtotoDomain(customerDto);
		List<BusCustomerInfo> customerInfos = customerDao.search(customerInfo,new PageInfo());
		List<CustomerDto> customerDtos = DomainstoDtos(customerInfos);
		return customerDtos;
	}
	
	
	/**
	 * @description 显示列表（有查询条件）
	 * @return List<CustomerDto>
	 * @update 2012-8-13 上午9:36:48
	 */
	public List<CustomerDto> search(CustomerDto customerDto,PageInfo pageInfo){
		
		BusCustomerInfo customerInfo = DtotoDomain(customerDto);
		List<BusCustomerInfo> customerInfos = customerDao.search(customerInfo, pageInfo);
		List<CustomerDto> customerDtos = DomainstoDtos(customerInfos);
		return customerDtos;
	}
	
	/**
	 * @description 增加或者修改
	 * @return CustomerDto
	 * @param factoryInfoDto
	 * @update 2013-2-21
	 */
	public CustomerDto save(CustomerDto customerDto){
		BusCustomerInfo customerInfo = null;
		if(!StringUtil.isNotEmpty(customerDto.getId())){
			customerInfo = DtotoDomain(customerDto); 
			int code = SettingsServletContextListener.getMaxCustomerNumber(); 
			customerInfo.setCode(super.formatFormIntToString(code,10000));
		}else{
			customerInfo = customerDao.load(customerDto.getId());
			customerInfo.setAddress(customerDto.getAddress());
			customerInfo.setDescription(customerDto.getDescription());
			customerInfo.setFax(customerDto.getFax());
			customerInfo.setTel(customerDto.getTel());
			customerInfo.setContacts(customerDto.getContacts());
		}
		customerDao.save(customerInfo);
		return DomaintoDto(customerInfo);
		
	}
	
	/**
	 * @description 删除一个菜单节点
	 * @return void
	 * @param id
	 * @update 2012-8-13 上午9:37:49
	 */
	public void delete(String id){
		try{
			BusCustomerInfo customerInfo = customerDao.load(id);
			customerDao.delete(customerInfo);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	/**
	 * @description 加载一个菜单节点
	 * @return CustomerDto
	 * @param id
	 * @update 2012-8-13 上午9:38:10
	 */
	public CustomerDto load(String id){
		return DomaintoDto(customerDao.load(id));
	}
	

	/**
	 * @description 获取查询结果数量
	 * @return int
	 * @param customerDto
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public int getSearchCount(CustomerDto customerDto,PageInfo pageInfo){
		String hql = "select count(a.id) from BusCustomerInfo a where 1=1 ";			
		hql = this.addWhere(customerDto,pageInfo,hql);		
		return customerDao.getCountForInfo(hql);
	}
	
	private String addWhere(CustomerDto customerDto,PageInfo pageInfo,String hql){
		if(customerDto ==null){
		    return hql;
		}
		if(null!=customerDto.getType() && !"".equals(customerDto.getType())){
			hql += " and a.type = "+ customerDto.getType();
		}
		if(null!=customerDto.getName() && !"".equals(customerDto.getName())){
			hql += " and a.name = '%"+ customerDto.getName() +"%' ";
		}
		if(null!=customerDto.getCode() && !"".equals(customerDto.getCode())){
			hql += " and a.code = '%"+ customerDto.getCode() +"%' ";	
		}
		if(null!=customerDto.getContacts() && !"".equals(customerDto.getContacts())){
			hql += " and a.contacts = '%"+ customerDto.getContacts() +"%' ";
		}
		return hql;
	}
	
	
	/**
	 * @description Domian转Dto
	 * @return BusCustomerInfo
	 * @param factoryInfoDto
	 */
	public BusCustomerInfo DtotoDomain(CustomerDto customerDto){
		if(null==customerDto){
			return null;
		}		
		BusCustomerInfo customerInfo = new BusCustomerInfo();
		customerInfo.setId(customerDto.getId());
		customerInfo.setCode(customerDto.getCode());
		customerInfo.setType(customerDto.getType());
		customerInfo.setName(customerDto.getName());
		customerInfo.setContacts(customerDto.getContacts());
		customerInfo.setAddress(customerDto.getAddress());
		customerInfo.setTel(customerDto.getTel());
		customerInfo.setFax(customerDto.getFax());
		customerInfo.setDescription(customerDto.getDescription());
		customerInfo.setEnabled(customerDto.getEnabled());
		customerInfo.setQ(customerDto.getQ());
		return customerInfo;
	}
	
	/**
	 * @description Dto转Domian
	 * @return CustomerDto
	 * @param factoryInfo
	 */
	public CustomerDto DomaintoDto(BusCustomerInfo customerInfo){
		if(null==customerInfo){
			return null;
		}
		CustomerDto customerDto = new CustomerDto();
		customerDto.setId(customerInfo.getId());
		customerDto.setCode(customerInfo.getCode());
		customerDto.setType(customerInfo.getType());
		customerDto.setName(customerInfo.getName());
		customerDto.setContacts(customerInfo.getContacts());
		customerDto.setAddress(customerInfo.getAddress());
		customerDto.setTel(customerInfo.getTel());
		customerDto.setFax(customerInfo.getFax());
		customerDto.setDescription(customerInfo.getDescription());
		customerDto.setEnabled(customerInfo.getEnabled());
		return customerDto;
	}
	
	/**
	 * @description domians转dtos
	 * @return List<CustomerDto>
	 * @param factoryInfos
	 * @return
	 */
	public List<CustomerDto> DomainstoDtos(List<BusCustomerInfo> customerInfos){
		
		List<CustomerDto> customerDtos = new ArrayList<CustomerDto>();
		if (null != customerInfos && customerInfos.size() > 0) {
			for (BusCustomerInfo customerInfo : customerInfos) {
				CustomerDto customerDto = DomaintoDto(customerInfo);
				if (null != customerDto) {
					customerDtos.add(customerDto);
				}
			}
		}
		return customerDtos;
	}
	
	
	/**
	 * 客户禁用
	 * @param factoryId
	 * @return
	 */
	public Boolean disable(String id) {
		try{
			String hql = "update BusCustomerInfo set enabled = false where id = '"+ id +"' ";
			customerDao.excuteHQL(hql);
		}catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
	
	/**
	 * 客户启用
	 * @param factoryId
	 * @return
	 */
	public Boolean enable(String id) {
		try{
			String hql = "update BusCustomerInfo set enabled = true where id = '"+ id +"' ";
			customerDao.excuteHQL(hql);
		}catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}

	/**
	 * 获取被禁用在客户
	 * @return
	 */
	public List<CustomerDto> getDisableCustomer() {
		String hql = "select new cn.com.fsun.bus.dto.CustomerDto " +
				"(id,code,name,contacts,address,tel,fax,description) " +
				"from BusCustomerInfo where enabled = false ";		
		return customerDao.findCostomer(hql);
	}
	
	/**
	 * 获取被启用在客户
	 * @return
	 */
	public List<CustomerDto> getEnableList() {
		String hql = "from BusCustomerInfo where enabled = true ";		
		return customerDao.find(hql);
	}
	
	public CustomerDto loadByCode(String customerCode) {
		return DomaintoDto(customerDao.loadByCode(customerCode));
	}

	/**
	 * 判别修改的客户的名称是否唯一值
	 * @param name 客户名称
	 * @param id 客户编号
	 * @return
	 */
	public boolean uniqueCustomerName(String name, String id) {
		String hql = "select count(*) from BusCustomerInfo ";
		String where = "where 1=1 ";
		if(id!=null){			
			where += "and name = '"+ name +"' and id != '"+ id +"' ";
		}else{
			where += "and name = '"+ name +"' ";
		}
		return customerDao.getCountForInfo(hql+where)==0;
	}
	
	public List<CommonDto> getNames() {
		String hql ="select distinct(name) from BusCustomerInfo where enabled = true ";
		List<String> list = customerDao.find(hql);
		List<CommonDto> cList= new ArrayList<CommonDto>();
		for (int i = 0; i < list.size(); i++) {
			cList.add(new CommonDto("",list.get(i)));
		}
		return cList;
	}
	
	public List<CommonDto> getContacts() {
		String hql ="select distinct(contacts) from BusCustomerInfo where enabled = true ";
		List<String> list = customerDao.find(hql);
		List<CommonDto> cList= new ArrayList<CommonDto>();
		for (int i = 0; i < list.size(); i++) {
			cList.add(new CommonDto("",list.get(i)));
		}
		return cList;
	}
}
