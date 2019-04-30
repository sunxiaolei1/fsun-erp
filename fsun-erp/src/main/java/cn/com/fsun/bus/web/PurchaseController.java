package cn.com.fsun.bus.web;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.com.fsun.bus.dto.BuyInfoDto;
import cn.com.fsun.bus.dto.PosDto;
import cn.com.fsun.bus.dto.ProduceDto;
import cn.com.fsun.bus.dto.PurchaseDto;
import cn.com.fsun.bus.exception.UnEnoughPurchaseCodeException;
import cn.com.fsun.bus.service.itf.PurchaseService;
import cn.com.fsun.common.pageInfo.PageInfo;
import cn.com.fsun.common.result.JsonResult;
import cn.com.fsun.common.result.JsonUtil;
import cn.com.fsun.common.web.BaseController;
import cn.com.fsun.constants.CommonConstant;
import cn.com.fsun.sys.service.LogService;
import cn.com.fsun.sys.service.MenuService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/bus/purchase")
public class PurchaseController extends BaseController {

	@Autowired
	private PurchaseService purchaseService;
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private LogService logService;
	
	private String message = null;
	
	@InitBinder
	private void initBinder(WebDataBinder binder) {
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		CustomDateEditor dateEditor = new CustomDateEditor(fmt, true);
		binder.registerCustomEditor(Date.class, dateEditor);
		binder.registerCustomEditor(Timestamp.class, dateEditor);
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(
				Boolean.TRUE);
		binder.registerCustomEditor(String.class, stringTrimmerEditor);
	}
	
