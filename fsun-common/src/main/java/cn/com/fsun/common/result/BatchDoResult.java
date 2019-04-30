package cn.com.fsun.common.result;

public class BatchDoResult extends BaseResult<String>{

	public BatchDoResult() {
		super();
	}
	
	public BatchDoResult(Boolean success) {
		super(success, "", "");
	}
	

	public BatchDoResult(Boolean success, String message) {
		super(success, message,"");
	}


	public BatchDoResult(Boolean success, String message, String data) {
		super(success, message, data);
	}
	
}
