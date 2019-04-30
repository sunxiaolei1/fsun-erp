package cn.com.fsun.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Set;

import org.springframework.dao.DataAccessException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import cn.com.fsun.sys.dto.MenuDto;
import cn.com.fsun.sys.dto.PowerDto;
import cn.com.fsun.sys.dto.RoleDto;
import cn.com.fsun.sys.dto.UserDto;
import cn.com.fsun.sys.service.UserService;



/**
 * 该类的主要作用是为Spring Security提供一个经过用户认证后的UserDetails。
 * 该UserDetails包括用户名、密码、是否可用、是否过期等信息
 */
public class MyUserDetailsService implements UserDetailsService {
	
	private UserService userService;
	
	/**
	 * 根据用户帐号得到用户对象
	 */
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException, DataAccessException {		
		
		UserDto userDto = userService.loadUserByUsername(username);
		if(null == userDto)
			throw new UsernameNotFoundException("帐号不存在!");

		Collection<GrantedAuthority> auths = new ArrayList<GrantedAuthority>();
		//获取用户的角色列表
		Set<RoleDto> roleDtos = userDto.getRoleDtos();
		if (roleDtos != null && roleDtos.size()>0){
			for (RoleDto roleDto : roleDtos) {
				//按钮权限授权
				Set<PowerDto> powerDtos = roleDto.getPowerDtos();
				if (powerDtos != null&&powerDtos.size()>0){
					for (PowerDto powerDto : powerDtos) {
						if(null!=powerDto && null!=powerDto.getCode()){
							GrantedAuthority grantedAuthority = new GrantedAuthorityImpl(
									powerDto.getCode());
							auths.add(grantedAuthority);
						}
					}
				}
				//菜单权限授权
				Set<MenuDto> menuDtos = roleDto.getMenuDtos();
				if (menuDtos != null&&menuDtos.size()>0){
					for (MenuDto menuDto : menuDtos) {
						if(null!=menuDto && null!=menuDto.getCode()){
							GrantedAuthority grantedAuthority = new GrantedAuthorityImpl(
									menuDto.getCode());
							auths.add(grantedAuthority);
						}
					}
				}
			}
		}

		return new MyUserDetails(userDto.getId(),userDto.getRealname(),userDto.getUsername(), userDto.getPassword(),true, true, true, true,
				auths);
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
}
