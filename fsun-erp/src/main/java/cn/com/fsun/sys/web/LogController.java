package cn.com.fsun.sys.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.fsun.common.utils.DateUtil;
import cn.com.fsun.common.result.JsonUtil;
import cn.com.fsun.common.utils.PageInfo;
import cn.com.fsun.common.web.BaseController;
import cn.com.fsun.sys.dto.LogDto;
import cn.com.fsun.sys.service.LogService;


/*
 * @author lw
 */

@Controller
@RequestMapping("/sys/log")
public class LogController extends BaseController {

	@Autowired
	private LogService logService;

	/**
	 * @description 加载所有菜单节点
	 * @return ModelMap
	 * @return
	 * @update 2012-8-13 上午10:58:27
	 */
	@RequestMapping(value = "/list", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap list() {
		List<LogDto> list = logService.list();
		return JsonUtil.getObjectList(Boolean.TRUE, list, list.size());
	}
	
	/**
	 * @description 查询
	 * @return ModelMap
	 * @param logDto
	 * @return
	 * @update 2013-3-11
	 */
	@RequestMapping(value = "/search", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap search(LogDto logDto){
		PageInfo pageInfo = new PageInfo();
		if(null!=logDto){
			int firstRecord = (logDto.getPage()-1)*logDto.getRows();
			pageInfo.setFirstRecord(firstRecord);
			pageInfo.setPageSize(logDto.getRows());
			if(StringUtils.isNotEmpty(logDto.getSort())){
				pageInfo.setSortColumn(logDto.getSort());
			}
			if(StringUtils.isNotEmpty(logDto.getOrder())){
				pageInfo.setSortType(logDto.getOrder());
			}
			if(null!=logDto.getStartDate_str()){
				pageInfo.setStartDate(logDto.getStartDate_str());
			}
			if(null!=logDto.getEndDate_str()){
				pageInfo.setEndDate(logDto.getEndDate_str());
			}
		}
		List<LogDto> logDtos = logService.search(logDto, pageInfo);
		return JsonUtil.getObjectList(Boolean.TRUE, logDtos, logService.getSearchCount(logDto, pageInfo));
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
		List<TreeDto> list = logService.listTree(null);
		return list;
	}*/

	/**
	 * @description 增加或者更新
	 * @return ModelMap
	 * @param logDto
	 * @param _parentId
	 * @return
	 * @update 2013-2-21
	 */
	@RequestMapping(value = "/save", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap save(LogDto logDto) {
		logService.save(logDto);
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
		LogDto logDto = logService.load(id);
		if (null != logDto) {
			return JsonUtil.getObject(Boolean.TRUE, logDto);
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

		logService.delete(id);
		return JsonUtil.getResult(Boolean.TRUE);
	}

	/**
	 * @description 创建饼状图
	 * @return ModelMap
	 * @param id
	 * @update 2012-8-9 下午3:53:10
	 */
	@RequestMapping(value = "/createPieChart", method = { RequestMethod.GET,
			RequestMethod.POST })
	@ResponseBody
	public Object createPieChart() {  
		Map<String, List> data = new HashMap<String, List>();
		List logMap = logService.typeCount();
		ModelMap m = new ModelMap();
		m.addAttribute("data",logMap );
		return m;
		
	}
	
	
	/**
	 * @description 创建饼状图
	 * @return ModelMap
	 * @param id
	 * @update 2012-8-9 下午3:53:10
	 */
	@RequestMapping(value = "/createCylinChart", method = { RequestMethod.GET,
			RequestMethod.POST })
	@ResponseBody
	public Object createCylinChart() {   
		Map<String, List> chartData = new HashMap<String, List>();
		ArrayList list = new  ArrayList();
		List logList = logService.broswerCount();
		Object[] o1 = logList.toArray();
		ArrayList nameList = new ArrayList() ;
		ArrayList dataList = new ArrayList();
		for(int i=0;i<logList.size();i++){
			Object[] o2 = (Object[]) o1[i];
			String name = o2[0].toString();
			String data = o2[1].toString();
			Integer y = Integer.parseInt(data);
			nameList.add(name);
			dataList.add(y);
		}
		HashMap<String, List> o3 = new HashMap<String, List>();
		o3.put("name", nameList);
		o3.put("data", dataList);
		//o.put("sliced", i);
		//o.put("selected", i);
		list.add(o3);
		chartData.put("data", list);
		return chartData;
		
	}
	
	
	
	
	
	/**
	 * @description 显示列表
	 * @return ModelMap
	 * @param
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/manage", method={RequestMethod.GET,RequestMethod.POST})
	public String manage() {
		return "sys/log/manage";
	}

	
}
