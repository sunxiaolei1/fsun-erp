package cn.com.fsun.common.test;

import cn.com.fsun.common.mail.MailUtil;
import cn.com.fsun.common.result.BaseResult;

public class EmailTest {

	public static void main(String[] args) {
		    
		try{
			MailUtil mail = new MailUtil();  
	        mail.setAddress("sunxl@sanlogic.com", MailUtil.TO);  
	        // 设置发送邮箱  
	        mail.setFromAddress("385207720@qq.com");  
	        mail.setSMTPHost("smtp.qq.com", 465, "385207720@qq.com", "axlgxckknjalbjij");  
	        mail.setSubject("主题测试使用");  
	        mail.setTextBody("testBody");  
	        mail.setHtmlBody("<B>内容测试</B>");  
	        //mail.setFileAttachment("C:/测试附件.docx");  
	        BaseResult result = mail.sendBatchSSL();
	        if(!result.getSuccess()){
	        	System.out.println("是否成功:"+ result.getMessage());
	        }
	        /*
	         * 不用安全认证的发送
	        MailUtil mail = new MailUtil();  
	        mail.setAddress("385207720@qq.com", MailUtil.TO);  
	        // 设置发送邮箱  
	        mail.setFromAddress("sunxl@sanlogic.com");  
	        mail.setSMTPHost("smtp.qq.com", 25, "sunxl@sanlogic.com", "sad123456789");  
	        mail.setSubject("主题测试使用");  
	        mail.setTextBody("testBody");  
	        mail.setHtmlBody("<B>内容测试</B>");  
	        //mail.setFileAttachment("C:/测试附件.docx");
	        BaseResult result = mail.sendBatchNoSSL();
	        if(!result.getSuccess()){
	        	System.out.println("是否成功:"+ result.getMessage());
	        }
	        */
	        
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

}
