package cn.com.fsun.bus.web;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.fsun.bus.dto.CustomerDto;
import cn.com.fsun.bus.service.CustomerService;
import cn.com.fsun.common.dto.CommonDto;
import cn.com.fsun.common.result.JsonResult;
import cn.com.fsun.common.result.JsonUtil;
import cn.com.fsun.common.utils.PageInfo;
import cn.com.fsun.common.web.BaseController;
import cn.com.fsun.constants.CommonConstant;
import cn.com.fsun.sys.service.LogService;

@Controller
@RequestMapping("/bus/customer")
public class CustomerController extends BaseController {
	
	/*@Autowired
	private CustomerTypeProductService CustomerTypeProductService;*/

	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private LogService logService;
	
	private String message = null;
	
	/**
	 * @description 加载列表
	 * @return List<CustomerDto>
	 * @return
	 * @update 2012-8-13 上午10:58:27
	 */
	@RequestMapping(value = "/list", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<CustomerDto> list(CustomerDto customerDto) {
		return customerService.list();
	}
	
	/**
	 * @description 加载列表
	 * @return ModelMap
	 * @return
	 * @update 2012-8-13 上午10:58:27
	 */
	@RequestMapping(value = "/getEnableList", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<CustomerDto> getEnableList() {
		return customerService.getEnableList();
	}
	
	/**
	 * @description 加载列表
	 * @return List<CommonDto>
	 * @return
	 * @update 2012-8-13 上午10:58:27
	 */
	@RequestMapping(value = "/getNames", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<CommonDto> getNames(CustomerDto customerDto) {
		return customerService.getNames();
	}
	
	/**
	 * @description 加载列表
	 * @return List<CommonDto>
	 * @return
	 * @update 2012-8-13 上午10:58:27
	 */
	@RequestMapping(value = "/getContacts", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<CommonDto> getContacts(CustomerDto customerDto) {
		return customerService.getContacts();
	}
	
	/**
	 * @description 加载列表(被启用的)
	 * @return ModelMap
	 * @return
	 * @update 2012-8-13 上午10:58:27
	 */
	@RequestMapping(value = "/getEnabledList", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<CustomerDto> getEnabledList(CustomerDto customerDto) {
		 return customerService.getEnabledList(customerDto);
	}
	
	/**
	 * @description 查询
	 * @return ModelMap
	 * @param factoryInfoDto
	 * @return
	 * @update 2013-3-11
	 */
	@RequestMapping(value = "/search", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap search(CustomerDto customerDto){
		PageInfo pageInfo = new PageInfo();
		if(null!=customerDto){
			if(null!=customerDto.getRows()&& null!=customerDto.getPage()){
				int firstRecord = (customerDto.getPage()-1)*customerDto.getRows();
				pageInfo.setFirstRecord(firstRecord);
				pageInfo.setPageSize(customerDto.getRows());
			}
			if(StringUtils.isNotEmpty(customerDto.getSort())){
				pageInfo.setSortColumn(customerDto.getSort());
			}
			if(StringUtils.isNotEmpty(customerDto.getOrder())){
				pageInfo.setSortType(customerDto.getOrder());
			}
		}
				
		List<CustomerDto> customerDtos = customerService.search(customerDto,pageInfo);
		return JsonUtil.getObjectList(Boolean.TRUE, customerDtos, customerService.getSearchCount(customerDto, pageInfo));
	}
	
	
	/**
	 * @description 判别是否是唯一值
	 * @return ModelMap
	 * @return
	 * @update 2012-8-13 上午10:58:27
	 */
	@RequestMapping(value = "/uniqueName", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap uniqueName(CustomerDto customerDto) {
		return JsonUtil.getResult(uniqueFactoryName(customerDto));
	}
	
	private boolean uniqueFactoryName(CustomerDto customerDto){
		if(customerDto.getName()==null || "".equals(customerDto.getName())){
			return true;
		}
		return customerService.uniqueCustomerName(customerDto.getName(),customerDto.getId());	
	}
	
	/**
	 * @description 增加或者更新
	 * @return ModelMap
	 * @param customerDto
	 * @return
	 * @update 2013-2-21
	 */
	@RequestMapping(value = "/save", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap save(CustomerDto customerDto) {
		Integer loglevel = null;
		
		Boolean isUnique = uniqueFactoryName(customerDto);
		if(!isUnique){
			message = "客户名称已经存在！";
			return JsonResult.getResult(isUnique,message);
		}
		
		customerDto.setEnabled(true);
		CustomerDto successCustomer = customerService.save(customerDto);
		if( null!=customerDto.getId() ){
			message = "客户: " + customerDto.getName()+ "更新成功";
			loglevel = CommonConstant.Log_Type_UPDATE;
		}else{
			message = "客户： " + customerDto.getName()+ "插入成功";
			loglevel = CommonConstant.Log_Type_INSERT;
		}
		logService.addLog(message, loglevel, CommonConstant.Log_Leavel_INFO);
		return JsonUtil.getObject(Boolean.TRUE,successCustomer);
	}
	
	
	/**
	 * @description 加载一个菜单节点
	 * @return ModelMap
	 * @return
	 * @update 2012-8-13 上午10:58:27
	 */
	@RequestMapping(value = "/load", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap load(@RequestParam("id") String id) {
		CustomerDto customerDto = customerService.load(id);
		if (null != customerDto) {
			return JsonUtil.getObject(Boolean.TRUE, customerDto);
		} else {
			return JsonUtil.getResult(Boolean.FALSE);
		}
	}
	
	/**
	 * @description 删除一条记录
	 * @return ModelMap
	 * @param id
	 * @update 2012-8-9 下午3:53:10
	 */
	@RequestMapping(value = "/delete", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap delete(@RequestParam("id") String id) {
		if(null!=id&&!"".equalsIgnoreCase(id)){
			String ids[] = id.split(",");
			//删除多条记录
			if(null!=ids && ids.length>0){
				for(int i=0;i<ids.length;i++){
					customerService.delete(ids[i]);
					/*if(factoryTypeProductService.removeCustomer(ids[i])){
						message = "客户厂家ID：" + ids[i] + "及相关信息删除成功";
						logService.addLog(message, CommonConstant.Log_Type_DEL, CommonConstant.Log_Leavel_INFO);
					}	*/				
				}
			}
			
		}
		return JsonUtil.getResult(Boolean.TRUE);
	}
	
	/**
	 * @description 禁用一条或多条记录
	 * @return ModelMap
	 * @param id
	 * @update 2012-8-9 下午3:53:10
	 */
	@RequestMapping(value = "/disable", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap disable(@RequestParam("id") String id) {
		if(null!=id&&!"".equalsIgnoreCase(id)){
			String ids[] = id.split(",");
			//删除多条记录
			if(null!=ids && ids.length>0){
				for(int i=0;i<ids.length;i++){
					customerService.disable(ids[i]);
					message = "客户ID：" + ids[i] + "禁用成功";
					logService.addLog(message, CommonConstant.Log_Type_UPDATE, CommonConstant.Log_Leavel_INFO);
				}
			}
		}
		return JsonUtil.getResult(Boolean.TRUE);
	}
	
	/**
	 * @description 加载列表
	 * @return ModelMap
	 * @return
	 * @update 2012-8-13 上午10:58:27
	 */
	@RequestMapping(value = "/getDisableCustomer", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap getDisableCustomer(CustomerDto customerDto) {
		List<CustomerDto> list = customerService.getDisableCustomer();
		return JsonUtil.getObjectList(Boolean.TRUE, list, list.size());
	}
	
	
	
	/**
	 * @description 启用一条或多条记录
	 * @return ModelMap
	 * @param id
	 * @update 2012-8-9 下午3:53:10
	 */
	@RequestMapping(value = "/enable", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap enable(@RequestParam("id") String id) {
		if(null!=id&&!"".equalsIgnoreCase(id)){
			String ids[] = id.split(",");
			//删除多条记录
			if(null!=ids && ids.length>0){
				for(int i=0;i<ids.length;i++){
					customerService.enable(ids[i]);
					message = "客户ID：" + ids[i] + "启用成功";
					logService.addLog(message, CommonConstant.Log_Type_UPDATE, CommonConstant.Log_Leavel_INFO);
				}
			}
		}
		return JsonUtil.getResult(Boolean.TRUE);
	}
	
	/**
	 * @description 显示列表
	 * @return ModelMap
	 * @param
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/manage", method={RequestMethod.GET,RequestMethod.POST})
	public String manage() {		
		return "/bus/customer/manage";		
	}
	
}
