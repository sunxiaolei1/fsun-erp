package cn.com.fsun.common.rpc.constants;

import java.util.HashMap;
import java.util.Map;

import cn.com.fsun.client.rpc.model.EmailModel;
import cn.com.fsun.common.rpc.replyer.SimpleReplyerNotData;

public class RpcConstants {
	
	//目的地名称(前缀)
	public class DestPrefixConstants{
		//email
		public static final String FSUN_SERVER_RPC_QUEUE = "cn.com.fsun.server.rpc.";
	}

	//目的地名称(后缀)
	public class DestSuffixConstants{
		//email
		public static final String EMAIL = "email.";
	    public static final String EMAIL_ADD_AND_SEND = EMAIL + "addAndSend";
	    public static final String EMAIL_SEND = EMAIL + "send";
	    //public static final String EMAIL_DELETE = EMAIL + "delete";
	}

	//消息队列名称
	public class QueueConstants{
		
		public static final String EMAIL_ADD_AND_SEND = DestPrefixConstants.FSUN_SERVER_RPC_QUEUE + DestSuffixConstants.EMAIL_ADD_AND_SEND;
		public static final String EMAIL_SEND = DestPrefixConstants.FSUN_SERVER_RPC_QUEUE + DestSuffixConstants.EMAIL_SEND;
	}
	
	//用于rpc返回message的converter
	public static final Map<String, Class<?>> CLIENT_CLASSMAP = new HashMap<String,Class<?>>();
	static{
		CLIENT_CLASSMAP.put(QueueConstants.EMAIL_SEND, SimpleReplyerNotData.class);
		CLIENT_CLASSMAP.put(QueueConstants.EMAIL_ADD_AND_SEND, SimpleReplyerNotData.class);
	}
	
	//用于rpc返回message的converter
	public static final Map<String, Class<?>> SERVER_CLASSMAP = new HashMap<String,Class<?>>();
	static{
		SERVER_CLASSMAP.put(QueueConstants.EMAIL_SEND, EmailModel.class);
		SERVER_CLASSMAP.put(QueueConstants.EMAIL_ADD_AND_SEND, EmailModel.class);
	}
}
