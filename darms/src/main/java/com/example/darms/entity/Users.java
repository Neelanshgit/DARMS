package com.example.darms.entity;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

import org.springframework.lang.NonNull;

@Entity
@SequenceGenerator(initialValue = 1, name = "idgen", sequenceName = "users_seq", allocationSize = 1)
public class Users extends DataObject {
	/**
	 * 
	 */
	private static final long serialVersionUID = 7526472295622776147L;
	@Id
	@NonNull
	private long id;
	//@Column(columnDefinition = "varchar(100) default Null")
	private String name;
	private String mobile;
	private String userId;
	private String password;
	private Integer roleId;
	private Integer userTypeId;
	private Integer loginTypeId;
	private String districtCode;
	private String tehsilCode;
	private int createdBy;
	private Timestamp createdAt;
	private int modifiedBy;
	private Timestamp modifiedAt;
	private boolean status;
	
	public Users() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Users(String name, String mobile, String userId, String password, Integer roleId, Integer userTypeId,
			Integer loginTypeId, String districtCode, String tehsilCode, int createdBy, Timestamp createdAt, int modifiedBy,
			Timestamp modifiedAt, boolean status) {
		super();
		this.name = name;
		this.mobile = mobile;
		this.userId = userId;
		this.password = password;
		this.roleId = roleId;
		this.userTypeId = userTypeId;
		this.loginTypeId = loginTypeId;
		this.districtCode = districtCode;
		this.tehsilCode = tehsilCode;
		this.createdBy = createdBy;
		this.createdAt = createdAt;
		this.modifiedBy = modifiedBy;
		this.modifiedAt = modifiedAt;
		this.status = status;
	}



	public Users(long id, String name, String mobile, String userId, String password, int roleId, int userTypeId,
			int loginTypeId, String districtCode, String tehsilCode, int createdBy, Timestamp createdAt, int modifiedBy,
			Timestamp modifiedAt, boolean status) {
		super();
		this.id = id;
		this.name = name;
		this.mobile = mobile;
		this.userId = userId;
		this.password = password;
		this.roleId = roleId;
		this.userTypeId = userTypeId;
		this.loginTypeId = loginTypeId;
		this.districtCode = districtCode;
		this.tehsilCode = tehsilCode;
		this.createdBy = createdBy;
		this.createdAt = createdAt;
		this.modifiedBy = modifiedBy;
		this.modifiedAt = modifiedAt;
		this.status = status;
	}
	


	public long getId() {
		return id;
	}



	public void setId(long id) {
		this.id = id;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getMobile() {
		return mobile;
	}



	public void setMobile(String mobile) {
		this.mobile = mobile;
	}



	public String getUserId() {
		return userId;
	}



	public void setUserId(String userId) {
		this.userId = userId;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}



	public Integer getRoleId() {
		return roleId;
	}



	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}



	public Integer getUserTypeId() {
		return userTypeId;
	}



	public void setUserTypeId(Integer userTypeId) {
		this.userTypeId = userTypeId;
	}



	public Integer getLoginTypeId() {
		return loginTypeId;
	}



	public void setLoginTypeId(Integer loginTypeId) {
		this.loginTypeId = loginTypeId;
	}



	public String getDistrictCode() {
		return districtCode;
	}



	public void setDistrictCode(String districtCode) {
		this.districtCode = districtCode;
	}



	public String getTehsilCode() {
		return tehsilCode;
	}



	public void setTehsilCode(String tehsilCode) {
		this.tehsilCode = tehsilCode;
	}



	public int getCreatedBy() {
		return createdBy;
	}



	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}



	public Timestamp getCreatedAt() {
		return createdAt;
	}



	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}



	public int getModifiedBy() {
		return modifiedBy;
	}



	public void setModifiedBy(int modifiedBy) {
		this.modifiedBy = modifiedBy;
	}



	public Timestamp getModifiedAt() {
		return modifiedAt;
	}



	public void setModifiedAt(Timestamp modifiedAt) {
		this.modifiedAt = modifiedAt;
	}



	public boolean isStatus() {
		return status;
	}



	public void setStatus(boolean status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "Users [id=" + id + ", name=" + name + ", mobile=" + mobile + ", userId=" + userId + ", password="
				+ password + ", roleId=" + roleId + ", userTypeId=" + userTypeId + ", loginTypeId=" + loginTypeId
				+ ", districtCode=" + districtCode + ", tehsilCode=" + tehsilCode + ", createdBy=" + createdBy
				+ ", createdAt=" + createdAt + ", modifiedBy=" + modifiedBy + ", modifiedAt=" + modifiedAt + ", status="
				+ status + "]";
	}
	
}
