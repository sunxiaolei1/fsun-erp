package cn.com.fsun.bus.exception;

import cn.com.fsun.common.constants.ExceptionInfoConstants;

public class DisableDeleteException extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public DisableDeleteException(){
		 super(ExceptionInfoConstants.OBJECT_USED_EXCEPTION);
	}

	public DisableDeleteException(String msg){
		 super(msg);
	}
}

