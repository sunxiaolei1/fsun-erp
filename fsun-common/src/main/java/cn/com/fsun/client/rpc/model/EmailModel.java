package cn.com.fsun.client.rpc.model;

import cn.com.fsun.bus.dto.EmailDto;
import cn.com.fsun.common.rpc.constants.RpcConstants;
import cn.com.fsun.common.rpc.model.SimpleModel;

public class EmailModel extends SimpleModel<EmailDto> {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public EmailModel() {
		super();
		super.setDestinationName(RpcConstants.QueueConstants.EMAIL_SEND);
	}

	
}
