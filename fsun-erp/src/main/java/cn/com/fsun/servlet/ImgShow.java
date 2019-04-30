package cn.com.fsun.servlet;

import java.io.*;  
import javax.servlet.*;  
import javax.servlet.http.*;  

public class ImgShow extends HttpServlet { 
	
	//OutsideImagesService
	
	 public void doGet(HttpServletRequest req, HttpServletResponse res)  
	   throws ServletException, IOException {  
		 
		 try{ 
			 String id = (String) req.getAttribute("id");
			 byte[] image = null;
			 res.setContentType("image/png"); // 设置返回的文件类型  
			 OutputStream toClient = res.getOutputStream();  
			 GenerateImage(image,toClient);  
		 }catch(Exception ex){  
			 System.out.println(ex.toString());  
		 }  
	 }  
	  
	 // 对字节数组字符串进行Base64解码并生成图片  
	 private boolean GenerateImage(byte[] image,OutputStream out) {  
		 try { 
			 if (image.length>0){
				 for (int i = 0; i < image.length; ++i) {  
					 if (image[i] < 0) {// 调整异常数据  
						 image[i] += 256;  
					 }  
				 }  
				 //   OutputStream out = new FileOutputStream(imgFilePath);  
				 out.write(image);  
				 out.flush();  
				 out.close();  
				 return true;    
			 }else{
				 return false;
			 }				 
		 } catch (Exception e) {  
			 return false;  
		 }  
	 }  
	 
}  