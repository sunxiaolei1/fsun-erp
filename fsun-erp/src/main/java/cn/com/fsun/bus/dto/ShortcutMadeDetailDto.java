package cn.com.fsun.bus.dto;

import java.util.List;

/**
 * 快捷下单生产明细
 * @author sunxiaolei
 *
 */
public class ShortcutMadeDetailDto extends MadeDetailDto {
	
	/**
	 * 生产单后道工序明细
	 */
	private List<MadeProcessDto> madeProcessDtos;

	public List<MadeProcessDto> getMadeProcessDtos() {
		return madeProcessDtos;
	}

	public void setMadeProcessDtos(List<MadeProcessDto> madeProcessDtos) {
		this.madeProcessDtos = madeProcessDtos;
	}
}
