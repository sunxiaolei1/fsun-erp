package cn.com.fsun.bus.web;

import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.MultiValueMap;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import cn.com.fsun.bus.dto.OutsideImagesDto;
import cn.com.fsun.bus.dto.OutsourcDetailDto;
import cn.com.fsun.bus.service.OutsideImagesService;
import cn.com.fsun.bus.service.OutsourcDetailService;
import cn.com.fsun.common.dto.CommonDto;
import cn.com.fsun.common.excel.ExportExcel;
import cn.com.fsun.common.result.JsonUtil;
import cn.com.fsun.common.utils.PageInfo;
import cn.com.fsun.common.utils.Plupload;
import cn.com.fsun.common.web.BaseController;
import cn.com.fsun.constants.CommonConstant;
import cn.com.fsun.sys.service.LogService;

@Controller
@RequestMapping("/bus/outsourcDetail")
public class OutsourcDetailController extends BaseController {

	@Autowired
	private OutsourcDetailService outsourcDetailService;
	
	@Autowired
	private OutsideImagesService outsideImagesService;
	
	@Autowired
	private LogService logService;
	
	private String message = null;
	
	/**
	 * @description 查询
	 * @return ModelMap
	 * @param outsourcDetailDto
	 * @return
	 * @update 2013-3-11
	 */
	@RequestMapping(value = "/search", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap search(OutsourcDetailDto outsourcDetailDto){
		PageInfo pageInfo = new PageInfo();
		boolean isPage = false;
		if(null!=outsourcDetailDto){
			if(null!=outsourcDetailDto.getRows()&& null!=outsourcDetailDto.getPage()){
				int firstRecord = (outsourcDetailDto.getPage()-1)*outsourcDetailDto.getRows();
				pageInfo.setFirstRecord(firstRecord);
				pageInfo.setPageSize(outsourcDetailDto.getRows());
				isPage = true;
			}
			if(StringUtils.isNotEmpty(outsourcDetailDto.getSort())){
				pageInfo.setSortColumn(outsourcDetailDto.getSort());
			}
			if(StringUtils.isNotEmpty(outsourcDetailDto.getOrder())){
				pageInfo.setSortType(outsourcDetailDto.getOrder());
			}
		}
		
		List<OutsourcDetailDto> outsourcDetailDtos = outsourcDetailService.search(outsourcDetailDto,pageInfo,isPage);
		return JsonUtil.getObjectList(Boolean.TRUE, outsourcDetailDtos, outsourcDetailService.getSearchCount(outsourcDetailDto, pageInfo));
	}
	
	/**
	 * @description 查询
	 * @return ModelMap
	 * @param outsourcDetailDto
	 * @return
	 * @throws UnsupportedEncodingException 
	 * @update 2013-3-11
	 */
	@RequestMapping(value = "/getOutsourcDetailByName", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap getOutsourcDetailByName(@RequestParam("outsourcName") String outsourcName) throws UnsupportedEncodingException{
		PageInfo pageInfo = new PageInfo();
		boolean isPage = false;
		OutsourcDetailDto outsourcDetailDto = new OutsourcDetailDto();
		outsourcDetailDto.setOutsourcName(URLDecoder.decode(outsourcName,"utf-8"));
		List<OutsourcDetailDto> outsourcDetailDtos = outsourcDetailService.search(outsourcDetailDto,pageInfo,isPage);
		return JsonUtil.getObjectList(Boolean.TRUE, outsourcDetailDtos, outsourcDetailService.getSearchCount(outsourcDetailDto, pageInfo));
	}
	
	/**
	 * @description 显示列表
	 * @return ModelMap
	 * @param
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/manage_edit", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView manage_edit(@RequestParam("outsourcName") String outsourcName,@RequestParam("technology") String technology) {
		ModelAndView modelAndView = new ModelAndView();		
		modelAndView.setViewName("/bus/outsourcDetail/manage_edit");
		try {
			outsourcName = URLDecoder.decode(outsourcName,"utf-8");
			technology = URLDecoder.decode(technology,"utf-8");
		} catch (UnsupportedEncodingException e) {
			outsourcName = "";
			technology = "";
			e.printStackTrace();
		}
		List<CommonDto> technologys = new ArrayList<CommonDto>();
		if(technology!=null){
			String[] listStr = technology.split(",");			
			for (int i = 0; i < listStr.length; i++) {
				CommonDto commonDto = new CommonDto(listStr[i],listStr[i]);
				technologys.add(commonDto);
			}
		}
		modelAndView.addObject("technology",JSONArray.fromObject(technologys));
		modelAndView.addObject("outsourcName", outsourcName);
		return modelAndView;
	}
	
	
	/**
	 * @description 增加或者更新
	 * @return ModelMap
	 * @param buyInfoDto
	 * @return
	 * @update 2013-2-21
	 */
	@RequestMapping(value = "/save", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap save(OutsourcDetailDto outsourcDetailDto) {
		Integer loglevel = null;
		OutsourcDetailDto oDto = null;
		try {
			oDto = outsourcDetailService.save(outsourcDetailDto);
		} catch (Exception e) {
			e.printStackTrace();
			return JsonUtil.getResult(Boolean.FALSE);
		}
		if(StringUtils.isNotEmpty(outsourcDetailDto.getId())){
			message = "厂家:"+ oDto.getOutsourcName() +"的外协回执单: " + oDto.getId() + "更新成功";
			loglevel = CommonConstant.Log_Type_UPDATE;
		}else{
			message = "厂家:"+ oDto.getOutsourcName() +"的外协回执单: " + oDto.getId() + "插入成功";
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
		OutsourcDetailDto outsourcDetailDto = outsourcDetailService.load(id);
		if (null != outsourcDetailDto) {
			return JsonUtil.getObject(Boolean.TRUE, outsourcDetailDto);
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
					OutsourcDetailDto oDto = outsourcDetailService.load(ids[i]);
					outsourcDetailService.delete(ids[i]);					
					message = "厂家:"+ oDto.getOutsourcName() +"的外协回执单: " + oDto.getId() + "删除成功";
					logService.addLog(message, CommonConstant.Log_Type_DEL, CommonConstant.Log_Leavel_INFO);
				}
			}
		}
		return JsonUtil.getResult(Boolean.TRUE);
	}
	
	
	/**
	 * @description 表格导入
	 * @param file
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws IOException
	 * @update 2014-4-3 下午3:52:36
	*/
	@RequestMapping(value = "/pictrueImport", method = { RequestMethod.GET,RequestMethod.POST })
	@ResponseBody
	public void pictrueImport(@RequestParam("file") MultipartFile fileUpload,OutsideImagesDto outsideImagesDto,
			HttpServletRequest request, HttpServletResponse response) throws IOException{
		String resultStr = "{\"status\":true}";
    	//正常返回：response.getWriter().write("{\"status\":true,\"newName\":\""+newFileName+"\"}");
    	//错误返回：response.getWriter().write("{\"status\":false}");
    	try {
    		if (!fileUpload.isEmpty() && null!=outsideImagesDto.getOutSideId() && !"".equals(outsideImagesDto.getOutSideId())) {
    			//System.out.println("name===="+fileUpload.getName());
                String fileName = fileUpload.getOriginalFilename();
                String[] suffixs = fileName.split("\\."); 
                String suffix = "."+suffixs[suffixs.length-1];//获取文件后缀
                if((".jpg.gif.png.bmp.jpeg".indexOf(suffix.toLowerCase())!=-1)){ //判断上传的文件格式是否正确           	
                	outsideImagesDto.setImages(fileUpload.getBytes());
                	outsideImagesDto.setName(fileName);                	
                	outsideImagesService.save(outsideImagesDto);
                }else{
                	resultStr = "{\"status\":false}";
                }            
            }else {
    			resultStr = "{\"status\":false}";
    		}
		} catch (IOException e) {
			resultStr = "{\"status\":false}";
			e.printStackTrace();
		}finally{
			response.getWriter().write(resultStr);
		}
	}
	 
	
	/**
	 * 根据回执单id获取图片ids
	 * @param outSideId
	 * @return
	 */
	@RequestMapping(value = "/getPictrueIds", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<Integer> getPictrueIds(String outSideId){
		List<Integer> list = outsideImagesService.getPictrueIds(outSideId);
		if(list==null){
			return new ArrayList<Integer>();
		}
		return list;
	}
	
	/**
	 * 根据图片id获取图片流对象
	 * @param outSideId
	 * @return
	 */
	@RequestMapping(value = "/getPictrueById", method = { RequestMethod.GET,RequestMethod.POST })
	public void getPictrueById(HttpServletRequest request, HttpServletResponse response,@RequestParam("id") String id){
		//response.setContentType("application/vnd.ms-excel");
		//response.addHeader("Content-Disposition", "attachment;filename="+filename);
		OutputStream out = null;
		try{
			out= response.getOutputStream();
			OutsideImagesDto outsideImagesDto = outsideImagesService.load(Integer.parseInt(id));
			//OutputStream os = new FileOutputStream("img/2.jpg");	
			out.write(outsideImagesDto.getImages());  
			out.flush();  
			out.close();  
		}catch (Exception e) {			
			try {
				out.flush();  
				out.close();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
		
		
	}
	
	 /**上传处理方法
	 * @throws IOException */  
    @RequestMapping(value="/upload", method = RequestMethod.POST)  
    public void upload(Plupload plupload,HttpServletRequest request, HttpServletResponse response,@RequestParam("outSideId") String outSideId) throws IOException {           
    	String resultStr = "{\"status\":false}";        
        plupload.setRequest(request);        
        try {  
            //上传文件  
            //PluploadUtil.upload(plupload, dir); 
        	 boolean isSuccess= savePicture(plupload,request, response,outSideId);
        	 if(isSuccess){      		 
        		 resultStr = "{\"status\":true}";    
        	 }
        	 response.getWriter().write(resultStr); 
        } catch (IllegalStateException e) {            
            e.printStackTrace();  
            response.getWriter().write(resultStr); 
        } 
    }  
    
    public boolean savePicture(Plupload plupload,HttpServletRequest request, HttpServletResponse response,String outSideId){
    	if(outSideId==null || "".equals(outSideId)){
    		return false;
    	}
    	try{
    		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) plupload.getRequest();	
    	    MultiValueMap<String, MultipartFile> map = multipartRequest.getMultiFileMap();
    	    if(map != null) {
    	    	Iterator<String> iter = map.keySet().iterator();
    			while(iter.hasNext()) {
    				String str = (String) iter.next();
    			    List<MultipartFile> fileList =  map.get(str);
    			    for(MultipartFile multipartFile : fileList) {
    			    	System.out.println(plupload+"文件尺寸为："+multipartFile.getSize()/1024+"KB");
    			    	OutsideImagesDto outsideImagesDto =new OutsideImagesDto();
    			    	outsideImagesDto.setImages(multipartFile.getBytes());
                    	outsideImagesDto.setName(plupload.getName());   
                    	outsideImagesDto.setOutSideId(outSideId);
                    	outsideImagesService.save(outsideImagesDto);
    			    }
    			}
    	    }
    	    
    	    return true;
    	}catch (Exception e) {
    		return false;
		}    	
		
    }
   
	
	/**
	 * @description 删除记录
	 * @return ModelMap
	 * @param id
	 * @update 2012-8-9 下午3:53:10
	 */
	@RequestMapping(value = "/delPictrue", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap delPictrue(@RequestParam("id") String id) {
		try{
			if(null!=id&&!"".equalsIgnoreCase(id)){
				String ids[] = id.split(",");
				//删除多条记录
				if(null!=ids && ids.length>0){
					for(int i=0;i<ids.length;i++){
						OutsideImagesDto oDto = outsideImagesService.load(Integer.parseInt(ids[i]));
						outsideImagesService.delete(Integer.parseInt(ids[i]));					
						message = "图片:"+ oDto.getName() + "删除成功";
						logService.addLog(message, CommonConstant.Log_Type_DEL, CommonConstant.Log_Leavel_INFO);
					}
				}
			}
			return JsonUtil.getResult(Boolean.TRUE);
		}catch (Exception e) {
			return JsonUtil.getResult(Boolean.FALSE);
		}
		
		
	}
	
	@RequestMapping(value = "/excelExport", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView excelExport(ModelMap model, HttpServletRequest request,HttpServletResponse response,
			OutsourcDetailDto outsourcDetailDto){
		
		String outsourcName = "";
		//对得到的参数进行解码 
		try {		
			if(outsourcDetailDto.getOutsourcName()!=null &&!"".equals(outsourcDetailDto.getOutsourcName())){
				outsourcDetailDto.setOutsourcName(URLDecoder.decode(outsourcDetailDto.getOutsourcName(),"utf-8"));
				outsourcName = outsourcDetailDto.getOutsourcName();
			}
		} catch (UnsupportedEncodingException e) {
			outsourcDetailDto.setOutsourcName("");
			e.printStackTrace();
		}
		
		//view_excel是在spring配置文件里配置的ExcelRevenueReportView,第二个和第三个参数采用键值对方法提供给buildExcelDocument方法使用
		model.addAttribute("fileName", outsourcName+"外发回执单信息表");
		HashMap<String,String> header = new HashMap<String,String>();
		header.put("orderCode", "订单编号");
		header.put("outsourcName", "外协方");
		header.put("process", "工艺流程");
		header.put("allPrice", "金额(元)");	
		header.put("completeTime", "完工时间");
		header.put("createManName", "制单人");
		header.put("description", "备注");		
		model.addAttribute("titles", header);		
		
		List<OutsourcDetailDto> data = outsourcDetailService.getDataForExcelExport(outsourcDetailDto);
		model.addAttribute("data", data);
		
		ExportExcel exportExcel =  new ExportExcel(outsourcDetailDto);
		return new ModelAndView(exportExcel,model);
	}
	
    
	
}