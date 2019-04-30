package cn.com.fsun.bus.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BeanPropertyBindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.Validator;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import cn.com.fsun.bus.dto.AfterProcessDto;
import cn.com.fsun.bus.dto.AfterProcessDtoList;
import cn.com.fsun.bus.dto.ProductDetailDto;
import cn.com.fsun.bus.dto.ProductDto;
import cn.com.fsun.bus.dto.TransactionDto;
import cn.com.fsun.bus.dto.TransactionDtoList;
import cn.com.fsun.bus.service.AfterProcessService;
import cn.com.fsun.bus.service.ProductService;
import cn.com.fsun.common.dto.CommonDto;
import cn.com.fsun.common.result.JsonResult;
import cn.com.fsun.common.result.JsonUtil;
import cn.com.fsun.common.utils.PageInfo;
import cn.com.fsun.common.utils.UploadUtil;
import cn.com.fsun.common.web.BaseController;
import cn.com.fsun.constants.CommonConstant;
import cn.com.fsun.sys.service.LogService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/bus/product")
public class ProductController extends BaseController {

	private final String path = "/bus/product/";
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private AfterProcessService afterProcessService;
	
	@Autowired
	private LogService logService;
	
	private String message = null;
	
	/**
	 * @description 加载列表
	 * @return List<ProductDto>
	 * @return
	 * @update 2012-8-13 上午10:58:27
	 */
	@RequestMapping(value = "/list", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<ProductDto> list(ProductDto productDto) {
		return productService.list();
	}
	
	/**
	 * @description 加载列表
	 * @return ModelMap
	 * @return
	 * @update 2012-8-13 上午10:58:27
	 */
	@RequestMapping(value = "/getEnableList", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<ProductDto> getEnableList() {
		return productService.getEnableList();
	}
	
	/**
	 * @description 加载列表
	 * @return List<ProductDto>
	 * @return
	 * @update 2012-8-13 上午10:58:27
	 */
	@RequestMapping(value = "/getTransactionsByCode", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<TransactionDto> getTransactionsByCode(@RequestParam("code") String code) {
		return productService.getTransactionsByCode(code);
	}
	
	/**
	 * @description 加载列表
	 * @return ModelMap
	 * @return
	 * @update 2012-8-13 上午10:58:27
	 */
	@RequestMapping(value = "/getNames", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<CommonDto> getNames(ProductDto productDto) {
		return productService.getNames();
	}
	
	@RequestMapping(value="/view",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView view(@RequestParam("id") String id, @RequestParam("rowIndex") String rowIndex){
		ProductDto productDto=null;
		ModelAndView mav = new ModelAndView();
		if(null==id){
			productDto = new ProductDto();
		}
		else{
			productDto = productService.load(id);	
			mav.addObject("product",productDto);
			
			List<AfterProcessDto> list = afterProcessService.getProcessByProductId(id);
			AfterProcessDtoList afterProcess = new AfterProcessDtoList();
			afterProcess.setAfterProcessDtoList(list);
			mav.addObject("afterProcessList",afterProcess);
						
			List<TransactionDto> transactions = productService.getTransactionsByCode(productDto.getCode());
			TransactionDtoList transactionList = new TransactionDtoList();
			transactionList.setTransactionDtoList(transactions);
			mav.addObject("transactionList",transactionList);		
			mav.addObject("rowIndex",rowIndex);
		}
		
		mav.setViewName(path + "view");		
		return mav;
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
	public ModelMap search(ProductDto productDto){
		PageInfo pageInfo = new PageInfo();
		if(null!=productDto){
			if(null!=productDto.getRows()&& null!=productDto.getPage()){
				int firstRecord = (productDto.getPage()-1)*productDto.getRows();
				pageInfo.setFirstRecord(firstRecord);
				pageInfo.setPageSize(productDto.getRows());
			}
			if(StringUtils.isNotEmpty(productDto.getSort())){
				pageInfo.setSortColumn(productDto.getSort());
			}
			if(StringUtils.isNotEmpty(productDto.getOrder())){
				pageInfo.setSortType(productDto.getOrder());
			}
		}
		
		List<ProductDto> productDtos = productService.search(productDto,pageInfo);
		return JsonUtil.getObjectList(Boolean.TRUE, productDtos, productService.getSearchCount(productDto, pageInfo));
	}
	
	
	/**
	 * @description 增加或者更新
	 * @return ModelMap
	 * @param productDto
	 * @return
	 * @update 2013-2-21
	 */
	@RequestMapping(value = "/downloadPicture", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public void downloadPicture(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");  
        response.setContentType("multipart/form-data");
        
        InputStream inputStream = null;
        OutputStream os = null;
        try { 
        	String filePath = java.net.URLDecoder.decode(request.getParameter("filePath"),"utf-8");
        	String fileName = java.net.URLDecoder.decode(request.getParameter("name"),"utf-8") + filePath.substring(filePath.lastIndexOf("."));
            String rootPath = request.getSession().getServletContext().getRealPath("/");
            response.setHeader("Content-Disposition", "attachment;filename="+ new String(fileName.getBytes("gb2312"), "ISO8859-1" )); 
            inputStream = new FileInputStream(rootPath + filePath);
            os = response.getOutputStream();  
            byte[] b=new byte[1024];  
            int length;  
            while((length=inputStream.read(b))>0){  
                os.write(b,0,length);  
            }  
        }catch(UnsupportedEncodingException e){
        	e.printStackTrace();  
        }catch (FileNotFoundException e) { 
            e.printStackTrace();  
        }catch (IOException e) {  
            e.printStackTrace();  
        }finally {
        	try {
    			if(inputStream != null){
    				inputStream.close();
    			}
				if(os != null){
	        		os.close();
	        	}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}    
	}
	
	/**
	 * @description 判别是否是唯一值
	 * @return ModelMap
	 * @return
	 * @update 2012-8-13 上午10:58:27
	 */
	@RequestMapping(value = "/uniqueName", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap uniqueName(ProductDto productDto) {
		return JsonUtil.getResult(uniqueProductName(productDto));
	}
	
	
	private boolean uniqueProductName(ProductDto productDto){
		if(productDto.getName()==null || "".equals(productDto.getName())){
			return true;
		}
		return productService.uniqueProductName(productDto.getName(),productDto.getId());	
	}
	
	/**
	 * @description 增加或者更新
	 * @return ModelMap
	 * @param productDto
	 * @return
	 * @update 2013-2-21
	 */
	/*@RequestMapping(value = "/save", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap save(ProductDto productDto,@RequestParam("ficon") MultipartFile ficon,@RequestParam("afterProcess") String afterProcess,
			HttpServletRequest request, HttpServletResponse response) {
		
		try {
			
			if(!ficon.isEmpty()){
				String product_icon_path = UploadUtil.buildFile(ficon, 
						request.getSession().getServletContext().getRealPath("/") + CommonConstant.UPLOAD_BASE_PATH + "/product");
				productDto.setIcon(product_icon_path);
			}else{
				if(null!=productDto.getIcon() && !"".equals(productDto.getIcon())){
					
				}else{
					productDto.setIcon("");
				}				
			}
				
			Integer loglevel = null;
			productDto.setEnabled(true);
		
			JSONArray json = JSONArray.fromObject(afterProcess);
			List<AfterProcessDto> afterProcessDtos = (List<AfterProcessDto>)JSONArray.toCollection(json, AfterProcessDto.class);
			
			productService.save(productDto,afterProcessDtos);
			if(StringUtils.isNotEmpty(productDto.getId())){
				message = "产品类型: " + productDto.getName()+ "更新成功";
				loglevel = CommonConstant.Log_Type_UPDATE;
			}else{
				message = "产品类型： " + productDto.getName()+ "插入成功";
				loglevel = CommonConstant.Log_Type_INSERT;
			}
			logService.addLog(message, loglevel, CommonConstant.Log_Leavel_INFO);
			return JsonUtil.getObject(Boolean.TRUE,"保存成功！");
		} catch (Exception e) {			
			e.printStackTrace();
			return JsonUtil.getObject(Boolean.FALSE,"保存失败！");
		}
		
	}*/
	
	/**
	 * @description 增加产品信息
	 * @return ModelMap
	 * @param productDetailDto
	 * @return
	 * @update 2013-2-21
	 */
	@RequestMapping(value = "/create", method=RequestMethod.POST)
	@ResponseBody
	public ModelMap create(@RequestBody ProductDetailDto productDetailDto, HttpServletRequest request) {
	
		try{										
			ProductDto productDto = productService.create(productDetailDto);							
			logService.addLog( "产品： " + productDto.getName()+ "插入成功", 
				CommonConstant.Log_Type_INSERT, CommonConstant.Log_Leavel_INFO);
			return JsonUtil.getObject(Boolean.TRUE, productDto);
		}catch (Exception e) {	
			String icon = productDetailDto.getProductInfo().getIcon();
			if(icon!=null && !"".equals(icon)){
				File f = new File(request.getSession().getServletContext().getRealPath("/") 
					+ CommonConstant.UPLOAD_BASE_PATH + "/product"+icon);
			    f.delete();
			}			
			return JsonUtil.getResult(Boolean.FALSE);
		}
		
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
	public ModelMap saveProduct(@RequestParam("process") String process,@RequestParam("productInfo") String productInfo
			,HttpServletRequest request, HttpServletResponse response) {
		
		ProductDto productDto = null;
		Integer loglevel = null;
		try{						
			JSONObject jsonObject = JSONObject.fromObject(productInfo);
			productDto =(ProductDto) JSONObject.toBean(jsonObject, ProductDto.class) ;
			productDto.setEnabled(true);
			
			JSONArray json = JSONArray.fromObject(process);
			List<AfterProcessDto> afterProcessDtos = (List<AfterProcessDto>)JSONArray.toCollection(json, AfterProcessDto.class);
					
			productService.save(productDto,afterProcessDtos,request);
			if(StringUtils.isNotEmpty(productDto.getId())){
				message = "产品: " + productDto.getName()+ "更新成功";
				loglevel = CommonConstant.Log_Type_UPDATE;
			}else{
				message = "产品： " + productDto.getName()+ "插入成功";
				loglevel = CommonConstant.Log_Type_INSERT;
			}
			logService.addLog(message, loglevel, CommonConstant.Log_Leavel_INFO);
			return JsonUtil.getObject(Boolean.TRUE,"保存成功！");
		}catch (Exception e) {			 
			if(productDto!=null && productDto.getIcon()!=null && !"".equals(productDto.getIcon())){
				File f = new File(request.getSession().getServletContext().getRealPath("/") + CommonConstant.UPLOAD_BASE_PATH + "/product"+productDto.getIcon());
			    f.delete();
			}			
			return JsonUtil.getResult(Boolean.FALSE);
		}
		
	}
	
	/**
	 * @description 增加或者更新
	 * @return ModelMap
	 * @param productDto
	 * @return
	 * @update 2013-2-21
	 */
	@RequestMapping(value = "/addFicon", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap addFicon(@RequestParam("ficon") MultipartFile ficon, HttpServletRequest request, HttpServletResponse response) {
	    String product_icon_path = "";
		try{
			if(!ficon.isEmpty()){		
				product_icon_path = UploadUtil.buildFile(ficon, 
						request.getSession().getServletContext().getRealPath("/") + CommonConstant.UPLOAD_BASE_PATH + "/product");
				return JsonUtil.getObject(Boolean.TRUE,product_icon_path);
			}else{
				return JsonUtil.getObject(Boolean.TRUE,product_icon_path);
			}
		}catch (Exception e) {
			return JsonUtil.getObject(Boolean.FALSE,product_icon_path);
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
		ProductDto productDto = productService.load(id);		
		if (null != productDto) {
			List<AfterProcessDto> list = afterProcessService.getProcessByProductId(id);
			productDto.setAfterProcess(list);
			return JsonUtil.getObject(Boolean.TRUE, productDto);
		} else {
			return JsonUtil.getResult(Boolean.FALSE);
		}
	}
	
	/**
	 * @description 加载一个菜单节点
	 * @return ModelMap
	 * @return
	 * @update 2012-8-13 上午10:58:27
	 */
	@RequestMapping(value = "/loadByCode", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap loadByCode(@RequestParam("productCode") String productCode) {
		ProductDto productDto = productService.loadByCode(productCode);		
		if (null != productDto) {
			List<AfterProcessDto> list = afterProcessService.getProcessByProductId(productDto.getId());
			productDto.setAfterProcess(list);
			return JsonUtil.getObject(Boolean.TRUE, productDto);
		} else {
			return JsonUtil.getResult(Boolean.FALSE);
		}
	}
	
	@Autowired
	private Validator validator; 
	
	private String productExist(String productCodes){
		BeanPropertyBindingResult result = new BeanPropertyBindingResult(productCodes,"productCodes");
		validator.validate(productCodes, result);
		if(result.hasErrors()){
			List<ObjectError> error = result.getAllErrors();
			for (ObjectError objectError : error) {
				return objectError.getDefaultMessage();
			}
		}
		return null;
	}
	
	/**
	 * @description 删除一条记录
	 * @return ModelMap
	 * @param id
	 * @update 2012-8-9 下午3:53:10
	 */
	@RequestMapping(value = "/delete", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap delete(@RequestParam("id") String id, @RequestParam("productCodes") String productCodes,
			HttpServletRequest request, HttpServletResponse response) {
		
		try{	
			String message = productExist(productCodes);		
			if(message!=null){
				return JsonResult.getResult(Boolean.FALSE,message);
			}
			if(null!=id&&!"".equalsIgnoreCase(id)){
				String ids[] = id.split(",");
				//删除多条记录
				if(null!=ids && ids.length>0){
					for(int i=0;i<ids.length;i++){
						ProductDto productDto= productService.load(ids[i]);
						productService.delete(ids[i]);
						if(productDto!=null && productDto.getIcon()!=null && !"".equals(productDto.getIcon())){
							File f = new File(request.getSession().getServletContext().getRealPath("/") + CommonConstant.UPLOAD_BASE_PATH + "/product"+productDto.getIcon());
						    f.delete();
						}	
						message = "产品类型ID：" + ids[i] + "删除成功";
						logService.addLog(message, CommonConstant.Log_Type_DEL, CommonConstant.Log_Leavel_INFO);
					}
				}
			}
			return JsonUtil.getResult(Boolean.TRUE);
			
		}catch (Exception e) {
			e.printStackTrace();
			return JsonUtil.getResult(Boolean.FALSE);
		}
		
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
					productService.disable(ids[i]);
					message = "产品ID：" + ids[i] + "禁用成功";
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
	@RequestMapping(value = "/getDisableProduct", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap getDisableProduct(ProductDto productTypeDto) {
		List<ProductDto> list = productService.getDisableProduct();
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
					productService.enable(ids[i]);
					message = "产品ID：" + ids[i] + "启用成功";
					logService.addLog(message, CommonConstant.Log_Type_UPDATE, CommonConstant.Log_Leavel_INFO);
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
		return "/bus/product/manage";		
	}
	
	/**
	 * @description 跳转到添加产品信息的界面(此界面包含订单明细)
	 * @return ModelMap
	 * @param
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/order", method=RequestMethod.GET)
	public ModelAndView orderProduct() {
		ModelAndView mav = new ModelAndView("bus/product/operate/order_product");
		return mav;
	}
	
	/**
	 * @description 跳转到添加已存在产品信息的界面(此界面包含订单明细)
	 * @return ModelMap
	 * @param
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/select/order", method=RequestMethod.GET)
	public ModelAndView orderSelectProduct() {
		ModelAndView mav = new ModelAndView("bus/product/operate/order_select_product");
		return mav;
	}
	
	/**
	 * @description 通过产品编号获取产品款号组数
	 * @return List<CommonDto>
	 * @return
	 * @update 2012-8-13 上午10:58:27
	 */
	@RequestMapping(value = "/getStylesByCode", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<CommonDto> getStylesByCode(@RequestParam("code") String code) {
		List<CommonDto> list = new ArrayList<>();
		ProductDto product = productService.loadByCode(code);
		if(product!=null&&product.getStyle()!=null){
			String[] styles = product.getStyle().split(",");
			for (int i = 0; i < styles.length; i++) {
				CommonDto common = new CommonDto();
				common.setName(styles[i]);	
				list.add(common);
			}
			
		}
		return list;
	}
}
