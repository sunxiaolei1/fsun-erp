package cn.com.fsun.bus.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.fsun.bus.dto.StoreDto;
import cn.com.fsun.bus.exception.StoreExistException;
import cn.com.fsun.bus.service.itf.StoreService;
import cn.com.fsun.common.result.JsonUtil;
import cn.com.fsun.common.utils.StringUtils;
import cn.com.fsun.common.web.BaseController;
import cn.com.fsun.constants.CommonConstant;
import cn.com.fsun.constants.UrlConstants;
import cn.com.fsun.sys.service.LogService;

/**
 *  仓库管理
 * @author lee
 *
 */
@Controller(value="clasterController")
@RequestMapping(UrlConstants.Module.STORE)
public class StoreController extends BaseController {
	
	@Autowired
	private StoreService clusterService;
	
	@Autowired
	private LogService logService;

	private String logMessage = null;
	/**
	 * 仓库管理
	 * @return
	 */
	@RequestMapping(UrlConstants.Method.MANAGE)
	public String manage(){
		return UrlConstants.Path.STORE_MANAGE;
	}
	
	/**
	 * @description 列表
	 * @return ModelMap
	 * @param clusterDto
	 * @return
	 */
	@RequestMapping(value = "/list", method = { RequestMethod.GET,RequestMethod.POST })
	@ResponseBody
	public ModelMap list() {
		List<StoreDto> list = clusterService.list();
		return JsonUtil.getObjectList(Boolean.TRUE, list, list.size());
	}
	
	/**
	 * @description 列表
	 * @return ModelMap
	 * @param clusterDto
	 * @return
	 */
	@RequestMapping(value = "/listEnabled", method = { RequestMethod.GET,RequestMethod.POST })
	@ResponseBody
	public List<StoreDto> listEnabled() {
		return clusterService.listEnabled();
	}
	
	/**
	 * @description 列表
	 * @return ModelMap
	 * @param clusterDto
	 * @return
	 */
	@RequestMapping(value = "/listDisabled", method = { RequestMethod.GET,RequestMethod.POST })
	@ResponseBody
	public List<StoreDto> listDisabled() {
		return clusterService.listDisabled();
	}
	
	
	/**
	 * @description 增加或者更新
	 * @return ModelMap
	 * @param clusterDto
	 * @param _parentId
	 * @return
	 */
	@RequestMapping(value = "/save", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap save(StoreDto clusterDto) {
		Integer operateType = null;
		
		try {
			clusterService.save(clusterDto);
		} catch (StoreExistException e) {
			return JsonUtil.getResult(Boolean.FALSE);
		}	
		if(null!=clusterDto && null!= clusterDto.getId()){				
			logMessage = "仓库: " + clusterDto.getName()+ "更新成功";		
			operateType = CommonConstant.Log_Type_UPDATE;
		}else{		
			logMessage = "仓库: " + clusterDto.getName()+ "插入成功";
			operateType = CommonConstant.Log_Type_INSERT;			
		}
		logService.addLog(logMessage, operateType, CommonConstant.Log_Leavel_INFO);
		return JsonUtil.getResult(Boolean.TRUE);
	}
	
	/**
	 * @description 删除一条或者多条记录
	 * @return ModelMap
	 * @param id
	 */
	@RequestMapping(value = "/delete", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap delete(@RequestParam("id") String id,@RequestParam("names") String names) {
		try{
			if(null!=id&&!"".equalsIgnoreCase(id)){
				String ids[] = id.split(",");		
				//删除多条记录
				if(null!=ids){
					if(ids.length>1){
						clusterService.delete(StringUtils.getIdsToInteger(ids));						
					}else{
						clusterService.delete(Integer.valueOf(ids[0]));
					}
					logMessage = "仓库: " + names + "删除成功";
					logService.addLog(logMessage, CommonConstant.Log_Type_DEL, CommonConstant.Log_Leavel_INFO);
				}
				
			}
			return JsonUtil.getResult(Boolean.TRUE);
		}catch (Exception e) {
			return JsonUtil.getResult(Boolean.FALSE);
		}		
	}
	
	/**
	 * @description 禁用一条或者多条记录
	 * @return ModelMap
	 * @param id
	 */
	@RequestMapping(value = "/disable", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap disable(@RequestParam("id") String id,@RequestParam("names") String names) {
		try{
			if(null!=id&&!"".equalsIgnoreCase(id)){
				String ids[] = id.split(",");		
				if(null!=ids){
					if(ids.length>1){
						clusterService.disable(StringUtils.getIdsToInteger(ids));						
					}else{
						clusterService.disable(Integer.valueOf(ids[0]));
					}
					logMessage = "仓库: " + names + "禁用成功";
					logService.addLog(logMessage, CommonConstant.Log_Type_UPDATE, CommonConstant.Log_Leavel_INFO);
				}
				
			}
			return JsonUtil.getResult(Boolean.TRUE);
		}catch (Exception e) {
			e.printStackTrace();
			return JsonUtil.getResult(Boolean.FALSE);
		}		
	}
	
	/**
	 * @description 启用一条或者多条记录
	 * @return ModelMap
	 * @param id
	 */
	@RequestMapping(value = "/enable", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap enable(@RequestParam("id") String id,@RequestParam("names") String names) {
		try{
			if(null!=id&&!"".equalsIgnoreCase(id)){
				String ids[] = id.split(",");		
				//删除多条记录
				if(null!=ids){
					if(ids.length>1){
						clusterService.enable(StringUtils.getIdsToInteger(ids));						
					}else{
						clusterService.enable(Integer.valueOf(ids[0]));
					}
					logMessage = "仓库: " + names + "启用成功";
					logService.addLog(logMessage, CommonConstant.Log_Type_UPDATE, CommonConstant.Log_Leavel_INFO);
				}
				
			}
			return JsonUtil.getResult(Boolean.TRUE);
		}catch (Exception e) {
			return JsonUtil.getResult(Boolean.FALSE);
		}		
	}

}
