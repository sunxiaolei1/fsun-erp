/**  
 * @title IconController.java
 * @package sanlogic.easyui.sys.web
 * @description 用一句话描述该文件做什么  
 * @update 2013-7-31 上午9:32:17
 * @version V1.0  
 */
package cn.com.fsun.sys.web;


import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;

import cn.com.fsun.common.result.JsonUtil;
import cn.com.fsun.common.utils.StringUtils;
import cn.com.fsun.common.web.BaseController;
import cn.com.fsun.sys.dto.IconDto;


/**
 * @description 这里用一句话描述这个类的作用
 * @version 1.0
 * @update 2013-7-31 上午9:32:17
 */
@Controller
@RequestMapping("/sys/icon")
public class IconController extends BaseController{
	
	/**
	 * @description 获取图标路径，显示图标
	 * @return ModelMap
	 * @return
	 * @update 2012-8-13 上午10:58:27
	 */
	
	@RequestMapping(value = "/list", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Object getIcons(HttpServletRequest request,HttpServletResponse httpResponse) throws Exception{
	  String root = request.getSession().getServletContext().getRealPath("");
	  String path = root+"/images/icons";
	  File file=new File(path);
	  String test[];
	  test=file.list();
	  ArrayList<IconDto> imgPath = new ArrayList<IconDto>();
	  for(String pInput : test){
		  if(StringUtils.isPicture(pInput,"")){
			  IconDto iconDto = new IconDto();
			  iconDto.setName(pInput);
			  iconDto.setPath("images/icons/" + pInput);
			  imgPath.add(iconDto);
		  }
	  }
	  
	  return imgPath;
	  
	  
	}
	
	/**
	 * @description 上传图标
	 * @return ModelMap
	 * @return
	 * @throws IOException 
	 * @update 2012-8-13 上午10:58:27
	*/
    @RequestMapping(value="/upload" , method = RequestMethod.POST)
    @ResponseBody
    public void upload(@RequestParam("file") MultipartFile fileUpload,HttpServletRequest request,HttpServletResponse response) throws IOException{
        
    	String resultStr = "{\"status\":true}";
    	//正常返回：response.getWriter().write("{\"status\":true,\"newName\":\""+newFileName+"\"}");
    	//错误返回：response.getWriter().write("{\"status\":false}");
    	try {
    		if (!fileUpload.isEmpty()) {
                        String fileName = fileUpload.getOriginalFilename();
                        String[] suffixs = fileName.split("\\."); 
                        String suffix = "."+suffixs[suffixs.length-1];//获取文件后缀
                        if((".jpg.gif.png.bmp.jpeg".indexOf(suffix.toLowerCase())!=-1)){ //判断上传的文件格式是否正确
                            byte[] bytes = fileUpload.getBytes();
                            String uploadPath = "images/icons/"+fileName;
                            File filePath = new File(request.getSession().getServletContext().getRealPath(uploadPath));
	                        if(filePath.exists()){    //判断有同样的文件存在
                            	String name = suffixs[suffixs.length-2];
                            	int number =1+(int)(Math.random()*100);
                            	String newName ="images/icons/"+name+number+suffix; //给上传的同名文件重命名
                            	File newFile = new File(request.getSession().getServletContext().getRealPath(newName));
                            	FileCopyUtils.copy(bytes, newFile); //文件开始上传到服务器上
	                        }
	                        else {
	                            FileCopyUtils.copy(bytes, filePath);//文件开始上传到服务器上
                            }
                        }
                        
                    } 
    		else {
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
	 * @description 删除图标
	 * @return ModelMap
	 * @return
     * @throws UnsupportedEncodingException 
	 * @update 2012-8-13 上午10:58:27
	*//*
	@RequestMapping(value = "/delete", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap delete(@RequestParam("filePath") String filePath,HttpServletRequest request,HttpServletResponse httpResponse) throws UnsupportedEncodingException {
		if(null!=filePath&&!"".equalsIgnoreCase(filePath)){
			String filePaths[] = filePath.split(",");
			 String root = request.getSession().getServletContext().getRealPath("");
			//删除多条记录
			if(null!=filePaths && filePaths.length>=2){
				for(int i=0;i<filePaths.length;i++){
					String path1 = root+"/"+filePaths[i];
					String path = new String(path1.getBytes("iso-8859-1"),"UTF-8");
					File file = new File(path);
					if(file.exists()){
					String[] suffixs=filePath.split("\\."); 
		            String suffix = "."+suffixs[suffixs.length-1];//获取文件后缀    
		            if((".jpg.gif.png.bmp.jpeg".indexOf(suffix.toLowerCase())!=-1)){ //判断上传的文件格式是否正确
		            	   file.delete();                       
					    }
					}
					else {
						return JsonUtil.getResult(Boolean.FALSE);
					}
				}
			//删除单条记录
			}else{
				String path1 = root+"/"+filePath;
				String path = new String(path1.getBytes("iso-8859-1"),"UTF-8");
				File file = new File(path);
				if(file.exists()){
				String[] suffixs=filePath.split("\\."); 
	            String suffix = "."+suffixs[suffixs.length-1];//获取文件后缀    
	            if((".jpg.gif.png.bmp.jpeg".indexOf(suffix.toLowerCase())!=-1)){ //判断上传的文件格式是否正确
	            	   file.delete();                       
				    }
				}
				else {
					return JsonUtil.getResult(Boolean.FALSE);
				}
			}
			
		}
		return JsonUtil.getResult(Boolean.TRUE);
	}*/
		
	
	
	
	/*	*//**
	 * @description 删除图标
	 * @return ModelMap
	 * @return
	 * @update 2012-8-13 上午10:58:27
	*//*
	@RequestMapping(value = "/delete", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public void delete(HttpServletRequest request, @RequestParam("file") MultipartFile file) {
    
		   if(!file.isEmpty()){                
			   String fileName = file.getOriginalFilename();
               String[] suffixs=fileName.split("\\."); 
               String suffix = "."+suffixs[suffixs.length-1];//获取文件后缀    
               if((".zip.rar.gz.tar.bz2".indexOf(suffix.toLowerCase())!=-1)){ //判断上传的文件格式是否正确
            	   String uploadPath = "images/icons/"+fileName;
                   File filePath = new File(request.getSession().getServletContext().getRealPath(uploadPath));
			       filePath.delete();                       
			    }
			   
		   }
	}*/
	
	
	
	 /**
	 * @description 删除图标
	 * @return ModelMap
	 * @return
     * @throws UnsupportedEncodingException 
	 * @update 2012-8-13 上午10:58:27
	*/
	@RequestMapping(value = "/delete", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap delete(@RequestParam("filePath") String filePath,HttpServletRequest request,HttpServletResponse httpResponse) throws UnsupportedEncodingException {
		
		if(null!=filePath&&!"".equalsIgnoreCase(filePath)){
			String filePaths[] = filePath.split(",");
			 String root = request.getSession().getServletContext().getRealPath("");
			//删除多条记录
			if(null!=filePaths && filePaths.length>=2){
				for(int i=0;i<filePaths.length;i++){
					String path1 = root+"/"+filePaths[i];
					String path = new String(path1.getBytes("iso-8859-1"),"UTF-8");
					File file = new File(path);
					if(file.exists()){
					String[] suffixs=filePath.split("\\."); 
		            String suffix = "."+suffixs[suffixs.length-1];//获取文件后缀    
		            if((".jpg.gif.png.bmp.jpeg".indexOf(suffix.toLowerCase())!=-1)){ //判断上传的文件格式是否正确
		            	   file.delete();                       
					    }
					}
					else {
						return JsonUtil.getResult(Boolean.FALSE);
					}
				}
			//删除单条记录
			}else{
				String path1 = root+"/"+filePath;
				String path = new String(path1.getBytes("iso-8859-1"),"UTF-8");
				File file = new File(path);
				if(file.exists()){
				String[] suffixs=filePath.split("\\."); 
	            String suffix = "."+suffixs[suffixs.length-1];//获取文件后缀    
	            if((".jpg.gif.png.bmp.jpeg".indexOf(suffix.toLowerCase())!=-1)){ //判断上传的文件格式是否正确
	            	   file.delete();                       
				    }
				}
				else {					
					return JsonUtil.getResult(Boolean.FALSE);
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
		return "sys/icon/manage";
	}
		
}


	
	


