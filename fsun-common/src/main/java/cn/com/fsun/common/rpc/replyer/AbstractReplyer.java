package cn.com.fsun.common.rpc.replyer;

/**
 * rpc调用的返回结果,基础类
 * @author
 *
 */
public abstract class AbstractReplyer {

	private Boolean success;
	private String msg;

	public Boolean getSuccess() {
		return success;
	}

	public void setSuccess(Boolean success) {
		this.success = success;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

}
