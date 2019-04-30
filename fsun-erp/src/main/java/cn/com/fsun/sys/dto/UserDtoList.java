package cn.com.fsun.sys.dto;

import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;

import cn.com.fsun.sys.dto.UserDto;

@XmlRootElement(name = "users")
public class UserDtoList {

	private int count;
	private List<UserDto> userDtos;

	public UserDtoList() {
	}

	public UserDtoList(List<UserDto> userDtos) {
		this.userDtos = userDtos;
	}

	public UserDtoList(List<UserDto> userDtos, int count) {
		this.userDtos = userDtos;
		this.count = count;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public List<UserDto> getUserDtos() {
		return userDtos;
	}

	public void setUserDtos(List<UserDto> userDtos) {
		this.userDtos = userDtos;
	}
}
