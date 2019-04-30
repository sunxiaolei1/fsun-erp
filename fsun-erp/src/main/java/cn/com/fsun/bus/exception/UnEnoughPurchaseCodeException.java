package cn.com.fsun.bus.exception;

import cn.com.fsun.common.constants.ExceptionInfoConstants;

public class UnEnoughPurchaseCodeException extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public UnEnoughPurchaseCodeException(){
		 super(ExceptionInfoConstants.UNENOUGH_PURCHASE_CODE);
	}

	public UnEnoughPurchaseCodeException(String msg){
		 super(msg);
	}
}
