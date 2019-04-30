package cn.com.fsun.sys.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;


import cn.com.fsun.common.domain.BaseDomain;



/*
 * @author lw
 */

@Entity
@Table(name = "r_role_menu")
public class RoleMenu extends BaseDomain{


	/**
	 * 
	 */
	private static final long serialVersionUID = 385662078399545200L;
	/**
     * id   db_column: id 
     */ 	
	private String id;
    /**
     * menuId   db_column: menu_id 
     */ 	
	private String menuId;
    /**
     * roleId   db_column: role_id 
     */ 	
	private String roleId;

	
	@GenericGenerator(name = "generator", strategy = "uuid")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "id", unique = true, nullable = false, length = 32)
	public String getId() {
		return this.id;
	}
	
	public void setId(String value) {
		this.id = value;
	}
	
	@Column(name = "menu_id", length = 32)
	public String getMenuId() {
		return this.menuId;
	}
	
	public void setMenuId(String value) {
		this.menuId = value;
	}
	
	@Column(name = "role_id", length = 32)
	public String getRoleId() {
		return this.roleId;
	}
	
	public void setRoleId(String value) {
		this.roleId = value;
	}
	
}