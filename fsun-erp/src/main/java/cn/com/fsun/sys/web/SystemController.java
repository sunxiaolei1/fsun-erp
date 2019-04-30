package cn.com.fsun.sys.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.fsun.common.result.JsonUtil;
import cn.com.fsun.common.web.BaseController;
import cn.com.fsun.constants.CommonConstant;
import cn.com.fsun.sys.service.LogService;
import cn.com.fsun.sys.service.SystemService;


@Controller
@RequestMapping("/sys/system")
public class SystemController extends BaseController{

	@Autowired
	private SystemService systemService;
	
	@Autowired
	private LogService logService;
	
	private String message = null;

	/**
	 * @description 加载所有菜单节点
	 * @return ModelMap
	 * @return
	 * @throws IOException 
	 * @update 2012-8-13 上午10:58:27
	 */
	@RequestMapping(value = "/dataBackup", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public void dataBackup(HttpServletRequest request,HttpServletResponse response) throws IOException {		

		InputStream inputStream = null;
		OutputStream os = null;
		try{
			String rootPath = request.getSession().getServletContext().getRealPath("/");	
			String filePath = systemService.dataBackup(rootPath);
			String fileName = filePath.substring(filePath.lastIndexOf("\\")+1, filePath.length());
		    response.setCharacterEncoding("utf-8");  
	        response.setContentType("multipart/form-data");  
	        response.setHeader("Content-Disposition", "attachment;filename="+ new String(fileName.getBytes("gb2312"), "ISO8859-1" ));  	        
	        	        
            inputStream=new FileInputStream(filePath);
            os=response.getOutputStream();  
            byte[] b=new byte[1024];  
            int length;  
            while((length=inputStream.read(b))>0){  
                os.write(b,0,length);  
            }  
            logService.addLog("数据库备份成功", CommonConstant.Log_Type_BACKUP, CommonConstant.Log_Leavel_INFO);
		}catch(Exception e){
			e.printStackTrace();			
		}finally{			
			if(inputStream!=null){				
				inputStream.close();				
			}
			if(os!=null){				
				os.close();				
			}
		}	
	}
	
	/**
	 * @description 文件压缩备份
	 * @return ModelMap
	 * @return
	 * @throws IOException 
	 * @update 2012-8-13 上午10:58:27
	 */
	@RequestMapping(value = "/fileBackup", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public void fileBackup(HttpServletRequest request,HttpServletResponse response) throws IOException {
		File file = null;
		InputStream inputStream = null;
		OutputStream os = null;
		try{
			String rootPath = request.getSession().getServletContext().getRealPath("/");
		    String name = "pictures.zip";		
			
		    response.setCharacterEncoding("utf-8");  
	        response.setContentType("multipart/form-data");  
	        response.setHeader("Content-Disposition", "attachment;filename="+ new String(name.getBytes("gb2312"), "ISO8859-1" ));  	        
	        file = systemService.fileBackup(rootPath + name,rootPath + CommonConstant.UPLOAD_BASE_PATH + "/product");
            inputStream=new FileInputStream(file);
            os=response.getOutputStream();  
            byte[] b=new byte[1024];  
            int length;  
            while((length=inputStream.read(b))>0){  
                os.write(b,0,length);  
            }  
            logService.addLog("图片备份成功", CommonConstant.Log_Type_BACKUP, CommonConstant.Log_Leavel_INFO);
		}catch(Exception e){
			e.printStackTrace();			
		}finally{			
			if(inputStream!=null){				
				inputStream.close();				
			}
			if(os!=null){				
				os.close();				
			}
			if(file.exists()){
				file.delete();
			}
		}
		
	}
}
