package cn.com.fsun.bus.dto;

import java.util.List;

public class AfterProcessDtoList {

	private List<AfterProcessDto> afterProcessDtoList;
	private Integer size;

	public List<AfterProcessDto> getAfterProcessDtoList() {
		return afterProcessDtoList;
	}

	public void setAfterProcessDtoList(List<AfterProcessDto> afterProcessDtoList) {
		this.afterProcessDtoList = afterProcessDtoList;
		this.size = afterProcessDtoList!=null?afterProcessDtoList.size():0;
	}

	public void setSize(Integer size) {
		this.size = size;
	}

	public Integer getSize() {
		return size;
	}
}
