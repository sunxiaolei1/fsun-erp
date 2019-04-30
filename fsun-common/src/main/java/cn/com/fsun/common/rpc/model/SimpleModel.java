package cn.com.fsun.common.rpc.model;

/**
 * 
 * @author lee
 *
 * @param <ParamsCls>
 */
public class SimpleModel<ParamsCls> extends AbstractModel{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private ParamsCls params;

	public ParamsCls getParams() {
		return params;
	}

	public void setParams(ParamsCls params) {
		this.params = params;
	}
	
	
}
