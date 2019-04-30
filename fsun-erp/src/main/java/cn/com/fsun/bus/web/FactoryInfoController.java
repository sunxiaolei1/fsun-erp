package cn.com.fsun.bus.web;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.fsun.bus.dto.FactoryInfoDto;
import cn.com.fsun.bus.exception.DisableDeleteException;
import cn.com.fsun.bus.service.FactoryInfoService;
import cn.com.fsun.common.result.JsonResult;
import cn.com.fsun.common.result.JsonUtil;
import cn.com.fsun.common.utils.PageInfo;
import cn.com.fsun.common.web.BaseController;
import cn.com.fsun.constants.CommonConstant;
import cn.com.fsun.sys.service.LogService;

@Controller
@RequestMapping("/bus/factoryInfo")
public class FactoryInfoController extends BaseController {

	@Autowired
	private FactoryInfoService factoryInfoService;
	
	@Autowired
	private LogService logService;
	
	private String message = null;
	
	/**
	 * @description 加载列表
	 * @return ModelMap
	 * @return
	 * @update 2012-8-13 上午10:58:27
	 */
	@RequestMapping(value = "/list", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<FactoryInfoDto> list(FactoryInfoDto factoryInfoDto) {
		return  factoryInfoService.list();
	}
	
	/**
	 * @description 加载列表
	 * @return ModelMap
	 * @return
	 * @update 2012-8-13 上午10:58:27
	 */
	@RequestMapping(value = "/getFactorylistByTechnology", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<FactoryInfoDto> getFactorylistByTechnology(@RequestParam("technology") String technology) {	
		try {		
			if(technology!=null &&!"".equals(technology)){
				technology = URLDecoder.decode(technology,"utf-8");
			}
		} catch (UnsupportedEncodingException e) {
			technology = "";
			e.printStackTrace();
		}
		return  factoryInfoService.getFactorylistByTechnology(technology);
	}
	
	/**
	 * @description 加载列表
	 * @return ModelMap
	 * @return
	 * @update 2012-8-13 上午10:58:27
	 */
	@RequestMapping(value = "/sale/list", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<FactoryInfoDto> saleList() {
		return factoryInfoService.saleList();
	}
	
	/**
	 * @description 加载列表
	 * @return ModelMap
	 * @return
	 * @update 2012-8-13 上午10:58:27
	 */
	@RequestMapping(value = "/factory/list", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<FactoryInfoDto> factoryList() {
		return factoryInfoService.factoryList();
	}
	
	/**
	 * @description 加载列表
	 * @return ModelMap
	 * @return
	 * @update 2012-8-13 上午10:58:27
	 */
	@RequestMapping(value = "/getEnableList", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<FactoryInfoDto> getEnableList() {
		return factoryInfoService.getEnableList();
	}
	
	/**
	 * @description 加载列表(被启用的)
	 * @return ModelMap
	 * @return
	 * @update 2012-8-13 上午10:58:27
	 */
	@RequestMapping(value = "/getEnabledList", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<FactoryInfoDto> getEnabledList(FactoryInfoDto factoryInfoDto) {
		 return factoryInfoService.getEnabledList(factoryInfoDto);
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
	public ModelMap search(FactoryInfoDto factoryInfoDto){
		PageInfo pageInfo = new PageInfo();
		if(null!=factoryInfoDto){
			if(null!=factoryInfoDto.getRows()&& null!=factoryInfoDto.getPage()){
				int firstRecord = (factoryInfoDto.getPage()-1)*factoryInfoDto.getRows();
				pageInfo.setFirstRecord(firstRecord);
				pageInfo.setPageSize(factoryInfoDto.getRows());
			}
			if(StringUtils.isNotEmpty(factoryInfoDto.getSort())){
				pageInfo.setSortColumn(factoryInfoDto.getSort());
			}
			if(StringUtils.isNotEmpty(factoryInfoDto.getOrder())){
				pageInfo.setSortType(factoryInfoDto.getOrder());
			}
		}
				
		List<FactoryInfoDto> factoryInfoDtos = factoryInfoService.search(factoryInfoDto,pageInfo);
		return JsonUtil.getObjectList(Boolean.TRUE, factoryInfoDtos, factoryInfoService.getSearchCount(factoryInfoDto, pageInfo));
	}
	
	
	/**
	 * @description 判别是否是唯一值
	 * @return ModelMap
	 * @return
	 * @update 2012-8-13 上午10:58:27
	 */
	@RequestMapping(value = "/uniqueName", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap uniqueName(FactoryInfoDto factoryInfoDto) {
		return JsonUtil.getResult(uniqueFactoryName(factoryInfoDto));
	}
	
	private boolean uniqueFactoryName(FactoryInfoDto factoryInfoDto){
		if(factoryInfoDto.getName()==null || "".equals(factoryInfoDto.getName())){
			return true;
		}
		return factoryInfoService.uniqueName(factoryInfoDto.getName(),factoryInfoDto.getId());	
	}
	
	/**
	 * @description 增加或者更新
	 * @return ModelMap
	 * @param factoryInfoDto
	 * @return
	 * @update 2013-2-21
	 */
	@RequestMapping(value = "/save", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap save(FactoryInfoDto factoryInfoDto) {
		Integer loglevel = null;
		
		Boolean isUnique = uniqueFactoryName(factoryInfoDto);
		if(!isUnique){
			message = "厂家名称已经存在！";
			return JsonUtil.getObject(isUnique,message);
		}
		factoryInfoService.save(factoryInfoDto);
		if(StringUtils.isNotEmpty(factoryInfoDto.getId())){
			message = "生产厂家: " + factoryInfoDto.getName()+ "更新成功";
			loglevel = CommonConstant.Log_Type_UPDATE;
		}else{
			message = "生产厂家： " + factoryInfoDto.getName()+ "插入成功";
			loglevel = CommonConstant.Log_Type_INSERT;
		}
		logService.addLog(message, loglevel, CommonConstant.Log_Leavel_INFO);
		return JsonUtil.getResult(Boolean.TRUE);
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
		FactoryInfoDto factoryInfoDto = factoryInfoService.load(id);
		if (null != factoryInfoDto) {
			return JsonUtil.getObject(Boolean.TRUE, factoryInfoDto);
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
		try{
			if(null!=id&&!"".equalsIgnoreCase(id)){
				String ids[] = id.split(",");
				//删除多条记录
				if(null!=ids && ids.length>0){
					for(int i=0;i<ids.length;i++){
						factoryInfoService.delete(ids[i]);
						message = "生产厂家ID：" + ids[i] + "及相关信息删除成功";
						logService.addLog(message, CommonConstant.Log_Type_DEL, CommonConstant.Log_Leavel_INFO);								
					}
				}		
			}	
			return JsonUtil.getResult(Boolean.TRUE);
		}catch(DisableDeleteException e){
			e.printStackTrace();
			return JsonResult.getResult(Boolean.FALSE, e.getMessage());
		}catch(Exception e){
			e.printStackTrace();
			return JsonResult.getResult(Boolean.FALSE, "操作异常");
		}
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
					factoryInfoService.disable(ids[i]);
					message = "厂家ID：" + ids[i] + "禁用成功";
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
	@RequestMapping(value = "/getDisableFactory", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap getDisableFactory(FactoryInfoDto factoryInfoDto) {
		List<FactoryInfoDto> list = factoryInfoService.getDisableFactory();
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
					factoryInfoService.enable(ids[i]);
					message = "厂家ID：" + ids[i] + "启用成功";
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
		return "/bus/factoryInfo/manage";		
	}
	
	
	/**
	 * @description 跳转至新增界面
	 * @return ModelMap
	 * @param
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/toCreate", method=RequestMethod.GET)
	public String toCreate() {		
		return "/bus/factoryInfo/create";		
	}
}
