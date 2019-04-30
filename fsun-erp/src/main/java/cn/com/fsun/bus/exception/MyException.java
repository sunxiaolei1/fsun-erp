package cn.com.fsun.bus.exception;

/**
 * 自定义异常类
 * @author sun
 */
public class MyException extends Exception{
	
	
	private static final long serialVersionUID = 1L;
	
	/**
	 * 自定义异常的方法
	 * @param 消息：错误的信息
	 */
	public MyException(String msg){
		 super(msg);
	}
}




