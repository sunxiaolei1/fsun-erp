package cn.com.fsun.bus.web;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.com.fsun.bus.dto.ProxyOrderDto;
import cn.com.fsun.bus.dto.ProxyOrderHeaderDto;
import cn.com.fsun.bus.dto.ProxyOrderQueryDto;
import cn.com.fsun.bus.exception.UnEnoughOrderCodeException;
import cn.com.fsun.bus.service.itf.ProxyOrderService;
import cn.com.fsun.common.excel.ExportExcel;
import cn.com.fsun.common.excel.NewExcelUtil;
import cn.com.fsun.common.result.JsonUtil;
import cn.com.fsun.common.utils.DateUtil;
import cn.com.fsun.common.utils.PageInfo;
import cn.com.fsun.common.web.BaseController;
import cn.com.fsun.constants.CommonConstant;
import cn.com.fsun.sys.service.LogService;

@Controller
@RequestMapping("/bus/proxyOrder")
public class ProxyOrderController extends BaseController {

	@Autowired
	private ProxyOrderService proxyOrderService;
	
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
		return "bus/proxyOrder/manage";
	}
	
	/**
	 * @description 显示列表
	 * @return ModelMap
	 * @param
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/proxyDetail-{proxyCode}", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView proxyDetailEdit(@PathVariable("proxyCode") String proxyCode) {
		ModelAndView mav = new ModelAndView("bus/proxyOrder/operate/proxy-detail");
		mav.addObject("proxyCode", proxyCode);
		return mav;
	}
	
	/**
	 * @description 显示列表
	 * @return ModelMap
	 * @param
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/toAddProxyPage", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView toAddProxyPage(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("bus/proxyOrder/operate/proxy-add");
		try {		
			mav.addObject("createManName", super.getCurrentUserRealName());
			mav.addObject("proxyCode", proxyOrderService.getInitCode());
		} catch (UnEnoughOrderCodeException e) {
			e.printStackTrace();
		}		
		return mav;
	}
	
	/**
	 * @description 查询
	 * @return ModelMap
	 * @param orderDto
	 * @return
	 * @update 2013-3-11
	 */
	@RequestMapping(value = "/excelExport", method=RequestMethod.GET)
	public void excelExport(ProxyOrderQueryDto proxyOrderQueryDto, 
		HttpServletResponse response){
		
		List<ProxyOrderHeaderDto> headerDtos = new ArrayList<>();	
		PageInfo pageInfo = new PageInfo();
		boolean isPage = false;
		try {					
			if(null!= proxyOrderQueryDto){
				if(StringUtils.isNotEmpty(proxyOrderQueryDto.getSort())){
					pageInfo.setSortColumn(proxyOrderQueryDto.getSort());
				}
				if(StringUtils.isNotEmpty(proxyOrderQueryDto.getOrder())){
					pageInfo.setSortType(proxyOrderQueryDto.getOrder());
				}
			}			
			ProxyOrderHeaderDto headerDto = new ProxyOrderHeaderDto();
			headerDto.setProxyCode(proxyOrderQueryDto.getProxyCode());
			headerDto.setProxyType(proxyOrderQueryDto.getProxyType());
			headerDto.setCustomerCode(proxyOrderQueryDto.getCustomerCode());
			headerDto.setStatus(proxyOrderQueryDto.getStatus());
			headerDtos = proxyOrderService.search(headerDto, pageInfo,isPage);
			
			LinkedHashMap<String,String> fieldMap = new LinkedHashMap<String,String>();	
			fieldMap.put("proxyCode", "加工单号");
			fieldMap.put("customerName", "客户名称");
			fieldMap.put("totalVersions", "版子总数");
			fieldMap.put("number", "单据数量");
			fieldMap.put("orderPrice", "单据金额");
			fieldMap.put("remark", "注意事项");
			fieldMap.put("paidStatus", "是否付款");
			fieldMap.put("proxyStatus", "单据状态");
			fieldMap.put("printStatusName", "打印状态");
			fieldMap.put("receiveTime", "交货日期");
			fieldMap.put("createManName", "制单人");
			fieldMap.put("createTime", "制单时间");
			NewExcelUtil.listToExcel(headerDtos, fieldMap, "加工清单汇总", response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * @description 查询
	 * @return ModelMap
	 * @param orderDto
	 * @return
	 * @update 2013-3-11
	 */
	@RequestMapping(value = "/search", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap search(ProxyOrderQueryDto proxyOrderQueryDto){
		
		List<ProxyOrderHeaderDto> headerDtos = new ArrayList<>();
		try {
			PageInfo pageInfo = new PageInfo();
			boolean isPage = false;
			if(null!= proxyOrderQueryDto){
				if(null!=proxyOrderQueryDto.getRows()&& null!=proxyOrderQueryDto.getPage()){
					int firstRecord = (proxyOrderQueryDto.getPage()-1)*proxyOrderQueryDto.getRows();
					pageInfo.setFirstRecord(firstRecord);
					pageInfo.setPageSize(proxyOrderQueryDto.getRows());
					isPage = true;
				}
				if(StringUtils.isNotEmpty(proxyOrderQueryDto.getSort())){
					pageInfo.setSortColumn(proxyOrderQueryDto.getSort());
				}
				if(StringUtils.isNotEmpty(proxyOrderQueryDto.getOrder())){
					pageInfo.setSortType(proxyOrderQueryDto.getOrder());
				}
			}
			
			ProxyOrderHeaderDto headerDto = new ProxyOrderHeaderDto();
			headerDto.setProxyCode(proxyOrderQueryDto.getProxyCode());
			headerDto.setProxyType(proxyOrderQueryDto.getProxyType());
			headerDto.setCustomerCode(proxyOrderQueryDto.getCustomerCode());
			headerDto.setStatus(proxyOrderQueryDto.getStatus());
			headerDtos = proxyOrderService.search(headerDto, pageInfo,isPage);
			return JsonUtil.getObjectList(Boolean.TRUE, headerDtos, proxyOrderService.getSearchCount(headerDto, pageInfo));

		} catch (Exception e) {
			e.printStackTrace();
			return JsonUtil.getObjectList(Boolean.TRUE, headerDtos, 0);
		}
	}


	
	/**
	 * 获取生产单据编码
	 * @return
	 */
	@RequestMapping(value = "/getInitCode", method = RequestMethod.GET)
	@ResponseBody
	public ModelMap getInitMadeCode() {
		try {		
			String proxyCode = proxyOrderService.getInitCode();
			return JsonUtil.getObject(Boolean.TRUE, proxyCode);
		}catch (UnEnoughOrderCodeException e) {
			e.printStackTrace();
			return JsonUtil.getResult(Boolean.FALSE);
		} catch (Exception e) {
			e.printStackTrace();
			return JsonUtil.getResult(Boolean.FALSE);
		}
	}
	
	
	/**
	 * 新增加工单(表头和明细)
	 * @param proxyOrderDto
	 * @return
	 */
	@RequestMapping(value = "/saveEntry", method = RequestMethod.POST)
	@ResponseBody
	public ModelMap saveEntry(@RequestBody ProxyOrderDto proxyOrderDto, HttpServletRequest request){
		try {
			proxyOrderService.saveEntry(proxyOrderDto);
			message = "加工单(编号:" + proxyOrderDto.getProxyOrderHeader().getProxyCode()+ ")插入成功";
			logService.addLog(message, CommonConstant.Log_Type_INSERT, CommonConstant.Log_Leavel_INFO);
			return JsonUtil.getResult(Boolean.TRUE);
		} catch (Exception e) {
			e.printStackTrace(); 
			String imageUrl = proxyOrderDto.getProxyOrderDetail().getImageUrl();
			if(imageUrl!=null && !"".equals(imageUrl)){
				File f = new File(request.getSession().getServletContext().getRealPath("/") 
					+ CommonConstant.UPLOAD_BASE_PATH + "/product"+imageUrl);
			    f.delete();
			}					
			return JsonUtil.getResult(Boolean.FALSE);
		}
	}
	
	/**
	 * 根据单据编号查询所有的明细
	 * @param proxyCode
	 * @return
	 */
	@RequestMapping(value = "/getEntry", method = RequestMethod.GET)
	@ResponseBody
	public ModelMap getEntry(String proxyCode) {
		try {
			ProxyOrderDto proxyOrderDto = proxyOrderService.getEntry(proxyCode);
			return JsonUtil.getObject(Boolean.TRUE, proxyOrderDto);
		} catch (Exception e) {
			e.printStackTrace();
			return JsonUtil.getResult(Boolean.FALSE);
		}
	}
	
	/**
	 * 更新单据(表头和明细)
	 * @param condition
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/updateEntry", method = RequestMethod.POST)
	@ResponseBody
	public ModelMap updateEntry(@RequestBody ProxyOrderDto proxyOrderDto){
		try {
			proxyOrderService.updateEntry(proxyOrderDto);
			message = "加工单(编号:" + proxyOrderDto.getProxyOrderHeader().getProxyCode()+ ")更新成功";
			logService.addLog(message, CommonConstant.Log_Type_UPDATE, CommonConstant.Log_Leavel_INFO);
			return JsonUtil.getResult(Boolean.TRUE);
		} catch (Exception e) {
			e.printStackTrace();
			return JsonUtil.getResult(Boolean.FALSE);
		}
	}
	
	/**
	 * 删除生产单
	 * @param asnNos
	 * @return
	 */
	@RequestMapping(value = "/deleteEntry", method = RequestMethod.GET)
	@ResponseBody
	public ModelMap delete(String[] proxyCodes){
		try {
			for (String proxyCode : proxyCodes) {
				proxyOrderService.deleteEntry(proxyCode);
				message = "加工单(编号:" + proxyCode + ")删除成功";
				logService.addLog(message, CommonConstant.Log_Type_DEL, CommonConstant.Log_Leavel_INFO);
			}
			return JsonUtil.getResult(Boolean.TRUE);
		} catch (Exception e) {
			e.printStackTrace();
			return JsonUtil.getResult(Boolean.FALSE);
		}
	}
	
	/**
	 * 结单
	 * @param proxyCodes
	 * @return
	 */
	@RequestMapping(value = "/completeProxys", method = RequestMethod.GET)
	@ResponseBody
	public ModelMap completeProxys(String[] proxyCodes){
		try {
			for (String proxyCode : proxyCodes) {
				proxyOrderService.completeProxy(proxyCode);
				message = "加工单(编号:" + proxyCode + ")结单成功";
				logService.addLog(message, CommonConstant.Log_Type_UPDATE, CommonConstant.Log_Leavel_INFO);
			}
			return JsonUtil.getResult(Boolean.TRUE);
		} catch (Exception e) {
			e.printStackTrace();
			return JsonUtil.getResult(Boolean.FALSE);
		}
	}
	
	/**
	 * 获取打印对象
	 * TODO
	 * @Title getProxyPrints   
	 * @param proxyCode
	 * @return ModelMap
	 */
	@RequestMapping(value = "/getProxyPrints", method = RequestMethod.GET)
	@ResponseBody
	public ModelMap getProxyPrints(@RequestParam("proxyCode") String proxyCode){
		try {
			ProxyOrderDto proxyOrderDto = proxyOrderService.getProxyPrints(proxyCode);
			return JsonUtil.getObject(Boolean.TRUE, proxyOrderDto);
		} catch (Exception e) {
			e.printStackTrace();
			return JsonUtil.getResult(Boolean.FALSE);
		}
	}
	
	/**
	 * 标记打印
	 * TODO
	 * @Title signPrint   
	 * @param proxyCode
	 * @return ModelMap
	 */
	@RequestMapping(value = "/signPrint", method = RequestMethod.GET)
	@ResponseBody
	public ModelMap signPrint(@RequestParam("proxyCode") String proxyCode){
		try {
			proxyOrderService.signPrint(proxyCode);
			return JsonUtil.getResult(Boolean.TRUE);
		} catch (Exception e) {
			e.printStackTrace();
			return JsonUtil.getResult(Boolean.FALSE);
		}
	}
	
	
}
