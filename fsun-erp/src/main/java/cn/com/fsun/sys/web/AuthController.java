package cn.com.fsun.sys.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.fsun.common.result.JsonResult;
import cn.com.fsun.common.web.BaseController;
import cn.com.fsun.constants.CommonConstant;
import cn.com.fsun.sys.dto.AuthDto;
import cn.com.fsun.sys.service.AuthService;
import cn.com.fsun.sys.service.LogService;

@Controller
@RequestMapping("/sys/auth")
public class AuthController extends BaseController {
	
	@Autowired
	private AuthService authService;

	@Autowired
	private LogService logService;
	
	private String message = null;
	
	@RequestMapping(value="/register",method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelMap register(AuthDto authDto){
		int info = 0;
		try{
			info = authService.register(authDto);
		}catch (Exception e) {
			return JsonResult.getResult(Boolean.FALSE,"用户未注册成功,请注册或联系管理员！"); 
		}	
		Integer loglevel = CommonConstant.Log_Type_OTHER;
		logService.addLog(message, loglevel, CommonConstant.Log_Leavel_INFO);
		return JsonResult.getResult(Boolean.TRUE,("您的使用时间是:"+(info>7000?"无限期":info+"天")));
	}
	
	/**
	 * @description 显示列表
	 * @return ModelMap
	 * @param
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/manage", method={RequestMethod.GET,RequestMethod.POST})
	public String manage() {
		return "sys/auth/manage";
	}
}

