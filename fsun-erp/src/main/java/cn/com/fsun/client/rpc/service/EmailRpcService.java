package cn.com.fsun.client.rpc.service;

import cn.com.fsun.client.rpc.model.EmailModel;
import cn.com.fsun.common.rpc.replyer.SimpleReplyerNotData;

public interface EmailRpcService extends BaseRpcService {

	SimpleReplyerNotData emailSend(EmailModel model);
	
	SimpleReplyerNotData emailAddToSend(EmailModel model);
}
