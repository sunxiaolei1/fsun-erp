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
@Table(name = "r_role_power")
public class RolePower extends BaseDomain{

	/**
	 * 
	 */
	private static final long serialVersionUID = -2928261866866124846L;
	/**
     * id   db_column: id 
     */ 	
	private String id;
    /**
     * powerId   db_column: power_id 
     */ 	
	private String powerId;
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
	
	@Column(name = "power_id", length = 32)
	public String getPowerId() {
		return this.powerId;
	}
	
	public void setPowerId(String value) {
		this.powerId = value;
	}
	
	@Column(name = "role_id", length = 32)
	public String getRoleId() {
		return this.roleId;
	}
	
	public void setRoleId(String value) {
		this.roleId = value;
	}
	
}