package cn.com.fsun.bus.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;  
import org.springframework.validation.Validator;

import cn.com.fsun.bus.service.OrderDetailService;
  
@Component 
public class ProductValidator implements Validator {

	@Autowired
	private OrderDetailService orderDetailService;
	
	@Override
	public boolean supports(Class<?> clazz) {  
       return String.class.equals(clazz);  
    }  
	
	@Override
    public void validate(Object obj, Errors errors) {  
       String productCodes = (String) obj;  
       if (orderDetailService.existDetailByProductCode(productCodes)) {
    	   errors.reject(null,"选中的产品中有已经使用在订单中不能删除.");
    	  // errors.rejectValue("phoneNumber", null, "选中的产品中有已经使用在订单中不能删除.");
	   }       
    }
} 