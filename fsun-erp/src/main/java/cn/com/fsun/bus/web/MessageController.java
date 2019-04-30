package cn.com.fsun.bus.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import cn.com.fsun.bus.service.itf.EmailService;
import cn.com.fsun.common.rpc.replyer.SimpleReplyerNotData;
import cn.com.fsun.common.result.JsonUtil;

@Controller("messageController")
@RequestMapping("/bus/message")
public class MessageController extends MultiActionController {
	
	@Autowired
    private EmailService emailService; 
  
	@RequestMapping(value = "/send", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
    public ModelMap sendMessage(@RequestParam("message") String message,HttpServletRequest request,HttpServletResponse response) {  
		SimpleReplyerNotData s = emailService.emailSend();          
        return JsonUtil.getResult(Boolean.TRUE);
    } 
	
	@RequestMapping(value = "/addToSend", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
    public ModelMap addToSendMessage(@RequestParam("message") String message,HttpServletRequest request,HttpServletResponse response) {  
		emailService.emailAddToSend();          
        return JsonUtil.getResult(Boolean.TRUE);
    } 
        
	@RequestMapping(value = "/manage", method={RequestMethod.GET,RequestMethod.POST})
	public String manage() {
		return "/bus/message/manage";
	}
   
}
