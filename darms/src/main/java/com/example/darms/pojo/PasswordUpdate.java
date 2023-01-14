package com.example.darms.pojo;

import javax.validation.constraints.NotBlank;

import org.hibernate.validator.constraints.Range;

public class PasswordUpdate {
	
	@NotBlank(message = "Old Password should not be blank")
	private String old_password;
	@Range(min = 6, max = 20, message="Password must be minimum 6 digit long")
	@NotBlank(message = "New Password should not be blank")
	private String new_password;
	@NotBlank(message = "Confirm Password should not be blank")
	private String confirm_password;
	
	public PasswordUpdate() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PasswordUpdate(String old_password, String new_password, String confirm_password) {
		super();
		this.old_password = old_password;
		this.new_password = new_password;
		this.confirm_password = confirm_password;
	}

	public String getOld_password() {
		return old_password;
	}

	public void setOld_password(String old_password) {
		this.old_password = old_password;
	}

	public String getNew_password() {
		return new_password;
	}

	public void setNew_password(String new_password) {
		this.new_password = new_password;
	}

	public String getConfirm_password() {
		return confirm_password;
	}

	public void setConfirm_password(String confirm_password) {
		this.confirm_password = confirm_password;
	}

	@Override
	public String toString() {
		return "PasswordUpdate [old_password=" + old_password + ", new_password=" + new_password + ", confirm_password="
				+ confirm_password + "]";
	}
	
}

