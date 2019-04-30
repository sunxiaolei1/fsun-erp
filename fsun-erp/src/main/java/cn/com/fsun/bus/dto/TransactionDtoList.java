package cn.com.fsun.bus.dto;

import java.util.List;

public class TransactionDtoList {
	
	private List<TransactionDto> transactionDtoList;
	private Integer size;

	public List<TransactionDto> getTransactionDtoList() {
		return transactionDtoList;
	}

	public void setTransactionDtoList(List<TransactionDto> transactionDtoList) {
		this.transactionDtoList = transactionDtoList;
		this.size = transactionDtoList!=null?transactionDtoList.size():0;
	}

	public void setSize(Integer size) {
		this.size = size;
	}

	public Integer getSize() {
		return size;
	}
	
}
