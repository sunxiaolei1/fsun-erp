package cn.com.fsun.bus.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.fsun.bus.dto.MaterielDto;
import cn.com.fsun.bus.service.itf.BuyInfoService;
import cn.com.fsun.bus.service.itf.MaterielService;
import cn.com.fsun.common.pageInfo.PageInfo;
import cn.com.fsun.common.result.JsonResult;
import cn.com.fsun.common.result.JsonUtil;
import cn.com.fsun.common.web.BaseController;
import cn.com.fsun.constants.CommonConstant;
import cn.com.fsun.sys.service.LogService;

@Controller
@RequestMapping("/bus/materiel")
public class MaterielController extends BaseController {
	
	@Autowired
	private MaterielService materielService;
	
	@Autowired
	private BuyInfoService buyInfoService;
	
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
		return "/bus/materiel/manage";		
	}
	
	/**
	 * @description 加载列表
	 * @return ModelMap
	 * @return
	 * @update 2012-8-13 上午10:58:27
	 */
	@RequestMapping(value = "/list", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<MaterielDto> list(MaterielDto materielDto) {
		List<MaterielDto> list = materielService.list(materielDto);
		return list;
	}
	
	/**
	 * @description 查询
	 * @return ModelMap
	 * @param productDto
	 * @return
	 * @update 2013-3-11
	 */
	@RequestMapping(value = "/search", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap search(MaterielDto materielDto,PageInfo pageInfo){
		try {
			List<MaterielDto> list = materielService.search(materielDto, pageInfo);
			return JsonUtil.getObjectList(Boolean.TRUE, list, pageInfo.getTotal());
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return JsonUtil.getObjectList(Boolean.TRUE, new ArrayList<MaterielDto>(), 0);	
	}
	
	/**
	 * @description 判别是否是唯一值
	 * @return ModelMap
	 * @return
	 * @update 2012-8-13 上午10:58:27
	 */
	@RequestMapping(value = "/uniqueName", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap uniqueName(MaterielDto materielDto) {
		return JsonUtil.getResult(uniqueMaterielName(materielDto));
	}
	
	
	private boolean uniqueMaterielName(MaterielDto materielDto){
		if(materielDto.getName()==null || "".equals(materielDto.getName())){
			return true;
		}
		return materielService.uniqueMaterielName(materielDto.getName(),materielDto.getId());	
	}
	
	/**
	 * @description 增加或者更新
	 * @return ModelMap
	 * @param productDto
	 * @return
	 * @update 2013-2-21
	 */
	@RequestMapping(value = "/save", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap save(MaterielDto materielDto) {
		Integer loglevel = null;
		Boolean isUnique = uniqueMaterielName(materielDto);
		if(!isUnique){
			message = "物料名称已经存在！";
			return JsonResult.getResult(isUnique, message);
		}
		materielService.save(materielDto);
		if(materielDto.getId()!=null){
			message = "物料: " + materielDto.getName()+ "更新成功";
			loglevel = CommonConstant.Log_Type_UPDATE;
		}else{
			message = "物料： " + materielDto.getName()+ "插入成功";
			loglevel = CommonConstant.Log_Type_INSERT;
		}
		logService.addLog(message, loglevel, CommonConstant.Log_Leavel_INFO);
		return JsonResult.getResult(true, "保存成功！");
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
			MaterielDto dto = materielService.load(id);
			return JsonUtil.getObject(Boolean.TRUE, dto);	
		}catch(Exception e){
			e.printStackTrace();
			return JsonUtil.getObject(Boolean.FALSE, new MaterielDto());	
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
					Long materielId =  Long.valueOf(ids[i]);
					if(buyInfoService.materielUsed(materielId)){
						MaterielDto materielDto = materielService.load(materielId);
						return JsonResult.getResult(false, "物料("+materielDto.getName()+")已存在于采购明细中，不能删除！");
					}
					materielService.delete(Long.valueOf(ids[i]));
					message = "物料ID：" + ids[i] + "删除成功";
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
		try {
			if(null!=id&&!"".equalsIgnoreCase(id)){
				String ids[] = id.split(",");
				//删除多条记录
				if(null!=ids && ids.length>0){
					for(int i=0;i<ids.length;i++){
						materielService.disable(Long.valueOf(ids[i]));
						message = "物料ID：" + ids[i] + "禁用成功";
						logService.addLog(message, CommonConstant.Log_Type_UPDATE, CommonConstant.Log_Leavel_INFO);
					}
				}
			}
			return JsonResult.getResult(Boolean.TRUE);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return JsonResult.getResult(false, "禁用失败！");
	}
	
	/**
	 * @description 加载列表
	 * @return ModelMap
	 * @return
	 * @update 2012-8-13 上午10:58:27
	 */
	@RequestMapping(value = "/getDisableMateriel", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap getDisableProduct(MaterielDto materielDto) {
		List<MaterielDto> list = materielService.getDisableMateriel();
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
		try{
			if(null!=id&&!"".equalsIgnoreCase(id)){
				String ids[] = id.split(",");
				//删除多条记录
				if(null!=ids && ids.length>0){
					for(int i=0;i<ids.length;i++){
						materielService.enable(Long.valueOf(ids[i]));
						message = "物料ID：" + ids[i] + "启用成功";
						logService.addLog(message, CommonConstant.Log_Type_UPDATE, CommonConstant.Log_Leavel_INFO);
					}
				}
			}
			return JsonUtil.getResult(Boolean.TRUE);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return JsonResult.getResult(false, "启用失败！");
	}
	
	
	/************************************** 分类下的物料的增删查操作开始  *************************************/

	/**
	 * 通过分类id获取带分页的物料列表
	 * @param classifyId
	 * @param pageInfo
	 * @return
	 */
	@RequestMapping(value = "/classify/getMateriels", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap getMateriels(@RequestParam("id") Long classifyId,PageInfo pageInfo){
		MaterielDto materielDto = new MaterielDto();
		materielDto.setClassifyId(classifyId);
		List<MaterielDto> materielDtos = materielService.search(materielDto,pageInfo);
		return JsonUtil.getObjectList(Boolean.TRUE, materielDtos, pageInfo.getTotal());
	}
	
//	/**
//	 * @description 查询(用于销售表的货物名称的下拉框的数据)
//	 * @return List<ProductDto> 
//	 * @param factoryTypeProductDto
//	 * @return
//	 * @update 2013-3-11
//	 */
//	@RequestMapping(value = "/productType/getProductsForList", method={RequestMethod.GET,RequestMethod.POST})
//	@ResponseBody
//	public List<ProductDto> getProductsForListForType(ProductTypeDto productTypeDto){
//		return typeProductService.getProducts(productTypeDto);
//	}
//	
//	
//	/**
//	 * @description 查询
//	 * @return ModelMap
//	 * @param factoryInfoDto
//	 * @return
//	 * @update 2013-3-11
//	 */
//	@RequestMapping(value = "/productType/getUnAddedProducts", method={RequestMethod.GET,RequestMethod.POST})
//	@ResponseBody
//	public ModelMap getUnAddedProductsForProductType(ProductTypeDto productTypeDto){
//		List<ProductDto> productDtos = typeProductService.getUnAddedProducts(productTypeDto);
//		return JsonUtil.getObjectList(Boolean.TRUE, productDtos,productDtos.size());
//	}
//
//	
//	/**
//	 * @description 分类添加
//	 * @return ModelMap
//	 * @param factoryId
//	 * @param productTypeId
//	 * @param productId (可能是一个、多个(用逗号分隔)或者无(""))
//	 * @return
//	 * @update 2013-10-29
//	 */
//	@RequestMapping(value = "/productType/typeToProduct", method={RequestMethod.GET,RequestMethod.POST})
//	@ResponseBody
//	public ModelMap typeToProduct(@RequestParam("productTypeId") String productTypeId,@RequestParam("productId") String productId) {
//		//不定选
//		if(productTypeId!=null && !"".equalsIgnoreCase(productTypeId)){
//			if(null!=productId && !"".equalsIgnoreCase(productId)){
//				String productIds[] = productId.split(",");
//				//新增多条记录
//				if(null!=productIds && productIds.length>0){
//					for(int i=0;i<productIds.length;i++){					
//						typeProductService.save(new TypeProductDto(productTypeId,productIds[i]));
//						message = "分类Id"+ productTypeId +"下的产品ID：" + productIds[i] + "插入成功";
//						logService.addLog(message, CommonConstant.Log_Type_INSERT, CommonConstant.Log_Leavel_INFO);
//					}
//				}
//			}
//		}
//		
//		return JsonUtil.getResult(Boolean.TRUE);
//	}
//	
//	/**
//	 * @description 产品去除
//	 * @return ModelMap
//	 * @param typeId
//	 * @return
//	 * @update 2013-10-29
//	 */
//	@RequestMapping(value = "/productType/removeProduct", method={RequestMethod.GET,RequestMethod.POST})
//	@ResponseBody
//	public ModelMap removeProductForProductType(@RequestParam("productTypeId") String productTypeId,@RequestParam("productId") String productId){
//		
//		Boolean isTrue = false;
//		if(productTypeId!=null && !"".equalsIgnoreCase(productTypeId)){
//			if(null!=productId && !"".equalsIgnoreCase(productId)){
//				String[] idsStr = productId.split(",");
//				//移除多条记录
//				String productIds = "";
//			    for (int j = 0; j < idsStr.length; j++) {	
//			    	productIds = productIds + "'"+ idsStr[j] +"',";		
//				}
//			    productIds = productIds.substring(0, productIds.length()-1);
//			    isTrue = typeProductService.removeProduct(productTypeId,productIds);
//			    if(isTrue){
//			    	message = "分类Id"+ productTypeId +"的产品移除成功";
//			    }			
//				logService.addLog(message, CommonConstant.Log_Type_DEL, CommonConstant.Log_Leavel_INFO);
//			}			
//		}
//		return JsonUtil.getResult(isTrue);
//	}
//	/************************************** 分类下的产品的增删查操作结束  *************************************/

}
