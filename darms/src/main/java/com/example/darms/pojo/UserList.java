package com.example.darms.pojo;

public class UserList {
	
	private String name;
	private String mobile;
	private String user_id;
	private String tname_eng;
	private String tname;
	/*
	 * private String password; private int roleId; private int userTypeId; private
	 * int loginTypeId; private int districtCode;
	 */
	
	public UserList() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UserList(String name, String mobile, String user_id, String tname_eng, String tname) {
		super();
		this.name = name;
		this.mobile = mobile;
		this.user_id = user_id;
		this.tname_eng = tname_eng;
		this.tname = tname;
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

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getTname_eng() {
		return tname_eng;
	}

	public void setTname_eng(String tname_eng) {
		this.tname_eng = tname_eng;
	}

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	@Override
	public String toString() {
		return "UserList [name=" + name + ", mobile=" + mobile + ", user_id=" + user_id + ", tname_eng=" + tname_eng
				+ ", tname=" + tname + "]";
	}
	
}

