package cn.com.fsun.sys.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import cn.com.fsun.common.domain.BaseDomain;



/*
 * @author lw
 */

@Entity
@Table(name = "r_role_user")
public class RoleUser extends BaseDomain{


    /**
     * id   db_column: id 
     */ 	
	private String id;
    /**
     * userId   db_column: user_id 
     */ 	
	private String userId;
    /**
     * roleId   db_column: role_id 
     */ 	
	private String roleId;
    /**
     * enabled   db_column: enabled 
     */ 	

	
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
	
	@Column(name = "user_id", length = 32)
	public String getUserId() {
		return this.userId;
	}
	
	public void setUserId(String value) {
		this.userId = value;
	}
	
	@Column(name = "role_id", length = 32)
	public String getRoleId() {
		return this.roleId;
	}
	
	public void setRoleId(String value) {
		this.roleId = value;
	}
}