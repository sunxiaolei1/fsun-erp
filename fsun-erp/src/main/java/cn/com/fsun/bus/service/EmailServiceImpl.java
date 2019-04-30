package cn.com.fsun.bus.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import cn.com.fsun.bus.service.itf.EmailService;
import cn.com.fsun.client.rpc.model.EmailModel;
import cn.com.fsun.client.rpc.service.EmailRpcService;
import cn.com.fsun.common.rpc.replyer.SimpleReplyerNotData;
import cn.com.fsun.common.service.BaseService;

@Component
public class EmailServiceImpl extends BaseService implements EmailService {
	
	@Autowired
	private EmailRpcService emailRpcService;
	
	@Override
	public SimpleReplyerNotData emailSend() {
		EmailModel model = new EmailModel();
		return emailRpcService.emailSend(model);
	}
	
	@Override
	public SimpleReplyerNotData emailAddToSend() {
		EmailModel model = new EmailModel();
		return emailRpcService.emailAddToSend(model);
	}
}