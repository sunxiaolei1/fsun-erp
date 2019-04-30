package cn.com.fsun.client.rpc.service.impl;

import org.springframework.stereotype.Component;

import cn.com.fsun.client.rpc.model.EmailModel;
import cn.com.fsun.client.rpc.service.EmailRpcService;
import cn.com.fsun.common.rpc.constants.RpcConstants;
import cn.com.fsun.common.rpc.replyer.SimpleReplyerNotData;

@Component
public class EmailRpcServiceImpl extends AbstractRpcService implements EmailRpcService{
	
	@Override
	public SimpleReplyerNotData emailSend(EmailModel model) {
		
		try{
			return (SimpleReplyerNotData)super.sendAndReceive(model); 	
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public SimpleReplyerNotData emailAddToSend(EmailModel model) {
		try{
		    return (SimpleReplyerNotData)super.sendAndReceive(RpcConstants.QueueConstants.EMAIL_ADD_AND_SEND,model); 
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

}
