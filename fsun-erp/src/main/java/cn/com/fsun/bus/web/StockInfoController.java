package cn.com.fsun.bus.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import cn.com.fsun.bus.domain.BusStockDetail;
import cn.com.fsun.bus.dto.StockBaseDto;
import cn.com.fsun.bus.dto.StockDto;
import cn.com.fsun.bus.service.itf.StockService;
import cn.com.fsun.common.utils.FileOperate;
import cn.com.fsun.common.result.JsonResult;
import cn.com.fsun.common.result.JsonUtil;
import cn.com.fsun.common.utils.PageInfo;
import cn.com.fsun.common.utils.UploadUtil;
import cn.com.fsun.common.web.BaseController;
import cn.com.fsun.constants.CommonConstant;
import cn.com.fsun.sys.service.LogService;

@Controller
@RequestMapping("/bus/stock")
public class StockInfoController extends BaseController {

	@Autowired
	private StockService stockService;
	
	@Autowired
	private LogService logService;
	
	private String logMessage = null;
 	
	/**
	 * @description 查询
	 * @return ModelMap
	 * @param userDto
	 * @return
	 * @update 2013-3-11
	 */
	@RequestMapping(value = "/search", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap search(StockBaseDto stockDto){
		PageInfo pageInfo = new PageInfo();
		if(null!=stockDto){
			if(null!=stockDto.getRows()&& null!=stockDto.getPage()){
				int firstRecord = (stockDto.getPage()-1)*stockDto.getRows();
				pageInfo.setFirstRecord(firstRecord);
				pageInfo.setPageSize(stockDto.getRows());
			}
			if(StringUtils.isNotEmpty(stockDto.getSort())){
				pageInfo.setSortColumn(stockDto.getSort());
			}
			if(StringUtils.isNotEmpty(stockDto.getOrder())){
				pageInfo.setSortType(stockDto.getOrder());
			}
		}
		List<StockBaseDto> stockDtos = stockService.search(stockDto, pageInfo);
		return JsonUtil.getObjectList(Boolean.TRUE, stockDtos, stockService.getSearchCount(stockDto, pageInfo));
	}
	

	/**
	 * @description 增加
	 * @return ModelMap
	 * @param stockDto
	 * @return
	 */
	@RequestMapping(value = "/save", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap save(StockBaseDto stockDto,@RequestParam("ficon") MultipartFile ficon,@RequestParam("stockDetails") String stockDetails,
			HttpServletRequest request, HttpServletResponse response) {		
		String imageRootPath = request.getSession().getServletContext().getRealPath("/") + CommonConstant.UPLOAD_BASE_PATH + "/product";
		String imagePath = null;
		try{		
			if(!ficon.isEmpty()){
				imagePath = UploadUtil.buildFile(ficon, imageRootPath);
				stockDto.setImage(imagePath);
			}
			JSONArray json = JSONArray.fromObject(stockDetails);
			List<BusStockDetail> stockDetailList = (List<BusStockDetail>)JSONArray.toCollection(json, BusStockDetail.class);
			stockService.save(stockDto,stockDetailList);		
			logMessage = "货号: " + stockDto.getArtNum()+ "插入成功";
			logService.addLog(logMessage, CommonConstant.Log_Type_INSERT, CommonConstant.Log_Leavel_INFO);		
			return JsonUtil.getResult(Boolean.TRUE);
		}catch (Exception e) {
			e.printStackTrace();
			if(imagePath!=null && !"".equals(imagePath)){			
				FileOperate fileOperate = new FileOperate();			
				fileOperate.delFile(imageRootPath + imagePath);				
			}	
			return JsonResult.getResult(Boolean.FALSE,"保存失败!");
		}
	}
	
	/**
	 * @description 更新
	 * @return ModelMap
	 * @param stockDto
	 * @return
	 */
	@RequestMapping(value = "/update", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap update(StockBaseDto stockDto, @RequestParam("stockDetails") String stockDetails,
			@RequestParam("ficon") MultipartFile ficon,@RequestParam("imageChanged") Boolean imageChanged,HttpServletRequest request) {	
		
		String imageRootPath = request.getSession().getServletContext().getRealPath("/") + CommonConstant.UPLOAD_BASE_PATH + "/product";
		String imagePath = null;
		try{			
			if(!ficon.isEmpty()){
				imagePath = UploadUtil.buildFile(ficon, imageRootPath);
				stockDto.setImage(imagePath);
			}else{
				stockDto.setImage(null);
			}
			JSONArray json = JSONArray.fromObject(stockDetails);
			List<BusStockDetail> stockDetailList = (List<BusStockDetail>)JSONArray.toCollection(json, BusStockDetail.class);
			stockService.update(stockDto,stockDetailList,imageChanged,imageRootPath);
			logMessage = "货号: " + stockDto.getArtNum()+ "更新成功";
			logService.addLog(logMessage, CommonConstant.Log_Type_UPDATE, CommonConstant.Log_Leavel_INFO);
			return JsonUtil.getResult(Boolean.TRUE);
		}catch (Exception e) {
			e.printStackTrace();
			if(imagePath!=null && !"".equals(imagePath)){			
				FileOperate fileOperate = new FileOperate();			
				fileOperate.delFile(imageRootPath + imagePath);				
			}		
			return JsonResult.getResult(Boolean.FALSE,"更新失败!");
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
	public ModelMap load(@RequestParam("id") Long id) {
		StockDto stockDto = stockService.load(id);
		if (null != stockDto) {
			return JsonUtil.getObject(Boolean.TRUE, stockDto);
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
	public ModelMap delete(@RequestParam("ids") String ids,@RequestParam("artNums") String artNums,HttpServletRequest request) {
		try{
			if(null!=ids&&!"".equalsIgnoreCase(ids)){
				String imageRootPath = request.getSession().getServletContext().getRealPath("/") + CommonConstant.UPLOAD_BASE_PATH + "/product";
				stockService.delete(ids,imageRootPath);						
				logMessage = "货号: " + artNums+ "删除成功";
				logService.addLog(logMessage, CommonConstant.Log_Type_DEL, CommonConstant.Log_Leavel_INFO);							
			}
			return JsonUtil.getResult(Boolean.TRUE);
		}catch (Exception e) {
			return JsonResult.getResult(Boolean.FALSE,"删除异常!");
		}
	}

	/**
	 * @description 显示列表
	 * @return ModelMap
	 * @param
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/manage", method={RequestMethod.GET,RequestMethod.POST})
	public String manage() {
		return "bus/stock/manage";
	}
	
	/**
	 * @description 显示列表
	 * @return ModelMap
	 * @param
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/returnManage-{id}", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView returnManage(@PathVariable("id") Long id) {
		ModelAndView mav = new ModelAndView("bus/stock/manage");
		mav.addObject("stockId", id);
		return mav;
	}

	/**
	 * @description 显示列表
	 * @return ModelMap
	 * @param
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/toSearch-{page}-{rows}", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView toSearch(@PathVariable("page") Integer page,@PathVariable("rows") Integer rows) {
		ModelAndView mav = new ModelAndView("bus/stock/search");
		PageInfo pageInfo = new PageInfo();
		if(null!=page && null!=rows){
			int firstRecord = (page-1)*rows;
			pageInfo.setFirstRecord(firstRecord);
			pageInfo.setPageSize(rows);
		}
		List<StockBaseDto> stockDtos = stockService.getStockBaseInfo(pageInfo); 
		mav.addObject("stockBases", stockDtos);
		return mav;
	}
	
	/**
	 * @description 显示列表
	 * @return ModelMap
	 * @param
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/getStockBases-{page}-{rows}", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap getStockBases(@PathVariable("page") Integer page,@PathVariable("rows") Integer rows) {
		try{
			PageInfo pageInfo = new PageInfo();
			if(null!=page && null!=rows){
				int firstRecord = (page-1)*rows;
				pageInfo.setFirstRecord(firstRecord);
				pageInfo.setPageSize(rows);
			}
			return JsonUtil.getObject(Boolean.TRUE, stockService.getStockBaseInfo(pageInfo));
		}catch (Exception e) {
			e.printStackTrace();
			return JsonUtil.getResult(Boolean.FALSE);
		}
		
	}
	
}
