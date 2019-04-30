package cn.com.fsun.common.rpc.replyer;

/**
 * 
 * @author 
 *
 */
public class SimpleReplyerNotData extends AbstractReplyer{

	// 私有的默认构造子
	private SimpleReplyerNotData() {}

	// 注意，这里没有final
	private static SimpleReplyerNotData replyer = null;

	// 静态工厂方法
	public synchronized static SimpleReplyerNotData getInstance(Boolean success,String message) {
		if (replyer == null) {
			replyer = new SimpleReplyerNotData();
		}
		replyer.setSuccess(success);
		replyer.setMsg(message);
		return replyer;
	}
	
}