	/**
	 * @description 显示列表
	 * @return ModelMap
	 * @param
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/manage", method={RequestMethod.GET,RequestMethod.POST})
	public String manage() {
		return "bus/purchase/manage";
	}
	
	/**
	 * @description 显示列表
	 * @return ModelMap
	 * @param
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/manage-{purchaseId}-{pageNumber}-{pageSize}", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView manage(@PathVariable("purchaseId") String purchaseId,
			@PathVariable("pageNumber") String pageNumber,@PathVariable("pageSize") String pageSize) {
		ModelAndView mav = new ModelAndView("bus/purchase/manage");
		mav.addObject("purchaseId", purchaseId);
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("pageSize", pageSize);
		return mav;
	}
	
	
	/**
	 * @description 加载所有菜单节点
	 * @return ModelMap
	 * @return
	 * @update 2012-8-13 上午10:58:27
	 */
	@RequestMapping(value = "/list", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<PurchaseDto> list(PurchaseDto purchaseDto) {
		try{
			List<PurchaseDto> list = purchaseService.list(purchaseDto);
			return list;
		}catch(Exception e){
			e.printStackTrace();
		}
		return new ArrayList<PurchaseDto>();
	}
	
	/**
	 * Vlan列表查询(带分页，带条件(name和别名))
	 * @param pageInfo
	 * @param vlanQo
	 * @return
	 */
	@RequestMapping(value="/search", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap search(PageInfo pageInfo , PurchaseDto purchaseDto){
		try {
			List<PurchaseDto> list = purchaseService.getOrderInfoForPage(purchaseDto, pageInfo);
			return JsonUtil.getObjectList(Boolean.TRUE, list, pageInfo.getTotal());
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return JsonUtil.getObjectList(Boolean.TRUE, new ArrayList<PurchaseDto>(), 0);
	}
	
	/**
	 * @description 获取单个订单信息
	 * @return ModelMap
	 * @param orderDto
	 * @return
	 * @update 2013-3-11
	 */
	@RequestMapping(value = "/getOneOrderInfo", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap getOneOrderInfo(PurchaseDto purchaseDto){
		List<PurchaseDto> purchaseDtos = purchaseService.getOrderInfoForPage(purchaseDto, null);
	    if(purchaseDtos!=null && purchaseDtos.size()>0){
	    	return JsonUtil.getObject(Boolean.TRUE, purchaseDtos.get(0));
	    }
	    return JsonUtil.getObject(Boolean.FALSE, new PurchaseDto());
	}
	
	/**
	 * @description 查询
	 * @return ModelMap
	 * @param orderDto
	 * @return
	 * @update 2013-3-11
	*/
	@RequestMapping(value = "/getPosInfo", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<PosDto> getPosInfo(@RequestParam("ids") String ids,@RequestParam("buyInfoIds") String buyInfoIds){
		try{
			return purchaseService.getPosInfo(ids,buyInfoIds,menuService.hasOperatePower(super.getCurrentUserID()));
		}catch(Exception e){
			e.printStackTrace();
			return new ArrayList<PosDto>();
		}
	}
	
	/**
	 * @description 跳转到新增或者编辑订单的界面
	 * @return ModelMap
	 * @param
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/operateOrder-{orderId}-{pageNumber}-{pageSize}", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView operateOrder(@PathVariable("orderId") String orderId,
			@PathVariable("pageNumber") String pageNumber,@PathVariable("pageSize") String pageSize) {
		ModelAndView mav = new ModelAndView("bus/purchase/operate/operate_purchase");
		mav.addObject("orderId", orderId);
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("pageSize", pageSize);
		return mav;
	}
	
	
	/**
	 * @description 增加或者更新
	 * @return ModelMap
	 * @param orderDto
	 * @return
	 * @update 2013-2-21
	 */
	@RequestMapping(value = "/save", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap save(PurchaseDto purchaseDto) {
		Integer loglevel = null;
		try{
			PurchaseDto purchaseDto1 = purchaseService.save(purchaseDto);
			if(StringUtils.isNotEmpty(purchaseDto.getId())){
				message = "采购计划单ID: " + purchaseDto1.getId()+ "更新成功";
				loglevel = CommonConstant.Log_Type_UPDATE;
			}else{
				message = "采购计划单ID: " + purchaseDto1.getId()+ "插入成功";
				loglevel = CommonConstant.Log_Type_INSERT;
			}
			logService.addLog(message, loglevel, CommonConstant.Log_Leavel_INFO);
			return JsonUtil.getResult(Boolean.TRUE);
		}catch(UnEnoughPurchaseCodeException e){
			e.printStackTrace();
			return JsonResult.getResult(Boolean.FALSE, e.getMessage());
		}catch (Exception e) {
			e.printStackTrace();
			return JsonResult.getResult(Boolean.FALSE, "操作异常!");
		}	
	}
	
	/**
	 * @description 增加或者更新
	 * @return ModelMap
	 * @param orderDto
	 * @return
	 * @update 2013-2-21
	 */
	@RequestMapping(value = "/create", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap create(@RequestParam("buyInfo") String buyInfo,@RequestParam("purchaseDto") String purchase) {
		Integer loglevel = null;
		PurchaseDto purchaseDto = null;
		try{
			JSONArray json = JSONArray.fromObject(buyInfo);
			List<BuyInfoDto> buyInfoDtos = (List<BuyInfoDto>)JSONArray.toCollection(json, BuyInfoDto.class);
			
			JSONObject jsonObject = JSONObject.fromObject(purchase);
			purchaseDto = (PurchaseDto) JSONObject.toBean(jsonObject, PurchaseDto.class) ;	
			purchaseDto = purchaseService.create(purchaseDto,buyInfoDtos);			
			
			loglevel = CommonConstant.Log_Type_INSERT;	
			message = "采购计划单ID: " + purchaseDto.getId()+ "插入成功";
			logService.addLog(message, loglevel, CommonConstant.Log_Leavel_INFO);
			return JsonUtil.getResult(Boolean.TRUE);
		}catch(UnEnoughPurchaseCodeException e){
			e.printStackTrace();
			return JsonResult.getResult(Boolean.FALSE, e.getMessage());
		}catch (Exception e) {
			e.printStackTrace();
			return JsonResult.getResult(Boolean.FALSE, "操作异常!");
		}	
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
		PurchaseDto purchaseDto = purchaseService.load(id);
		if (null != purchaseDto) {
			return JsonUtil.getObject(Boolean.TRUE, purchaseDto);
		} else {
			return JsonUtil.getResult(Boolean.FALSE);
		}
	}
	
	/**
	 * @description 删除多条记录(删除订单信息及订单下相关的物料信息)
	 * @return ModelMap
	 * @param id
	 * @update 2012-8-9 下午3:53:10
	 */
	@RequestMapping(value = "/delete", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap delete(@RequestParam("id") String id) {
		
		if(null!=id&&!"".equalsIgnoreCase(id)){			
			try{
				String ids[] = id.split(",");
				for (int i = 0; i < ids.length; i++) {
				    purchaseService.delete(ids[i]);
				    message = "采购单(：" + ids[i] + ")删除成功";
					logService.addLog(message, CommonConstant.Log_Type_DEL, CommonConstant.Log_Leavel_INFO);		
				}
				return JsonUtil.getResult(Boolean.TRUE);
			}catch(Exception e){
				e.printStackTrace();
				return JsonResult.getResult(Boolean.FALSE,"操作异常");
			}	
		}
		return JsonUtil.getResult(Boolean.TRUE);
	}

	
//	/**
//	 * @description 判断订单下是否存在货物信息
//	 * @return ModelMap
//	 * @return
//	 * @update 2012-8-13 上午10:58:27
//	 
//	@RequestMapping(value = "/hasGoods", method={RequestMethod.GET,RequestMethod.POST})
//	@ResponseBody
//	public ModelMap hasGoodForOrder(@RequestParam("id") String id,@RequestParam("orderType") String orderType) {
//		
//		if(null!=id&&!"".equalsIgnoreCase(id)&&null!=orderType&&!"".equalsIgnoreCase(orderType)){
//			String ids[] = id.split(",");
//			String orderTypes[] = orderType.split(",");
//			if(null!=ids && ids.length>0 && null!=orderTypes && orderTypes.length>0){
//				for(int i=0;i<ids.length;i++){
//					orderService.hasGoodForOrder(ids[i],orderTypes[i]);
//				}
//			}
//		}
//		if (null != orderDto) {
//			return JsonUtil.getObject(Boolean.TRUE, orderDto);
//		} else {
//			return JsonUtil.getResult(Boolean.FALSE);
//		}
//	}
//	*/
	
	
//	
//	/**
//	 * @description 显示列表
//	 * @return ModelMap
//	 * @param
//	 * @update 2012-8-9 下午3:52:06
//	 */
//	@RequestMapping(value = "/changeStatus", method={RequestMethod.GET,RequestMethod.POST})
//	@ResponseBody
//	public ModelMap changeStatus(@RequestParam("orderId") String orderId) {
//		Integer loglevel = null;
//		purchaseService.changeStatus(purchaseService.load(orderId));		
//		message = "订单ID: " + orderId+ "更新成功";
//		loglevel = CommonConstant.Log_Type_UPDATE;
//		logService.addLog(message, loglevel, CommonConstant.Log_Leavel_INFO);
//		return JsonUtil.getResult(Boolean.TRUE);
//	}
	
	/**
	 * @description 通过id判别是否有操作权限
	 * @return ModelMap
	 * @param
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/operatePower", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap operatePower(@RequestParam("purchaseId") String purchaseId) {		
		//Boolean operatePower = purchaseService.operatePower(purchaseService.load(purchaseId));
		Boolean operatePower = true;
		return JsonUtil.getResult(operatePower);
	}
	
	
}

