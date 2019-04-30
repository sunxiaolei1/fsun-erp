package cn.com.fsun.common.rpc.replyer;

/**
 * rpc的请求返回，带数据
 * @author 
 *
 * @param <Clazz>
 */
public class SimpleReplyer<DataCls> extends AbstractReplyer{

	private DataCls data;

	public DataCls getData() {
		return data;
	}

	public void setData(DataCls data) {
		this.data = data;
	}	
	
}
