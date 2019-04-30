package cn.com.fsun.bus.service.itf;

import cn.com.fsun.common.rpc.replyer.SimpleReplyerNotData;

public interface EmailService {

	public SimpleReplyerNotData emailSend();
	
	public SimpleReplyerNotData emailAddToSend();
}
