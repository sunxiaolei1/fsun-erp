package cn.com.fsun.bus.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.com.fsun.bus.dto.BuyInfoDto;
import cn.com.fsun.bus.dto.FactoryInfoDto;
import cn.com.fsun.bus.service.FactoryInfoService;
import cn.com.fsun.bus.service.itf.BuyInfoService;
import cn.com.fsun.bus.service.itf.PurchaseService;
import cn.com.fsun.common.excel.ExportExcel;
import cn.com.fsun.common.pageInfo.PageInfo;
import cn.com.fsun.common.result.JsonResult;
import cn.com.fsun.common.result.JsonUtil;
import cn.com.fsun.common.web.BaseController;
import cn.com.fsun.constants.CommonConstant;
import cn.com.fsun.sys.service.LogService;

@Controller
@RequestMapping("/bus/buyInfo")
public class BuyInfoController extends BaseController {

	@Autowired
	private BuyInfoService buyInfoService;
	
	@Autowired
	private FactoryInfoService factoryInfoService;
	
	@Autowired
	private PurchaseService purchaseService;
	
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
		return "bus/buyInfo/manage";
	}
	
	/**
	 * @description 显示列表
	 * @return ModelMap
	 * @param
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/manage_edit-{index}-{purchaseId}", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView manage_edit(@PathVariable("index") String index, @PathVariable("purchaseId") String purchaseId) {
		ModelAndView modelAndView = new ModelAndView();		
		modelAndView.setViewName("/bus/buyInfo/manage_edit");
		modelAndView.addObject("currIndex", index);
		modelAndView.addObject("purchaseId", purchaseId);		
		return modelAndView;
	}
	
	/**
	 * @description 加载所有菜单节点
	 * @return ModelMap
	 * @return
	 * @update 2012-8-13 上午10:58:27
	 */
	@RequestMapping(value = "/list", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap list(BuyInfoDto buyInfoDto) {
		List<BuyInfoDto> list = buyInfoService.findBuyInfoByRequest(buyInfoDto);
		return JsonUtil.getObjectList(Boolean.TRUE, list, list.size());
	}
	
	/**
	 * @description 查询
	 * @return ModelMap
	 * @param buyInfoDto
	 * @return
	 * @update 2013-3-11
	 */
	@RequestMapping(value = "/search", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap search(BuyInfoDto buyInfoDto, PageInfo pageInfo){
		try{
			List<BuyInfoDto> buyInfoDtos = buyInfoService.findBuyInfoByRequest(buyInfoDto);//buyInfoService.findBuyInfoByRequestForPage(buyInfoDto,pageInfo);
			return JsonUtil.getObjectList(Boolean.TRUE, buyInfoDtos, buyInfoDtos.size());
		}catch(Exception e){
			e.printStackTrace();
			return JsonUtil.getObjectList(Boolean.TRUE, new ArrayList<BuyInfoDto>(), 0);
		}
		
	}
	
	/**
	 * @description 增加或者更新
	 * @return ModelMap
	 * @param buyInfoDto
	 * @return
	 * @update 2013-2-21
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST )
	@ResponseBody
	public ModelMap save(BuyInfoDto buyInfoDto) {
		Integer loglevel = null;
		BuyInfoDto buyInfoDto1 = null;
		try {
			buyInfoDto1 = buyInfoService.save(buyInfoDto);
		} catch (Exception e) {
			e.printStackTrace();
			return JsonResult.getResult(Boolean.FALSE,"操作异常");
		}
		if(buyInfoDto.getId()!=null){
			message = "采购单("+ buyInfoDto.getPurchaseId() +")下的货号: " + buyInfoDto.getId()+ "更新成功";
			loglevel = CommonConstant.Log_Type_UPDATE;
		}else{
			message = "采购单("+ buyInfoDto1.getPurchaseId() +")下的货号： " + buyInfoDto1.getId()+ "插入成功";
			loglevel = CommonConstant.Log_Type_INSERT;
		}
		logService.addLog(message, loglevel, CommonConstant.Log_Leavel_INFO);
		return JsonUtil.getObject(Boolean.TRUE, buyInfoDto1, purchaseService.load(buyInfoDto.getPurchaseId()));
	}
	
	
	/**
	 * @description 加载一个菜单节点
	 * @return ModelMap
	 * @return
	 * @update 2012-8-13 上午10:58:27
	 */
	@RequestMapping(value = "/load", method = RequestMethod.GET)
	@ResponseBody
	public ModelMap load(@RequestParam("id") Integer id) {
		BuyInfoDto buyInfoDto = buyInfoService.load(id);
		if (null != buyInfoDto) {
			return JsonUtil.getObject(Boolean.TRUE, buyInfoDto);
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
	@RequestMapping(value = "/delete", method = RequestMethod.POST )
	@ResponseBody
	public ModelMap delete(@RequestParam("purchaseId") String purchaseId, @RequestParam("id") String id) {
		if(null!=id&&!"".equalsIgnoreCase(id)){
			String ids[] = id.split(",");
			//删除多条记录
			if(null!=ids && ids.length>0){
				for(int i=0;i<ids.length;i++){
					try{
						buyInfoService.delete(Integer.valueOf(ids[i]),purchaseId);
						message = "采购单("+ purchaseId +")下的货号：" + ids[i] + "删除成功";
						logService.addLog(message, CommonConstant.Log_Type_DEL, CommonConstant.Log_Leavel_INFO);
					}catch(Exception e){
						e.printStackTrace();
						return JsonResult.getResult(Boolean.FALSE,"操作异常");
					}				
			    }
			}
		}
		return JsonUtil.getObject(Boolean.TRUE, "", purchaseService.load(purchaseId));
	}
	
	/**
	 * @description 更新供货厂家
	 * @return ModelMap
	 * @param id
	 * @update 2012-8-9 下午3:53:10
	 */
	@RequestMapping(value = "/updateFactory", method = RequestMethod.POST )
	@ResponseBody
	public ModelMap updateFactory(@RequestParam("purchaseId") String purchaseId, @RequestParam("ids") String ids, 
			@RequestParam("names") String names, @RequestParam("factoryId") String factoryId) {
		
		FactoryInfoDto factoryInfoDto = factoryInfoService.load(factoryId);
		if(factoryInfoDto!=null){
			if(null!=ids && !"".equalsIgnoreCase(ids)){	
				try {
					buyInfoService.updateFactory(ids,factoryId);
				} catch (Exception e) {
					e.printStackTrace();
					return JsonResult.getResult(Boolean.FALSE,"更新供货厂家异常！");
				}
				message = "采购单(" + purchaseId + ")下的物料：("+ names +") 更新为厂家("+ factoryInfoDto.getName() +")成功";
				logService.addLog(message, CommonConstant.Log_Type_DEL, CommonConstant.Log_Leavel_INFO);			
			}
			return JsonUtil.getResult(Boolean.TRUE);
		}
		return JsonResult.getResult(Boolean.FALSE,"供货厂家不存在！");	
	}
	
	
	/**
	 * @description 验收多条记录
	 * @return ModelMap
	 * @param id
	 * @update 2012-8-9 下午3:53:10
	 */
	@RequestMapping(value = "/accept", method = RequestMethod.POST)
	@ResponseBody
	public ModelMap accept(@RequestParam("purchaseId") String purchaseId, @RequestParam("ids") String ids, 
			@RequestParam("names") String names) {
		if(null!=ids && !"".equalsIgnoreCase(ids)){			
			//验收多条记录	
			try {
				buyInfoService.accept(ids);
			} catch (Exception e) {
				e.printStackTrace();
				return JsonResult.getResult(Boolean.FALSE,"验收异常！");
			}
			message = "采购单(" + purchaseId + ")下的物料：("+ names +") 验收成功";
			logService.addLog(message, CommonConstant.Log_Type_DEL, CommonConstant.Log_Leavel_INFO);			
		}
		return JsonUtil.getResult(Boolean.TRUE);
	}
	
	/**
	 * @description 验证是否已经验收成功了
	 * @return ModelMap
	 * @param id
	 * @update 2012-8-9 下午3:53:10
	 */
	@RequestMapping(value = "/acceptSuccess", method = RequestMethod.POST)
	@ResponseBody
	public ModelMap acceptSuccess(@RequestParam("ids") String ids,@RequestParam("names") String names) {
		if(null!=ids && !"".equalsIgnoreCase(ids)){			
			//验收多条记录				
			message = buyInfoService.acceptSuccess(ids,names);
			if(message!=null){
				return JsonResult.getResult(Boolean.TRUE, message);			
			}			
		}		
		return JsonUtil.getResult(Boolean.FALSE);
	}
	
	@RequestMapping(value = "/excelExport", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView excelExport(ModelMap model, HttpServletRequest request,HttpServletResponse response,BuyInfoDto buyInfoDto){
		//view_excel是在spring配置文件里配置的ExcelRevenueReportView,第二个和第三个参数采用键值对方法提供给buildExcelDocument方法使用
		model.addAttribute("fileName", "物料采购明细表");
		HashMap<String,String> header = new HashMap<String,String>();
		header.put("purchaseId", "采购单号");
		header.put("classifyName", "物料分类");
		header.put("materielName", "物料名称");
		header.put("spec", "规格型号");
		header.put("inStatus", "验收状况");		
		header.put("number", "数量");
		header.put("unit", "单位");
		header.put("onePrice", "单价(元)");
		header.put("allPrice", "总价(元)");
		header.put("storeName", "存入仓库");
		header.put("consignee", "收货人");
		header.put("factoryName", "供货厂家");
		header.put("description", "备注");		
		model.addAttribute("titles", header);
		
		List<BuyInfoDto> data = buyInfoService.findBuyInfoByRequestForExcelExport(buyInfoDto);
		model.addAttribute("data", data);
		
		ExportExcel exportExcel =  new ExportExcel(buyInfoDto);
		return new ModelAndView(exportExcel,model);
	}
	
}
