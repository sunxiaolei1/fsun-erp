package cn.com.fsun.sys.dto;

import cn.com.fsun.common.dto.BaseDto;


/*
 * @author lw
 */

public class RoleUserDto extends BaseDto{

	private String id;	//ID
	private String roleId;	//角色ID
	private String userId;	//用户ID


	
	public String getId() {
		return this.id;
	}
	
	public void setId(String value) {
		this.id = value;
	}
	
	public String getRoleId() {
		return this.roleId;
	}
	
	public void setRoleId(String value) {
		this.roleId = value;
	}
	public String getUserId() {
		return this.userId;
	}
	
	public void setUserId(String value) {
		this.userId = value;
	}
	
}