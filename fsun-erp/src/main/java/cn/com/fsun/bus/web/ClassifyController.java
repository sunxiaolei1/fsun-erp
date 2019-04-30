package cn.com.fsun.bus.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.fsun.bus.dto.ClassifyDto;
import cn.com.fsun.bus.dto.ProductDto;
import cn.com.fsun.bus.service.itf.ClassifyService;
import cn.com.fsun.bus.service.itf.MaterielService;
import cn.com.fsun.common.pageInfo.PageInfo;
import cn.com.fsun.common.result.JsonResult;
import cn.com.fsun.common.result.JsonUtil;
import cn.com.fsun.common.web.BaseController;
import cn.com.fsun.constants.CommonConstant;
import cn.com.fsun.sys.service.LogService;

@Controller
@RequestMapping("/bus/classify")
public class ClassifyController extends BaseController{

	@Autowired
	private ClassifyService classifyService;
	
	@Autowired
	private MaterielService materielService;

	@Autowired
	private LogService logService;
	
	private String message = null;
	
	/**
	 * @description 显示列表
	 * @return ModelMap
	 * @param
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/manage", method={RequestMethod.GET,RequestMethod.POST})
	public String manage() {		
		return "/bus/classify/manage";		
	}
	
	/**
	 * @description 加载所有列表
	 * @return ModelMap
	 * @return
	 * @update 2012-8-13 上午10:58:27
	 */
	@RequestMapping(value = "/list", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<ClassifyDto> list(ClassifyDto classifyDto) {
		 return classifyService.list();
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
	public ModelMap search(ClassifyDto classifyDto, PageInfo pageInfo){
		List<ClassifyDto> classifyDtos = classifyService.search(classifyDto,pageInfo);
		return JsonUtil.getObjectList(Boolean.TRUE, classifyDtos, classifyDtos.size());
	}
	
	
	/**
	 * @description 判别是否是唯一值
	 * @return ModelMap
	 * @return
	 * @update 2012-8-13 上午10:58:27
	 */
	@RequestMapping(value = "/uniqueName", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap uniqueName(ClassifyDto classifyDto) {
		return JsonUtil.getResult(uniqueClassifyName(classifyDto));
	}
	
	
	private boolean uniqueClassifyName(ClassifyDto classifyDto){
		if(classifyDto.getName()==null || "".equals(classifyDto.getName())){
			return true;
		}
		return classifyService.uniqueClassifyName(classifyDto.getName(),classifyDto.getId());	
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
	public ModelMap save(ClassifyDto classifyDto) {
		Integer loglevel = null;
		
		Boolean isUnique = uniqueClassifyName(classifyDto);
		if(!isUnique){
			message = "分类名称已经存在！";
			return JsonUtil.getObject(isUnique,message);
		}
		classifyService.save(classifyDto);
		if(classifyDto.getId() != null){
			message = "分类: " + classifyDto.getName()+ "更新成功";
			loglevel = CommonConstant.Log_Type_UPDATE;
		}else{
			message = "分类： " + classifyDto.getName()+ "插入成功";
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
	public ModelMap load(@RequestParam("id") Long id) {
		try{
			ClassifyDto classifyDto = classifyService.load(id);
			return JsonUtil.getObject(Boolean.TRUE, classifyDto);
		}catch(Exception e){
			e.printStackTrace();	
		}
		return JsonUtil.getObject(Boolean.FALSE,new ClassifyDto());
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
					Long classifyId =  Long.valueOf(ids[i]);
					if(materielService.classifyUsed(classifyId)){
						ClassifyDto classifyDto = classifyService.load(classifyId);
						return JsonResult.getResult(false, "物料分类("+classifyDto.getName()+")已存在于物料信息中，不能删除！");
					}
					classifyService.delete(classifyId);
					message = "分类ID：" + ids[i] + "删除成功";
					logService.addLog(message, CommonConstant.Log_Type_DEL, CommonConstant.Log_Leavel_INFO);
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
					classifyService.disable(Long.valueOf(ids[i]));
					message = "分类ID：" + ids[i] + "禁用成功";
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
	@RequestMapping(value = "/getDisableClassify", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap getDisableProductType(ProductDto productTypeDto) {
		List<ClassifyDto> list = classifyService.getDisableClassify();
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
					classifyService.enable(Long.valueOf(ids[i]));
					message = "分类ID：" + ids[i] + "启用成功";
					logService.addLog(message, CommonConstant.Log_Type_UPDATE, CommonConstant.Log_Leavel_INFO);
				}
			}
		}
		return JsonUtil.getResult(Boolean.TRUE);
	}

}
