package cn.com.fsun.bus.exception;

import cn.com.fsun.common.constants.ExceptionInfoConstants;

public class UnEnoughOrderCodeException extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public UnEnoughOrderCodeException(){
		 super(ExceptionInfoConstants.UNENOUGH_ORDER_CODE);
	}

	public UnEnoughOrderCodeException(String msg){
		 super(msg);
	}
}
