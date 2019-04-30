package cn.com.fsun.sys.web;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.com.fsun.common.utils.DateUtil;
import cn.com.fsun.common.excel.ExcelUtil;
import cn.com.fsun.common.result.JsonUtil;
import cn.com.fsun.common.utils.PageInfo;
import cn.com.fsun.common.web.BaseController;
import cn.com.fsun.constants.CommonConstant;
import cn.com.fsun.constants.ExcelConstants;
import cn.com.fsun.sys.dto.PowerDto;
import cn.com.fsun.sys.service.LogService;
import cn.com.fsun.sys.service.PowerService;


/*
 * @author lw
 */

@Controller
@RequestMapping("/sys/power")
public class PowerController extends BaseController {

	@Autowired
	private PowerService powerService;

	@Autowired
	private LogService logService;
	
	private String message = null;
	
	/**
	 * @description 加载所有菜单节点
	 * @return ModelMap
	 * @return
	 * @update 2012-8-13 上午10:58:27
	 */
	@RequestMapping(value = "/list", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap list() {
		List<PowerDto> list = powerService.list();
		return JsonUtil.getObjectList(Boolean.TRUE, list, list.size());
	}
	
	/**
	 * @description 查询
	 * @return ModelMap
	 * @param powerDto
	 * @return
	 * @update 2013-3-11
	 */
	@RequestMapping(value = "/search", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap search(PowerDto powerDto){
		PageInfo pageInfo = new PageInfo();
		if(null!=powerDto){
			int firstRecord = (powerDto.getPage()-1)*powerDto.getRows();
			pageInfo.setFirstRecord(firstRecord);
			pageInfo.setPageSize(powerDto.getRows());
			if(StringUtils.isNotEmpty(powerDto.getSort())){
				pageInfo.setSortColumn(powerDto.getSort());
			}
			if(StringUtils.isNotEmpty(powerDto.getOrder())){
				pageInfo.setSortType(powerDto.getOrder());
			}
		}
		List<PowerDto> powerDtos = powerService.search(powerDto, pageInfo);
		return JsonUtil.getObjectList(Boolean.TRUE, powerDtos, powerService.getSearchCount(powerDto, pageInfo));
	}
	
	
	/**
	 * @description 用于生成树
	 * @return List<TreeDto>
	 * @return
	 * @update 2013-3-11
	 */
	/*@RequestMapping(value = "/listTree", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<TreeDto> listTree() {
		List<TreeDto> list = powerService.listTree(null);
		return list;
	}*/

	/**
	 * @description 增加或者更新
	 * @return ModelMap
	 * @param powerDto
	 * @param _parentId
	 * @return
	 * @update 2013-2-21
	 */
	@RequestMapping(value = "/save", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap save(PowerDto powerDto) {
		Integer operateType = null;
		powerService.save(powerDto);
		if(StringUtils.isNotEmpty(powerDto.getId())){
			message = "权限: " + powerDto.getName()+ "更新成功";
			operateType = CommonConstant.Log_Type_UPDATE;
		}else{
			message = "权限: " + powerDto.getName()+ "插入成功";
			operateType = CommonConstant.Log_Type_INSERT;
		}
		logService.addLog(message, operateType, CommonConstant.Log_Leavel_INFO);
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
		PowerDto powerDto = powerService.load(id);
		if (null != powerDto) {
			return JsonUtil.getObject(Boolean.TRUE, powerDto);
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
					PowerDto powerDto = powerService.load(ids[i]);
					powerService.delete(ids[i]);
					message = "权限：" + powerDto.getName() + "删除成功";
					logService.addLog(message, CommonConstant.Log_Type_DEL, CommonConstant.Log_Leavel_INFO);
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
		return "sys/power/manage";
	}

	/**
	 * @description 上移
	 * @return ModelMap
	 * @param power
	 * @update 2012-8-9 下午3:52:36
	 */
	@RequestMapping(value = "/upgrade", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap upgrade(@RequestParam("id") String id,
			@RequestParam("parentNodeId") String parentNodeId,
			@RequestParam("prevBrotherId") String prevBrotherId) {

		if (null != parentNodeId
				&& parentNodeId.toLowerCase().indexOf("xnode") >= 0) {
			parentNodeId = "0";
		}

		Boolean flag = powerService.exchange(id, prevBrotherId, parentNodeId);

		if (flag) {
			return JsonUtil.getResult(Boolean.TRUE);
		} else {
			return JsonUtil.getResult(Boolean.FALSE);
		}
	}

	/**
	 * @description 下移
	 * @return ModelMap
	 * @param power
	 * @update 2012-8-9 下午3:52:36
	 */
	@RequestMapping(value = "/degrade", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap degrade(@RequestParam("id") String id,
			@RequestParam("parentNodeId") String parentNodeId,
			@RequestParam("nextBrotherId") String nextBrotherId) {

		if (null != parentNodeId
				&& parentNodeId.toLowerCase().indexOf("xnode") >= 0) {
			parentNodeId = "0";
		}

		Boolean flag = powerService.exchange(id, nextBrotherId, parentNodeId);

		if (flag) {
			return JsonUtil.getResult(Boolean.TRUE);
		} else {
			return JsonUtil.getResult(Boolean.FALSE);
		}
	}
	
	/**
	 * @description 禁用
	 * @return ModelMap
	 * @param power
	 * @update 2012-8-9 下午3:52:36
	 */
	@RequestMapping(value = "/forbiddenPower", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap forbiddenPower(@RequestParam("id") String id) {

		Boolean flag = powerService.forbiddenPower(id);

		if (flag) {
			return JsonUtil.getResult(Boolean.TRUE);
		} else {
			return JsonUtil.getResult(Boolean.FALSE);
		}
	}

	/**
	 * @description 启用
	 * @return ModelMap
	 * @param power
	 * @update 2012-8-9 下午3:52:36
	 */
	@RequestMapping(value = "/startUpPower", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap startUpPower(@RequestParam("id") String id) {

		Boolean flag = powerService.startUpPower(id);

		if (flag) {
			return JsonUtil.getResult(Boolean.TRUE);
		} else {
			return JsonUtil.getResult(Boolean.FALSE);
		}
	}
	
	/**
	 * @description 表格导出
	 * @return ModelMap
	 * @param power
	 * @throws Exception 
	 * @update 2012-8-9 下午3:52:36
	 */
	@RequestMapping(value = "/excelExport", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public void excelExport(HttpServletResponse response) throws Exception {
		
		List<PowerDto> powerDtos = powerService.list();
		
		Map<String,String> header = ExcelConstants.header_power();
		ExcelUtil excelUtil = new ExcelUtil();
		Workbook wb = excelUtil.writeExcel4("power", powerDtos, 1, header, PowerDto.class);
		
		String filename=DateUtil.getDate(1, null)+".xls";
		OutputStream out=null;
		response.setContentType("application/vnd.ms-excel");
		response.addHeader("Content-Disposition", "attachment;filename="+filename);
		try {
			out = response.getOutputStream();
			wb.write(out);
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			try {
				out.flush();
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * @description 表格导入
	 * @return ModelMap
	 * @param power
	 * @throws IOException 
	 * @update 2012-8-9 下午3:52:36
	 */
	@RequestMapping(value = "/excelImport", method = { RequestMethod.GET,
			RequestMethod.POST })
	@ResponseBody
	public void excelImport(@RequestParam("file") MultipartFile file,
			HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		ExcelUtil excelUtil = new ExcelUtil();
		//测试
//		InputStream is = new FileInputStream(new File("E:/20130812154759.xls"));
//		List<PowerDto> powerDtos = excelUtil.readExcel2(is,ExcelConstants.EXCEL_POWER, 1, PowerDto.class);
		List<PowerDto> powerDtos = excelUtil.readExcel2(
				new ByteArrayInputStream(file.getBytes()),
				ExcelConstants.EXCEL_POWER, 1, PowerDto.class);
		if (null != powerDtos && powerDtos.size() > 0) {
			for (PowerDto powerDto : powerDtos) {
				this.save(powerDto);
			}
		}
		response.getWriter().write("{\"status\":true}");
	}
}
