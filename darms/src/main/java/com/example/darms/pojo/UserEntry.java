package com.example.darms.pojo;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Range;


public class UserEntry {
	
	@NotBlank(message = "Name should not be blank")
	private String name;
	@NotBlank(message = "Mobile should not be blank")
	private String mobile;
	@NotBlank(message = "User-Id should not be blank")
	private String userId;
	//@NotBlank(message = "Password should not be blank")
	private String password;
	@NotNull(message = "Role should not be blank")
	@Range(min = 1, message= "Role should not be blank")
	private int roleId;
	@NotNull(message = "User Type should not be blank")
	@Range(min = 1, message= "User Type should not be blank")
	private int userTypeId;
	@NotNull(message = "Login Type should not be blank")
	@Range(min = 0, message= "Login Type should not be blank")
	private int loginTypeId;
	//@NotBlank(message = "District should not be blank")
	private String districtCode;
	//@NotBlank(message = "Tehsil should not be blank")
	private String tehsilCode;
	
	public UserEntry() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UserEntry(String name, String mobile, String userId, String password, int roleId, int userTypeId,
			int loginTypeId, String districtCode, String tehsilCode) {
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

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	public int getUserTypeId() {
		return userTypeId;
	}

	public void setUserTypeId(int userTypeId) {
		this.userTypeId = userTypeId;
	}

	public int getLoginTypeId() {
		return loginTypeId;
	}

	public void setLoginTypeId(int loginTypeId) {
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

	@Override
	public String toString() {
		return "UserEntry [name=" + name + ", mobile=" + mobile + ", userId=" + userId + ", password=" + password
				+ ", roleId=" + roleId + ", userTypeId=" + userTypeId + ", loginTypeId=" + loginTypeId
				+ ", district_code=" + districtCode + ", tehsilCode=" + tehsilCode + "]";
	}
	
	
	
	
}

